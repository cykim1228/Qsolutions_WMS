<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>[QSOLUTIONS]업무관리 시스템</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/summernote/summernote.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/summernote/summernote.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/summernote/lang/summernote-ko-KR.js"></script>
<!-- <script src="https://code.jquery.com/ui/1.9.1/jquery-ui.js" integrity="sha256-tXuytmakTtXe6NCDgoePBXiKe1gB+VA3xRvyBs/sq94=" crossorigin="anonymous"></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery_timepicker/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jquery_timepicker/jquery.timepicker.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<!-- Include Choices CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/styles/choices.min.css">
<!-- Include Choices JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/scripts/choices.min.js"></script>

<%-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>

<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<script type="text/javascript">

	var selectedManager = new Array();
	
	var i = 0;
	
	function insertdata() {

		var formData = document.insertData;
			
			if(formData.equipmentcode.value == "") {
				alert("장비를 선택해주세요.")
				return formData.equipmentcode.focus();
			}
			
			if(formData.modelname.value == "") {
				alert("모델명을 입력해주세요.")
				return formData.modelname.focus();
			}
			
		var temp_obj = {};
		temp_obj["equipmentcode"] = $("#equipmentcode").val();
		temp_obj["contractcode"] = $("#contractcode").val();
		temp_obj["modelname"] = $("#modelname").val();
		temp_obj["modelserial"] = $("#modelserial").val();
		temp_obj["modelmac"] = $("#modelmac").val();
		temp_obj["modeldetail"] = $("#modeldetail").val();
		
		var equipmentcode = $("#equipmentcode").val();
		
		$.ajax({
			url : "InsertModel",
			type : "post",
			data : JSON.stringify(temp_obj),
			datatype : "json",
			cache : false,
			contentType : "application/json;charset=UTF-8",
			success : function(resqonse) {
				alert("장비 모델이 추가되었습니다.");
				location.href = "/Equipment/View?equipmentcode=" + equipmentcode;
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			}
		});
		
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
	margin-top: 100px;
	margin-bottom: 100px;
	background-color: #E6E6E6;
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
	
}

.viewListCenter {
	width: 60%;
	height: 80%;
	margin: 0 auto; 
	margin-top: 50px;
	margin-bottom: 70px;
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

/* datepicer 버튼 롤오버 시 손가락 모양 표시 */
.ui-datepicker-trigger {
	cursor: pointer;
}

/* datepicer input 롤오버 시 손가락 모양 표시 */
.hasDatepicker {
	cursor: pointer;
}

h2 {
	padding: 0 20px 10px 20px;
	font-size: 20px;
	font-weight: 400;
}

@media(max-width: 300px) {
	.well { 
		margin : 0
	}
}

.note-toolbar.panel-heading{
    position: relative;
    top: 0px !important;
}

.modal-content {
	margin-top: 100px;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>
<div id="header-space"></div>
<!-- <body style="background-color: #d4d4d4"> -->

	<!-- 상세 뷰 페이지  -->
	<form action="${pageContext.request.contextPath}/Cowork/Insert" method="post" id="insertData" name="insertData" style="margin-bottom: 100px;">
	    <div class="viewListTop">
	    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">모델 등록</span>
	    	<!-- <input type="submit" id="save" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;" value="업무 등록"> -->
	    	<button type="button" id="save" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;">모델 등록</button>
	    </div>
	
		<div class="viewListCenter" id="insertform">
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">장비 명</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="equipmentcode" id="equipmentcode" data-live-search="true" data-width="100%" data-size="10" title="== 장비를 선택해주세요 ==" style="display: inline-block;">
				<c:forEach var="equipmentList" items="${equipmentList}" varStatus="list">
					<option id="equipmentcode" value="${equipmentList.equipmentcode}"<c:if test="${equipmentList.equipmentcode == equipmentcode}">selected="selected"</c:if>>${equipmentList.equipmentname}</option>
				</c:forEach>
			</select>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">계약</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="contractcode" id="contractcode" data-live-search="true" data-width="100%" data-size="10" title="== 계약을 선택해주세요 ==" style="display: inline-block;">
				<c:forEach var="contractList" items="${contractList}" varStatus="list">
					<option id="contractcode" value="${contractList.contractcode}">[${contractList.companyname}]  ${contractList.contracttitle}</option>
				</c:forEach>
			</select>
		
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">모델 명</p>
			<input id="modelname" name="modelname" type="text" class="form-control" placeholder="모델 명 입력..." value="${modelVO.modelname}" size="50" style="width: 100%; display: inline-block;" required>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">시리얼 넘버</p>
			<input id="modelserial" name="modelserial" type="text" class="form-control" placeholder="시리얼 입력..." value="${modelVO.modelserial}" size="50" style="width: 100%; display: inline-block;" required>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">MAC</p>
			<input id="modelmac" name="modelmac" type="text" class="form-control" placeholder="MAC 입력..." value="${modelVO.modelserial}" size="50" style="width: 100%; display: inline-block;" required>
			
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">추가 내용</p>
			<textarea id="modeldetail" name="modeldetail" class="form-control summernote hint2emoji" rows="3" placeholder="추가 내용을 입력해주세요.." style="width: 100%; display: inline-block;" required></textarea>
			
		</div>
	</form>
	
</body>
</html>