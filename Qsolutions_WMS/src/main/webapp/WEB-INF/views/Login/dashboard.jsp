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
		var url = "/qsolcowork/User/Updateforms?userid="+userid;
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
		<p style="padding-left:60%; margin-top:12%; text-align:left; font-weight: bold; font-size: 150%">
		${userVO.username}
		<input type="hidden" id="userid" value="${userVO.userid}"/>
		</p>
		<p style="padding-left:60%; margin-top:10%; text-align:left; font-weight: bold; font-size: 120%; color: gray;">${userVO.positionname}</p>
		<p style="padding-left:60%; margin-top:10%; text-align:left; font-weight: bold; font-size: 120%; color: gray;">${userVO.deptname}</p>
		<br>
		<button type="button" id="save" class="btn btn-info" onclick="" style="margin-top: 5%; width: 80%; height: 10%">오늘의 일정</button>
		<button type="button" id="save" class="btn btn-info" onclick="updateuserform()" style="margin-top: 2%; width: 80%; height: 10%">내정보 수정</button>
	</div>
	<div class="roundedEvent center-block">
		<h3 style="text-align: center; font-weight: bold;">이벤트</h3>
		<br>
		<p style="color: #d9534f;">이벤트가 없습니다.</p>
	</div>
	<div class="roundedMessage pull-right">
		<h3 style="text-align: center; font-weight: bold;">최신 메시지</h3>
		<br>
		
		<c:if test="${subcoworkListVO.isEmpty()}">
			<p style="color: #d9534f;">메시지가 없습니다.</p>
		</c:if>
		
		<c:forEach items="${subcoworkListVO}" var="subcoworkListVO" varStatus="rowCount">
			<span style="color: #FAAC58; font-weight: bold;">${subcoworkListVO.companyname}</span>
			<span>-</span>
			<span style="color: #58ACFA; font-weight: bold;">${subcoworkListVO.coworktitle}</span>
			<span>${subcoworkListVO.subcoworktext}</span>
			<br><br>
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
					<th style="width: 30%; text-align: center;">고객사명</th>
					<th style="width: 20%; text-align: center;">진행률</th>
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
							<p>견적</p>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '입찰'}">
							<p>입찰</p>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '수주'}">
							<p>수주</p>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '계약'}">
							<p>계약</p>
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
								${subcoworkListVO.coworkstep}
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
						<c:if test="${coworkMyListVO.coworkstep == '0%'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '20%'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '40%'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">40%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '60%'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-success" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">60%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '80%'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-success" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">80%</div>
							</div>
						</c:if>
						<c:if test="${coworkMyListVO.coworkstep == '완료'}">
							<div class="progress" style="margin-bottom: 0px;">
								<div class="progress-bar progress-bar-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
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