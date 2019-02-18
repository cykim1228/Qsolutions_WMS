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
	<script type="text/javascript">
		function search_user(){
			var searchUser = document.SearchUser;
			searchUser.submit();
		}
		function viewuser(){
			var userid = $("#userid").val();
			//alert(senddelvar);
			alert(userid);
			$.ajax({
	        url:"View",
	        type:"get",
	        data:{"userid":userid},
	        datatype:"text",
	        contentType:"application/text;charset=UTF-8",
	        success:function(data){
	            
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
			});	
		}
		function insertView(){
			location.href = "/qsolcowork/User/Insertform";
		}
		
		$(function() {
			  $("#myTable").tablesorter();
			});
		
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
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body style="background-color:#d4d4d4"> -->

	<!-- 상세 뷰 페이지 -->
	<div class="viewListTop">
		<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">담당자 리스트</span>
	    <button type="button" class="btn btn-primary pull-right" onclick="insertView()" style="margin-left:10px; margin-right: 10px; margin-top: 8px;">담당자 등록</button>
	    <form class="navbar-form navbar-right" style="border-right-width: 2px; border-right-style: solid; border-right-color: gray; margin-right: 5px;">
			<select class="btn btn-primary" name="SearchType">
	            <option value="username"<c:if test="${pagingVO.searchType == 'username'}">seleted</c:if> >담당자명</option>
	            <option value="userid" <c:if test="${pagingVO.searchType == 'userid'}">seleted</c:if> >담당자ID</option>
	        </select>
            <input type="text" class="form-control" placeholder="Search..." value="${SearchData}" name="SearchData">
            <input type="submit" class="btn btn-primary" value="검색">
          </form>
	</div>
	<div class="viewList">
		<div class="table-responsive">
		<table id="myTable" class="table table-striped tablesorter" >
			<thead align="center">
				<tr>
					<th style="width: 15%; text-align: center;">담당자ID</th>
					<th style="width: 10%; text-align: center;">담당자명</th>
					<th style="width: 15%; text-align: center;">H.P</th>
					<th style="width: 20%; text-align: center;">EMail</th>
					<th style="width: 10%; text-align: center;">부서</th>
					<th style="width: 10%; text-align: center;">직급</th>
					<th style="width: 20%; text-align: center;">소속</th>
				</tr>	
			</thead>
			<tbody align="center">
				<c:forEach items="${userVO}" var="userVO" varStatus="rowCount">
					<tr>
						<td>${userVO.userid}</td>
						<td style="font-weight: bold;"><a href="${pageContext.request.contextPath}/User/View?userid=${userVO.userid}">${userVO.username}</a></td>
						<td><a href='tel:${userVO.usermobile}'>${userVO.usermobile}</a></td>
						<td><a href='mailto:${userVO.useremail}'>${userVO.useremail}</a></td>
						<td>${userVO.deptname}</td>
						<td>${userVO.positionname}</td>
						<td>${userVO.companyname}</td>
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
	    <!-- <div class=".col-md-3 .col-md-offset-9" align="right">
	    	<button type="button" class="btn btn-primary" onclick="insertView()">사용자등록</button>
	    </div> -->
    </div>
    <form action="${pageContext.request.contextPath}/User/List" method="post" id='frmPaging'>
        <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
        <input type='hidden' name='index' id='index' value='${pagingVO.index}'>
        <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pagingVO.pageStartNum}'>
        <input type='hidden' name='listCnt' id='listCnt' value='${pagingVO.listCnt}'>
        <input type='hidden' name='searchType' id='searchType' value='${pagingVO.searchType}'>
        <input type='hidden' name='searchData' id='searchData' value='${pagingVO.searchData}'>
    </form>
</body>
</html>