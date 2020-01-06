<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<script type="text/javascript">
	function updateuserform(){
		var equipmentcode = $("#equipmentcode").val();
		var url = "/Equipment/Updateform?equipmentcode="+equipmentcode;
		// alert(url);
		location.href = url;
	}

	function deleteequipment(){
	    var answer = confirm("삭제하시겠습니까??")
	    if (answer) {
		    var equipmentcode = $("#equipmentcode").val();
			//alert(senddelvar);
			$.ajax({
	        url:"Delete",
	        type:"get",
	        data:{"equipmentcode":equipmentcode},
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
	        success:function(data){
	            alert("삭제되었습니다.");
	            location.href="/Equipment/List"
	            
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
	
	function insertmodelform() {
		var equipmentcode = $("#equipmentcode").val();
		var url = "/Equipment/InsertModelForm?equipmentcode="+equipmentcode;
		// alert(url);
		location.href = url;
	}
	
	function cancel(){
		location.href = "/User/List";
	}
	
	function googleLogin() {
		location.href = "/User/googleCallback";
	}
	
	$(function() {

		$(".tableModel").tablesorter(
			{
				theme : "bootstrap",

				widthFixed : true,

				// widget code contained in the jquery.tablesorter.widgets.js file
				// use the zebra stripe widget if you plan on hiding any rows (filter widget)
				// the uitheme widget is NOT REQUIRED!
				widgets : [ "columns", "zebra" ],

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
			container : $(".ts-pagerModel"),
			
			size : 5,
			
			cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

			// target the pager page select dropdown - choose a page
			cssGoto : ".pagenum",

			// remove rows from the table to speed up the sort of large tables.
			// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
			removeRows : false,

			// output string - default is '{page}/{totalPages}';
			// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
			output : '{page} / {totalPages}'

		});
	});
	
	function viewModel(modelcode) {
		
		var modelcode = modelcode;
		
		console.log(modelcode);
		
		$.ajax({
			type : 'post',
			url : '/Equipment/ViewSelectModel',
			data : {
				modelcode : modelcode
			},
			success : function(data) {
				
				console.log(data);
				console.log(data.modelname);
				
				var str = '';
				str += '<tr>';
				str += '<td>' + data.modelname + '</td>';
				str += '<td>' + data.modeldetail + '</td>';
				str += '<td>' + data.modelmac + '</td>';
				str += '</tr>';

				$('#model_text').html(str);
				
				if (data.contractcode == null) {
					
					var strs = '';
					strs += '<tr>';
					strs += '<td>' + "미계약" + '</td>';
					strs += '<td>' + "미계약" + '</td>';
					strs += '<td>' + "미계약" + '</td>';
					strs += '<td>' + "미계약" + '</td>';
					strs += '</tr>';
					
					$('#model_texts').html(strs);
					
				} else {
					
					var strs = '';
					strs += '<tr>';
					strs += '<td>' + data.contracttitle + '</td>';
					strs += '<td>' + data.companyname + '</td>';
					strs += '<td>' + data.startdate + '</td>';
					strs += '<td>' + data.enddate + '</td>';
					strs += '</tr>';
					
					$('#model_texts').html(strs);
					
				}
				
				$("#layerpop").modal(); 
			}
		});
		
	}
	
	function deletemodel(val){
 		
		// var str = "";
		// var tdArr = new Array();
		// var checkBtn = $(this);
		
		// var tr = checkBtn.parent().parent();
		// var td = tr.children();
		
		// console.log("클릭한 Row의 모든 데이터 : "+tr.text());
        
        // var filepathname = td.eq(0).value();
		
 		var temp_obj = {};
 		
		temp_obj["equipmentcode"] = $("#equipmentcode").val();
		temp_obj["modelcode"] = val;
		// temp_obj["filename"] = $("#filename").val();
		// temp_obj["filepathname"] = $("#filepathname").val();
	    
		// alert("test--"+JSON.stringify(temp_obj));

		var answer = confirm("해당 장비 모델을 삭제 하시겠습니까??")
		
		if(answer) {
			$.ajax({
		        url:"DeleteModel",
		        type:"post",
		        data:JSON.stringify(temp_obj),
		        enctype: "multipart/form-data",
		        datatype:"json",
				cache : false,
		        contentType:"application/json; charset=UTF-8",
		        success:function(resqonse){
		            alert("장비 모델을 삭제하였습니다.");
		            location.reload();
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		        }
		    });
		}
	}
	
	function updatemodel(val){
		var equipmentcode = $("#equipmentcode").val();
		var modelcode = val;
		
		var url = "/Equipment/UpdateModelForm?modelcode="+modelcode;
		// alert(url);
		location.href = url;
	}
	
	function insertModelExcel() {
		var excelFile = new FormData(document.getElementById('insertExcelForm'));
		
		var answer = confirm("장비 모델을 엑셀로 추가 하시겠습니까??")
		
		if(answer) {
			$.ajax({
				url : "UploadModelExcel",
				data : excelfile,
				processData : false,
				contentType : false,
				type : "POST",
				success : function(data) {
					console.log(data);
				}
			});
		}
	}
	
	function fileSubmit() {
		
		var forms = document.fileForm;
		
		if(forms.fileUp.value == "") {
			alert("엑셀 파일을 선택해주세요.")
			return forms.fileUp.focus();
		}
		
		var answer = confirm("장비 모델을 엑셀로 추가 하시겠습니까??")
		
        var formData = new FormData($("#fileForm")[0]);
		if(answer) {
	        $.ajax({
	            type : 'post',
	            url : 'fileUpload',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(html) {
	                alert("장비 모델 추가하였습니다.");
	                location.reload();
	            },
	            error : function(error) {
	                alert("장비 모델 추가에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
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
	background-color: white;
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

.box {
	border:0.5px solid #ddd;
	padding:8px 12px;
	border-radius:5px;
}
.box:hover{
	background-color:#A9D0F5;
}

.clickable {cursor: pointer;}
.hover {text-decoration: underline;}
.odd{ background: #FFFFFF;}
.even{ background: #F9F9F9;}
.active{ width:10px; height:10px; background:#337ab7; color:white;}

.listth {
	background : #EEEEEE;
}

.modal-content {
	margin-top: 100px;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>
<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">장비 상세 조회</span>
    	
		<button type="button" class="btn btn-danger pull-right" onclick="deleteequipment()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">장비 삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateuserform()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">장비 수정</button>
		<button type="button" class="btn btn-info pull-right" onclick="insertmodelform()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">모델 추가</button>
		<input type="hidden" id="equipmentcode" name="equipmentcode" value="${equipmentVO.equipmentcode}"/>
		<input type="hidden" id="equipmentname" name="equipmentname" value="${equipmentVO.equipmentname}"/>
    	<%-- <a href="${google_url}">
    		<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width: 100%">
        		<i class="fa fa-google" aria-hidden="true"></i>Google Login
        	</button>
        </a>  --%>
    </div>
	<!--  -->
	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">분 류</th>
						<th style="width: 15%; text-align: center;">구 분</th>
						<th style="width: 10%; text-align: center;">코 드</th>
						<th style="width: 30%; text-align: center;">장비 명</th>
						<th style="width: 20%; text-align: center;">제조사</th>
						<th style="width: 10%; text-align: center;">수 량</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>${equipmentVO.equipmentsubject}</td>
							<td>${equipmentVO.equipmentdivision}</td>
							<td>${equipmentVO.equipmentcode}</td>
							<td>${equipmentVO.equipmentname}</td>
							<td>${equipmentVO.equipmentcompany}</td>
							<td></td>
						</tr>
				</tbody>
			</table>
		</div>
		<% pageContext.setAttribute("newLineChar", "\n"); %>
		<div class="rounded" style="line-height: 1.5em; font-size: 16px; overflow: scroll; overflow-x : hidden; word-break:break-all; word-wrap:break-word;">
		${fn:replace(equipmentVO.equipmentspec, newLineChar, "<br>")}
		</div>
	</div>
	<div class="viewList">
	
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">장비 모델 리스트</span>
	
		<div class="table-responsive">
			<table class="table table-striped tableModel">
				<thead align="center">
					<tr>
						<th style="width: 25%; text-align: center;">모델 명</th>
						<th style="width: 20%; text-align: center;">시리얼 넘버</th>
						<th style="width: 20%; text-align: center;">MAC</th>
						<th style="width: 25%; text-align: center;">계약</th>
						<th style="width: 10%; text-align: center;">수정 / 삭제</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="5" class="ts-pagerModel">
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
								<select class="pagesize" hidden="hidden">
								    <option value="5">5</option>
								    <option value="5" seleced>5</option>
							    </select>
							</div>
						</th>
					</tr>
				</tfoot>
				<tbody align="center">
					<c:forEach items="${modelList}" var="modelList" varStatus="rowCount">
						<tr>
							<td onclick="viewModel(${modelList.modelcode});"><a href="javascript:void(0);" onclick="viewModel(${modelList.modelcode});">${modelList.modelname}</a></td>
							<td onclick="viewModel(${modelList.modelcode});">${modelList.modelserial}</td>
							<td onclick="viewModel(${modelList.modelcode});">${modelList.modelmac}</td>
							<td onclick="viewModel(${modelList.modelcode});">${modelList.contracttitle}</td>
							<td>
							<button id="checkBtn" type="button" class="btn btn-success" value="${modelList.modelcode}" onclick="updatemodel(this.value)" style="display: inline-block;">수정</button>
							<button id="checkBtn" type="button" class="btn btn-danger" value="${modelList.modelcode}" onclick="deletemodel(this.value)" style="display: inline-block;">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">장비 모델 엑셀로 추가</span>
		<form id="fileForm" name="fileForm" action="fileUpload" onsubmit="return false;" method="post" enctype="multipart/form-data" style="height: 40px;">
		<button type="button" class="btn btn-success pull-right" onclick="fileSubmit()" style="margin-right: 10px; margin-top: 8px;">엑셀 등록</button>
        <input class="btn btn-success pull-right" type="file" id="fileUp" name="fileUp" style="width: 20%; margin-right: 10px; margin-top: 8px; height: 34px;"><br>
        <input type="hidden" id="equipmentcode" name="equipmentcode" value="${equipmentVO.equipmentcode}">
        <input type="hidden" id="filename" name="filename" value="${equipmentVO.equipmentname}">
		</form>
	</div>

<!-- 모달 창 -->

<div class="modal fade" id="layerpop" >
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title">모델 상세보기</h4>
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			
			<!-- body -->
			<div id="coworkViewText" class="modal-body">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 30%; text-align: center;">모델 명</th>
						<th style="width: 35%; text-align: center;">상세내용</th>
						<th style="width: 35%; text-align: center;">MAC</th>
					</tr>
				</thead>
				<tbody align="center" id="model_text">
					
				</tbody>
			</table>
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 25%; text-align: center;">계약</th>
						<th style="width: 25%; text-align: center;">고객사</th>
						<th style="width: 25%; text-align: center;">시작날짜</th>
						<th style="width: 25%; text-align: center;">종료날짜</th>
					</tr>
				</thead>
				<tbody align="center" id="model_texts">
					
				</tbody>
			</table>
			</div>
			
			<!-- Footer -->
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>