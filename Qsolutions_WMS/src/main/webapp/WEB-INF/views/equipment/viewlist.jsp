<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>[QSOLUTIONS]업무관리 시스템</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.ice.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tablesorter.js"></script>
	
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

	<script type="text/javascript">
		function search_user(){
			var searchUser = document.SearchUser;
			searchUser.submit();
		}
		function insertView(){
			location.href = "/Equipment/Insertform";
		}
		
		/* $(function() {
			$("#myTable").tablesorter();
		}); */
		
		$(document).ready(function() {
			$("#excelConvertBtn").on('click', function() {
				location.href = "../toExcel/companyListToExcel";
			})
		})
		
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
	margin-top: 15px;
}

.pagingView {
	width: 80%;
	height: 80%;
	margin: 0 auto; 
	margin-bottom: 80px;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body style="background-color:#d4d4d4"> -->
	<!-- 상세 뷰 페이지 -->
	<div class="viewListTop" style="margin-bottom: 10px;">
		<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">장비 리스트</span>
		<br class="visible-xs">
	    <button type="button" class="btn btn-primary pull-right" onclick="insertView()" style="margin-left:10px; margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">장비 등록</button>
<!-- 	
	    <input type="button" class="btn btn-success pull-right" name="excelConvertBtn" id="excelConvertBtn" value="엑셀 출력" style="cursor:hand; margin-left:10px; margin-top: 8px; margin-bottom: 10px;" />
 -->
 	    <form class="navbar-form navbar-right hidden-xs" style="border-right-width: 2px; border-right-style: solid; border-right-color: gray; margin-right: 5px;">
			<select class="btn btn-primary" name="SearchType">
				<option value="equipmentcode" <c:if test="${pagingVO.searchType == 'equipmentcode'}">seleted</c:if> >장비 코드</option>
				<option value="equipmentname"<c:if test="${pagingVO.searchType == 'equipmentname'}">seleted</c:if> >장비 명</option>
			</select>
            <input type="text" class="form-control" placeholder="Search..." value="${SearchData}" name="SearchData">
            <input type="submit" class="btn btn-primary" value="검색">
        </form>
        <br class="visible-xs" style="margin-bottom: 10px;">
		</div>
	<div class="viewList">
	<div class="table-responsive">
		<table id="myTable" class="table table-striped tablesorter">
			<thead align="center">
				<tr>
					<th style="width: 10%; text-align: center;">장비 분류</th>
					<th class="hidden-xs" style="width: 20%; text-align: center;">장비 코드</th>
					<th style="width: 40%; text-align: center;">장비 명</th>
					<th class="hidden-xs" style="width: 30%; text-align: center;">장비 비고</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${equipmentlistvo}" var="equipmentlistvo" varStatus="rowCount">
					<tr>
						<td>${equipmentlistvo.equipmentcode}</td>
						<td class="hidden-xs">${equipmentlistvo.equipmentcode}</td>
						<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Equipment/View?equipmentcode=${equipmentlistvo.equipmentcode}'>${equipmentlistvo.equipmentname}</a></td>
						<td class="hidden-xs">${equipmentlistvo.equipmentcode}</td>
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
    <div class="viewList">
    <form action="${pageContext.request.contextPath}/Equipment/List" method="post" id='frmPaging'>
        <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
        <input type='hidden' name='index' id='index' value='${pagingVO.index}'>
        <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pagingVO.pageStartNum}'>
        <input type='hidden' name='listCnt' id='listCnt' value='${pagingVO.listCnt}'>
        <input type='hidden' name='searchType' id='searchType' value='${pagingVO.searchType}'>
        <input type='hidden' name='searchData' id='searchData' value='${pagingVO.searchData}'>
    </form>
    </div>
</body>
</html>