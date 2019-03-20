<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>[QSOLUTIONS]업무관리 시스템</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>

<script type="text/javascript">
function updateuserform(){
		var userid = $("#userid").val();
		var url = "/User/Updateforms?userid="+userid;
		// alert(url);
		location.href = url;
	}
	
function todayCowork(){
	var url = "${pageContext.request.contextPath}/Cowork/Calendar";
	// alert(url);
	location.href = url;
}
</script>

<style>

body {
	margin-top: 100px;
	margin-bottom: 100px;
}

.viewListTop{
	width: 80%;
	height: 80%;
	margin: 0 auto; 
}

.viewList {
	width: 80%;
	height: 80%;
	margin: 0 auto; 
	
}

.viewListCenter {
	width: 60%;
	height: 80%;
	margin: 0 auto; 
	margin-top: 50px;
}

.pagingView {
	width: 80%;
	height: 80%;
	margin: 0 auto; 
}

.rounded {
	width: 100%;
	height: 200px;
	background-color: #E6E6E6;
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
}

.roundedUserInfo {
	display: inline-block;
	width: 26%;
	height: 400px;
	background-color: white;
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:3em;
	-moz-border-radius: 3em;
	-webkit-border-radius: 3em;
	text-align: center;
}

.roundedEvent {
	display: inline-block;
	float:none !important;
    margin: 0 auto;
	width: 36%;
	height: 400px;
	background-color: white;
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:3em;
	-moz-border-radius: 3em;
	-webkit-border-radius: 3em;
	text-align: center;
}

.roundedMessage {
	display: inline-block;
	width: 36%; 
	height: 400px;
	background-color: white;
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:3em;
	-moz-border-radius: 3em;
	-webkit-border-radius: 3em;
}

/* datepicer 버튼 롤오버 시 손가락 모양 표시 */
.ui-datepicker-trigger {
	cursor: pointer;
}

/* datepicer input 롤오버 시 손가락 모양 표시 */
.hasDatepicker {
	cursor: pointer;
}

h2 {
	padding: 0 20px 10px 20px;
	font-size: 20px;
	font-weight: 400;
}

@media(max-width: 300px) {
	.well { 
		margin : 0
	}
}

::-webkit-scrollbar {
	display:none;
}

.coworkCount{
	width : 20px;
	height : 20px;
	background-color : red;
	color : white;
	border-radius : 10em;
	z-index : 1;
	position: relative;
	bottom: 17px;
	left: 21px;
}

</style>

</head>
<body style="background-color: #E6E6E6">
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<div class="viewListTop" style="text-align: center;">
	<div class="roundedUserInfo pull-left">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" style="width: 80%; margin-top: 10px">
		<br>
		<img src="${pageContext.request.contextPath}/resources/img/user.png" alt="" style="width: 40%; margin-left: 10%; margin-top: 8%;" class="pull-left">
		<p style="padding-left:55%; margin-top:12%; text-align:left; font-weight: bold; font-size: 150%">
		${userVO.username}
		<input type="hidden" id="userid" value="${userVO.userid}"/>
		</p>
		<p style="padding-left:55%; margin-top:10%; text-align:left; font-weight: bold; font-size: 120%; color: gray;">${userVO.positionname}</p>
		<p style="padding-left:55%; margin-top:10%; text-align:left; font-weight: bold; font-size: 100%; color: gray;">${userVO.deptname}</p>
		<br>
		<c:if test="${todaycowork eq '0'}">
		<button type="button" id="save" class="btn btn-info" onclick="todayCowork()" style="margin-top: 5%; width: 80%; height: 10%;">오늘의 일정</button>
		</c:if>
		<c:if test="${todaycowork ne '0'}">
		<button type="button" id="save" class="btn btn-info" onclick="todayCowork()" style="margin-top: 5%; width: 80%; height: 10%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오늘의 일정
		<div class = "coworkCount pull-right">${todaycowork}</div>
		</button>
		</c:if>
		<button type="button" id="save" class="btn btn-info" onclick="updateuserform()" style="margin-top: 2%; width: 80%; height: 10%">내정보 수정</button>
	</div>
	<div class="roundedEvent center-block" style="line-height: 1.3em; overflow: scroll; overflow-x : hidden; word-break:break-all; word-wrap:break-word; -ms-overflow-style: none; padding: 20px;">
		<h3 style="text-align: center; font-weight: bold;">이벤트</h3>
		<c:if test="${coworkListVO.isEmpty()}">
			<p style="color: #d9534f; margin-top: 110px;">이벤트가 없습니다.</p>
		</c:if>
		
		<c:forEach items="${coworkListVO}" var="coworkListVO" varStatus="rowCount">
			<br>
			<span style="color: #01DF3A; font-weight: bold;">${coworkListVO.username}</span>
			<span> 님이 새 업무를 등록하셨습니다.</span>
			<br>
			<a href='${pageContext.request.contextPath}/Company/View?companycode=${coworkListVO.companycode}'><span style="color: #FAAC58; font-weight: bold;">${coworkListVO.companyname}</span></a>
			<span style="font-weight: bold;">-</span>
			<a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkListVO.coworkcode}'><span style="color: #58ACFA; font-weight: bold;">${coworkListVO.coworktitle}</span></a>
			<br>
		</c:forEach>
		
	</div>
	<div class="roundedMessage pull-right" style="line-height: 1.3em; overflow: scroll; overflow-x : hidden; word-break:break-all; word-wrap:break-word; -ms-overflow-style: none; padding: 20px;">
		<h3 style="text-align: center; font-weight: bold;">최신 메시지</h3>
		
		<c:if test="${subcoworkListVO.isEmpty()}">
			<p style="color: #d9534f; margin-top: 110px;">메시지가 없습니다.</p>
		</c:if>
		
		<c:forEach items="${subcoworkListVO}" var="subcoworkListVO" varStatus="rowCount">
			<br>
			<span style="color: #FAAC58; font-weight: bold;">${subcoworkListVO.companyname}</span>
			<span style="font-weight: bold;">-</span>
			<span style="color: #58ACFA; font-weight: bold;">${subcoworkListVO.coworktitle}</span>
			<br>
			<span>${subcoworkListVO.subcoworktext}</span>
			<br>
		</c:forEach>
	</div>
</div>

<div class="viewList">
	<h3 style="font-weight: bold;">나의 최근 업무</h3>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th style="width: 15%; text-align: center;">카테고리</th>
					<th style="width: 35%; text-align: center;">업무명</th>
					<th style="width: 30%; text-align: center;">고객사명</th89>
					<th style="width: 20%; text-align: center;">진행단계</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${coworkMyListVO}" var="coworkMyListVO" varStatus="rowCount">
				<tr>
					<td>
					${coworkMyListVO.coworksubject}
					<input type="hidden" id="coworkcode" value="${coworkMyListVO.coworkcode}"/>
					</td>
					<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkMyListVO.coworkcode}'>${coworkMyListVO.coworktitle}</a></td>
					<td><a href='${pageContext.request.contextPath}/Company/View?companycode=${coworkMyListVO.companycode}'>${coworkMyListVO.companyname}</a></td>
					<td>
						<c:if test="${coworkMyListVO.coworkstep == '견적'}">
							<!-- <p style="margin-bottom: 0px;">견적</p> -->
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">견적</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '발주'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">발주</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '입찰'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">입찰</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '수주'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">수주</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '계약'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">계약</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '이슈발생'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '원인파악'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '작업진행'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">75%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '진행중'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
							</div>
						</c:if>
						<%-- <c:if test="${coworkMyListVO.coworkstep == '유지보수전'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 25%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">25%</div>
							</div>
						</c:if> --%>
						<c:if test="${coworkMyListVO.coworkstep == '점검전'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '점검중'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '0'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '20'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '40'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">40%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '60'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-success" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">60%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '80'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-success" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">80%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '완료'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep eq null}">
							<div class="progress" style="margin-bottom: 0px;">
								<p style="font-size: 80%; color: gray; margin-top: 4px;">미선택</p>
								<div class="progress-bar progress-bar-warning" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>