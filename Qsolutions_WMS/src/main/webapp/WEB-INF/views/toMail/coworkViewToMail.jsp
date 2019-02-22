<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>하이</h1>
	<input type="hidden" id="subject" type="text" name="subject" value="${CoworkVO.companyname} - ${CoworkVO.coworktitle}">
		<br>
			<table border="1">
				<thead align="center">
					<tr>
						<th style="width: 10%; text-align: center;">카테고리</th>
						<th style="width: 35%; text-align: center;">제목</th>
						<th style="width: 10%; text-align: center;">업무코드</th>
						<th style="width: 25%; text-align: center;">고객사명</th>
						<th style="width: 10%; text-align: center;">등록자</th>
						<th style="width: 10%; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>${CoworkVO.coworksubject}</td>
							<td>${CoworkVO.coworktitle}</td>
							<td>${CoworkVO.coworkcode}</td>
							<td>${CoworkVO.companyname}</td>
							<td>${CoworkVO.username}</td>
							<td><fmt:formatDate value="${CoworkVO.coworkdate}" pattern="yyyy/MM/dd"/></td>
						</tr>
				</tbody>
			</table>
			<table border="1">
				<thead align="center">
					<tr>
						<th style="width: 30%; text-align: center;">진행단계</th>
						<th style="width: 40%; text-align: center;">시작시간</th>
						<th style="width: 40%; text-align: center;">종료시간</th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<td>${CoworkVO.coworkstep}</td>
						<td>${CoworkVO.startdate}</td>
						<td>${CoworkVO.enddate}</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 20%; text-align: center;">소속</th>
						<th style="width: 15%; text-align: center;">직급</th>
						<th style="width: 15%; text-align: center;">담당자</th>
						<th style="width: 20%; text-align: center;">담당자연락처</th>
						<th style="width: 30%; text-align: center;">담당자이메일</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${userList}" var="userList" varStatus="rowCount">
						<tr>
							<td><a href='${pageContext.request.contextPath}/Company/View?companycode=${userList.usercompanycode}'>${userList.companyname}</a></td>
							<td>${userList.positionname}</td>
							<td><a href="${pageContext.request.contextPath}/User/View?userid=${userList.userid}">${userList.username}</a></td>
							<td><a href='tel:${userList.usermobile}'>${userList.usermobile}</a></td>
							<td><a href='mailto:${userList.useremail}'>${userList.useremail}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<div style="width: 80%; height: 80%; background-color: #E6E6E6; border:2px solid #ddd; padding:0.5em; line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;">
			${CoworkVO.coworktext}
		</div>
		<c:forEach var="SubCoworkVO" items="${SubCoworkVO}" varStatus="linenum">
	        <div class="viewList">
				<div class="roundedSubNo">
					No. ${SubCoworkVO.subcoworkcode}
					<input type="hidden" id="subcoworkcode" name="subcoworkcode" value="${SubCoworkVO.subcoworkcode}">
				</div>
		        <div class="roundedSubText">
		         	${SubCoworkVO.subcoworktext}
		        </div>
		        <div class="roundedSubName">
		            ${SubCoworkVO.username}
		        </div>
		        <div class="roundedSubName">
		            <fmt:timeZone value="GMT">
		            <fmt:formatDate value="${SubCoworkVO.subcoworkdate}" pattern="yyyy/MM/dd a h:mm"/>
		            </fmt:timeZone>
				</div>
	        </div>
	    </c:forEach>

</body>
</html>