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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<!-- Include Choices CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/styles/choices.min.css">
<!-- Include Choices JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/scripts/choices.min.js"></script>

<script type="text/javascript">
  		function updateuserform(){
  			
			var formData = document.insertData;
  			
  			if(formData.username.value == "") {
  				alert("이름을 입력해주세요.")
  				return formData.username.focus();
  			}
  			
  			if(formData.usercompanycode.value == "") {
  				alert("소속 회사를 선택해주세요.")
  				return formData.usercompanycode.focus();
  			}
  		
  			if(formData.positioncode.value == "") {
  				alert("직급을 선택해주세요.")
  				return formData.positioncode.focus();
  			}
  			
  			if(formData.usermobile.value == "") {
  				alert("연락처를 입력해주세요.")
  				return formData.usermobile.focus();
  			}
  			
			var temp_obj = {};
			
		    temp_obj["userid"] = $("#userid").val();
		    temp_obj["username"] = $("#username").val();
		    temp_obj["userpasswd"] = $("#userpasswd").val();
		    temp_obj["usercompanycode"] = $("#usercompanycode").val();
		    temp_obj["deptcode"] = $("#deptcode").val();
		    temp_obj["positioncode"] = $("#positioncode").val();
		    temp_obj["usermobile"] = $("#usermobile").val();
		    temp_obj["useremail"] = $("#useremail").val();

  			// alert(JSON.stringify(temp_obj));

  			$.ajax({
  		        url:"Update",
  		        type:"post",
  		        data:JSON.stringify(temp_obj),
  		        datatype:"json",
  				cache : false,
  		        contentType:"application/json; charset=UTF-8",
  		        success:function(resqonse){
  		            alert("업데이트 처리되었습니다.");
  		            location.href="/User/List";
  		        },
  		        error:function(jqXHR, textStatus, errorThrown){
  		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
  		        }
  		    });
  			
  		}
  		function cancel(){
  			location.href = "/User/List";
  		}
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

.viewListCenter {
	width: 60%;
	height: 80%;
	margin: 0 auto; 
	margin-top: 50px;
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
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
}

.roundedSubNo {
	display: inline-block;
	width: 8%;
	height: 74px;
	background-color: #E6E6E6;
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
	text-align: center;
}

.roundedSubName {
	display: inline-block;
	width: 15%;
	height: 74px;
	background-color: #E6E6E6;
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
	text-align: center;
}

.roundedSubText {
	display: inline-block;
	width: 51%; 
	height: 74px;
	background-color: #E6E6E6;
	border:2px solid #ddd;
	padding:0.5em;
	line-height: 1em;
	border-radius:0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
	<form action="${pageContext.request.contextPath}/Cowork/Insert" method="post" id="insertData" name="insertData">
	    <div class="viewListTop">
	    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">사용자 수정</span>
	    	<button type="button" id="save" class="btn btn-primary pull-right" onclick="updateuserform()" style="margin-right: 10px; margin-top: 8px;">사용자 수정</button>
	    </div>
	
		<div class="viewListCenter" id="insertform">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">사용자 ID</p>
			<input id="userid" name="userid" type="text" class="form-control" value="${userVO.userid}" placeholder="ID 입력.." size="50" style="width: 100%; display: inline-block;" readonly="readonly">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">사용자 이름</p>
			<input id="username" name="username" type="text" class="form-control" value="${userVO.username}" placeholder="이름 입력.." size="50" style="width: 100%; display: inline-block;">
			
			<c:choose>
				<c:when test="${userVO.companyname eq '(주) 퀀텀솔루션즈'}">
					<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">비밀번호</p>
					<input id="userpasswd" name="userpasswd" type="password" class="form-control" value="${userVO.userpasswd}" placeholder="PW 입력.." size="50" style="width: 100%; display: inline-block;">
				</c:when>
				<c:otherwise>
					<input id="userpasswd" name="userpasswd" type="hidden" class="form-control" value="${userVO.userpasswd}" placeholder="PW 입력.." size="50" style="width: 100%; display: inline-block;">
				</c:otherwise>
			</c:choose>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">소속</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="usercompanycode" id="usercompanycode" data-live-search="true" data-width="100%" data-size="10" title="== 소속 회사를 선택해주세요 ==" style="display: inline-block;">
				<option value="" selected disabled hidden>== 소속 회사를 선택해주세요 ==</option>
				<c:forEach var="companyVO" items="${companyVO}" varStatus="list">
					<option id="usercompanycode" value="${companyVO.companycode}" <c:if test="${userVO.usercompanycode == companyVO.companycode}">selected</c:if>>${companyVO.companyname}</option>
				</c:forEach>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">부서</p>
			<select class="form-control" name="deptcode" id="deptcode">
				<option value="" selected disabled hidden>== 소속 혹은 부서를 선택해주세요 ==</option>
			<c:choose>
				<c:when test="${userVO.companyname eq '(주) 퀀텀솔루션즈'}">
					<c:forEach var="deptVO" items="${deptVO}" varStatus="list">
						<option id="deptcode" value="${deptVO.deptcode}" <c:if test="${userVO.deptcode == deptVO.deptcode}">selected</c:if>>${deptVO.deptname}</option>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<option id="deptcode" value="A00000"<c:if test="${userVO.deptcode == 'A00000'}">selected</c:if>>고객사</option>
					<option id="deptcode" value="B00000"<c:if test="${userVO.deptcode == 'B00000'}">selected</c:if>>파트너사</option>
				</c:otherwise>
			</c:choose>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">직급</p>
			<select class="form-control" name="deptcode" id="positioncode">
				<option value="" selected disabled hidden>== 직급을 선택해주세요 ==</option>
				<c:forEach var="positionVO" items="${positionVO}" varStatus="list">
					<option id="positioncode" value="${positionVO.positioncode}" <c:if test="${userVO.positioncode == positionVO.positioncode}">selected</c:if>>
					${positionVO.positionname}
					</option>
				</c:forEach>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">연락처</p>
			<input id="usermobile" name="usermobile" type="text" class="form-control" value="${userVO.usermobile}" placeholder="연락처 입력.." size="50" style="width: 100%; display: inline-block;">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">이메일</p>
			<input id="useremail" name="useremail" type="text" class="form-control" value="${userVO.useremail}" placeholder="이메일 입력.." size="50" style="width: 100%; display: inline-block; margin-bottom: 100px;">
			
		</div>
	</form>
    
	<%-- <!-- 상세 뷰 페이지  -->
	<div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">사용자ID : ${userVO.userid}</h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>사용자 이름 : <input type="text" id="username" name="username"  value="${userVO.username}"></h4>
              <input type="hidden" id="userid" value="${userVO.userid}"/>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>부서 :
	              <select class="form-control" name="deptcode" id="deptcode">
	              	<c:forEach var="deptVO" items="${deptVO}" varStatus="list">
					  <option id="deptcode" value="${deptVO.deptcode}" <c:if test="${userVO.deptcode == deptVO.deptcode}">seleted</c:if>>${deptVO.deptname}</option>
	              	</c:forEach>
				</select>
				</h4>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>직급 :
	              <select class="form-control" name="deptcode" id="deptcode">
	              	<c:forEach var="positionVO" items="${positionVO}" varStatus="list">
						<option id="positioncode" value="${positionVO.positionname}" <c:if test="${positionVO.positionname == positionVO.positionname}">seleted</c:if>>
							${positionVO.positionname}
						</option>
	              	</c:forEach>
				</select></h4>
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>핸드폰 번호 : <input type="text" id="usermobile" name="usermobile"  value="${userVO.usermobile}"></h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>이메일주소 : <input type="text" id="useremail" name="useremail"  value="${userVO.useremail}"></h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>
              	소속 : 
              	  <select class="form-control" name="companyusercode" id="companyusercode">
              	 	 <option id="companyusercode" value="${userVO.companyusercode}" <c:if test="${userVO.companyusercode == 1}">seleted</c:if>>퀀텀솔루션즈</option>
              	 	 <option id="companyusercode" value="${userVO.companyusercode}" <c:if test="${userVO.companyusercode == 0}">seleted</c:if>>고객사</option>
              	  </select>
              </h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4></h4>
            </div>
          </div>
          <br><br>
			<div class="row">
				<div class="col-xs-12 col-sm-6 placeholder">
			        <button type="button" class="btn btn-primary" onclick="updateuserform()">수정</button>
				</div>
				<div class="col-xs-12 col-sm-6 placeholder right">
				    <button type="button" class="btn btn-primary" onclick="cancel()">취소</button>
				</div>
			</div>
        </div>
	</div> --%>
</body>
</html>