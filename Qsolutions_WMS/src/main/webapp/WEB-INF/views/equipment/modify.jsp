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

<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<script type="text/javascript">
  
function updatedata() {
	
	var formData = document.updateData;
	
	if(formData.equipmentname.value == "") {
		alert("장비 명을 입력해주세요.")
		return formData.equipmentname.focus();
	}
	
	if(formData.equipmentcompany.value == "") {
		alert("제조사를 입력해주세요.")
		return formData.equipmentcompany.focus();
	}
	
	if(formData.equipmentsubject.value == "") {
		alert("장비 분류를 입력해주세요.")
		return formData.equipmentsubject.focus();
	}
	
	if(formData.equipmentdivision.value == "") {
		alert("장비 구분을 입력해주세요.")
		return formData.equipmentdivision.focus();
	}
	
	var temp_obj = {};
	temp_obj["equipmentcode"] = $("#equipmentcode").val();
	temp_obj["equipmentname"] = $("#equipmentname").val();
	temp_obj["equipmentcompany"] = $("#equipmentcompany").val();
	temp_obj["equipmentsubject"] = $("#equipmentsubject").val();
	temp_obj["equipmentdivision"] = $("#equipmentdivision").val();
	temp_obj["equipmentspec"] = $("#equipmentspec").val();

	console.log("temp_obj : " + JSON.stringify(temp_obj));
	
	$.ajax({
		url:"Update",
		type:"post",
		data:JSON.stringify(temp_obj),
		datatype:"json",
		cache : false,
		contentType:"application/json;charset=UTF-8",
		success:function(resqonse){
			alert("저장되었습니다.");
			location.href = "/Equipment/List";
		},
		error:function(jqXHR, textStatus, errorThrown){
			alert("에러 발생~~ \n" + textStatus + " : " + errorThrown+":::"+jqXHR);
		}
	});
	
}

function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
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
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- 상세 뷰 페이지  -->
<form action="${pageContext.request.contextPath}/Equipment/Update" method="post" id="updateData" name="updateData">
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">장비 수정</span>
    	<button type="button" class="btn btn-primary pull-right" onclick="updatedata()" style="margin-right: 10px; margin-top: 8px;">장비 수정</button>
    </div>
    
    <!-- 
    
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
				<option value="SMB" <c:if test="${companyVO.companyclass eq 'SMB'}">selected</c:if>>SMB</option>
				<option value="엔터프라이즈" <c:if test="${companyVO.companyclass eq '엔터프라이즈'}">selected</c:if>>엔터프라이즈</option>
				<option value="외국계" <c:if test="${companyVO.companyclass eq '외국계'}">selected</c:if>>외국계</option>
				<option value="기타" <c:if test="${companyVO.companyclass eq '기타'}">selected</c:if>>기타</option>
			</select>
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">회사 주소</p>
		<input type="text" class="form-control d-inline" id="store_zip"	value="${companyVO.companyzipcode}" name="companyzipcode" readonly="readonly" placeholder="우편번호" size="50" style="width: 85%; display: inline-block; margin-bottom: 4px;">
		<button type="button" class="btn btn-primary text-white pull-right" id="find_zip" onclick="execDaumPostcode()"style="width: 15%;">우편번호 찾기</button>
		
        <input type="text" id="companyaddress" name="companyaddress" value="${companyVO.companyaddress}" class="form-control" placeholder="도로명주소" readonly="readonly" size="50" style="width: 100%; display: inline-block; margin-bottom: 4px;">
        <input type="text" class="form-control" id="companyaddress2" value="${companyVO.companyaddress2}" name="companyaddress2" placeholder="상세주소" size="50" style="width: 100%; display: inline-block;">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">회사 홈페이지</p>
		<input id="companyhomepg" name="companyhomepg" type="text" class="form-control" placeholder="" value="${companyVO.companyhomepg}" size="50" style="width: 100%; display: inline-block;">
		
	</div>
     -->

	<div class="viewListCenter">
		<input type="hidden" id="equipmentcode" value="${equipmentVO.equipmentcode}"  name="equipmentcode" />
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 명</p>
		<input id="equipmentname" name="equipmentname" type="text" class="form-control" placeholder="장비 명 입력.." value="${equipmentVO.equipmentname}" size="50" style="width: 100%; display: inline-block; ">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">제조사</p>
		<input id="equipmentcompany" name="equipmentcompany" type="text" class="form-control" placeholder="장비 제조사 입력.." value="${equipmentVO.equipmentcompany}" size="50" style="width: 100%; display: inline-block; ">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 분류</p>
			<input type="text" id="equipmentsubject" name="equipmentsubject" list="equipmentsubjectList" class="form-control" placeholder="== 장비 분류를 선택해주세요 ==" value="${equipmentVO.equipmentsubject}" size="50" style="width: 100%; display: inline-block; ">
				<datalist id="equipmentsubjectList">
					<option value="방화벽"></option>
					<option value="네트워크"></option>
					<option value="보안"></option>
					<option value="기타"></option>
				</datalist>
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 구분</p>
			<input type="text" id="equipmentdivision" name="equipmentdivision" list="equipmentdivisionList" class="form-control" placeholder="== 장비 구분을 선택해주세요 ==" value="${equipmentVO.equipmentdivision}" size="50" style="width: 100%; display: inline-block; ">
				<datalist id="equipmentdivisionList">
					<option value="서버"></option>
					<option value="센서"></option>
					<option value="스위치"></option>
					<option value="라우터"></option>
					<option value="브릿지"></option>
					<option value="프로그램"></option>
					<option value="기타"></option>
				</datalist>
				
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 상세 스펙</p>
		<textarea id="equipmentspec" name="equipmentspec" class="form-control summernote hint2emoji" rows="3" placeholder="장비 상세 스펙을 입력해주세요.." style="width: 100%; display: inline-block;" required>${equipmentVO.equipmentspec}</textarea>
		
	</div>
</form>

</body>
</html>