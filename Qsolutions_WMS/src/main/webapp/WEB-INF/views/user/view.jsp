<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>[QSOLUTIONS]업무관리 시스템</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
  <script type="text/javascript">
	function updateuserform(){
		var userid = $("#userid").val();
		var url = "/qsolcowork/User/Updateform?userid="+userid;
		alert(url);
		location.href = url;
	}

	function deleteuserdata(){
	    var temp_obj = {};
	    var answer = confirm("삭제하시겠습니까??")
	    if (answer) {
		    temp_obj["userid"] = $("#userid").val();
			alert(JSON.stringify(temp_obj));
			//alert(senddelvar);
			$.ajax({
	        url:"Delete",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
	        success:function(data){
	            alert("삭제되었습니다.");
	            location.href="/qsolcowork/User/List"
	            
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
			});
	    }
	    else {
	        return;
	    }
		
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
<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">사용자 상세 조회</span>
    	<button type="button" class="btn btn-danger pull-right" onclick="deleteuserdata()" style="margin-right: 10px; margin-top: 8px;">사용자 삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateuserform()" style="margin-right: 10px; margin-top: 8px;">사용자 수정</button>
    </div>
	<!--  -->
	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">ID</th>
						<th style="width: 10%; text-align: center;">이름</th>
						<th style="width: 15%; text-align: center;">연락처</th>
						<th style="width: 15%; text-align: center;">이메일</th>
						<th style="width: 15%; text-align: center;">부서</th>
						<th style="width: 15%; text-align: center;">직급</th>
						<th style="width: 15%; text-align: center;">소속</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>${userVO.userid}</td>
							<td>${userVO.username}<input type="hidden" id="userid" value="${userVO.userid}"/></td>
							<td><a href='tel:${userVO.usermobile}'>${userVO.usermobile}</a></td>
							<td><a href='mailto:${userVO.useremail}'>${userVO.useremail}</a></td>
							<td>${userVO.deptname}</td>
							<td>${userVO.positionname}</td>
							<td>
								<c:if test="${userVO.companyusercode == 1}">퀀텀솔루션즈</c:if>
								<c:if test="${userVO.companyusercode == 0}">고객사</c:if>
								<c:if test="${userVO.companyusercode == 2}">파트너사</c:if>
							</td>
						</tr>
				</tbody>
			</table>
	</div>
	</div>
	
	<%-- <div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 50%; text-align: center;">고객사홈페이지</th>
						<th style="width: 50%; text-align: center;">고객사주소</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td><a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></td>
							<td>[${companyVO.companyzipcode}] ${companyVO.companyaddress} ${companyVO.companyaddress2}</td>
						</tr>
				</tbody>
			</table>
		</div>
	</div> --%>
    
	<%-- <!-- 상세 뷰 페이지  -->
	<div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">사용자ID :${userVO.userid}</h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>사용자 이름 :${userVO.username} </h4>
              <input type="hidden" id="userid" value="${userVO.userid}"/>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>부서 : ${userVO.deptname}</h4>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>직급 : ${userVO.positionname}</h4>
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>핸드폰 번호 :${userVO.usermobile}</h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>이메일주소: ${userVO.useremail}</h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>
              	소속 : 
					<c:if test="${userVO.companyusercode == 1}">퀀텀솔루션즈</c:if>
					<c:if test="${userVO.companyusercode == 0}">고객사</c:if>
              </h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4></h4>
            </div>
          </div>
          <br><br>
          <div class="col-xs-24 col-sm-12 placeholder">
			${CoworkVO.coworktext}
		</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 placeholder">
			        <button type="button" class="btn btn-primary" onclick="updateuserform()">수정</button>
			        <button type="button" class="btn btn-primary" onclick="deleteuserdata()">삭제</button>
				</div>
				<div class="col-xs-12 col-sm-6 placeholder right">
				    <button type="button" class="btn btn-primary" onclick="cancel()">취소</button>
				</div>
			</div>
        </div>
	</div> --%>
</body>
</html>