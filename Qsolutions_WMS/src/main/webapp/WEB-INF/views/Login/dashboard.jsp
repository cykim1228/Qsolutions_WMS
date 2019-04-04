<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<title>[QSOLUTIONS]업무관리 시스템</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>

<link rel="stylesheet" media="screen and (max-width: 767px)" href="${pageContext.request.contextPath}/resources/css/min-767px.css" />
<link rel="stylesheet" media="screen and (min-width: 768px) and (max-width: 959px)" href="${pageContext.request.contextPath}/resources/css/max-960px.css" />
<link rel="stylesheet" media="screen and (min-width: 960px)" href="${pageContext.request.contextPath}/resources/css/max-960px.css" />

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

.border {
    width: 40%;
    border-radius: 50%;
    -webkit-border-radius:50%;
    -moz-border-radius: 50%;
    text-align: center;
    border: 6px solid #fff;
    box-shadow: 0 0 16px rgb(221,221,221);
    -webkit-box-shadow: 0 0 16px rgb(221,221,221);
    -moz-box-shadow: 0 0 16px rgb(221,221,221);
    position: relative;
    display: inline-block;
    margin-top: 20px;
    margin-left: 10%;
    background-size: contain;
    background-image: url('http://qsol.synology.me/${profileVO.profilepathname}');
    background-repeat: no-repeat;
    background-position: center;
}
.border:before {
    content: "";
    display: block;
    padding-top: 100%; /* 1:1 비율 */
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
		<c:choose>
			<c:when test="${empty profileVO.profilepathname}">
				<img src="${pageContext.request.contextPath}/resources/img/user.png" alt="" class="pull-left" style="width: 40%; margin-left: 10%; margin-top: 8%;" class="pull-left">
			</c:when>
			<c:otherwise>
			<div class="border pull-left"></div>
			</c:otherwise>
		</c:choose>
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
		<button type="button" id="save" class="btn btn-info" onclick="updateuserform()" style="margin-top: 2%; margin-bottom: 6%; width: 80%; height: 10%">내정보 수정</button>
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
	<div class="table-responsive tables">
		<table class="table table-striped">
			<thead>
				<tr>
					<th style="width: 15%; text-align: center;">카테고리</th>
					<th style="width: 35%; text-align: center;">업무명</th>
					<th style="width: 30%; text-align: center;">고객사명</th>
					<th style="width: 20%; text-align: center;">진행단계</th>
				</tr>
			</thead>
			<tbody class="visible-xs">
				<c:forEach items="${coworkMyListVO}" var="coworkMyListVO" varStatus="rowCount">
				<tr>
					<td>
					${coworkMyListVO.coworksubject}
					<input type="hidden" id="coworkcode" value="${coworkMyListVO.coworkcode}"/>
					</td>
					<c:choose>
						<c:when test="${fn:length(coworkMyListVO.coworktitle) > 12}">
							<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkMyListVO.coworkcode}'><c:out value="${fn:substring(coworkMyListVO.coworktitle,0,11)}"/>...</a></td>
						</c:when>
						<c:otherwise>
							<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkMyListVO.coworkcode}'>${coworkMyListVO.coworktitle}</a></td>
						</c:otherwise> 
					</c:choose>
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
			<tbody class="hidden-xs">
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