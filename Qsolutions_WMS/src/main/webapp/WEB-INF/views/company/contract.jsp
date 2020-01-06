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

	function updatecontractform(){
		var contractcode = $("#contractcode").val();
		var contractcompany = $("#contractcompany").val();
		var url = "/Company/UpdateContractForm?contractcompany=" + contractcompany + "&contractcode=" + contractcode;
		// alert(url);
		location.href = url;
	}
	
	function insertmodelform(){
		var contractcode = $("#contractcode").val();
		var contractcompany = $("#contractcompany").val();
		var url = "/Company/InsertEquipmentForm?contractcompany=" + contractcompany + "&contractcode=" + contractcode;
		// alert(url);
		location.href = url;
	}

	function deletecontractdata(){
	    var answer = confirm("삭제하시겠습니까??")
	    if (answer) {
		    var contractcode = $("#contractcode").val();
		    var contractcompany = $("#contractcompany").val();
		    
			//alert(senddelvar);
			$.ajax({
	        url:"DeleteContract",
	        type:"get",
	        data:{"contractcode":contractcode},
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
	        success:function(data){
	            alert("삭제되었습니다.");
	            location.href="/Company/View?companycode="+contractcompany;
	            
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

		var answer = confirm("계약에서 제외 하시겠습니까??")
		
		if(answer) {
			$.ajax({
		        url:"DeleteContractModel",
		        type:"post",
		        data:JSON.stringify(temp_obj),
		        enctype: "multipart/form-data",
		        datatype:"json",
				cache : false,
		        contentType:"application/json; charset=UTF-8",
		        success:function(resqonse){
		            alert("장비 모델을 제외하였습니다.");
		            location.reload();
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
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

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>
<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">계약 상세 조회</span>
    	
		<button type="button" class="btn btn-danger pull-right" onclick="deletecontractdata()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">계약 삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updatecontractform()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">계약 수정</button>
		<button type="button" class="btn btn-success pull-right" onclick="insertmodelform()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">장비 모델 추가</button>
    	
    	<input type="hidden" id="contractcode" name="contractcode" value="${contractVO.contractcode}"/>
		<input type="hidden" id="contractcompany" name="contractcompany" value="${contractVO.contractcompany}"/>
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
		<% pageContext.setAttribute("newLineChar", "\n"); %>
		<div class="rounded" style="line-height: 1.5em; font-size: 16px; overflow: scroll; overflow-x : hidden; word-break:break-all; word-wrap:break-word;">
		${fn:replace(contractVO.contractname, newLineChar, "<br>")}
		</div>
	</div>
	<div class="viewList">
	
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">장비 모델 목록</span>
		<div class="table-responsive">
			<table class="table table-striped tableModel">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">장비 명</th>
						<th style="width: 15%; text-align: center;">모델 명</th>
						<th style="width: 15%; text-align: center;">시리얼 넘버</th>
						<th style="width: 15%; text-align: center;">MAC</th>
						<th style="width: 30%; text-align: center;">상세정보</th>
						<th style="width: 10%; text-align: center;">제외</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="6" class="ts-pagerModel">
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
							<td>${modelList.equipmentname}</td>
							<td>${modelList.modelname}</td>
							<td>${modelList.modelserial}</td>
							<td>${modelList.modelmac}</td>
							<td>${modelList.modeldetail}</td>
							<td><button id="checkBtn" type="button" class="btn btn-danger" value="${modelList.modelcode}" onclick="deletemodel(this.value)" style="display: inline-block;">제외</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>