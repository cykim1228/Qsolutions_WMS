<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>[QSOLUTIONS]업무관리 시스템</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signin.css">
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>

</head>
<body class="text-center">
	<form class="form-signin" name="SendLogin" action="${pageContext.request.contextPath}/Login" method="POST">
		<!-- 로그인 폼  -->
		<img class="mb-4" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="">      
		<h1 class="h3 mb-3 font-weight-normal">사내 업무 시스템</h1>
		
		<label for="inputEmail" class="sr-only">UserID</label>
		<input type="text" id="userid" name="userid"  class="form-control" placeholder="아이디" value="${cookie.rememberID.value}"  required autofocus>
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" id="userpasswd" name="userpasswd" class="form-control" placeholder="패스워드" required>
		<input type="hidden" name="Client" value="N"/>
	
	<div class="checkbox mb-3">
        <label>
          <input type="checkbox" name="useCookie"> 로그인유지
        </label>
      </div>
		<button type="button" onclick="check()" id="loginBtn" class="btn btn-default btn-lg" style=" margin-bottom: 20px">LOGIN</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
	</form>
	<script>
		var LoginForm = document.SendLogin;
		
		$(document).ready(function(){
		
			//아이디input에서 엔터입력시 비밀번호input으로 넘어감
			$('#userid').keydown(function(event){
				if(event.keyCode == 13){
					$('#userpasswd').focus();
				}
			});
			
			//비밀번호input에서 엔터를 누르면 로그인 클릭됨
			$('#userpasswd').keydown(function(event) {
				if(event.keyCode == 13){
					$('#loginBtn').trigger('click');
				}
			});
		});
		
		function check(){
			if(LoginForm.userid.value == ""){
				alert("아이디를 입력해주시기 바랍니다.");
				setTimeout(function() { $('input[name="userid"]').focus() }, 1000);
				return;
			}
			if(LoginForm.userpasswd.value == ""){
				alert("패스워드를 입력해주시기 바랍니다.");
				setTimeout(function() { $('input[name="userpasswd"]').focus() }, 1000);
				return;
			}
			LoginForm.submit();
		}
  	</script>
</body>
</html>