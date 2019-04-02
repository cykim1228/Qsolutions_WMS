<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<title>[QSOLUTIONS]업무관리 시스템</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.bootstrap_4.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tablesorter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tablesorter.widgets.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.tablesorter.pager.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tablesorter.pager.js"></script>
<script type="text/javascript">
	function updateform(){
		//var coworkcode = document.getElementById("coworkcode").value
		var companycode = $("#companycode").val();
		var url = "/Company/Updateform?companycode="+companycode;
		location.href = url;
	}

	function deleteform(){
		
		var answer = confirm("삭제하시겠습니까??")
		if (answer) {
			var companycode = $("#companycode").val();
			$.ajax({
	        url:"Delete",
	        type:"get",
	        data:{"companycode":companycode},
	        datatype:"html",
	        contentType:"application/html;charset=UTF-8",
	        success:function(response){
	            alert("삭제되었습니다.");
	    		location.href = "/Company/List";
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
		location.href = "/qsolcowork/Company/List";
	}
	
	function uploadfile(){
 		
 		var temp_obj = {};
 		
		temp_obj["companycode"] = $("#companycode").val();
		temp_obj["filename"] = $("#filename").val();
		temp_obj["filepathname"] = $("#filepathname").val();
	    
		alert("test--"+JSON.stringify(temp_obj));

		$.ajax({
	        url:"Upload",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        enctype: "multipart/form-data",
	        datatype:"json",
			cache : false,
	        contentType:"application/json; charset=UTF-8",
	        success:function(resqonse){
	            alert("파일이 업로드되었습니다.");
	    		location.href = "/Company/List";
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
	function deletefile(val){
 		
		// var str = "";
		// var tdArr = new Array();
		// var checkBtn = $(this);
		
		// var tr = checkBtn.parent().parent();
		// var td = tr.children();
		
		// console.log("클릭한 Row의 모든 데이터 : "+tr.text());
        
        // var filepathname = td.eq(0).value();
		
 		var temp_obj = {};
 		
		temp_obj["companycode"] = $("#companycode").val();
		temp_obj["filepathname"] = val;
		// temp_obj["filename"] = $("#filename").val();
		// temp_obj["filepathname"] = $("#filepathname").val();
	    
		// alert("test--"+JSON.stringify(temp_obj));

		var answer = confirm("삭제하시겠습니까??")
		
		if(answer) {
			$.ajax({
		        url:"fileDelete",
		        type:"post",
		        data:JSON.stringify(temp_obj),
		        enctype: "multipart/form-data",
		        datatype:"json",
				cache : false,
		        contentType:"application/json; charset=UTF-8",
		        success:function(resqonse){
		            alert("파일을 삭제하였습니다.");
		            location.reload();
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		        }
		    });
		}
	}
	
	function fileSubmit() {
		
		var forms = document.fileForm;
		
		if(forms.fileUp.value == "") {
			alert("파일을 선택해주세요.")
			return forms.fileUp.focus();
		}
		
		if(forms.filename.value == "") {
			alert("파일 업로드 이름을 작성해주세요.")
			return forms.filename.focus();
		}
		
        var formData = new FormData($("#fileForm")[0]);
        $.ajax({
            type : 'post',
            url : 'fileUpload',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
                alert("파일 업로드하였습니다.");
                location.reload();
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
	
	$(function() {

		$(".tableUser").tablesorter(
			{
				theme : "bootstrap",

				widthFixed : true,

				// widget code contained in the jquery.tablesorter.widgets.js file
				// use the zebra stripe widget if you plan on hiding any rows (filter widget)
				// the uitheme widget is NOT REQUIRED!
				widgets : [ "filter", "columns", "zebra" ],

				widgetOptions : {
					// using the default zebra striping class name, so it actually isn't included in the theme variable above
					// this is ONLY needed for bootstrap theming if you are using the filter widget, because rows are hidden
					zebra : [ "even", "odd" ],

					// class names added to columns when sorted
					columns : [ "primary", "secondary", "tertiary" ],

					// reset filters button
					filter_reset : ".reset",

					// extra css class name (string or array) added to the filter element (input or select)
					filter_cssFilter : [ 
						'form-control', 
						'form-control',
						'form-control custom-select', // select needs custom class names :(
						'form-control', 
						'form-control', 
						'form-control',
						'form-control' 
						]

					}
				}).tablesorterPager({

			// target the pager markup - see the HTML block below
			container : $(".ts-pagerUser"),
			
			size : 5,
			
			cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

			// target the pager page select dropdown - choose a page
			cssGoto : ".pagenum",

			// remove rows from the table to speed up the sort of large tables.
			// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
			removeRows : false,

			// output string - default is '{page}/{totalPages}';
			// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
			output : '{startRow} - {endRow} / {filteredRows} ({totalRows})'

		});
		
		$(".tableCowork").tablesorter(
				{
					theme : "bootstrap",

					widthFixed : true,

					// widget code contained in the jquery.tablesorter.widgets.js file
					// use the zebra stripe widget if you plan on hiding any rows (filter widget)
					// the uitheme widget is NOT REQUIRED!
					widgets : [ "filter", "columns", "zebra" ],

					widgetOptions : {
						// using the default zebra striping class name, so it actually isn't included in the theme variable above
						// this is ONLY needed for bootstrap theming if you are using the filter widget, because rows are hidden
						zebra : [ "even", "odd" ],

						// class names added to columns when sorted
						columns : [ "primary", "secondary", "tertiary" ],

						// reset filters button
						filter_reset : ".reset",

						// extra css class name (string or array) added to the filter element (input or select)
						filter_cssFilter : [ 
							'form-control', 
							'form-control',
							'form-control custom-select', // select needs custom class names :(
							'form-control', 
							'form-control', 
							'form-control',
							'form-control' 
							]

						}
					}).tablesorterPager({

				// target the pager markup - see the HTML block below
				container : $(".ts-pagerCowork"),

				size : 5,
				
				cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

				// target the pager page select dropdown - choose a page
				cssGoto : ".pagenum",

				// remove rows from the table to speed up the sort of large tables.
				// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
				removeRows : false,

				// output string - default is '{page}/{totalPages}';
				// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
				output : '{startRow} - {endRow} / {filteredRows} ({totalRows})'

			});
		
		$(".tableFile").tablesorter(
			{
				theme : "bootstrap",
				
				widthFixed : true,

				// widget code contained in the jquery.tablesorter.widgets.js file
				// use the zebra stripe widget if you plan on hiding any rows (filter widget)
				// the uitheme widget is NOT REQUIRED!
				widgets : [ "filter", "columns", "zebra" ],

				widgetOptions : {
					// using the default zebra striping class name, so it actually isn't included in the theme variable above
					// this is ONLY needed for bootstrap theming if you are using the filter widget, because rows are hidden
					zebra : [ "even", "odd" ],

					// class names added to columns when sorted
					columns : [ "primary", "secondary", "tertiary" ],

					// reset filters button
					filter_reset : ".reset",

					// extra css class name (string or array) added to the filter element (input or select)
					filter_cssFilter : [ 
						'form-control', 
						'form-control',
						'form-control custom-select', // select needs custom class names :(
						'form-control', 
						'form-control', 
						'form-control',
						'form-control' 
						]

					}
				}).tablesorterPager({

			// target the pager markup - see the HTML block below
			container : $(".ts-pagerFile"),

			size : 5,
			
			cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

			// target the pager page select dropdown - choose a page
			cssGoto : ".pagenum",

			// remove rows from the table to speed up the sort of large tables.
			// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
			removeRows : false,

			// output string - default is '{page}/{totalPages}';
			// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
			output : '{startRow} - {endRow} / {filteredRows} ({totalRows})'

		});
	
	});
	
	$(document).ready(function() {
		$("#excelConvertBtn").on('click', function() {
			location.href = "../toExcel/companyViewToExcel?companycode=${companyVO.companycode}";
		})
	})
						
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

.tablesorter-pager .btn-group-sm .btn {
	font-size: 1.2em; /* make pager arrows more visible */
}

.file_input_textbox {
	float:left
}

.file_input_div {
	position:relative;
	width:100px;
	height:23px;
	overflow:hidden;
}

.file_input_button {
	width:100px;
	position:absolute; 
	top:0px; 
	background-color:#aaa; 
	color:#fff; 
	border-style:solid;
}

.file_input_hidden {
	font-size:45px; 
	position:absolute; 
	right:0px; 
	top:0px; 
	opacity:0; 
	filter:alpha(opacity=0); 
	-ms-filter:"alpha(opacity=0)"; 
	-khtml-opacity:0; 
	-moz-opacity:0;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
    <div class="viewListTop hidden-xs">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">${companyVO.companyname}</span>
    	<br class="visible-xs">
    	<button type="button" class="btn btn-danger pull-right" onclick="deleteform()" style="margin-right: 10px; margin-top: 8px;">고객사 삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateform()" style="margin-right: 10px; margin-top: 8px;">고객사 수정</button>
    	<input type="button" class="btn btn-success pull-right" name="excelConvertBtn" id="excelConvertBtn" value="엑셀 출력" style="cursor:hand; margin-right:10px; margin-top: 8px;" />
		<br class="visible-xs">
	</div>
	<div class="viewListTop visible-xs">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">${companyVO.companyname}</span>
    	<br class="visible-xs">
    	<button type="button" class="btn btn-danger pull-right" onclick="deleteform()" style="margin-top: 8px; margin-bottom: 10px;">삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateform()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">수정</button>
    	<input type="button" class="btn btn-success pull-right" name="excelConvertBtn" id="excelConvertBtn" value="엑셀 출력" style="cursor:hand; margin-right:10px; margin-top: 8px; margin-bottom: 10px;" />
		<br class="visible-xs">
	</div>
<!--  -->
	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">분류</th>
						<th class="hidden-xs" style="width: 20%; text-align: center;">고객사코드</th>
						<th class="hidden-xs" style="width: 35%; text-align: center;">홈페이지</th>
						<th style="width: 40%; text-align: center;">주소</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>
							${companyVO.companyclass}
							<input type="hidden" id="coworkcode" value="${companyVO.companycode}"/>
							</td>
							<td class="hidden-xs">
							${companyVO.companycode}
							<input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
							<input type="hidden" id="companyname" name="companyname" value="${companyVO.companyname}"/>
							</td>
							<td class="hidden-xs"><a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></td>
							<td>[${companyVO.companyzipcode}] ${companyVO.companyaddress} ${companyVO.companyaddress2}</td>
						</tr>
				</tbody>
			</table>
	</div>
	</div>
	
	<div class="viewList">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">직원 목록</span>
		<div class="table-responsive">
			<table class="table table-striped tableUser">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;" class="filter-select filter-exact" data-placeholder="직급을 선택해주세요.">직급</th>
						<th style="width: 15%; text-align: center;">이름</th>
						<th style="width: 35%; text-align: center;">연락처</th>
						<th style="width: 35%; text-align: center;">이메일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="4" class="ts-pagerUser">
							<div class="form-inline" align="center">
								<div class="btn-group btn-group-sm mx-1" role="group">
									<button type="button" class="btn btn-primary first"
										title="first">⇤</button>
									<button type="button" class="btn btn-primary prev"
										title="previous">←</button>
								</div>
								<span class="pagedisplay"></span>
								<div class="btn-group btn-group-sm mx-1" role="group">
									<button type="button" class="btn btn-primary next"
										title="next">→</button>
									<button type="button" class="btn btn-primary last"
										title="last">⇥</button>
								</div>
								<!-- <select class="form-control-sm custom-select btn btn-primary px-1 pagesize" 
									title="Select page size" style="width: 50px; height: 37px;">
									<option selected="selected" value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
								</select> -->
								<select class="form-control-sm btn btn-primary custom-select pagenum"
									title="Select page number" style="width: 50px; height: 37px;">
								</select>
							</div>
						</th>
					</tr>
				</tfoot>
				<tbody align="center">
					<c:forEach items="${userList}" var="userList" varStatus="rowCount">
						<tr>
							<td>${userList.positionname}</td>
							<td><a href="${pageContext.request.contextPath}/User/View?userid=${userList.userid}">${userList.username}</a></td>
							<td><a href='tel:${userList.usermobile}'>${userList.usermobile}</a></td>
							<td><a href='mailto:${userList.useremail}'>${userList.useremail}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="viewList">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">업무 목록</span>
		<div>
				<div class="table-responsive">
					<table class="table table-striped tableCowork">
						<thead align="center">
							<tr>
								<th style="width: 20%; text-align: center;" class="filter-select filter-exact" data-placeholder="카테고리를 선택해주세요.">카테고리</th>
								<th style="width: 20%; text-align: center;">업무코드</th>
								<th style="width: 20%; text-align: center;">제목</th>
								<th style="width: 20%; text-align: center;">등록자</th>
								<th style="width: 20%; text-align: center;">작성일</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="5" class="ts-pagerCowork">
									<div class="form-inline" align="center">
										<div class="btn-group btn-group-sm mx-1" role="group">
											<button type="button" class="btn btn-primary first"
												title="first">⇤</button>
											<button type="button" class="btn btn-primary prev"
												title="previous">←</button>
										</div>
										<span class="pagedisplay"></span>
										<div class="btn-group btn-group-sm mx-1" role="group">
											<button type="button" class="btn btn-primary next"
												title="next">→</button>
											<button type="button" class="btn btn-primary last"
												title="last">⇥</button>
										</div>
										<!-- <select class="form-control-sm custom-select btn btn-primary px-1 pagesize" 
											title="Select page size" style="width: 50px; height: 37px;">
											<option selected="selected" value="5">5</option>
											<option value="10">10</option>
											<option value="15">15</option>
										</select> -->
										<select class="form-control-sm btn btn-primary custom-select pagenum"
											title="Select page number" style="width: 50px; height: 37px;">
										</select>
									</div>
								</th>
							</tr>
						</tfoot>
						<tbody align="center">
							<c:forEach items="${coworkList}" var="coworkList" varStatus="rowCount">
								<tr>
									<td>${coworkList.coworksubject}</td>
									<td>${coworkList.coworkcode}</td>
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.coworkcode}'>${coworkList.coworktitle}</a></td>
									<td><a href='${pageContext.request.contextPath}/User/View?userid=${coworkList.userid}'>${coworkList.username}</a></td>
									<td>${coworkList.coworkdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	</div>
	
	<div class="viewList" style="margin-bottom: 100px;">
	<form id="fileForm" name="fileForm" action="fileUpload" method="post" enctype="multipart/form-data" style="height: 40px;">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">파일 목록</span>
	<br class="visible-xs">
	<br class="visible-xs">
		<input class="btn btn-primary pull-right visible-xs" type="file" id="fileUp" name="fileUp" style="width: 90%; margin-right: 10px; margin-bottom: 10px;"><br>
        <input class="btn btn-primary pull-right" type="button" value="파일업로드" onClick="fileSubmit();">
       	<input type="text" class="form-control pull-right visible-xs" placeholder="업로드 이름.." id="filename" name="filename" style="width: 60%; margin-right: 10px; margin-bottom: 10px;">
       	<input type="text" class="form-control pull-right hidden-xs" placeholder="업로드 이름.." id="filename" name="filename" style="width: 20%; margin-right: 10px;">
        <input class="btn btn-primary pull-right hidden-xs" type="file" id="fileUp" name="fileUp" style="width: 20%; margin-right: 10px;"><br>
        <input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}">
    </form>
    <br><br>
		<div>
				<div class="table-responsive">
					<table class="table table-striped tableFile">
						<thead align="center">
							<tr>
								<th style="width: 40%; text-align: center;">업로드 이름</th>
								<th style="width: 40%; text-align: center;">업로드 날짜</th>
								<th style="width: 20%; text-align: center;">파일 삭제</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="3" class="ts-pagerFile">
									<div class="form-inline" align="center">
										<div class="btn-group btn-group-sm mx-1" role="group">
											<button type="button" class="btn btn-primary first"
												title="first">⇤</button>
											<button type="button" class="btn btn-primary prev"
												title="previous">←</button>
										</div>
										<span class="pagedisplay"></span>
										<div class="btn-group btn-group-sm mx-1" role="group">
											<button type="button" class="btn btn-primary next"
												title="next">→</button>
											<button type="button" class="btn btn-primary last"
												title="last">⇥</button>
										</div>
										<!-- <select class="form-control-sm custom-select btn btn-primary px-1 pagesize" 
											title="Select page size" style="width: 50px; height: 37px;">
											<option selected="selected" value="5">5</option>
											<option value="10">10</option>
											<option value="15">15</option>
										</select> -->
										<select class="form-control-sm btn btn-primary custom-select pagenum"
											title="Select page number" style="width: 50px; height: 37px;">
										</select>
									</div>
								</th>
							</tr>
						</tfoot>
						<tbody align="center">
							<c:forEach items="${fileList}" var="fileList" varStatus="rowCount">
								<tr>
									<td><input type="hidden" id="filepathname" name="filepathname" value="${fileList.filepathname}">
									<a href="http://qsol.synology.me/${fileList.filepathname}">${fileList.filename}</a></td>
									<td><fmt:formatDate value="${fileList.uploaddate}" pattern="yyyy/MM/dd"/></td>
									<td><button id="checkBtn" type="button" class="btn btn-danger" value="${fileList.filepathname}" onclick="deletefile(this.value)" style="display: inline-block;">삭제</button>
									</td>
								</tr>
							</c:forEach>
							<!-- <a href="http://localhost:8080/upload/C0000003/1552287574583.png">asd</a> -->
						</tbody>
					</table>
				</div>
			</div>
	</div>
	
	<%-- <form method="post" action="upload" enctype="multipart/form-data">
		<input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
		<label>파일 명:</label>
		<input type="text" id="filename" name="filename">
		<input type="file" id="file" name="file">
		<br><br>
		<button type="button" class="btn btn-primary pull-right" onclick="uploadfile()" style="margin-right: 10px; margin-top: 8px;">파일 업로드</button>
	</form> --%>
	
	<%-- <form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
        <input class="btn btn-primary pull-right" type="button" value="파일업로드" onClick="fileSubmit();">
        <input class="btn btn-primary" type="file" id="fileUp" name="fileUp"/><br>
        <input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
       	파일명 : <input type="text" id="filename" name="filename">
    </form> --%>
	
	<%-- <span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">파일 목록</span>
	<div class="result-images">
		<img src="${pageContext.request.contextPath }${url }" style="width:150px">
	</div> --%>

	<%-- <!-- 상세 뷰 페이지  -->
	<div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">사이트 명 :${companyVO.companyname}</h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>사이트코드 :${companyVO.companycode} </h4>
              <input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>담당자 :</h4>
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-12 placeholder">
              <h4>회사 홈페이지 :&nbsp <a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></h4>
            </div>
            <div class="col-xs-12 col-sm-12 placeholder">
              <h4>회사주소 : ${companyVO.companyaddress}</h4>
            </div>
          </div>
          <br><br>
          <!-- 회사 담당자  -->
          <div class="col-xs-24 col-sm-12 placeholder">
          	담당자1<br>
          	담당자2
		</div>
		<br><br>
			<div class="row">
				<div class="col-xs-12 col-sm-6 placeholder">
			        <button type="button" class="btn btn-primary" onclick="updateform()">수정</button>
			        <button type="button" class="btn btn-primary" onclick="deleteform()">삭제</button>
				</div>
				<div class="col-xs-12 col-sm-6 placeholder right">
				    <button type="button" class="btn btn-primary" onclick="cancel()">취소</button>
				</div>
			</div>
			
			<div>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead align="center">
							<tr>
								<th style="width: 20%; text-align: center;">카테고리</th>
								<th style="width: 20%; text-align: center;">업무코드</th>
								<th style="width: 20%; text-align: center;">제목</th>
								<th style="width: 20%; text-align: center;">등록자</th>
								<th style="width: 20%; text-align: center;">작성일</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach items="${coworkList}" var="coworkList" varStatus="rowCount">
								<tr>
									<td>${coworkList.coworksubject}</td>
									<td>${coworkList.coworkcode}</td>
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.coworkcode}'>${coworkList.coworktitle}</a></td>
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.userid}'>${coworkList.userid}</a></td>
									<td>${coworkList.coworkdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
        </div>
	</div> --%>
</body>
</html>