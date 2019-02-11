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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-material-datetimepicker.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-material-datetimepicker.js"></script>
<script src="https://code.jquery.com/ui/1.9.1/jquery-ui.js" integrity="sha256-tXuytmakTtXe6NCDgoePBXiKe1gB+VA3xRvyBs/sq94=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<!-- Include Choices CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/styles/choices.min.css">
<!-- Include Choices JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/choices.js@4/public/assets/scripts/choices.min.js"></script>

<%-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">

	// 	function fileupload(){}
	// 		$(function () {
	// 		    'use strict';
	// 		    // Change this to the location of your server-side upload handler:
	// 		    var url = window.location.hostname === 'blueimp.github.io' ?
	// 		                '//jquery-file-upload.appspot.com/' : 'server/php/';
	// 		    $('#fileupload').fileupload({
	// 		        url: url,
	// 		        dataType: 'json',
	// 		        done: function (e, data) {
	// 		            $.each(data.result.files, function (index, file) {
	// 		                $('<p/>').text(file.name).appendTo('#files');
	// 		            });
	// 		        },
	// 		        progressall: function (e, data) {
	// 		            var progress = parseInt(data.loaded / data.total * 100, 10);
	// 		            $('#progress .progress-bar').css(
	// 		                'width',
	// 		                progress + '%'
	// 		            );
	// 		        }
	// 		    }).prop('disabled', !$.support.fileInput)
	// 		        .parent().addClass($.support.fileInput ? undefined : 'disabled');
	// 		});
	// 	}

	function insertdata() {

		var temp_obj = {};
		temp_obj["coworksubject"] = $("#coworksubject").val();
		temp_obj["coworktitle"] = $("#coworktitle").val();
		temp_obj["coworkcode"] = $("#coworkcode").val();
		temp_obj["userid"] = $("#userid").val();
		temp_obj["companycode"] = $("#companycode").val();
		temp_obj["coworktext"] = $("#coworktext").val();
		temp_obj["startdate"] = $("#startdate").val();
		temp_obj["enddate"] = $("#enddate").val();

		$.ajax({
			url : "Insert",
			type : "post",
			data : JSON.stringify(temp_obj),
			datatype : "json",
			cache : false,
			contentType : "application/json;charset=UTF-8",
			success : function(resqonse) {
				alert("저장되었습니다.");
				location.href = "/qsolcowork/Cowork/List";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			}
		});
	}

	function cancel() {
		location.href = "/qsolcowork/Cowork/List";
	}
	
	$(document).ready(function() {

		$('#enddate').bootstrapMaterialDatePicker ({
			weekStart: 0, 
			format: 'YYYY-MM-DD HH:mm',
			cancelText: 'Cancel',
			okText: 'OK',
			/* nowButton : true, */
			switchOnClick : true,
			lang: 'ko'
		});
		
		$('#startdate').bootstrapMaterialDatePicker ({
			weekStart: 0, 
			format: 'YYYY-MM-DD HH:mm',
			cancelText: 'Cancel',
			okText: 'OK',
			/* nowButton : true, */
			switchOnClick : true,
			lang: 'ko'
		}).on('change', function(e, date) {
			$('#enddate').bootstrapMaterialDatePicker('setMinDate', date);
		});

		$('#min-date').bootstrapMaterialDatePicker({ 
			format : 'YYYY/MM/DD HH:mm', 
			minDate : new Date() 
		});
		
		$.material.init()
		
	});
	
	function changeSelect(){
		var userid = $("#manager").val();
		var companycode = $("#companycode").val();
		var coworkcode = $("#coworkcode").val();
		var managerName = $("#manager option:checked").text();
		
	    var temp_obj = {};
	    temp_obj["userid"] = userid;
	    temp_obj["companycode"] = companycode;
	    temp_obj["coworkcode"] = coworkcode;
	    
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
		
		var coworkcode = $("#coworkcode").val();
		var companycode = $("#companycode").val();
		
		$.ajax({
		    url:"SelectManager",
		    type:"post",
		    data:{"coworkcode" : coworkcode},
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
		    temp_obj["coworkcode"] = $("#coworkcode").val();
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

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body style="background-color: #d4d4d4"> -->

	<!-- 상세 뷰 페이지  -->
	<form action="${pageContext.request.contextPath}/Cowork/Insert" method="post" id="insertData" name="insertData">
	    <div class="viewListTop">
	    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">업무 등록</span>
	    	<input type="submit" id="save" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;" value="업무 등록">
	    </div>
	
		<div class="viewListCenter" id="insertform">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 제목</p>
			<input id="coworktitle" name="coworktitle" type="text" class="form-control" placeholder="업무명 입력..." value="${CoworkVO.coworktitle}" size="50" style="width: 100%; display: inline-block;" required>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 코드</p>
			<input id="coworkcode" name="coworkcode" type="text" class="form-control" placeholder="${CoworkVO.coworkcode}" value="${CoworkVO.coworkcode}" size="50" style="width: 100%; display: inline-block;" readonly="readonly">
			<input type="hidden" id="coworkcode" value="${CoworkVO.coworkcode}"  name="coworkcode" />
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">카테고리</p>
			<select class="form-control" id="coworksubject" name="coworksubject">
				<option value="이슈">이슈</option>
				<option value="유지보수">유지보수</option>
				<option value="정기점검">정기점검</option>
				<option value="상담">상담</option>
				<option value="프로젝트">프로젝트</option>
			</select>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">작성자</p>
			<input type="text" class="form-control" id="#" value="${CoworkVO.userid}(${CoworkVO.username})" name="writer" size="50" style="width: 100%; display: inline-block;" readonly="readonly">
			<input type="hidden" id="userid" value="${CoworkVO.userid}" name="userid" />
			<input type="hidden" id="username" value="${CoworkVO.username}" name="username" />
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">고객사 명</p>
			<select class="form-control" name="companycode" id="companycode">
				<option id="companycode" value="normal" selected>고객사 선택..</option>
				<c:forEach var="companyList" items="${companyList}" varStatus="list">
					<option id="companycode" value="${companyList.companycode}">${companyList.companyname}</option>
				</c:forEach>
			</select>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 내용</p>
			<textarea id="coworktext" name="coworktext" class="form-control" rows="3" placeholder="업무 내용을 입력해주세요.." style="width: 100%; display: inline-block;" required></textarea>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 날짜</p>
			<input id="startdate" name="startdate" type="text" class="form-control" placeholder="시작 시간.." value="" size="50" style="width: 49%; display: inline-block;">
			<input id="enddate" name="enddate" type="text" class="form-control pull-right" placeholder="종료 시간.." value="" size="50" style="width: 49%; display: inline-block;">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">담당자</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="manager" id="manager" data-live-search="true" title="담당자 선택.." data-width="100%" data-size="5" onchange="changeSelect()" style="display: inline-block;">
				<optgroup label="퀀텀솔루션즈">
						<c:forEach var="usersVO" items="${usersVO}" varStatus="list">
							<option id="manager" value="${usersVO.userid}"><p id="managerName" value="${usersVO.username}">${usersVO.username}</p></option>
						</c:forEach>
					</optgroup>
					<optgroup label="고객사">
						<c:forEach var="usersVO" items="${usersVO}" varStatus="list">
							<option id="manager" value="${usersVO.userid}">${usersVO.username}</option>
						</c:forEach>
					</optgroup>
						
					<optgroup label="파트너사">
						<c:forEach var="usersVO" items="${usersVO}" varStatus="list">
							<option id="manager" value="${usersVO.userid}"><p id="managerName" value="${usersVO.username}">${usersVO.username}</p></option>
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
	</form>
	
	<%-- <!-- 상세 뷰 페이지  -->
	<form action="${pageContext.request.contextPath}/Cowork/Insert"
		method="post" id="insertData" name="insertData">
		<div class="container-fluid" id="insertform">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">
					업무 제목<input id="coworktitle" name="coworktitle" type="text"
						class="form-control" placeholder="타이틀 입력..."
						value="${CoworkVO.coworktitle}" size="50">
				</h1>
				<div class="row placeholders">
					<div class="col-xs-12 col-sm-4 placeholder">
						<h4>업무코드 : ${CoworkVO.coworkcode}</h4>
						<input type="hidden" id="coworkcode"
							value="${CoworkVO.coworkcode}" name="coworkcode" />
					</div>
					<div class="col-xs-12 col-sm-4 placeholder">
						<h4>카테고리 :</h4>
						<select class="form-control" id="coworksubject"
							name="coworksubject">
							<option value="이슈">이슈</option>
							<option value="유지보수">유지보수</option>
							<option value="정기점검">정기점검</option>
							<option value="견적">견적</option>
						</select>
					</div>
					<div class="col-xs-12 col-sm-4 placeholder">
						<h4>작성자 : ${CoworkVO.userid}(${CoworkVO.username})</h4>
						<input type="hidden" id="userid" value="${CoworkVO.userid}"
							name="userid" /> <input type="hidden" id="username"
							value="${CoworkVO.username}" name="username" />
					</div>
					<div class="col-xs-12 col-sm-4 placeholder">
						<h4>작성일 : ${CoworkVO.coworkdate}</h4>
					</div>
				</div>
				<br>
				<br>
				<div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>업체명 :</h4>
						<select class="form-control" name="companycode" id="companycode">
							<c:forEach var="companyList" items="${companyList}"
								varStatus="list">
								<option id="companycode" value="${companyList.companycode}">${companyList.companyname}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>담당자명:</h4>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>담당자연락처</h4>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>담당자 이메일</h4>
					</div>
				</div>
				<br>
				<br>
				<div class="col-xs-24 col-sm-12 placeholder">
					<textarea rows="10" cols="150" name="coworktext" id="coworktext"
						class="form-control">${CoworkVO.coworktext}</textarea>
				</div>
				<div>
					<button type="button" class="btn btn-primary"
						onclick="insertdata()" id="save">저장</button>
					<button type="button" class="btn btn-primary" onclick="cancel()"
						id="cancel">취소</button>
				</div>
			</div>
		</div>
	</form> --%>
</body>
</html>