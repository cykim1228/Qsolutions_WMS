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
  
</head>
<body  style="background-color: #d4d4d4">
	<!-- 네비에이션 부분 (검색 및 확인 필요) -->
	<div class="color:black" align="center">
		<nav class="navbar navbar-inverse">
			<ul class="nav nav-tabs" align="center">
			  <li role="presentation"><a href="#">Home</a></li>
			  <li role="presentation"><a href="#">Site</a></li>
			  <li role="presentation"><a href="#">work</a></li>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				  
					<button type="button" class="btn btn-default navbar-btn">LOGOUT</button>	
				</form>
			</ul>
		</nav>
	</div>
	<div>
</body>
</html>