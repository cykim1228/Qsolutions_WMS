<%@ page language="java"
	contentType="application/vnd.ms-excel;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.qsolutions.cowork.VO.CompanyVO"%>
<!DOCTYPE html>
<html>
<head>

<%

	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	String today = format.format(new Date());
	String days = request.getParameter("days");
	
	// MS excel로 다운로드/실행, filename에 저장될 파일명을 적어준다.
	CompanyVO companyVO = (CompanyVO)request.getAttribute("companyVO");
	String file_name = companyVO.getCompanyname();
	String ExcelName  = new String((file_name).getBytes("KSC5601"),"8859_1") + "_" + today + ".xls";

	response.setHeader("Content-Disposition","attachment;filename="+ExcelName);
	response.setHeader("Content-Description", "JSP Generated Data");

	// ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
	// response.setContentType("application/vnd.ms-excel");
%>
​
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

	<table border="1">
		<thead align="center">
			<tr>
				<th style="width: 15%; text-align: center;">분류</th>
				<th style="width: 20%; text-align: center;">고객사명</th>
				<th style="width: 20%; text-align: center;">고객사코드</th>
				<th style="width: 35%; text-align: center;">홈페이지</th>
				<th style="width: 40%; text-align: center;">주소</th>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td>${companyVO.companyclass}</td>
				<td>${companyVO.companyname}</td>
				<td>${companyVO.companycode}</td>
				<td><a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></td>
				<td>[${companyVO.companyzipcode}] ${companyVO.companyaddress} ${companyVO.companyaddress2}</td>
			</tr>
		</tbody>
	</table>
	<br>
	<table border="1">
		<thead align="center">
			<tr>
				<th style="width: 15%; text-align: center;">직급</th>
				<th style="width: 15%; text-align: center;">이름</th>
				<th style="width: 35%; text-align: center;">연락처</th>
				<th style="width: 35%; text-align: center;">이메일</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${userList}" var="userList" varStatus="rowCount">
				<tr>
					<td>${userList.positionname}</td>
					<td>${userList.username}</td>
					<td style="mso-number-format:\@">${userList.usermobile}</td>
					<td>${userList.useremail}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<table border="1">
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
					<td>${coworkList.coworktitle}</td>
					<td>${coworkList.username}</td>
					<td><fmt:formatDate value="${coworkList.coworkdate}" pattern="yyyy/MM/dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>