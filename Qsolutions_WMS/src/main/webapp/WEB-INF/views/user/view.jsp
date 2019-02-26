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
	function updateuserform(){
		var userid = $("#userid").val();
		var url = "/qsolcowork/User/Updateform?userid="+userid;
		alert(url);
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
	            location.href="/qsolcowork/User/List"
	            
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
		location.href = "/qsolcowork/User/List";
	}
	
	function googleLogin() {
		location.href = "/qsolcowork/User/googleCallback";
	}
	
	$(function() {

		$(".tableWrite").tablesorter(
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
			container : $(".ts-pagerWrite"),

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

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>
<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">담당자 상세 조회</span>
    	<c:choose>
			<c:when test="${userVO.companyname eq '(주) 퀀텀솔루션즈'}">
				<c:if test="${loginVO.userid eq 'admin'}">
				<button type="button" class="btn btn-danger pull-right" onclick="deleteuserdata()" style="margin-right: 10px; margin-top: 8px;">담당자 삭제</button>
    			<button type="button" class="btn btn-primary pull-right" onclick="updateuserform()" style="margin-right: 10px; margin-top: 8px;">담당자 수정</button>
				</c:if>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-danger pull-right" onclick="deleteuserdata()" style="margin-right: 10px; margin-top: 8px;">담당자 삭제</button>
    			<button type="button" class="btn btn-primary pull-right" onclick="updateuserform()" style="margin-right: 10px; margin-top: 8px;">담당자 수정</button>
			</c:otherwise>
		</c:choose>
    	
    	
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
						<th style="width: 15%; text-align: center;">ID</th>
						<th style="width: 10%; text-align: center;">이름</th>
						<th style="width: 15%; text-align: center;">연락처</th>
						<th style="width: 15%; text-align: center;">이메일</th>
						<th style="width: 15%; text-align: center;">부서</th>
						<th style="width: 15%; text-align: center;">직급</th>
						<th style="width: 15%; text-align: center;">소속</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>${userVO.userid}</td>
							<td>${userVO.username}<input type="hidden" id="userid" value="${userVO.userid}"/></td>
							<td><a href='tel:${userVO.usermobile}'>${userVO.usermobile}</a></td>
							<td><a href='mailto:${userVO.useremail}'>${userVO.useremail}</a></td>
							<td>${userVO.deptname}</td>
							<td>${userVO.positionname}</td>
							<td>${userVO.companyname}</td>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="viewList">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">작성 업무 목록</span>
		<div class="table-responsive">
			<table class="table table-striped tableWrite">
				<thead align="center">
					<tr>
						<th style="width: 10%; text-align: center;" class="filter-select filter-exact" data-placeholder="카테고리">카테고리</th>
						<th style="width: 20%; text-align: center;">고객사명</th>
						<th style="width: 30%; text-align: center;">제목</th>
						<th style="width: 10%; text-align: center;">등록자</th>
						<th style="width: 15%; text-align: center;">업무코드</th>
						<th style="width: 15%; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="6" class="ts-pagerWrite">
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
					<c:forEach items="${coworkVO}" var="coworkVO" varStatus="rowCount">
					<tr>
						<td>${coworkVO.coworksubject}</td>
						<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Company/View?companycode=${coworkVO.companycode}'>${coworkVO.companyname}</a></td>
						<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkVO.coworkcode}'>${coworkVO.coworktitle}</a></td>
						<td><a href='${pageContext.request.contextPath}/User/View?userid=${coworkVO.userid}'>${coworkVO.username}</a></td>
						<td>${coworkVO.coworkcode}</td>
						<td><fmt:formatDate value="${coworkVO.coworkdate}" pattern="yyyy/MM/dd"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="viewList">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">담당 업무 목록</span>
		<div class="table-responsive">
			<table class="table table-striped tableCowork">
				<thead align="center">
					<tr>
						<th style="width: 10%; text-align: center;" class="filter-select filter-exact" data-placeholder="카테고리">카테고리</th>
						<th style="width: 20%; text-align: center;">고객사명</th>
						<th style="width: 30%; text-align: center;">제목</th>
						<th style="width: 10%; text-align: center;">등록자</th>
						<th style="width: 15%; text-align: center;">업무코드</th>
						<th style="width: 15%; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="6" class="ts-pagerCowork">
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
					<c:forEach items="${managerCoworkVO}" var="managerCoworkVO" varStatus="rowCount">
					<tr>
						<td>${managerCoworkVO.coworksubject}</td>
						<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Company/View?companycode=${managerCoworkVO.companycode}'>${managerCoworkVO.companyname}</a></td>
						<td style="font-weight: bold;"><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${managerCoworkVO.coworkcode}'>${managerCoworkVO.coworktitle}</a></td>
						<td><a href='${pageContext.request.contextPath}/User/View?userid=${managerCoworkVO.userid}'>${managerCoworkVO.username}</a></td>
						<td>${managerCoworkVO.coworkcode}</td>
						<td><fmt:formatDate value="${managerCoworkVO.coworkdate}" pattern="yyyy/MM/dd"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<%-- <div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 50%; text-align: center;">고객사홈페이지</th>
						<th style="width: 50%; text-align: center;">고객사주소</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td><a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></td>
							<td>[${companyVO.companyzipcode}] ${companyVO.companyaddress} ${companyVO.companyaddress2}</td>
						</tr>
				</tbody>
			</table>
		</div>
	</div> --%>
    
	<%-- <!-- 상세 뷰 페이지  -->
	<div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">사용자ID :${userVO.userid}</h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>사용자 이름 :${userVO.username} </h4>
              <input type="hidden" id="userid" value="${userVO.userid}"/>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>부서 : ${userVO.deptname}</h4>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>직급 : ${userVO.positionname}</h4>
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>핸드폰 번호 :${userVO.usermobile}</h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>이메일주소: ${userVO.useremail}</h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>
              	소속 : 
					<c:if test="${userVO.companyusercode == 1}">퀀텀솔루션즈</c:if>
					<c:if test="${userVO.companyusercode == 0}">고객사</c:if>
              </h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4></h4>
            </div>
          </div>
          <br><br>
          <div class="col-xs-24 col-sm-12 placeholder">
			${CoworkVO.coworktext}
		</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 placeholder">
			        <button type="button" class="btn btn-primary" onclick="updateuserform()">수정</button>
			        <button type="button" class="btn btn-primary" onclick="deleteuserdata()">삭제</button>
				</div>
				<div class="col-xs-12 col-sm-6 placeholder right">
				    <button type="button" class="btn btn-primary" onclick="cancel()">취소</button>
				</div>
			</div>
        </div>
	</div> --%>
</body>
</html>