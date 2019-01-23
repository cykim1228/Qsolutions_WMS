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

	    $(document).ready(function(){
	        $("#header").load("header.html")
	       /* id 지정을 통해서도 가능합니다. 
	        $("#header").load("header.html #navbar")
	        */       
	     });
		function search_user(){
			var searchUser = document.SearchUser;
			searchUser.submit();
		}
		function insertView(){
			location.href = "/qsolcowork/Cowork/Insertform";
		}
		
		var list = '';
		
		//전체 업무리스트 출력
		function getAllUserList(){
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/admin/userList/all',
				success : function(data){
					$(data).each(function(index, item) {
						list += '<tr>';
						list += '<td>'+ item.user_id +'</td>';
						list += '<td>'+ item.user_name +'</td>';
						list += '<td>'+ item.user_phone +'</td>';
						list += '<td>'+ item.user_birth +'</td>';
						list += '</tr>';
						$('#userListBody').html(list);
					});
					list = '';
				}
			});
		};
		
		function sorting(sortName, orderBy){
			var that = (this);		
			
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/Cowork/List/sort',
				data : {
					sortName : sortName,
					orderBy : orderBy,
				},
				success : function(data){
					
					if($('#coworkcodeTh').attr('onclick') == "sorting('user_id', 'desc')"){
						$('#coworkcodeTh').attr('onclick', "sorting('user_id', 'asc')");
					} else {
						$('#coworkcodeTh').attr('onclick', "sorting('user_id', 'desc')");
					}
					
					if($('#userNameTh').attr('onclick') == "sorting('user_Name', 'desc')"){
						$('#userNameTh').attr('onclick', "sorting('user_Name', 'asc')");
					} else {
						$('#userNameTh').attr('onclick', "sorting('user_Name', 'desc')");
					}
					
					if($('#useridTh').attr('onclick') == "sorting('userid', 'desc')"){
						$('#useridTh').attr('onclick', "sorting('userid', 'asc')");
					} else {
						$('#useridTh').attr('onclick', "sorting('userid', 'desc')");
					}
					
					if($('#userBirthTh').attr('onclick') == "sorting('user_Birth', 'desc')"){
						$('#userBirthTh').attr('onclick', "sorting('user_Birth', 'asc')");
					} else {
						$('#userBirthTh').attr('onclick', "sorting('user_Birth', 'desc')");
					}
				}
			});
		};
		
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
<body>
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
	            <option value="userid" <c:if test="${pagingVO.searchType == 'userid'}">seleted</c:if> >사용자ID</option>
	            <option value="username"<c:if test="${pagingVO.searchType == 'username'}">seleted</c:if> >사용자명</option>
	            <option value="coworktitle"<c:if test="${pagingVO.searchType == 'coworktitle'}">seleted</c:if> >업무명</option>
	            <option value="companyname"<c:if test="${pagingVO.searchType == 'companyname'}">seleted</c:if> >사이트명</option>
	        </select>
            <input type="text" class="form-control" placeholder="Search..." value="${SearchData}" name=SearchData>
          </form>
        </div>
        </div>
    </nav>
    
	<!-- 상세 뷰 페이지 -->
	<div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">업무 리스트</span>
    	<button type="button" class="btn btn-primary pull-right" onclick="insertView()" style="margin-right: 10px; margin-top: 8px;">업무 등록</button>
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
				<c:forEach items="${coworklistvo}" var="coworklistvo" varStatus="rowCount">
					<tr>
						<td>${coworklistvo.coworksubject}</td>
						<td>${coworklistvo.coworkcode}</td>
						<td><a href='${pageContext.request.contextPath}/Company/View?companycode=${coworklistvo.companycode}'>${coworklistvo.companyname}</a></td>
						<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworklistvo.coworkcode}'>${coworklistvo.coworktitle}</a></td>
						<td><a href='${pageContext.request.contextPath}/User/View?userid=${coworklistvo.userid}'>${coworklistvo.userid}</a></td>
						<td>${coworklistvo.coworkdate}</td>
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
		    </ul>	
	    </div>
    </div>
    <form action="${pageContext.request.contextPath}/Cowork/List" method="post" id='frmPaging'>
        <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
        <input type='hidden' name='index' id='index' value='${pagingVO.index}'>
        <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pagingVO.pageStartNum}'>
        <input type='hidden' name='listCnt' id='listCnt' value='${pagingVO.listCnt}'>
        <input type='hidden' name='searchType' id='searchType' value='${pagingVO.searchType}'>
        <input type='hidden' name='searchData' id='searchData' value='${pagingVO.searchData}'>
    </form>
</body>
</html>