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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/summernote/summernote.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-material-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/summernote/summernote.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/summernote/lang/summernote-ko-KR.js"></script>
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

<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

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
	
	var selectedManager = new Array();
	
	var i = 0;
	
	function insertdata() {

		var formData = document.insertData;
			
			if(formData.coworktitle.value == "") {
				alert("제목을 입력해주세요.")
				return formData.coworktitle.focus();
			}
			
			if(formData.coworksubject.value == "") {
				alert("카테고리를 선택해주세요.")
				return formData.coworksubject.focus();
			}
			
			if(formData.companycode.value == "") {
				alert("고객사 이름을 입력해주세요.")
				return formData.companycode.focus();
			}
			
		var temp_obj = {};
		temp_obj["coworksubject"] = $("#coworksubject").val();
		temp_obj["coworktitle"] = $("#coworktitle").val();
		// temp_obj["coworkcode"] = $("#coworkcode").val();
		temp_obj["userid"] = $("#userid").val();
		temp_obj["companycode"] = $("#companycode").val();
		temp_obj["coworktext"] = $("#coworktext").val();
		temp_obj["startdate"] = $("#startdate").val();
		temp_obj["enddate"] = $("#enddate").val();

		var selectdata = $('#coworksubject option:selected').val();
		console.log("selectdata : " + selectdata);
		
		if (selectdata == "이슈") {
			temp_obj["coworkstep"] = $("#coworkstep1").val();
		} else if (selectdata == "유지보수") {
			temp_obj["coworkstep"] = $("#coworkstep2").val();
		} else if (selectdata == "정기점검") {
			temp_obj["coworkstep"] = $("#coworkstep3").val();
		} else if (selectdata == "상담") {
			temp_obj["coworkstep"] = $("#coworkstep4").val();
		} else {
			temp_obj["coworkstep"] = $("#coworkstep5").val();
		}
		
		var comcode = $("#companycode").val();
		
		var selectsManager = [$("#manager").val().toString()];
		
		var dataList = {'selectsManager' : selectsManager, 'comcode' : comcode};
		
		// alert("selectsManager : " + selectsManager);
		
		/* 
		var selectManager = $("#manager").val().toString();
		alert("manager : " + selectManager);
		var filedata = {"selectManager" : selectManager};
		
		var totData = new Object();
		var Data = new Object();
		var dataList = new Array();
		
		var obj = document.getElementById("manager"); 
	    for (var i=0,cnt=obj.options.length;i<cnt;i++) { 
			if (obj.options[i].selected == true) alert('체크'); 
			
			data["manager"] = $("#manager" + i).val().toString();
			dataList.push(data);
	    }
		
		for (var i = 0; i < $('#manager option').size(); i++) {
			
			dataList[i] = $("#manager" + i + " option:selected").val();
			dataList.push(selectManager);
			
			if( $("#manager option:eq("+i+")").attr("selected") ) //선택된 값찾기
			alert($("#manager option:eq("+i+")").val()); //선택된 값 출력
			
			// data["manager"] = $("#manager").val().toString();
			// dataList.push(data);
		}
		
		alert("dataList : " + dataList);
		
		totData["managerList"] = dataList;
		alert("totData : " + totData); */
		
		$.ajax({
            url : "InsertSelectManager",     // 요기에 ajax!
            type : 'POST', 
            data : dataList,
            success : function(data) {
               // alert("완료!");
            }, // success : function (xml)
            error : function(xhr, status) {
                alert("에러발생!" + xhr + " : " + status);
            }
        });
		
		$.ajax({
			url : "Insert",
			type : "post",
			data : JSON.stringify(temp_obj),
			datatype : "json",
			cache : false,
			contentType : "application/json;charset=UTF-8",
			success : function(resqonse) {
				alert("저장되었습니다.");
				location.href = "/Cowork/List";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			}
		});
		
	}

	function cancel() {
		location.href = "/Cowork/List";
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
		
		/* selectedManager[i] = $("#manager option:selected").val();
		
		i = i + 1;
		
		alert("i : " + selectManager);
		
		alert("selectedManager : " + selectedManager);
		
		var selectManager = $("#manager").val().toString();
		alert("manager : " + selectManager);
		var filedata = {"selectManager" : selectManager};
	    
		alert(filedata); */
		
		/* var obj = document.getElementById("manager"); 
			for (var i=0,cnt=obj.options.length;i<cnt;i++) { 
				if (obj.options[i].selected == true) alert('selectManager : ' + selectManager[i]); 
		} */
		
		/* var userid = $("#manager").val();
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
	    $('#choicess').html(); */

	    /* $.ajax({
        url:"InsertManager",
        type:"post",
        data:JSON.stringify(temp_obj),
        datatype:"json",
        contentType:"application/json;charset=UTF-8",
        success:function(data){
        	viewManager();
            // alert("등록되었습니다.");
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
		}); */
		
	}
	
	/* $(document).ready(function() {
		
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
				    temp_html = temp_html + '[' + item.positionname + '] ' + item.username;
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
	} */
	
	/* function deleteManager(e){
	    var temp_obj = {};
	    var answer = confirm("삭제하시겠습니까??")
	    
	    var managerid = e.getAttribute("name");
	    
	    if (answer) {
		    temp_obj["userid"] = e.getAttribute("name");
		    temp_obj["coworkcode"] = $("#coworkcode").val();
		    temp_obj["companycode"] = $("#companycode").val();
		    
		    console.log(temp_obj);
		    
		    console.log("managerid : " + managerid);
        	console.log("." + managerid);
        	$("div").remove("." + managerid);
        	viewManager();
            alert("삭제되었습니다.");
            
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
		
	} */
	
	function showSelect() {
		
		// var selectData = document.forms.insertData;
		
		var selectdata = $('#coworksubject option:selected').val();
		
		console.log("selectdata : " + selectdata);
		
		if (selectdata == "이슈") {
			$('.coworkstep1').css("display","");
			$('.coworkstep2').css("display","none");
			$('.coworkstep3').css("display","none");
			$('.coworkstep4').css("display","none");
			$('.coworkstep5').css("display","none");
		} else if (selectdata == "유지보수") {
			$('.coworkstep1').css("display","none");
			$('.coworkstep2').css("display","");
			$('.coworkstep3').css("display","none");
			$('.coworkstep4').css("display","none");
			$('.coworkstep5').css("display","none");
		} else if (selectdata == "정기점검") {
			$('.coworkstep1').css("display","none");
			$('.coworkstep2').css("display","none");
			$('.coworkstep3').css("display","");
			$('.coworkstep4').css("display","none");
			$('.coworkstep5').css("display","none");
		} else if (selectdata == "상담") {
			$('.coworkstep1').css("display","none");
			$('.coworkstep2').css("display","none");
			$('.coworkstep3').css("display","none");
			$('.coworkstep4').css("display","");
			$('.coworkstep5').css("display","none");
		} else {
			$('.coworkstep1').css("display","none");
			$('.coworkstep2').css("display","none");
			$('.coworkstep3').css("display","none");
			$('.coworkstep4').css("display","none");
			$('.coworkstep5').css("display","");
		}
		
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
	    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">업무 등록</span>
	    	<!-- <input type="submit" id="save" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;" value="업무 등록"> -->
	    	<button type="button" id="save" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;">업무 등록</button>
	    </div>
	
		<div class="viewListCenter" id="insertform">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 제목</p>
			<input id="coworktitle" name="coworktitle" type="text" class="form-control" placeholder="업무명 입력..." value="${CoworkVO.coworktitle}" size="50" style="width: 100%; display: inline-block;" required>
			<%-- <p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 코드</p>
			<input id="coworkcode" name="coworkcode" type="text" class="form-control" placeholder="${CoworkVO.coworkcode}" value="${CoworkVO.coworkcode}" size="50" style="width: 100%; display: inline-block;" readonly="readonly">
			<input type="hidden" id="coworkcode" value="${CoworkVO.coworkcode}"  name="coworkcode" /> --%>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">카테고리</p>
			<select class="form-control" id="coworksubject" name="coworksubject" onChange="showSelect()">
				<option value="" selected disabled hidden>== 카테고리를 선택해주세요 ==</option>
				<option value="이슈">이슈</option>
				<option value="유지보수">유지보수</option>
				<!-- <option value="정기점검">정기점검</option> -->
				<option value="상담">상담</option>
				<option value="프로젝트">프로젝트</option>
			</select>
			<select class="form-control coworkstep1" id="coworkstep1" name="coworkstep1" style="display: none;">
				<option value="" selected disabled hidden>== 진행단계를 선택해주세요 ==</option>
				<option value="이슈발생">이슈발생</option>
				<option value="원인파악">원인파악</option>
				<option value="작업진행">작업진행</option>
				<option value="완료">완료</option>
			</select>
			<select class="form-control coworkstep2" id="coworkstep2" name="coworkstep2" style="display: none;">
				<option value="" selected disabled hidden>== 진행단계를 선택해주세요 ==</option>
				<option value="진행중">진행중</option>
				<option value="완료">완료</option>
			</select>
			<!-- <select class="form-control coworkstep3" id="coworkstep3" name="coworkstep3" style="display: none;">
				<option value="" selected disabled hidden>== 진행단계를 선택해주세요 ==</option>
				<option value="점검전">점검전</option>
				<option value="점검중">점검중</option>
				<option value="완료">완료</option>
			</select> -->
			<select class="form-control coworkstep4" id="coworkstep4" name="coworkstep4" style="display: none;">
				<option value="" selected disabled hidden>== 진행단계를 선택해주세요 ==</option>
				<option value="견적">견적</option>
				<option value="발주">발주</option>
				<option value="입찰">입찰</option>
				<option value="수주">수주</option>
				<option value="계약">계약</option>
				<option value="계약">완료</option>
			</select>
			<select class="form-control coworkstep5" id="coworkstep5" name="coworkstep5" style="display: none;">
				<option value="" selected disabled hidden>== 진행단계를 선택해주세요 ==</option>
				<option value="0">0%</option>
				<option value="20">20%</option>
				<option value="40">40%</option>
				<option value="60">60%</option>
				<option value="80">80%</option>
				<option value="100">완료</option>
			</select>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">작성자</p>
			<input type="text" class="form-control" id="#" value="${CoworkVO.username}" name="writer" size="50" style="width: 100%; display: inline-block;" readonly="readonly">
			<input type="hidden" id="userid" value="${CoworkVO.userid}" name="userid" />
			<input type="hidden" id="username" value="${CoworkVO.username}" name="username" />
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">고객사 명</p>
			<select class="selectpicker show-tick" data-style="btn-primary" name="companycode" id="companycode" data-live-search="true" data-width="100%" data-size="10" title="== 고객사를 선택해주세요 ==" style="display: inline-block;">
				<c:forEach var="companyList" items="${companyList}" varStatus="list">
					<option id="companycode" value="${companyList.companycode}">${companyList.companyname}</option>
				</c:forEach>
			</select>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 내용</p>
			<textarea id="coworktext" name="coworktext" class="form-control summernote hint2emoji" rows="3" placeholder="업무 내용을 입력해주세요.." style="width: 100%; display: inline-block;" required></textarea>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 날짜</p>
			<input id="startdate" name="startdate" type="text" class="form-control" placeholder="시작 시간.." value="" size="50" style="width: 49%; display: inline-block;">
			<input id="enddate" name="enddate" type="text" class="form-control pull-right" placeholder="종료 시간.." value="" size="50" style="width: 49%; display: inline-block;">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">담당자</p>
			<select class="selectpicker show-tick" multiple data-selected-text-format="count > 10" data-style="btn-primary" name="manager" id="manager" data-live-search="true" title="== 담당자를 선택해주세요 ==" data-width="100%" data-size="10" onchange="changeSelect()" style="display: inline-block;">
				
				<c:forEach var="companyList" items="${companyList}" varStatus="status">
					<optgroup label="${companyList.companyname}">
						<c:forEach var="usersVO" items="${usersVO}" varStatus="status">
							<c:if test="${companyList.companyname == usersVO.companyname}">
								<option id="manager${status.count}" value="${usersVO.userid}" data-subtext="${usersVO.positionname}"><p id="managerName" value="${usersVO.username}">${usersVO.username}</p></option>
							</c:if>
						</c:forEach>
					</optgroup>
				</c:forEach>
				
				<optgroup label="미분류">
					<c:forEach var="managerVO" items="${managerVO}" varStatus="status">
						<c:if test="${managerVO.companyname eq null}">
							<option id="manager${status.count}" value="${managerVO.managerid}"><p id="managerName" value="${managerVO.managername}">[${managerVO.positionname}] ${managerVO.managername}</p></option>
						</c:if>
					</c:forEach>
				</optgroup>
			</select>
			<%-- <div class="choices" data-type="select-multiple" role="combobox" aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" dir="ltr">
			<div id="choicess" class="choices__inner">
				<c:forEach var="managerList" items="${managerList}" varStatus="list">
					<div class="choices__list choices__list--multiple ${managerList.userid}">
						<div class="choices__item choices__item--selectable" data-item="" data-id="12" data-value="${managerList.username}" data-deletable="" aria-selected="true">
						${managerList.username}
						<button id="managerId" name="${managerList.userid}" value="${managerList.userid}" type="button" class="choices__button" onclick="deleteManager(this)">
						${managerList.userid}
						</button>
						</div>
					</div>
				</c:forEach>
			</div>
			</div> --%>
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