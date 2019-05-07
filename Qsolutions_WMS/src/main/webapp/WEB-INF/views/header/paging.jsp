<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paging.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pagingAjax.js"></script>
</head>
<body>

<!--맨 첫페이지 이동 -->
<!--이전 페이지 이동 -->
<ul class="pagination preBtn"></ul>
<!--페이지번호 -->
<ul class="pagination index"></ul>
<!--다음 페이지 이동 -->
<!--마지막 페이지 이동 -->
<ul class="pagination nextBtn"></ul>
	
</body>
</html>