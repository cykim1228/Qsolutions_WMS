<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>[QSOLUTIONS]업무관리 시스템</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script type="text/javascript">
		function search_user(){
			var searchUser = document.SearchUser;
			searchUser.submit();
		}
		function insertView(){
			location.href = "/qsolcowork/Company/Insertform";
		}
</script>

<style>

body {

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
	margin-top: 15px;
}

.pagingView {
	width: 80%;
	height: 80%;
	margin: 0 auto; 
}

</style>

</head>
<!-- <body style="background-color:#d4d4d4"> -->
	<!-- 네비에이션 부분 (검색 및 확인 필요) -->	
    <nav class="navbar navbar-inverse">
	<div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/Cowork/List">업무관리 시스템</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-center">
            <li><a href="${pageContext.request.contextPath}/Cowork/List">업무</a></li>
            <li><a href="${pageContext.request.contextPath}/Company/List">사이트</a></li>
            <li><a href="${pageContext.request.contextPath}/User/List">사용자</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/Logout">LOGOUT</a></li>
          </ul>
		<form class="navbar-form navbar-right">
			<select class="btn btn-primary" name="SearchType">
				<option value="companyname" <c:if test="${pagingVO.searchType == 'companyname'}">seleted</c:if> >회사명</option>
				<option value="companyhomepg"<c:if test="${pagingVO.searchType == 'companyhomepg'}">seleted</c:if> >홈페이지 주소</option>
				<option value="companyaddress"<c:if test="${pagingVO.searchType == 'companyaddress'}">seleted</c:if> >회사주소</option>
			</select>
            <input type="text" class="form-control" placeholder="Search..." value="${SearchData}" name=SearchData>
          </form>
        </div>
        </div>
    </nav>
	<!-- 상세 뷰 페이지 -->
	<div class="viewListTop">
		<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">회사 리스트</span>
	    <button type="button" class="btn btn-primary pull-right" onclick="insertView()" style="margin-right: 10px; margin-top: 8px;">회사 등록</button>
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
				<c:forEach items="${companylistvo}" var="companylistvo" varStatus="rowCount">
					<tr>
						<td>${companylistvo.companyclass}</td>
						<td>${companylistvo.companycode}</td>
						<td><a href='${pageContext.request.contextPath}/Company/View?companycode=${companylistvo.companycode}'>${companylistvo.companyname}</a></td>
						<td><a href='${companylistvo.companyhomepg}'>${companylistvo.companyhomepg}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
    <!-- 5. paging view -->
    <div>
	    <div align="center" class=".col-md-3 .col-md-offset-3 pagingView">
		    <ul class="pagination">
		        <c:if test="${pagingVO.pageStartNum ne 1}">
		            <!--맨 첫페이지 이동 -->
		            <li><a onclick='pagePre(${pagingVO.pageCnt+1},${pagingVO.pageCnt});'>‹‹</a></li>
		            <!--이전 페이지 이동 -->
		            <li><a onclick='pagePre(${pagingVO.pageStartNum},${pagingVO.pageCnt});'>‹</a></li>
		        </c:if>
		        
		        <!--페이지번호 -->
		        <c:forEach var="i" begin="${pagingVO.pageStartNum}" end="${pagingVO.pageLastNum}" step="1">
		            	<li class='pageIndex${i}'>
		             		<a onclick="pageIndex(${i});">${i}</a>
		            	</li>					
		        </c:forEach>
		        <c:if test="${pagingVO.lastChk}">
		            <!--다음 페이지 이동 -->
		            <li><a onclick='pageNext(${pagingVO.pageStartNum},${pagingVO.total},${pagingVO.listCnt},${pagingVO.pageCnt});'>›</a></li>
		            <!--마지막 페이지 이동 -->
		            <li><a onclick='pageLast(${pagingVO.pageStartNum},${pagingVO.total},${pagingVO.listCnt},${pagingVO.pageCnt});'>»</a></li>
		        </c:if>
		<!-- 	        	<select class='btn btn-primary' id='listCount' name='listCount' onchange='listCnt();'> -->
		<!-- 		            <option value='5' >5</option> -->
		<!-- 		            <option value='10'>10</option> -->
		<!-- 		            <option value='15'>15</option> -->
		<!-- 		            <option value='20'>20</option> -->
		<!-- 	   		   </select>	 -->
		    </ul>	
	    </div>
	    
    </div>
    <form action="${pageContext.request.contextPath}/Company/List" method="post" id='frmPaging'>
        <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
        <input type='hidden' name='index' id='index' value='${pagingVO.index}'>
        <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pagingVO.pageStartNum}'>
        <input type='hidden' name='listCnt' id='listCnt' value='${pagingVO.listCnt}'>
        <input type='hidden' name='searchType' id='searchType' value='${pagingVO.searchType}'>
        <input type='hidden' name='searchData' id='searchData' value='${pagingVO.searchData}'>
    </form>
    
    <form action="${pageContext.request.contextPath}/Search/List" method="post">
    	<input type="text" class="form-control" placeholder="Search..." value="${SearchData}" name=SearchData>
    	<input type="submit">
    </form>
    
</body>
</html>