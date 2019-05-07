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
  
  <link rel="shortcut icon"" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<style type="text/css">

/* The customcheck */
.customcheck {
    display: inline-block;
    position: relative;
    padding-left: 2px;
    cursor: pointer;
    font-size: 15px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    text-align: left;
    margin-left: 15px;
}

/* Hide the browser's default checkbox */
.customcheck input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 20px;
    width: 20px;
    background-color: white;
    border-radius: 5px;
    border: 1px solid gray;
}

/* On mouse-over, add a grey background color */
.customcheck:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.customcheck input:checked ~ .checkmark {
    background-color: #02cf32;
    border-radius: 5px;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.customcheck input:checked ~ .checkmark:after {
    display: inline-block;
}

/* Style the checkmark/indicator */
.customcheck .checkmark:after {
    left: 6px;
    top: 2px;
    width: 7px;
    height: 13px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}

</style>

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
	<div style="padding: 10px 70px;">
        <label class="customcheck"><p style="margin-left: 30px;">아이디기억</p>
          <input type="checkbox" id="idSaveCheck">
          <span class="checkmark"></span>
        </label>
        <br>
        <label class="customcheck"><p style="margin-left: 30px;">로그인유지</p>
          <input type="checkbox" name="useCookie">
          <span class="checkmark"></span>
        </label>
	</div>
	<!-- <div class="checkbox mb-3">
        <label>
        	<input type="checkbox" id="idSaveCheck">아이디 기억
	        <input type="checkbox" name="useCookie" style="margin-left: 10px;"><p style="margin-left: 10px;">로그인유지</p>
        </label>
      </div> -->
		<button type="button" onclick="check()" id="loginBtn" class="btn btn-default btn-lg" style="width:330px; margin-bottom: 20px">LOGIN</button>
		<!-- <button type="button" onclick="googleLogin()" id="loginBtn" class="btn btn-default btn-lg" style="width:330px; margin-bottom: 20px">GoogleLogin</button> -->
		
		<p class="mt-5 mb-3 text-muted">&copy; 2019 Copyright:
		<a href="http://www.qsolutions.co.kr/" style="color: #0431B4;"> Quantum Solutions</a>
	  <p style="font-size: 80%;">The Dominant in Wireless Lifecycle</p></p>
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
			location.href = "/Login/googleLogin";
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
		
	    $(document).ready(function(){
	    	 
	        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	        var key = getCookie("key");
	        $("#userid").val(key); 
	         
	        if($("#userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	            $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	        }
	         
	        $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	            if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	                setCookie("key", $("#userid").val(), 7); // 7일 동안 쿠키 보관
	            }else{ // ID 저장하기 체크 해제 시,
	                deleteCookie("key");
	            }
	        });
	         
	        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	        $("#userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	            if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	                setCookie("key", $("#userid").val(), 7); // 7일 동안 쿠키 보관
	            }
	        });
	    });
	     
	    function setCookie(cookieName, value, exdays){
	        var exdate = new Date();
	        exdate.setDate(exdate.getDate() + exdays);
	        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	        document.cookie = cookieName + "=" + cookieValue;
	    }
	     
	    function deleteCookie(cookieName){
	        var expireDate = new Date();
	        expireDate.setDate(expireDate.getDate() - 1);
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

	    
  	</script>
</body>
</html>