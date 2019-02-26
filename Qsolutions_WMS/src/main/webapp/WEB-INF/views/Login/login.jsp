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
		<div style="text-align: center;">
		<img class="mb-4" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" >      
		</div>
		<h1 class="h3 mb-3 font-weight-normal">사내 업무 시스템</h1>
	<div>
		<label for="inputEmail" class="sr-only">UserID</label>
		<input type="text" id="userid" name="userid"  class="form-control" placeholder="아이디" value="${cookie.rememberID.value}" style="width:330px; margin: 0 auto;"  required autofocus>
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" id="userpasswd" name="userpasswd" class="form-control" placeholder="패스워드" style="width:330px; margin: 0 auto;" required>
		<input type="hidden" name="Client" value="N"/>
	</div>
	<div class="checkbox mb-3">
        <label>
          <input type="checkbox" name="useCookie"> 로그인유지
        </label>
      </div>
		<button type="button" onclick="check()" id="loginBtn" class="btn btn-default btn-lg" style="width:330px; margin-bottom: 20px">LOGIN</button>
		<!-- <button type="button" onclick="googleLogin()" id="loginBtn" class="btn btn-default btn-lg" style="width:330px; margin-bottom: 20px">GoogleLogin</button> -->
		
		<p class="mt-5 mb-3 text-muted">&copy; 2019 Copyright: 
		<a href="http://www.qsolutions.co.kr/" style="color: #0431B4;"> Quantum Solutions</a>
	  <p style="font-size: 3px;">The Dominant in Wireless Lifecycle</p></p>
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
		
		function googleLogin() {
			location.href = "/qsolcowork/Login/googleLogin";
		}
		
		function setCookie(cookieName, value, exdays){
	        var exdate = new Date();
	        exdate.setDate(exdate.getDate() + exdays);
	        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	        document.cookie = cookieName + "=" + cookieValue;
	    }
	     
	    function deleteCookie(cookieName){
	        var expireDate = new Date();
	        expireDate.setDate(expireDate.getDate() - 1); //어제날짜를 쿠키 소멸날짜로 설정
	        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	    }
	     
	    function getCookie(cookieName) {
	        cookieName = cookieName + '=';
	        var cookieData = document.cookie;
	        var start = cookieData.indexOf(cookieName);
	        var cookieValue = '';
	        if(start != -1){
	            start += cookieName.length;
	            var end = cookieData.indexOf(';', start);
	            if(end == -1)end = cookieData.length;
	            cookieValue = cookieData.substring(start, end);
	        }
	        return unescape(cookieValue);
	    }
	    
	    $(document).ready(function() {
	        //Id 쿠키 저장
	        var userInputId = getCookie("userInputId");
	        $("input[name='userId']").val(userInputId); 
	         
	        if($("input[name='userId']").val() != ""){ 
	            $("#idSaveCheck").attr("checked", true); 
	            $("#pwdSaveCheck").removeAttr("disabled");
	        }
	         
	        $("#idSaveCheck").change(function(){ 
	            if($("#idSaveCheck").is(":checked")){                     
	                   //id 저장 클릭시 pwd 저장 체크박스 활성화
	                   $("#pwdSaveCheck").removeAttr("disabled");
	                   $("#pwdSaveCheck").removeClass('no_act');
	                var userInputId = $("input[name='userId']").val();
	                setCookie("userInputId", userInputId, 365);
	            }else{ 
	                deleteCookie("userInputId");
	                $("#pwdSaveCheck").attr("checked", false); 
	                deleteCookie("userInputPwd");
	                $("#pwdSaveCheck").attr("disabled", true);
	                $("#pwdSaveCheck").addClass('no_act');
	            }
	        });
	         
	      
	        $("input[name='userId']").keyup(function(){ 
	            if($("#idSaveCheck").is(":checked")){ 
	                var userInputId = $("input[name='userId']").val();
	                setCookie("userInputId", userInputId, 365);
	            }
	        });
	        
	        //Pwd 쿠키 저장 
	        var userInputPwd = getCookie("userInputPwd");
	        $("input[name='userPwd']").val(userInputPwd); 
	         
	        if($("input[name='userPwd']").val() != ""){ 
	            $("#pwdSaveCheck").attr("checked", true);
	            $("#pwdSaveCheck").removeClass('no_act');
	        }
	         
	        $("#pwdSaveCheck").change(function(){ 
	            if($("#pwdSaveCheck").is(":checked")){ 
	                var userInputPwd = $("input[name='userPwd']").val();
	                setCookie("userInputPwd", userInputPwd, 365);
	            }else{ 
	                deleteCookie("userInputPwd");
	            }
	        });
	         
	      
	        $("input[name='userPwd']").keyup(function(){ 
	            if($("#pwdSaveCheck").is(":checked")){ 
	                var userInputPwd = $("input[name='userPwd']").val();
	                setCookie("userInputPwd", userInputPwd, 365);
	            }
	        });
	    });
		
  	</script>
</body>
</html>