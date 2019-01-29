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
  <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zipcode.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
	<!-- Include Choices CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/styles/choices.min.css">
	<!-- Include Choices JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/scripts/choices.min.js"></script>
  
  <script type="text/javascript">
  
  function updatedata(){
	    var temp_obj = {};
	    temp_obj["companyname"] = $("#companyname").val();
	    temp_obj["companycode"] = $("#companycode").val();
	    temp_obj["companyzipcode"] = $("#store_zip").val();
	    temp_obj["companyaddress"] = $("#companyaddress").val();
	    temp_obj["companyaddress2"] = $("#companyaddress2").val();
	    temp_obj["companyhomepg"] = $("#companyhomepg").val();
	    temp_obj["companyclass"] = $("#companyclass").val();

	    $.ajax({
	        url:"Update",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        datatype:"json",
			cache : false,
	        contentType:"application/json;charset=UTF-8",
	        success:function(resqonse){
	            alert("저장되었습니다.");
	    		location.href = "/qsolcowork/Company/List";
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown+":::"+jqXHR);
	        }
	    });
	}
  
  	function savedata(){
  	
  	}
  	
  	function changeSelect(){
		var userid = $("#manager").val();
		var companycode = $("#companycode").val();
		var managerName = $("#manager option:checked").text();
		
	    var temp_obj = {};
	    temp_obj["userid"] = userid;
	    temp_obj["companycode"] = companycode;
	    
	    var temp_html = "";
	    
	    temp_html = temp_html + '<div class="choices__list choices__list--multiple">';
	    temp_html = temp_html + '<div class="choices__item choices__item--selectable" data-item="" data-id="12" data-value="' + userid + '" data-deletable="" aria-selected="true">';
	    temp_html = temp_html + managerName;
	    temp_html = temp_html + '<button id="managerId" name="' + userid + '" value="' + userid + '" type="button" class="choices__button" data-button="" aria-label="Remove item: managerName" onclick="deleteManager(this)">';
	    temp_html = temp_html + userid;
	    temp_html = temp_html + '</button>';
	    temp_html = temp_html + '</div>';
	    temp_html = temp_html + '</div>';
	    
	    $("#choicess").append(temp_html);
	    $('#choicess').html();

	    $.ajax({
        url:"InsertManager",
        type:"post",
        data:JSON.stringify(temp_obj),
        datatype:"json",
        contentType:"application/json;charset=UTF-8",
        success:function(data){
        	viewManager();
            alert("등록되었습니다.");
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
		});
		
	}
	
	$(document).ready(function() {
		
		viewManager();
		
	});
		
	function viewManager() {
		
		// console.log("managerList : " + temp_obj)
		
		var companycode = $("#companycode").val();
		
		$.ajax({
		    url:"SelectManagerUpdate",
		    type:"get",
		    data:{"companycode" : companycode},
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
		    success:function(data){
			    		
		    	// console.log(data.managerList);
			    // console.log(JSON.stringify(data));
			   	// console.log("viewManagerData : " + data);
			   	
			   	console.log(JSON.stringify(data));
			   	
			   	var temp_html = "<br>";

			   	// console.log("userid : " + managerList.userid);
			   	
			    $.each(data, function(index, item) {
			    	console.log(index + " " + item.userid);
			   	    index = index + 1;
			    	temp_html = temp_html + '<div class="choices__list choices__list--multiple">';
			    	temp_html = temp_html + '<div class="choices__item choices__item--selectable" data-item="" data-id="12" data-value="' + item.userid + '" data-deletable="" aria-selected="true">';
				    temp_html = temp_html + item.username;
				    temp_html = temp_html + '<button id="managerId" name="' + item.userid + '" value="' + item.userid + '" type="button" class="choices__button" data-button="" aria-label="Remove item: managerName" onclick="deleteManager(this)">';
				    temp_html = temp_html + item.userid;
				   	temp_html = temp_html + '</button>';
				   	temp_html = temp_html + '</div>';
				   	temp_html = temp_html + '</div>';
			   	});
				$("#choicess").html(temp_html);
	        },
	        error:function(jqXHR, textStatus, errorThrown){
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		    }
		});
	}
		
	function deleteManager(e){
	    var temp_obj = {};
	    var answer = confirm("삭제하시겠습니까??")
	    
	    var managerid = e.getAttribute("name");
	    
	    if (answer) {
		    temp_obj["userid"] = e.getAttribute("name");
		    
		    temp_obj["companycode"] = $("#companycode").val();
		    
		    console.log(temp_obj);
		    
		    $.ajax({
	        url:"DeleteManager",
	        type:"delete",
	        data:JSON.stringify(temp_obj),
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
	        success:function(data){
	        	console.log("managerid : " + managerid);
	        	console.log("." + managerid);
	        	$("div").remove("." + managerid);
	        	viewManager();
	            alert("삭제되었습니다.");
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
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/Cowork/List">업무관리 시스템</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-center">
					<li><a href="${pageContext.request.contextPath}/Cowork/List">업무</a></li>
					<li><a href="${pageContext.request.contextPath}/Company/List">사이트</a></li>
					<li><a href="${pageContext.request.contextPath}/User/List">사용자</a></li>
					<li><a href="${pageContext.request.contextPath}/Cowork/Calendar">캘린더</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/Logout">LOGOUT</a></li>
				</ul>
				<form action="${pageContext.request.contextPath}/Search/List" method="post" class="navbar-form navbar-right">
			    	<input type="text" class="form-control" placeholder="통합검색.." value="${SearchData}" name=SearchData>
			    	<input type="submit" class="btn btn-primary" value="검색">
    			</form>
			</div>
		</div>
	</nav>

<!-- 상세 뷰 페이지  -->
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">회사 수정</span>
    	<button type="button" class="btn btn-primary pull-right" onclick="updatedata()" style="margin-right: 10px; margin-top: 8px;">회사 수정</button>
    </div>

	<div class="viewListCenter">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">회사 명</p>
		<input id="companyname" name="companyname" type="text" class="form-control" placeholder="회사명 입력..." value="${companyVO.companyname}" size="50" style="width: 100%; display: inline-block;">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">회사 코드</p>
		<input id="#" name="companycode" type="text" class="form-control" placeholder="${companyVO.companycode}" value="${companyVO.companycode}" size="50" style="width: 100%; display: inline-block;" readonly="readonly">
		<input type="hidden" id="companycode" value="${companyVO.companycode}"  name="companycode" />
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">분류</p>
			<select class="form-control" id="companyclass" name="companyclass">
				<option value="공공" <c:if test="${companyVO.companyclass eq '공공'}">selected</c:if>>공공</option>
				<option value="의료" <c:if test="${companyVO.companyclass eq '의료'}">selected</c:if>>의료</option>
				<option value="금융" <c:if test="${companyVO.companyclass eq '금융'}">selected</c:if>>금융</option>
				<option value="방송" <c:if test="${companyVO.companyclass eq '방송'}">selected</c:if>>방송</option>
				<option value="기타" <c:if test="${companyVO.companyclass eq '기타'}">selected</c:if>>기타</option>
			</select>
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">회사 주소</p>
		<input type="text" class="form-control d-inline" id="store_zip"	value="${companyVO.companyzipcode}" name="companyzipcode" readonly="readonly" placeholder="우편번호" size="50" style="width: 85%; display: inline-block; margin-bottom: 4px;">
		<button type="button" class="btn btn-primary text-white pull-right" id="find_zip" onclick="execDaumPostcode()"style="width: 15%;">우편번호 찾기</button>
		
        <input type="text" id="companyaddress" name="companyaddress" value="${companyVO.companyaddress}" class="form-control" placeholder="도로명주소" readonly="readonly" size="50" style="width: 100%; display: inline-block; margin-bottom: 4px;">
        <input type="text" class="form-control" id="companyaddress2" value="${companyVO.companyaddress2}" name="companyaddress2" placeholder="상세주소" size="50" style="width: 100%; display: inline-block;">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">회사 홈페이지</p>
		<input id="companyhomepg" name="companyhomepg" type="text" class="form-control" placeholder="" value="${companyVO.companyhomepg}" size="50" style="width: 100%; display: inline-block;">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">담당자</p>
		<select class="selectpicker show-tick" data-style="btn-primary" name="manager" id="manager" data-live-search="true" title="담당자 선택.." data-width="100%" data-size="5" onchange="changeSelect()">
			<optgroup label="퀀텀솔루션즈">
				<c:forEach var="usersVO" items="${usersVO}" varStatus="list">
					<c:if test="${usersVO.companyusercode eq 0}">
						<option id="manager" value="${usersVO.userid}"><p id="managerName" value="${usersVO.username}">${usersVO.username}</p></option>
						
					</c:if>
				</c:forEach>
			</optgroup>
			<optgroup label="고객사">
				<c:forEach var="usersVO" items="${usersVO}" varStatus="list">
					<c:if test="${usersVO.companyusercode eq 1}">
						<option id="manager" value="${usersVO.userid}">${usersVO.username}</option>
						
					</c:if>
				</c:forEach>
			</optgroup>
				
			<optgroup label="파트너사">
				<c:forEach var="usersVO" items="${usersVO}" varStatus="list">
					<c:if test="${usersVO.companyusercode eq 2}">
						<option id="manager" value="${usersVO.userid}"><p id="managerName" value="${usersVO.username}">${usersVO.username}</p></option>
						
					</c:if>
				</c:forEach>
			</optgroup>
		</select>
		
		<div class="choices" data-type="select-multiple" role="combobox" aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" dir="ltr">
			<div id="choicess" class="choices__inner">
				<%-- <c:forEach var="managerList" items="${managerList}" varStatus="list">
					<div class="choices__list choices__list--multiple ${managerList.userid}">
						<div class="choices__item choices__item--selectable" data-item="" data-id="12" data-value="${managerList.username}" data-deletable="" aria-selected="true">
						${managerList.username}
						<button id="managerId" name="${managerList.userid}" value="${managerList.userid}" type="button" class="choices__button" onclick="deleteManager(this)">
						${managerList.userid}
						</button>
						</div>
					</div>
				</c:forEach> --%>
			</div>
		</div>
		
	</div>

	<%-- <!-- 상세 뷰 페이지  -->
	<div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">고객사 명<input id="companyname" name="companyname" type="text" class="form-control" placeholder="고객사명 입력..." value="${companyVO.companyname}" size="50"> </h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-12 placeholder">
              <h4>고객사코드 :${companyVO.companycode} </h4>
	              <input type="hidden" id="companycode" value="${companyVO.companycode}"  name="companycode" />
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
          
            <div class="col-xs-12 col-sm-6 placeholder">
              <h4>고객사 주소</h4>
              <div class="input-group">
					<div class="input-group-append" style="display: inline;">
						<button type="button" class="btn btn-primary text-white" id="find_zip" onclick="execDaumPostcode()">우편번호 찾기</button>
						<input type="text" class="form-control d-inline" id="store_zip"	value="${companyVO.companyzipcode}" name="companyzipcode" readonly="readonly" placeholder="우편번호">
					</div>
			  </div>
              <input type="text" id="companyaddress" name="companyaddress" value="${companyVO.companyaddress}" class="form-control" placeholder="도로명주소" readonly="readonly">
              <input type="text" class="form-control" id="companyaddress2" value="${companyVO.companyaddress2}" name="companyaddress2" placeholder="상세주소">
            </div>
            <div class="col-xs-12 col-sm-6 placeholder">
              <h4>고객사 HomePage</h4><input type="text" id="companyhomepg" name="companyhomepg" value="${companyVO.companyhomepg}" class="form-control" placeholder="고객사 홈페이지 입력.." >
            </div>
          </div>
          <br><br>
          	담당자 리스트
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>담당자 명 :</h4>
              <select class="form-control" name="companycode" id="companycode">
              	<c:forEach var="companyList" items="${companyList}" varStatus="list">
				  <option id="companycode" value="${companyList.companycode}">${companyList.companyname}</option>
              	</c:forEach>
				</select>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>담당자 HP:${companyVO.companyname}</h4>
            </div>
          </div>
          <br><br>
		<div>
			<c:if test='${companyVO.companyname == ":" || companyVO.companyname == null}'>
	        <button type="button" class="btn btn-primary" onclick="insertdata()">저장</button>
	        </c:if>
	        <c:if test='${companyVO.companyname != ":" || compnayVO.companyname != null}'>
	        <button type="button" class="btn btn-primary" onclick="updatedata()">수정</button>
	        </c:if>
	        <button type="button" class="btn btn-primary" onclick="cancel()">취소</button>
		</div>
        </div>
	</div> --%>
</body>
</html>