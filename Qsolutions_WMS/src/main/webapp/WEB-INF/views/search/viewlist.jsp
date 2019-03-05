<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>[QSOLUTIONS]업무관리 시스템</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/theme.bootstrap_4.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.tablesorter.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.tablesorter.widgets.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.tablesorter.pager.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.tablesorter.pager.js"></script>

<script type="text/javascript">
	function search_user() {
		var searchUser = document.SearchUser;
		searchUser.submit();
	}

	function insertView() {
		location.href = "/Company/Insertform";
	}

	$(function() {

		$(".tableCompany").tablesorter(
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
						filter_cssFilter : [ 'form-control', 'form-control',
								'form-control custom-select', // select needs custom class names :(
								'form-control', 'form-control', 'form-control',
								'form-control' ]

					}
				}).tablesorterPager({

			// target the pager markup - see the HTML block below
			container : $(".ts-pagerCompany"),

			// target the pager page select dropdown - choose a page
			cssGoto : ".pagenum",

			// remove rows from the table to speed up the sort of large tables.
			// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
			removeRows : false,

			// output string - default is '{page}/{totalPages}';
			// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
			output : '{startRow} - {endRow} / {filteredRows} ({totalRows})'

		});

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
						filter_cssFilter : [ 'form-control', 'form-control',
								'form-control custom-select', // select needs custom class names :(
								'form-control', 'form-control', 'form-control',
								'form-control' ]

					}
				}).tablesorterPager({

			// target the pager markup - see the HTML block below
			container : $(".ts-pagerUser"),

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
						filter_cssFilter : [ 'form-control', 'form-control',
								'form-control custom-select', // select needs custom class names :(
								'form-control', 'form-control', 'form-control',
								'form-control' ]

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

.viewListTop {
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

.tablesorter-pager .btn-group-sm .btn {
	font-size: 1.2em; /* make pager arrows more visible */
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<%@ include file="/WEB-INF/views/header/footer.jsp"%>

	<!-- <body style="background-color:#d4d4d4"> -->

	<!-- 상세 뷰 페이지 -->
	<div class="viewListTop">
		<span class="sub-header"
			style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">통합
			검색 결과</span>
	</div>
	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 34%; text-align: center;">회사 검색 결과</th>
						<th style="width: 34%; text-align: center;">담당자 검색 결과</th>
						<th style="width: 33%; text-align: center;">업무 검색 결과</th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<c:forEach items="${SearchCompanyCountvo}"
							var="SearchCompanyCountvo" varStatus="rowCount">
							<td>${SearchCompanyCountvo.count}</td>
						</c:forEach>
						<c:forEach items="${SearchUserCountvo}" var="SearchUserCountvo"
							varStatus="rowCount">
							<td>${SearchUserCountvo.count}</td>
						</c:forEach>
						<c:forEach items="${SearchCoworkCountvo}"
							var="SearchCoworkCountvo" varStatus="rowCount">
							<td>${SearchCoworkCountvo.count}</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped tableCompany">
				<thead align="center">
					<tr>
						<th style="width: 10%; text-align: center;" class="filter-select filter-exact" data-placeholder="회사 분류">회사 분류</th>
						<th style="width: 20%; text-align: center;">회사 코드</th>
						<th style="width: 40%; text-align: center;">회사 명</th>
						<th style="width: 30%; text-align: center;">회사 홈페이지</th>
					</tr>
				</thead>
				<tfoot>
					<!-- <tr>
			      <th>Name</th>
			      <th>Major</th>
			      <th>Sex</th>
			      <th>English</th>
			      <th>Japanese</th>
			      <th>Calculus</th>
			      <th>Geometry</th>
			    </tr> -->
					<tr>
						<th colspan="4" class="ts-pagerCompany">
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
								<!-- <select class="form-control-sm custom-select px-1 pagesize"
									title="Select page size">
									<option selected="selected" value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="all">All Rows</option>
								</select>  -->
								<select class="form-control-sm btn btn-primary custom-select pagenum"
									title="Select page number" style="width: 50px; height: 37px;">
								</select>
							</div>
						</th>
					</tr>
				</tfoot>
				<tbody align="center">
					<c:forEach items="${searchcompanylist}" var="searchcompanylist"
						varStatus="rowCount">
						<tr>
							<td>${searchcompanylist.companyclass}</td>
							<td>${searchcompanylist.companycode}</td>
							<td><a
								href='${pageContext.request.contextPath}/Company/View?companycode=${searchcompanylist.companycode}'>${searchcompanylist.companyname}</a></td>
							<td><a href='${searchcompanylist.companyhomepg}'>${searchcompanylist.companyhomepg}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped tableUser">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">사용자ID</th>
						<th style="width: 10%; text-align: center;">사용자명</th>
						<th style="width: 15%; text-align: center;">H.P</th>
						<th style="width: 15%; text-align: center;">EMail</th>
						<th style="width: 15%; text-align: center;">부서</th>
						<th style="width: 15%; text-align: center;" class="filter-select filter-exact" data-placeholder="직급">직급</th>
						<th style="width: 15%; text-align: center;">소속</th>
					</tr>
				</thead>
				<tfoot>
					<!-- <tr>
			      <th>Name</th>
			      <th>Major</th>
			      <th>Sex</th>
			      <th>English</th>
			      <th>Japanese</th>
			      <th>Calculus</th>
			      <th>Geometry</th>
			    </tr> -->
					<tr>
						<th colspan="7" class="ts-pagerUser">
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
								<!-- <select class="form-control-sm custom-select px-1 pagesize"
									title="Select page size">
									<option selected="selected" value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="all">All Rows</option>
								</select>  -->
								<select class="form-control-sm btn btn-primary custom-select pagenum"
									title="Select page number" style="width: 50px; height: 37px;">
								</select>
							</div>
						</th>
					</tr>
				</tfoot>
				<tbody align="center">
					<c:forEach items="${searchuserlist}" var="searchuserlist"
						varStatus="rowCount">
						<tr>
							<td>${searchuserlist.userid}</td>
							<td><a
								href="${pageContext.request.contextPath}/User/View?userid=${searchuserlist.userid}">${searchuserlist.username}</a></td>
							<td><a href='tel:${searchuserlist.usermobile}'>${searchuserlist.usermobile}</a></td>
							<td><a href='mailto:${searchuserlist.useremail}'>${searchuserlist.useremail}</a></td>
							<td>${searchuserlist.deptname}</td>
							<td>${searchuserlist.positionname}</td>
							<td>${searchuserlist.companyname}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped tableCowork">
				<thead align="center">
					<tr>
						<th style="width: 10%; text-align: center;" class="filter-select filter-exact" data-placeholder="카테고리">카테고리</th>
						<th style="width: 15%; text-align: center;">업무코드</th>
						<th style="width: 15%; text-align: center;">고객사명</th>
						<th style="width: 20%; text-align: center;">제목</th>
						<th style="width: 20%; text-align: center;">등록자</th>
						<th style="width: 20%; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tfoot>
					<!-- <tr>
			      <th>Name</th>
			      <th>Major</th>
			      <th>Sex</th>
			      <th>English</th>
			      <th>Japanese</th>
			      <th>Calculus</th>
			      <th>Geometry</th>
			    </tr> -->
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
								<!-- <select class="form-control-sm custom-select px-1 pagesize"
									title="Select page size">
									<option selected="selected" value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="all">All Rows</option>
								</select>  -->
								<select class="form-control-sm btn btn-primary custom-select pagenum"
									title="Select page number" style="width: 50px; height: 37px;">
								</select>
							</div>
						</th>
					</tr>
				</tfoot>
				<tbody align="center">
					<c:forEach items="${searchcoworklist}" var="searchcoworklist"
						varStatus="rowCount">
						<tr>
							<td>${searchcoworklist.coworksubject}</td>
							<td>${searchcoworklist.coworkcode}</td>
							<td><a
								href='${pageContext.request.contextPath}/Company/View?companycode=${searchcoworklist.companycode}'>${searchcoworklist.companyname}</a></td>
							<td><a
								href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${searchcoworklist.coworkcode}'>${searchcoworklist.coworktitle}</a></td>
							<td><a
								href='${pageContext.request.contextPath}/User/View?userid=${searchcoworklist.userid}'>${searchcoworklist.username}</a></td>
							<td>${searchcoworklist.coworkdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>