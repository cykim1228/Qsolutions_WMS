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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/summernote/summernote.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/summernote/summernote.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/summernote/lang/summernote-ko-KR.js"></script>

<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<script type="text/javascript">
  
function updatedata() {
	
	var formData = document.updateData;
	
	if(formData.modelname.value == "") {
		alert("모델명을 입력해주세요.")
		return formData.modelname.focus();
	}
	
	var temp_obj = {};
	temp_obj["equipmentcode"] = $("#equipmentcode").val();
	temp_obj["modelcode"] = $("#modelcode").val();
	temp_obj["modelname"] = $("#modelname").val();
	temp_obj["contractcode"] = $("#contractcode").val();
	temp_obj["modelserial"] = $("#modelserial").val();
	temp_obj["modelmac"] = $("#modelmac").val();
	temp_obj["modeldetail"] = $("#modeldetail").val();
	
	var equipmentcode = $("#equipmentcode").val();

	console.log("temp_obj : " + JSON.stringify(temp_obj));
	
	$.ajax({
		url:"UpdateModel",
		type:"post",
		data:JSON.stringify(temp_obj),
		datatype:"json",
		cache : false,
		contentType:"application/json;charset=UTF-8",
		success:function(resqonse){
			alert("저장되었습니다.");
			location.href = "/Equipment/View?equipmentcode=" + equipmentcode;
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

$.ajax({
	url : 'https://api.github.com/emojis',
	async : false
}).then(function(data) {
	window.emojis = Object.keys(data);
	window.emojiUrls = data;
});;

$(function() {
	$('.summernote').summernote({
		height : 300, // 기본 높이값
		minHeight : null, // 최소 높이값(null은 제한 없음)
		maxHeight : null, // 최대 높이값(null은 제한 없음)
		// focus : true, // 페이지가 열릴때 포커스를 지정함
		lang : 'ko-KR', // 한국어 지정(기본값은 en-US)
		hint : {
			match : /:([\-+\w]+)$/,
			search : function(keyword, callback) {
				callback($.grep(emojis, function(item) {
					return item.indexOf(keyword) === 0;
				}));
			},
			template : function(item) {
				var content = emojiUrls[item];
				return '<img src="' + content + '" width="20" /> :'
						+ item + ':';
			},
			content : function(item) {
				var url = emojiUrls[item];
				if (url) {
					return $('<img />').attr('src', url).css('width',
							20)[0];
				}
				return '';
			}
		}
	});
});

</script>

<style>

body {
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
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- 상세 뷰 페이지  -->
<form action="${pageContext.request.contextPath}/Equipment/Update" method="post" id="updateData" name="updateData">
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">모델 수정</span>
    	<button type="button" class="btn btn-primary pull-right" onclick="updatedata()" style="margin-right: 10px; margin-top: 8px;">모델 수정</button>
    	<input type="hidden" id="modelcode" name="modelcode" value="${modelVO.modelcode}"/>
    	<input type="hidden" id="equipmentcode" name="equipmentcode" value="${modelVO.equipmentcode}"/>
    </div>
    
	<div class="viewListCenter" id="insertform">
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 명</p>
			<input id="equipmentcode" name="equipmentcode" type="text" class="form-control" placeholder="장비 명 입력..." value="${modelVO.equipmentname}" size="50" style="width: 100%; display: inline-block;" required disabled="disabled">
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">계약</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="contractcode" id="contractcode" data-live-search="true" data-width="100%" data-size="10" title="== 계약을 선택해주세요 ==" style="display: inline-block;">
				<c:forEach var="contractList" items="${contractList}" varStatus="list">
					<option id="contractcode" value="${contractList.contractcode}"<c:if test="${contractList.contractcode == modelVO.contractcode}">selected="selected"</c:if>>[${contractList.companyname}]  ${contractList.contracttitle}</option>
				</c:forEach>
			</select>
		
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">모델 명</p>
			<input id="modelname" name="modelname" type="text" class="form-control" placeholder="모델 명 입력..." value="${modelVO.modelname}" size="50" style="width: 100%; display: inline-block;" required>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">시리얼 넘버</p>
			<input id="modelserial" name="modelserial" type="text" class="form-control" placeholder="시리얼 입력..." value="${modelVO.modelserial}" size="50" style="width: 100%; display: inline-block;" required>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">MAC</p>
			<input id="modelmac" name="modelmac" type="text" class="form-control" placeholder="MAC 입력..." value="${modelVO.modelserial}" size="50" style="width: 100%; display: inline-block;" required>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">추가 내용</p>
			<textarea id="modeldetail" name="modeldetail" class="form-control summernote hint2emoji" rows="3" placeholder="추가 내용을 입력해주세요.." style="width: 100%; display: inline-block;" required>${modelVO.modeldetail}</textarea>
			
		</div>
</form>

</body>
</html>