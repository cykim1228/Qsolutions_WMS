<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>Google Nexus Website Menu</title>
	<meta name="description" content="A sidebar menu as seen on the Google Nexus 7 website" />
	<meta name="keywords" content="google nexus 7 menu, css transitions, sidebar, side menu, slide out menu" />
	<meta name="author" content="Codrops" />
	
	<!-- 파비콘 (웹페이지 아이콘) -->
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/manifest.json"> 
	<meta name="theme-color" content="#ffffff">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/component.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
	
<style type="text/css">
body {
	padding-top: 80px;
	background-color: white;
}
.iconcss {
	margin: 0px 15px;
} 
.header {
  position: fixed;
  display: inline-block;
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

</style>

<script type="text/javascript">

$(window).load(function() {    
	$('#loading').hide();  
});

//FadeOut page loader
$(window).load(function(){
    $(".page-loader").fadeOut("slow");
});

function usersetting(){
	var userid = $("#userid").val();
	var url = "/User/Setting?userid="+userid;
	// alert(url);
	location.href = url;
}

</script>

</head>
<body>

<!-- ========== LOADER ========== -->
<div class="page-loader">
    <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" width="180" class="logo-img logo-loader animated infinite pulse">
</div>

<div class="header" style="z-index: 5000">
	<div class="container indexs">
		<ul id="gn-menu" class="gn-menu-main">
			<li class="gn-trigger">
				<a class="gn-icon gn-icon-menu indexs"><span>Menu</span></a>
				<nav class="gn-menu-wrapper indexs">
					<div class="gn-scroller">
						<ul class="gn-menu">
							<li class="gn-search-item">
								<form action="${pageContext.request.contextPath}/Search/List" method="post">
								<input placeholder="통합검색.." type="search" class="gn-search" value="${SearchData}" name=SearchData>
								<a class="gn-icon gn-icon-search"><span>Search</span></a>
								</form>
							</li>
							<%-- <li>
								<a class="gn-icon gn-icon-download" href="${pageContext.request.contextPath}/Cowork/List">업무</a>
								<ul class="gn-submenu">
									<li><a class="gn-icon gn-icon-illustrator">Vector Illustrations</a></li>
									<li><a class="gn-icon gn-icon-photoshop">Photoshop files</a></li>
								</ul>
							</li> --%>
							<li><a href="${pageContext.request.contextPath}/Cowork/List"><i class="fa fa-clipboard fa-fw fa-lg iconcss" aria-hidden="true"></i>업무</a></li>
							<li><a href="${pageContext.request.contextPath}/Company/List"><i class="fa fa-building fa-fw fa-lg iconcss" aria-hidden="true"></i>사이트</a></li>
							<li><a href="${pageContext.request.contextPath}/User/List"><i class="fa fa-user fa-fw fa-lg iconcss" aria-hidden="true"></i>담당자</a></li>
							<li><a href="${pageContext.request.contextPath}/Equipment/List"><i class="fa fa-server fa-fw fa-lg iconcss" aria-hidden="true"></i>장비</a></li>
							<li><a href="${pageContext.request.contextPath}/Cowork/Calendar"><i class="fa fa-calendar fa-fw fa-lg iconcss" aria-hidden="true"></i>업무캘린더</a></li>
							<li><a href="${pageContext.request.contextPath}/Cowork/CalendarGoogle"><i class="fa fa-google fa-fw fa-lg iconcss" aria-hidden="true"></i>구글캘린더</a></li>
							<li><a onclick="usersetting()"><i class="fa fa-cog fa-fw fa-lg iconcss" aria-hidden="true"></i>설정</a></li>
							<%-- <li><a href="${pageContext.request.contextPath}/Cowork/GNtest"><i class="fa fa-home fa-fw fa-lg iconcss" aria-hidden="true"></i>테스트</a></li> --%>
							<!-- <li><a class="gn-icon gn-icon-cog">Settings</a></li>
							<li><a class="gn-icon gn-icon-help">Help</a></li>
							<li>
								<a class="gn-icon gn-icon-archive">Archives</a>
								<ul class="gn-submenu">
									<li><a class="gn-icon gn-icon-article">Articles</a></li>
									<li><a class="gn-icon gn-icon-pictures">Images</a></li>
									<li><a class="gn-icon gn-icon-videos">Videos</a></li>
								</ul>
							</li> -->
						</ul>
					</div><!-- /gn-scroller -->
				</nav>
			</li>
			<li><a style="padding: 0 20px;" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" style="width: 120px;"></a></li>
			<li><a style="padding: 0 20px;" href="${pageContext.request.contextPath}/Logout"><i class="fa fa-sign-out fa-fw fa-lg" aria-hidden="true"></i>LOGOUT</a></li>
		</ul>
		<!-- <header>
			<h1>Google Nexus Website Menu <span>A sidebar menu as seen on the <a href="http://www.google.com/nexus/index.html">Google Nexus 7</a> page</span></h1>	
		</header>  -->
	</div><!-- /container -->
</div>
	<script src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gnmenu.js"></script>
	<script>
		new gnMenu( document.getElementById( 'gn-menu' ) );
	</script>

</body>
</html>