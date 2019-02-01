<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="118281903184-v4ds1n6m49q8kg5fbq7fcs8hni6k9js3.apps.googleusercontent.com.apps.googleusercontent.com">
<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript">

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
	
</script>

</head>
<body>
	<!-- 구글 로그인 화면으로 이동 시키는 URL -->
		<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
		<div id="google_id_login" style="text-align:center">
			<a href="${google_url}">
				<img width="230" src="${pageContext.request.contextPath}/resources/img/google-login-button.png"/>
			</a>
		</div>
		
		<div class="g-signin2" data-onsuccess="onSignIn"></div>
				
		
		
		
		
</body>
</html>