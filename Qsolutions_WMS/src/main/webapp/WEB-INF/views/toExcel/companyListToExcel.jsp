<%@ page language="java"
	contentType="application/vnd.ms-excel;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

<%

	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	String today = format.format(new Date());
	String days = request.getParameter("days");
	
	// MS excel로 다운로드/실행, filename에 저장될 파일명을 적어준다.
	String file_name = "고객사리스트";
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
				<th style="width: 10%; text-align: center;">회사 분류</th>
				<th style="width: 20%; text-align: center;">회사 코드</th>
				<th style="width: 40%; text-align: center;">회사 명</th>
				<th style="width: 30%; text-align: center;">회사 홈페이지</th>
				<th style="width: 80%; text-align: center;">회사 주소</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${companylistvo}" var="companylistvo"
				varStatus="rowCount">
				<tr>
					<td>${companylistvo.companyclass}</td>
					<td>${companylistvo.companycode}</td>
					<td style="font-weight: bold;">${companylistvo.companyname}</a></td>
					<td><a href='${companylistvo.companyhomepg}'>${companylistvo.companyhomepg}</a></td>
					<td>[${companylistvo.companyzipcode}] ${companylistvo.companyaddress} ${companylistvo.companyaddress2}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>