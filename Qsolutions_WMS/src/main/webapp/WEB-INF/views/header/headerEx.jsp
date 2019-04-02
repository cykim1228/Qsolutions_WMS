<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>

<script type="text/javascript">

$(window).load(function() {    
	$('#loading').hide();  
});

//FadeOut page loader
$(window).load(function(){
    $(".page-loader").fadeOut("slow");
});

</script>

<style>
body {
	
}

.header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 5;
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

.rounded {
	width: 100%;
	height: 200px;
	background-color: #E6E6E6;
	border: 2px solid #ddd;
	padding: 0.5em;
	line-height: 1em;
	border-radius: 0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
}

.roundedSubNo {
	display: inline-block;
	width: 8%;
	height: 74px;
	background-color: #E6E6E6;
	border: 2px solid #ddd;
	padding: 0.5em;
	line-height: 1em;
	border-radius: 0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
	text-align: center;
}

.roundedSubName {
	display: inline-block;
	width: 15%;
	height: 74px;
	background-color: #E6E6E6;
	border: 2px solid #ddd;
	padding: 0.5em;
	line-height: 1em;
	border-radius: 0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
	text-align: center;
}

.roundedSubText {
	display: inline-block;
	width: 51%;
	height: 74px;
	background-color: #E6E6E6;
	border: 2px solid #ddd;
	padding: 0.5em;
	line-height: 1em;
	border-radius: 0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
}
#loading {
	width: 100%;  
	height: 100%;  
	top: 0px;
	left: 0px;
	position: fixed;  
	display: block;  
	opacity: 0.7;  
	background-color: #fff;  
	z-index: 99;  
	text-align: center; 
} 
  
#loading-image {  
	position: absolute;  
	top: 50%;  
	left: 50%; 
	z-index: 100; 
}

.page-loader {
	position:fixed;
	z-index:10001;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:#f2f2f2;
}

.page-loader img.logo-loader,.spinner {
	position:absolute;
	top:0;
	bottom:0;
	left:0;
	right:0;
	margin:auto;
}

.logo-img {
	max-height:40px;
	-webkit-transition:all .4s ease-in-out;
	transition:all .4s ease-in-out;
}

.logo-loader,.spinner {
	position:absolute;
	top:0;
	bottom:0;
	left:0;
	right:0;
	margin:auto;
}

.animated {
	opacity:1;
}

// Small devices (landscape phones, 768px 미만)
@media (max-width: 767px) { 
	.searchbar {
		width: 500px;
	}
}

</style>

</head>
<body>
	<%-- <div id="loading">
		<img id="loading-image" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Loading..." />
	</div> --%>

	<!-- ========== LOADER ========== -->
    <div class="page-loader">
        <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" width="180" class="logo-img logo-loader animated infinite pulse">
    </div>

	<!-- 네비에이션 부분 (검색 및 확인 필요) -->
	<nav class="navbar navbar-inverse header">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/Dashboard">업무관리 시스템</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-center">
					<li><a href="${pageContext.request.contextPath}/Cowork/List">업무</a></li>
					<li><a href="${pageContext.request.contextPath}/Company/List">사이트</a></li>
					<li><a href="${pageContext.request.contextPath}/User/List">담당자</a></li>
					<li><a href="${pageContext.request.contextPath}/Cowork/Calendar">업무캘린더</a></li>
					<li><a href="${pageContext.request.contextPath}/Cowork/CalendarGoogle">구글캘린더</a></li>
					<li><a href="${pageContext.request.contextPath}/Cowork/GNtest">테스트</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/Logout">LOGOUT</a></li>
				</ul>
				<form action="${pageContext.request.contextPath}/Search/List" method="post" class="navbar-form navbar-right">
			    	<input type="text" class="form-control searchbar" placeholder="통합검색.." value="${SearchData}" name=SearchData>
			    	<input type="submit" class="btn btn-primary" value="검색">
    			</form>
			</div>
		</div>
	</nav>
</body>
</html>