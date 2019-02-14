<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>[QSOLUTIONS]업무관리 시스템</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script type="text/javascript">
	function search_user() {
		var searchUser = document.SearchUser;
		searchUser.submit();
	}
	function insertView() {
		location.href = "/qsolcowork/Company/Insertform";
	}
</script>

<style>
body {
	margin-top: 100px;
	margin-bottom: 100px;
}

.viewListTop {
	width: 80%;
	height: 80%;
	margin: 0 auto;
}

.viewList {
	width: 80%;
	height: 80%;
	margin: 0 auto;
	margin-top: 15px;
}

.pagingView {
	width: 80%;
	height: 80%;
	margin: 0 auto;
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body style="background-color:#d4d4d4"> -->

<!-- 상세 뷰 페이지 -->
<div class="viewListTop">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">통합 검색 결과</span>
</div>
<div class="viewList">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th style="width: 34%; text-align: center;">회사 검색 결과</th>
					<th style="width: 34%; text-align: center;">사용자 검색 결과</th>
					<th style="width: 33%; text-align: center;">업무 검색 결과</th>
				</tr>
			</thead>
			<tbody align="center">
					<tr>
						<c:forEach items="${SearchCompanyCountvo}" var="SearchCompanyCountvo" varStatus="rowCount">
							<td>${SearchCompanyCountvo.count}</td>
						</c:forEach>
						<c:forEach items="${SearchUserCountvo}" var="SearchUserCountvo" varStatus="rowCount">
							<td>${SearchUserCountvo.count}</td>
						</c:forEach>
						<c:forEach items="${SearchCoworkCountvo}" var="SearchCoworkCountvo" varStatus="rowCount">
							<td>${SearchCoworkCountvo.count}</td>
						</c:forEach>
					</tr>
			</tbody>
		</table>
	</div>
</div>


<div class="viewList">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th style="width: 10%; text-align: center;">회사 분류</th>
					<th style="width: 20%; text-align: center;">회사 코드</th>
					<th style="width: 40%; text-align: center;">회사 명</th>
					<th style="width: 30%; text-align: center;">회사 홈페이지</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${searchcompanylist}" var="searchcompanylist"
					varStatus="rowCount">
					<tr>
						<td>${searchcompanylist.companyclass}</td>
						<td>${searchcompanylist.companycode}</td>
						<td><a
							href='${pageContext.request.contextPath}/Company/View?companycode=${searchcompanylist.companycode}'>${searchcompanylist.companyname}</a></td>
						<td><a href='${searchcompanylist.companyhomepg}'>${searchcompanylist.companyhomepg}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="viewList">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th style="width: 15%; text-align: center;">사용자ID</th>
					<th style="width: 10%; text-align: center;">사용자명</th>
					<th style="width: 15%; text-align: center;">H.P</th>
					<th style="width: 15%; text-align: center;">EMail</th>
					<th style="width: 15%; text-align: center;">부서</th>
					<th style="width: 15%; text-align: center;">직급</th>
					<th style="width: 15%; text-align: center;">소속</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${searchuserlist}" var="searchuserlist"
					varStatus="rowCount">
					<tr>
						<td>${searchuserlist.userid}</td>
						<td><a
							href="${pageContext.request.contextPath}/User/View?userid=${searchuserlist.userid}">${searchuserlist.username}</a></td>
						<td><a href='tel:${searchuserlist.usermobile}'>${searchuserlist.usermobile}</a></td>
						<td><a href='mailto:${searchuserlist.useremail}'>${searchuserlist.useremail}</a></td>
						<td>${searchuserlist.deptname}</td>
						<td>${searchuserlist.positionname}</td>
						<td>${searchuserlist.companyname}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="viewList">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th style="width: 10%; text-align: center;">카테고리</th>
					<th style="width: 15%; text-align: center;">업무코드</th>
					<th style="width: 15%; text-align: center;">고객사명</th>
					<th style="width: 20%; text-align: center;">제목</th>
					<th style="width: 20%; text-align: center;">등록자</th>
					<th style="width: 20%; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${searchcoworklist}" var="searchcoworklist"
					varStatus="rowCount">
					<tr>
						<td>${searchcoworklist.coworksubject}</td>
						<td>${searchcoworklist.coworkcode}</td>
						<td><a
							href='${pageContext.request.contextPath}/Company/View?companycode=${searchcoworklist.companycode}'>${searchcoworklist.companyname}</a></td>
						<td><a
							href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${searchcoworklist.coworkcode}'>${searchcoworklist.coworktitle}</a></td>
						<td><a
							href='${pageContext.request.contextPath}/User/View?userid=${searchcoworklist.userid}'>${searchcoworklist.username}</a></td>
						<td>${searchcoworklist.coworkdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>