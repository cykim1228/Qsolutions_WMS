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
  <script type="text/javascript">
  		function updateuserform(){
			var temp_obj = {};
			
		    temp_obj["userid"] = $("#userid").val();
		    temp_obj["username"] = $("#username").val();
		    temp_obj["userpasswd"] = $("#userpasswd").val();
		    temp_obj["companyusercode"] = $("#companyusercode").val();
		    temp_obj["deptcode"] = $("#deptcode").val();
		    temp_obj["positioncode"] = $("#positioncode").val();
		    temp_obj["usermobile"] = $("#usermobile").val();
		    temp_obj["useremail"] = $("#useremail").val();

  			alert(JSON.stringify(temp_obj));

  			$.ajax({
  		        url:"Update",
  		        type:"post",
  		        data:JSON.stringify(temp_obj),
  		        datatype:"json",
  				cache : false,
  		        contentType:"application/json; charset=UTF-8",
  		        success:function(resqonse){
  		            alert("업데이트 처리되었습니다.");
  		            location.href="/qsolcowork/User/List";
  		        },
  		        error:function(jqXHR, textStatus, errorThrown){
  		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
  		        }
  		    });
  			
  		}
  		function cancel(){
  			location.href = "/qsolcowork/User/List";
  		}
  </script>

<style>

body {

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
<!-- <body  style="background-color: #d4d4d4"> -->
	<!-- 네비에이션 부분 (검색 및 확인 필요) -->	
    <nav class="navbar navbar-inverse">
	<div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/Cowork/List">업무관리 시스템</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-center">
            <li><a href="${pageContext.request.contextPath}/Cowork/List">업무</a></li>
            <li><a href="${pageContext.request.contextPath}/Company/List">사이트</a></li>
            <li><a href="${pageContext.request.contextPath}/User/List">사용자</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/Logout">LOGOUT</a></li>
          </ul>
		<form class="navbar-form navbar-right">
			<select class="btn btn-primary" name="SearchType">
	            <option value="userid" <c:if test="${pagingVO.searchType == 'userid'}">seleted</c:if> >사용자ID</option>
	            <option value="username"<c:if test="${pagingVO.searchType == 'username'}">seleted</c:if> >사용자명</option>
	            <option value="coworktitle"<c:if test="${pagingVO.searchType == 'coworktitle'}">seleted</c:if> >업무명</option>
	            <option value="companyname"<c:if test="${pagingVO.searchType == 'companyname'}">seleted</c:if> >사이트명</option>
	        </select>
            <input type="text" class="form-control" placeholder="Search..." value="${SearchData}">
          </form>
        </div>
     </div>
    </nav>
    
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
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">비밀번호</p>
			<input id="userpasswd" name="userpasswd" type="password" class="form-control" value="${userVO.userpasswd}" placeholder="PW 입력.." size="50" style="width: 100%; display: inline-block;">
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">소속</p>
			<select class="form-control" name="companyusercode" id="companyusercode">
				<option id="companyusercode" value="0" <c:if test="${userVO.companyusercode eq 0}">selected</c:if>>퀀텀솔루션즈</option>
				<option id="companyusercode" value="1" <c:if test="${userVO.companyusercode eq 1}">selected</c:if>>고객사</option>
				<option id="companyusercode" value="2" <c:if test="${userVO.companyusercode eq 2}">selected</c:if>>파트너사</option>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">부서</p>
			<select class="form-control" name="deptcode" id="deptcode">
				<c:forEach var="deptVO" items="${deptVO}" varStatus="list">
					<option id="deptcode" value="${deptVO.deptcode}" <c:if test="${userVO.deptcode == deptVO.deptcode}">selected</c:if>>${deptVO.deptname}</option>
				</c:forEach>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">직급</p>
			<select class="form-control" name="deptcode" id="positioncode">
				<c:forEach var="positionVO" items="${positionVO}" varStatus="list">
					<option id="positioncode" value="${positionVO.positioncode}" <c:if test="${userVO.positioncode == positionVO.positioncode}">selected</c:if>>
					${positionVO.positionname}
					</option>
				</c:forEach>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">연락처</p>
			<input id="usermobile" name="usermobile" type="text" class="form-control" value="${userVO.usermobile}" placeholder="연락처 입력.." size="50" style="width: 100%; display: inline-block;">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">이메일</p>
			<input id="useremail" name="useremail" type="text" class="form-control" value="${userVO.useremail}" placeholder="이메일 입력.." size="50" style="width: 100%; display: inline-block;">
			
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