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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<!-- Include Choices CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/styles/choices.min.css">
<!-- Include Choices JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/scripts/choices.min.js"></script>

<script type="text/javascript">
// 		function checkcompany(){
// 			  $("select[id=companycode]").prop('disabled',false);
// 		}
// 		function checknocompany(){
// 			  $("select[id=companycode]").prop('disabled',true);
// 		}
		
  		function insertdata(){
  			
  			var formData = document.insertData;
  			
  			if(formData.managername.value == "") {
  				alert("이름을 입력해주세요.")
  				return formData.managername.focus();
  			}
  			
  			if(formData.managercompanycode.value == "") {
  				alert("소속 회사를 선택해주세요.")
  				return formData.managercompanycode.focus();
  			}
  			
  			if(formData.managerdeptname.value == "") {
  				alert("분류를 선택해주세요.")
  				return formData.managerdeptname.focus();
  			}
  			
  			if(formData.managerpositioncode.value == "") {
  				alert("직급을 선택해주세요.")
  				return formData.managerpositioncode.focus();
  			}
  			
  			if(formData.managermobile.value == "") {
  				alert("연락처를 입력해주세요.")
  				return formData.managermobile.focus();
  			}
  			
			var temp_obj = {};
			
		    temp_obj["managername"] = $("#managername").val();
		    temp_obj["managercompanycode"] = $("#managercompanycode").val();
		    temp_obj["managerdeptname"] = $("#managerdeptname").val();
		    temp_obj["managerpositioncode"] = $("#managerpositioncode").val();
		    temp_obj["managermobile"] = $("#managermobile").val();
		    temp_obj["manageremail"] = $("#manageremail").val();

  			alert(JSON.stringify(temp_obj));

  			$.ajax({
  		        url:"Insert",
  		        type:"post",
  		        data:JSON.stringify(temp_obj),
  		        datatype:"json",
  				cache : false,
  		        contentType:"application/json; charset=UTF-8",
  		        success:function(resqonse){
  		            alert("업데이트 처리되었습니다.");
  		            location.href="/qsolcowork/Manager/List";
  		        },
  		        error:function(jqXHR, textStatus, errorThrown){
  		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
  		        }
  		    });
  		}
  		
  		function cancel(){
  			location.href = "/qsolcowork/Manager/List";
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
	<form action="${pageContext.request.contextPath}/User/Insert" method="post" id="insertData" name="insertData">
	    <div class="viewListTop">
	    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">사용자 등록</span>
	    	<button type="button" id="save" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;">사용자 등록</button>
	    </div>
	
		<div class="viewListCenter" id="insertform">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">담당자 이름</p>
			<input id="managername" name="managername" type="text" class="form-control" placeholder="이름 입력.." size="50" style="width: 100%; display: inline-block;">
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">소속</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="managercompanycode" id="managercompanycode" data-live-search="true" data-width="100%" data-size="10" title="== 소속 회사를 선택해주세요 ==" style="display: inline-block;">
				<option value="" selected disabled hidden>== 소속 회사를 선택해주세요 ==</option>
				<c:forEach var="companyVO" items="${companyVO}" varStatus="list">
					<option id="managercompanycode" value="${companyVO.companycode}">${companyVO.companyname}</option>
				</c:forEach>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">부서</p>
			<select class="form-control" name="managerdeptname" id="managerdeptname">
				<option value="" selected disabled hidden>== 분류를 선택해주세요 ==</option>
				<option id="managerdeptname" value="고객사">고객사</option>
				<option id="managerdeptname" value="파트너사">파트너사</option>
				<option id="managerdeptname" value="기타">기타</option>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">직급</p>
			<select class="form-control" name="managerpositioncode" id="managerpositioncode">
				<option value="" selected disabled hidden>== 직급을 선택해주세요 ==</option>
				<c:forEach var="positionVO" items="${positionVO}" varStatus="list">
					<option id="managerpositioncode" value="${positionVO.positioncode}">${positionVO.positionname}</option>
				</c:forEach>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">연락처</p>
			<input id="managermobile" name="managermobile" type="text" class="form-control" placeholder="연락처 입력.." size="50" style="width: 100%; display: inline-block;">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">이메일</p>
			<input id="manageremail" name="manageremail" type="text" class="form-control" placeholder="이메일 입력.." size="50" style="width: 100%; display: inline-block;">
			
		</div>
	</form>
    
	<%-- <!-- 상세 뷰 페이지  -->
	<form action="${pageContext.request.contextPath}/Cowork/Insert" method="post" id="insertData" name="insertData">
	<div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="insertform">
          <h1 class="page-header">사용자등록</h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>사용자ID : <input type="text" id="userid" name="userid"></h4>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>사용자명  :  <input type="text" id="username" name="username"></h4>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>패스워드 : <input type="password" id="userpasswd" name="userpasswd"></h4>
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>소속<br> </h4>
				<select class="form-control" id="companyusercode" name="companyusercode">
					<option id="companyusercode" value="0">(주)퀀텀솔루션즈</option>
					<option id="companyusercode" value="1">고객사</option>
				</select>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>부서</h4>
	              <select class="form-control" name="deptcode" id="deptcode">
	              	<c:forEach var="deptVO" items="${deptVO}" varStatus="list">
					  <option id="deptcode" value="${deptVO.deptcode}">${deptVO.deptname}</option>
	              	</c:forEach>
				</select>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>직급</h4>
	              <select class="form-control" name="positioncode" id="positioncode">
	              	<c:forEach var="positionVO" items="${positionVO}" varStatus="list">
					  <option id="positioncode" value="${positionVO.positioncode}">${positionVO.positionname}</option>
	              	</c:forEach>
				</select>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>연락처 : <input type="text" id="usermobile" name="usermobile"> </h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>이메일 : <input type="text" id="useremail" name="useremail"></h4>
            </div>
          </div>
          <br><br>
			<div>
		        <button type="button" class="btn btn-primary" onclick="insertdata()">저장</button>
		        <button type="button" class="btn btn-primary" onclick="cancel()">취소</button>
			</div>
        </div>
	</div>
	</form> --%>
</body>
</html>