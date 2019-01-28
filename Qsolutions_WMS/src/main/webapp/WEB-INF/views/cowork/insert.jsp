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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/util.js"></script>
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
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<!-- <body style="background-color: #d4d4d4"> -->

	<!-- 상세 뷰 페이지  -->
	<form action="${pageContext.request.contextPath}/Cowork/Insert" method="post" id="insertData" name="insertData">
	    <div class="viewListTop">
	    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">업무 등록</span>
	    	<button type="button" id="save" class="btn btn-primary pull-right" onclick="insertdata()" style="margin-right: 10px; margin-top: 8px;">업무 등록</button>
	    </div>
	
		<div class="viewListCenter" id="insertform">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 제목</p>
			<input id="coworktitle" name="coworktitle" type="text" class="form-control" placeholder="업무명 입력..." value="${CoworkVO.coworktitle}" size="50" style="width: 100%; display: inline-block;">
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">업무 코드</p>
			<input id="coworkcode" name="coworkcode" type="text" class="form-control" placeholder="${CoworkVO.coworkcode}" value="${CoworkVO.coworkcode}" size="50" style="width: 100%; display: inline-block;" readonly="readonly">
			<input type="hidden" id="coworkcode" value="${CoworkVO.coworkcode}"  name="coworkcode" />
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">카테고리</p>
			<select class="form-control" id="coworksubject" name="coworksubject">
				<option value="이슈">이슈</option>
				<option value="유지보수">유지보수</option>
				<option value="정기점검">정기점검</option>
				<option value="견적">견적</option>
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
			<textarea id="coworktext" name="coworktext" class="form-control" rows="3" placeholder="업무 내용을 입력해주세요.." style="width: 100%; display: inline-block;"></textarea>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">담당자 명</p>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">담당자 연락처</p>
			<p class="sub-header" style="margin-left: 10px; margin-top:20px; font-size: 15px; font-weight: bold;">담당자 이메일</p>
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