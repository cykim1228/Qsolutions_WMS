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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery_timepicker/jquery.timepicker.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jquery_timepicker/jquery.timepicker.css">
  
	<!-- Include Choices CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/styles/choices.min.css">
	<!-- Include Choices JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/scripts/choices.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>

<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 
	
<script type="text/javascript">
 	function insertdata(){
 		
 		var formData = document.insertData;
		
		if(formData.companycode.value == "") {
			alert("회사를 선택해주세요.")
			return formData.companycode.focus();
		}
		
		if(formData.contractsubject.value == "") {
			alert("분류를 선택해주세요.")
			return formData.contractsubject.focus();
		}
		
		/* if(formData.companyaddress.value == "") {
			alert("회사 주소를 검색해주세요.")
			return formData.companyaddress.focus();
		}
		
		if(formData.companyaddress2.value == "") {
			alert("회사 상세주소를 입력해주세요.")
			return formData.companyaddress2.focus();
		} */
		
		if(formData.contractname.value == "") {
			alert("계약 내용을 입력해주세요.")
			return formData.contractname.focus();
		}
		
		if(formData.contracttitle.value == "") {
			alert("계약명을 입력해주세요.")
			return formData.contractname.focus();
		}
 		
		var companycode = $("#companycode").val();
		
 		var temp_obj = {};
		temp_obj["contractcode"] = $("#contractcode").val();
		temp_obj["contractcompany"] = $("#companycode").val();
		temp_obj["contracttitle"] = $("#contracttitle").val();
		temp_obj["contractsubject"] = $("#contractsubject").val();
	    temp_obj["contractname"] = $("#contractname").val();
	    temp_obj["startdate"] = $("#startdate").val();
	    temp_obj["enddate"] = $("#enddate").val();
	    
		// alert("test--"+JSON.stringify(temp_obj));

		$.ajax({
	        url:"UpdateContract",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        datatype:"json",
			cache : false,
	        contentType:"application/json; charset=UTF-8",
	        success:function(resqonse){
	            alert("계약이 수정되었습니다.");
	    		location.href = "/Company/View?companycode=" + companycode;
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
 	/* function updatedata(){
 		var temp_obj = {};
		// temp_obj["companycode"] = $("#companycode").val();
		temp_obj["companyname"] = $("#companyname").val();
		temp_obj["companyzipcode"] = $("#store_zip").val();
	    temp_obj["companyaddress"] = $("#companyaddress").val();
	    temp_obj["companyaddress2"] = $("#companyaddress2").val();
	    temp_obj["companyhomepg"] = $("#companyhomepg").val();
	    temp_obj["companyclass"] = $("#companyclass").val();

		// alert("test--"+JSON.stringify(temp_obj));

		$.ajax({
	        url:"Update",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        datatype:"json",
			cache : false,
	        contentType:"application/json; charset=UTF-8",
	        success:function(resqonse){
	            alert("업데이트 처리되었습니다.");
	    		location.href = "/Company/List";
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	} */
 	
	function cancel(){
  		location.href = "/qsolcowork/Company/List";
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
<form action="${pageContext.request.contextPath}/Company/Insert" method="post" id="insertData" name="insertData">
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">계약 수정</span>
    	<button type="button" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;">계약 수정</button>
    	
    	<input type="hidden" id="contractcode" value="${contractVO.contractcode}"  name="contractcode" />
    </div>

	<div class="viewListCenter">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">고객사 명</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="companycode" id="companycode" data-live-search="true" data-width="100%" data-size="10" title="== 고객사를 선택해주세요 ==" style="display: inline-block;" disabled="disabled">
				<c:forEach var="companyList" items="${companyList}" varStatus="list">
					<option id="companycode" value="${companyList.companycode}"<c:if test="${companyList.companycode == contractcompany}">selected="selected"</c:if>>${companyList.companyname}</option>
				</c:forEach>
			</select>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">계약 분류</p>
			<select class="form-control" id="contractsubject" name="contractsubject">
				<option value="유지보수" <c:if test="${contractVO.contractsubject eq '유지보수'}">selected</c:if>>유지보수</option>
				<option value="판매" <c:if test="${contractVO.contractsubject eq '판매'}">selected</c:if>>판매</option>
				<option value="기타" <c:if test="${contractVO.contractsubject eq '기타'}">selected</c:if>>기타</option>
			</select>
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">계약명</p>
		<input id="contracttitle" name="contracttitle" type="text" value="${contractVO.contracttitle}" class="form-control" placeholder="" size="50" style="width: 100%; display: inline-block; ">
		
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">계약 내용</p>
			<textarea id="contractname" name="contractname" class="form-control summernote hint2emoji" rows="3" placeholder="업무 내용을 입력해주세요.." style="width: 100%; display: inline-block;" required>${contractVO.contractname}</textarea>
		
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">계약 기간</p>
			<!-- <input id="startdate" name="startdate" type="text" class="form-control" placeholder="시작 시간.." value="" size="50" style="width: 49%; display: inline-block;">
			<input id="enddate" name="enddate" type="text" class="form-control pull-right" placeholder="종료 시간.." value="" size="50" style="width: 49%; display: inline-block;"> -->
			<div class="demo" style="margin-bottom: 50px;">
				<p id="datepairExample">
					<input type="text" class="form-control date start" id="startdate" name="startdate" value="${contractVO.startdate}" placeholder="시작 날짜.." size="50" style="width: 48%; display: inline-block;" autocomplete="off" /> to
					<input type="text" class="form-control date end pull-right" id="enddate" name="enddate" value="${contractVO.enddate}" placeholder="종료 날짜.." size="50" style="width: 48%; display: inline-block;" autocomplete="off" />
				</p>
			</div>
			<script src="http://jonthornton.github.io/Datepair.js/dist/datepair.js"></script>
			<script src="http://jonthornton.github.io/Datepair.js/dist/jquery.datepair.js"></script>
			<script>
			$('#datepairExample .date').datepicker({
				'format': 'yyyy-mm-dd',
				'autoclose': true
			});
			$('#datepairExample').datepair();
			</script>
	</div>
</form>
	
</body>
</html>