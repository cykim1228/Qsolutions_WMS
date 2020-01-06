<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	function updateuserform(){
		var userid = $("#userid").val();
		var url = "/User/Updateform?userid="+userid;
		// alert(url);
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
	            location.href="/User/List"
	            
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
		location.href = "/User/List";
	}
	
	function googleLogin() {
		location.href = "/User/googleCallback";
	}
	
	function changeEquipment() {
		var selectequipment = document.getElementById("selectequipment");
		
		var selectvalue = selectequipment.options[selectequipment.selectedIndex].value;
		
		var equipmentcode = selectvalue;
		//alert(senddelvar);
		$.ajax({
        url:"ChangeEquipment",
        type:"get",
        data:{"equipmentcode":equipmentcode},
        datatype:"json",
        contentType:"application/json;charset=UTF-8",
        success:function(data){
            console.log(data);
            $("#equipmentname").val(data.equipmentname);
            $("#equipmentcompany").val(data.equipmentcompany);
            $("#equipmentsubject").val(data.equipmentsubject);
            $("#equipmentdivision").val(data.equipmentdivision);
            $("#equipmentcount").val(data.equipmentcount);
            $("#equipmentspec").val(data.equipmentspec);
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
		});
		
		$("#selectequipment option:selected").each(function () {
			if($(this).val() == 'E0000000') {
				$("#equipmentcode").val('E0000000');
				$("#equipmentname").val('');
	            $("#equipmentcompany").val('');
	            $("#equipmentsubject").val('');
	            $("#equipmentdivision").val('');
	            $("#equipmentcount").val('');
	            $("#equipmentspec").val('');
	            
				$("#equipmentname").attr("disabled", false);
	            $("#equipmentcompany").attr("disabled", false);
	            $("#equipmentsubject").attr("disabled", false);
	            $("#equipmentdivision").attr("disabled", false);
	            // $("#equipmentcount").attr("disabled", false);
	            $("#equipmentspec").attr("disabled", false);
			} else {
				$("#equipmentname").attr("disabled", true);
	            $("#equipmentcompany").attr("disabled", true);
	            $("#equipmentsubject").attr("disabled", true);
	            $("#equipmentdivision").attr("disabled", true);
	            // $("#equipmentcount").attr("disabled", true);
	            $("#equipmentspec").attr("disabled", true);
			}
		});
		
	}
	
	function insertdata(){
 		
 		var formData = document.insertData;
 		
 		var temp_obj = {};
 		
 		var contractcompany = $("#contractcompany").val();
 		
 		temp_obj["contractcode"] = $("#contractcode").val();
		temp_obj["equipmentcode"] = $("#equipmentcode").val();
		temp_obj["equipmentname"] = $("#equipmentname").val();
		temp_obj["equipmentcompany"] = $("#equipmentcompany").val();
	    temp_obj["equipmentsubject"] = $("#equipmentsubject").val();
	    temp_obj["equipmentdivision"] = $("#equipmentdivision").val();
	    temp_obj["equipmentspec"] = $("#equipmentspec").val();
	    temp_obj["cedetail"] = $("#cedetail").val();
	    
		var contractcode = $("#contractcode").val();
		
		var selectModel = [$("#modelcode").val().toString()];
		
		var dataList = {'selectModel' : selectModel, 'contractcode' : contractcode};
	    
		// alert("test--"+JSON.stringify(temp_obj));
		
		$.ajax({
            url : "InsertEquipment",     // 요기에 ajax!
            type : 'POST', 
            data : dataList,
            success : function(data) {
            	alert("장비가 추가되었습니다.");
	    		location.href = "/Company/Contract?contractcompany=" + contractcompany + "&contractcode=" + contractcode;
            }, // success : function (xml)
            error : function(xhr, status) {
                alert("에러발생!" + xhr + " : " + status);
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
	margin-bottom: 100px;
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

<form action="${pageContext.request.contextPath}/Equipment/Insert" method="post" id="insertData" name="insertData">
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">장비 모델 추가</span>
    	<button type="button" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;">모델 추가</button>
    	<input type="hidden" id="contractcode" value="${contractVO.contractcode}" name="contractcode" />
    	<input type="hidden" id="contractcompany" value="${contractVO.contractcompany}" name="contractcompany" />
    </div>

	<div class="viewListCenter">
	
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 20%; text-align: center;">계약 분류</th>
						<th style="width: 20%; text-align: center;">계약명</th>
						<th style="width: 20%; text-align: center;">시작일</th>
						<th style="width: 20%; text-align: center;">종료일</th>
						<th style="width: 20%; text-align: center;">진행률</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>${contractVO.contractsubject}</td>
							<td>${contractVO.contracttitle}</td>
							<td>${contractVO.startdate}</td>
							<td>${contractVO.enddate}</td>
							<td></td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 모델</p>
			<select class="selectpicker show-tick" multiple data-selected-text-format="count > 10" data-style="btn-primary" name="modelcode" id="modelcode" data-live-search="true" title="== 계약할 모델을 선택해주세요 ==" data-width="100%" data-size="10" style="display: inline-block;">
				
				<c:forEach var="equipmentList" items="${equipmentList}" varStatus="status">
					<optgroup label="${equipmentList.equipmentname}">
						<c:forEach var="modelList" items="${modelList}" varStatus="status">
							<c:if test="${equipmentList.equipmentname == modelList.equipmentname}">
								<option id="manager${status.count}" value="${modelList.modelcode}" data-subtext="${modelList.equipmentname}"><p id="modelName" value="${modelList.modelname}">${modelList.modelname}</p></option>
							</c:if>
						</c:forEach>
					</optgroup>
				</c:forEach>
			</select>
			
	</div>
</form>

</body>
</html>