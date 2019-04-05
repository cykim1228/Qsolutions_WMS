<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-colorpicker.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-colorpicker.js"></script>
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<script type="text/javascript">

$(function() {
    $('#cp9').colorpicker({
        customClass: 'colorpicker-2x',
        sliders: {
            saturation: {
                maxLeft: 200,
                maxTop: 200
            },
            hue: {
                maxTop: 200
            },
            alpha: {
                maxTop: 200
            }
        }
    });
});

function fileSubmit() {
	
	var forms = document.fileForm;
	
	if(forms.fileUp.value == "") {
		alert("파일을 선택해주세요.")
		return forms.fileUp.focus();
	}
	
    var formData = new FormData($("#fileForm")[0]);
    $.ajax({
        type : 'post',
        url : 'profileUpload',
        data : formData,
        processData : false,
        contentType : false,
        success : function(html) {
            alert("프로필 사진이 변경되었습니다.");
            location.href = "/";
        },
        error : function(error) {
            alert("프로필 사진 변경에 실패하였습니다.");
            console.log(error);
            console.log(error.status);
        }
    });
}

function colorSubmit() {
	
	var temp_obj = {};
	
	temp_obj["userid"] = $("#userid").val();
	temp_obj["usercolor"] = $("#cp9").val();

	$.ajax({
        url:"Color",
        type:"post",
        data:JSON.stringify(temp_obj),
        datatype:"json",
		cache : false,
        contentType:"application/json; charset=UTF-8",
        success:function(resqonse){
            alert("색상이 변경되었습니다.");
    		location.href = "/";
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
    });
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

.colorpicker-2x .colorpicker-saturation {
	width: 200px;
	height: 200px;
}

.colorpicker-2x .colorpicker-hue,
.colorpicker-2x .colorpicker-alpha {
	width: 30px;
	height: 200px;
}

.colorpicker-2x .colorpicker-color,
.colorpicker-2x .colorpicker-color div {
	height: 30px;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- 상세 뷰 페이지  -->
	<div class="viewListTop">
		<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">사용자 환경 설정</span>
	</div>
	<div class="viewListCenter" id="insertform">
		<form action="${pageContext.request.contextPath}/User/Insert" method="post" id="insertData" name="insertData">
	
			<%-- <p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">사용자 ID</p>
			<input id="userid" name="userid" type="text" class="form-control" placeholder="${userVO.userid}" value="${userVO.userid}" size="50" style="width: 100%; display: inline-block;" readonly="readonly"> --%>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 캘린더 색상</p>
			<input id="cp9" type="text" class="form-control" value="${usercolorVO.usercolor}"/>
			<input type="hidden" id="userid" name="userid" value="${userVO.userid}">
			<input class="btn btn-primary pull-right" type="button" value="캘린더 색상 변경" onClick="colorSubmit();" style="margin-top: 10px; display: inline-block;">
		</form>
		<form id="fileForm" name="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
			<p class="sub-header" style="margin-left: 10px; margin-top:70px; font-size: 15px; font-weight: bold;">프로필 사진</p>
			<input class="btn btn-primary" type="file" id="fileUp" name="fileUp" style="width: 100%;"><br>
			<input type="hidden" id="userid" name="userid" value="${userVO.userid}">
			<input class="btn btn-primary pull-right" type="button" value="프로필 사진 변경" onClick="fileSubmit();" style="position: relative; top: -10px;">
		</form>
	</div>

</body>
</html>