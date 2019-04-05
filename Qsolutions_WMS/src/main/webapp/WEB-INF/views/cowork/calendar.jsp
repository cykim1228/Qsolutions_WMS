<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[QSOLUTIONS]업무관리 시스템</title>

<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fullcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/gcal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/locale-all.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fullcalendar.min.css">
<link rel="stylesheet" media="print" type="text/css" href="${pageContext.request.contextPath}/resources/css/fullcalendar.print.min.css">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<script type='text/javascript'>

	$(document).ready(function() {

		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		

		$('#calendar').fullCalendar({
			locale: 'ko', 
			businessHours: true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,listWeek,timelineDay' // basicDay
			},
			editable : false,
			eventLimit: true,
			height: get_calendar_height,
			/* eventClick: function() {calendar.jsp
				$("#layerpop").modal(); */
			googleCalendarApiKey : "AIzaSyAAYTAR5Q5FNigkke8ATZ8O_3v7v8r64DI",
			/* googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", */
			eventClick: function(calEvent, jsEvent, view) {
				var coworktitle = calEvent.title;
				var coworkcode = calEvent.eventClassNames;
				console.log(coworktitle);
				console.log(coworkcode);
				
				$.ajax({
					type : 'post',
					url : '/Cowork/Calendar',
					data : {
						coworkcode : coworkcode
					},
					success : function(data) {
						
						console.log(data);
						console.log(data.coworktitle);
						
						var str = '';
						str += '<tr>';
						str += '<td>' + data.coworksubject + '</td>';
						str += '<td><a href="${pageContext.request.contextPath}/Cowork/View?coworkcode=' + data.coworkcode + '">' + data.coworktitle + '</a></td>';
						str += '<td>' + data.coworkcode + '</td>';
						str += '</tr>';

						$('#cowork_text').html(str);
						
						var strs = '';
						strs += '<tr>';
						strs += '<td><a href="${pageContext.request.contextPath}/Company/View?companycode=' + data.companycode + '">' + data.companyname + '</a></td>';
						strs += '<td><a href="${pageContext.request.contextPath}/User/View?userid=' + data.userid + '">' + data.username + '</a></td>';
						strs += '<td>' + data.startdate + '</td>';
						strs += '<td>' + data.enddate + '</td>';
						strs += '</tr>';
						
						$('#cowork_texts').html(strs);
						
						$("#layerpop").modal(); 
					}
				});
				
				
				
				
			},
			
			events : [ 
				<c:forEach items="${coworklistvo}" var="coworklistvo" varStatus="rowCount">
					{
						title : '${coworklistvo.coworktitle}',
						start : '${coworklistvo.startdate}',
						end : '${coworklistvo.enddate}',
						eventClassNames : '${coworklistvo.coworkcode}'
						<c:forEach items="${colorlistVO}" var="colorlistVO" varStatus="rowCount">
							<c:choose>
								<c:when test="${coworklistvo.username=='관리자'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
	                   			<c:when test="${coworklistvo.username=='김찬영'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='이다해'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='김도균'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='김동현'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='이건수'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='조형찬'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='박종신'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='이준호'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='조만수'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='서미향'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='임문혁'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='유지헌'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='유웅재'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:when test="${coworklistvo.username=='조형찬'}">
									<c:if test="${colorlistVO.userid==coworklistvo.userid}">
										,color : '${colorlistVO.usercolor}'
									</c:if>
								</c:when>
								<c:otherwise>,color : '#000000' </c:otherwise>
							</c:choose>
						</c:forEach>
					},
				</c:forEach>
			]
			
			/* eventSources : [
				{
					googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com", 
					className : "휴일", 
					color : "#FF0000", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "cykim1228@gmail.com", 
					className : "김찬영", 
					color : "#FA5858", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "kdog920825@gmail.com", 
					className : "김도균", 
					color : "#FF8000", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "forgive0218@gmail.com", 
					className : "박종신", 
					color : "#FFBF00", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "kasd1032@gmail.com", 
					className : "홍재영", 
					color : "#D7DF01", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "rainnizm@gmail.com", 
					className : "유지헌", 
					color : "#04B404", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "ydy000@gmail.com", 
					className : "윤도영", 
					color : "#088A68", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "kleeeec@gmail.com", 
					className : "이건수", 
					color : "#01DFD7", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "dahae3278@gmail.com", 
					className : "이다해", 
					color : "#01A9DB", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "gkdlwmsj@gmail.com", 
					className : "이준호", 
					color : "#01A9DB", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "qodrml@gmail.com", 
					className : "임문혁", 
					color : "#0080FF", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "mansoo0612@gmail.com", 
					className : "조만수", 
					color : "#0040FF", 
					textColor : "#FFFFFF"
				}
			] */
		});
		
		$(window).resize(function() {
	        $('#calendar').fullCalendar('option', 'height', get_calendar_height());
	    });
		
		$('#calendars').fullCalendar({
			locale: 'ko', 
			businessHours: true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,listWeek,timelineDay' // basicDay
			},
			editable : false,
			eventLimit: true,
			height: get_calendar_height,
			/* eventClick: function() {calendar.jsp
				$("#layerpop").modal(); */
			googleCalendarApiKey : "AIzaSyAAYTAR5Q5FNigkke8ATZ8O_3v7v8r64DI",
			/* googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", */
			eventClick: function(calEvent, jsEvent, view) {
				var coworktitle = calEvent.title;
				var coworkcode = calEvent.eventClassNames;
				console.log(coworktitle);
				console.log(coworkcode);
				
				$.ajax({
					type : 'post',
					url : '/Cowork/Calendar',
					data : {
						coworkcode : coworkcode
					},
					success : function(data) {
						
						console.log(data);
						console.log(data.coworktitle);
						
						var str = '';
						str += '<tr>';
						str += '<td>' + data.coworksubject + '</td>';
						str += '<td><a href="${pageContext.request.contextPath}/Cowork/View?coworkcode=' + data.coworkcode + '">' + data.coworktitle + '</a></td>';
						str += '<td>' + data.coworkcode + '</td>';
						str += '</tr>';

						$('#cowork_text').html(str);
						
						var strs = '';
						strs += '<tr>';
						strs += '<td><a href="${pageContext.request.contextPath}/Company/View?companycode=' + data.companycode + '">' + data.companyname + '</a></td>';
						strs += '<td><a href="${pageContext.request.contextPath}/User/View?userid=' + data.userid + '">' + data.username + '</a></td>';
						strs += '<td>' + data.startdate + '</td>';
						strs += '<td>' + data.enddate + '</td>';
						strs += '</tr>';
						
						$('#cowork_texts').html(strs);
						
						$("#layerpop").modal(); 
					}
				});
				
				
				
				
			},
			
			events : [ 
				<c:forEach items="${coworklistvo}" var="coworklistvo" varStatus="rowCount">
					{
						title : '${coworklistvo.coworktitle}',
						start : '${coworklistvo.startdate}',
						end : '${coworklistvo.enddate}',
						eventClassNames : '${coworklistvo.coworkcode}'
							<c:forEach items="${colorlistVO}" var="colorlistVO" varStatus="rowCount">
								<c:choose>
									<c:when test="${coworklistvo.username=='관리자'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
			               			<c:when test="${coworklistvo.username=='김찬영'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='이다해'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='김도균'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='김동현'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='이건수'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='조형찬'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='박종신'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='이준호'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='조만수'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='서미향'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='임문혁'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='유지헌'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='유웅재'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:when test="${coworklistvo.username=='조형찬'}">
										<c:if test="${colorlistVO.userid==coworklistvo.userid}">
											,color : '${colorlistVO.usercolor}'
										</c:if>
									</c:when>
									<c:otherwise>,color : '#000000' </c:otherwise>
								</c:choose>
							</c:forEach>
					},
				</c:forEach>
			]
			
			/* eventSources : [
				{
					googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com", 
					className : "휴일", 
					color : "#FF0000", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "cykim1228@gmail.com", 
					className : "김찬영", 
					color : "#FA5858", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "kdog920825@gmail.com", 
					className : "김도균", 
					color : "#FF8000", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "forgive0218@gmail.com", 
					className : "박종신", 
					color : "#FFBF00", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "kasd1032@gmail.com", 
					className : "홍재영", 
					color : "#D7DF01", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "rainnizm@gmail.com", 
					className : "유지헌", 
					color : "#04B404", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "ydy000@gmail.com", 
					className : "윤도영", 
					color : "#088A68", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "kleeeec@gmail.com", 
					className : "이건수", 
					color : "#01DFD7", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "dahae3278@gmail.com", 
					className : "이다해", 
					color : "#01A9DB", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "gkdlwmsj@gmail.com", 
					className : "이준호", 
					color : "#01A9DB", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "qodrml@gmail.com", 
					className : "임문혁", 
					color : "#0080FF", 
					textColor : "#FFFFFF"
				},
				{
					googleCalendarId : "mansoo0612@gmail.com", 
					className : "조만수", 
					color : "#0040FF", 
					textColor : "#FFFFFF"
				}
			] */
		});
		
		$(window).resize(function() {
	        $('#calendars').fullCalendar('option', 'height', get_calendar_height());
	    });


	});
	
	function get_calendar_height() {
	      return $(window).height() - 10;
	}
	
</script>

<style>

body {
	margin-top: 100px;
	margin-bottom: 100px;
}

#calendar {
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	width: auto;
	margin: 20px 200px 0px 200px;
}

#calendars {
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	width: auto;
	margin: 20px 200px 0px 200px;
}

.fc-day-number.fc-sat.fc-past { 
	color:#0000FF; 
}     /* 토요일 */

.fc-day-number.fc-sun.fc-past { 
	color:#FF0000; 
}    /* 일요일 */

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

.fc-sun { 
	color: red;
	background-color:#F5A9A9; 
	font-weight: bold;
}
.fc-sat { 
	color: #2E64FE;
	background-color:#A9E2F3;  
	font-weight: bold;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

	<div class="viewListTop" style="margin-bottom: 20px;">
		<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">업무 달력</span>
	</div>
	<div class="hidden-xs" id='calendar' style="padding-bottom: 100px;"></div>
	<div class="visible-xs" id='calendars' style="padding-bottom: 100px; margin: 20px 0px 0px"></div>
	
	
	<!-- 모달 창 -->

<div class="modal fade" id="layerpop" >
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title">업무 상세보기</h4>
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			
			<!-- body -->
			<div id="coworkViewText" class="modal-body">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 30%; text-align: center;">카테고리</th>
						<th style="width: 35%; text-align: center;">제목</th>
						<th style="width: 35%; text-align: center;">업무코드</th>
					</tr>
				</thead>
				<tbody align="center" id="cowork_text">
					
				</tbody>
			</table>
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 25%; text-align: center;">고객사명</th>
						<th style="width: 25%; text-align: center;">등록자</th>
						<th style="width: 25%; text-align: center;">시작시간</th>
						<th style="width: 25%; text-align: center;">종료시간</th>
					</tr>
				</thead>
				<tbody align="center" id="cowork_texts">
					
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