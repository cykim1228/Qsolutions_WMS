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
		// temp_obj["companycode"] = $("#companycode").val();
		temp_obj["equipmentname"] = $("#equipmentname").val();
		temp_obj["equipmentcompany"] = $("#equipmentcompany").val();
	    temp_obj["equipmentsubject"] = $("#equipmentsubject").val();
	    temp_obj["equipmentdivision"] = $("#equipmentdivision").val();
	    temp_obj["equipmentspec"] = $("#equipmentspec").val();
	    
		// alert("test--"+JSON.stringify(temp_obj));

		$.ajax({
	        url:"Insert",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        datatype:"json",
			cache : false,
	        contentType:"application/json; charset=UTF-8",
	        success:function(resqonse){
	            alert("장비가 등록되었습니다.");
	    		location.href = "/Equipment/List";
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	};
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
  		location.href = "/qsolcowork/Equipment/List";
	}
	
	$('#equipmentsubject').change(function(){ 
		$("#equipmentsubject option:selected").each(function () { 
			if($(this).val()== '직접입력'){ //직접입력일 경우 
				$("#str_email02").val(''); //값 초기화 
				$("#str_email02").attr("disabled",false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#str_email02").val($(this).text()); //선택값 입력 
				$("#str_email02").attr("disabled",true); //비활성화 
			} 
		}); 
	});
	
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
<form action="${pageContext.request.contextPath}/Equipment/Insert" method="post" id="insertData" name="insertData">
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">장비 등록</span>
    	<button type="button" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;">장비 등록</button>
    </div>

	<div class="viewListCenter">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 명</p>
		<input id="equipmentname" name="equipmentname" type="text" class="form-control" placeholder="장비 명 입력.." size="50" style="width: 100%; display: inline-block; ">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">제조사</p>
		<input id="equipmentcompany" name="equipmentcompany" type="text" class="form-control" placeholder="장비 제조사 입력.." size="50" style="width: 100%; display: inline-block; ">
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 분류</p>
			<input type="text" id="equipmentsubject" name="equipmentsubject" list="equipmentsubjectList" class="form-control" placeholder="== 장비 분류를 선택해주세요 ==" size="50" style="width: 100%; display: inline-block; ">
				<datalist id="equipmentsubjectList">
					<option value="방화벽"></option>
					<option value="네트워크"></option>
					<option value="보안"></option>
					<option value="기타"></option>
				</datalist>
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 구분</p>
			<input type="text" id="equipmentdivision" name="equipmentdivision" list="equipmentdivisionList" class="form-control" placeholder="== 장비 구분을 선택해주세요 ==" size="50" style="width: 100%; display: inline-block; ">
				<datalist id="equipmentdivisionList">
					<option value="서버"></option>
					<option value="센서"></option>
					<option value="스위치"></option>
					<option value="라우터"></option>
					<option value="브릿지"></option>
					<option value="프로그램"></option>
					<option value="기타"></option>
				</datalist>
			<!-- <select class="form-control" id="equipmentsubject" name="equipmentsubject">
				<option value="" selected disabled hidden>== 장비 구분을 선택해주세요 ==</option>
				<option value="서버">서버</option>
				<option value="센서">센서</option>
				<option value="스위치">스위치</option>
				<option value="라우터">라우터</option>
				<option value="브릿지">브릿지</option>
				<option value="기타">기타</option>
				<option value="직접입력">직접입력</option>
			</select> -->
			
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 상세 스펙</p>
		<textarea id="equipmentspec" name="equipmentspec" class="form-control summernote hint2emoji" rows="3" placeholder="장비 상세 스펙을 입력해주세요.." style="width: 100%; display: inline-block;" required></textarea>
		
	</div>
</form>
	
</body>
</html>