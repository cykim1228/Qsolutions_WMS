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
			
		</thead>
		<tbody align="center">
			<c:forEach items="${companylistvo}" var="companylistvo" varStatus="rowCount">
			<br style='mso-data-placement:same-cell;'>
				<tr>
					<th style="width: 10%; text-align: center;">회사 분류</th>
					<th style="width: 20%; text-align: center;">회사 코드</th>
					<th style="width: 40%; text-align: center;">회사 명</th>
					<th style="width: 30%; text-align: center;">회사 홈페이지</th>
					<th style="width: 80%; text-align: center;">회사 주소</th>
				</tr>
				<tr>
					<td style="text-align: center;">${companylistvo.companyclass}</td>
					<td style="text-align: center;">${companylistvo.companycode}</td>
					<td style="text-align: center;">${companylistvo.companyname}</a></td>
					<td style="text-align: center;"><a href='${companylistvo.companyhomepg}'>${companylistvo.companyhomepg}</a></td>
					<td style="text-align: center;">[${companylistvo.companyzipcode}] ${companylistvo.companyaddress} ${companylistvo.companyaddress2}</td>
				</tr>
				<tr>
					<th style="width: 80%; text-align: center;">담당자 직급</th>
					<th style="width: 10%; text-align: center;">담당자 이름</th>
					<th style="width: 30%; text-align: center;">담당자 소속</th>
					<th style="width: 20%; text-align: center;">담당자 번호</th>
					<th style="width: 40%; text-align: center;">담당자 메일</th>
				</tr>
				<c:forEach items="${userVO}" var="userVO" varStatus="rowCount">
					<c:if test="${userVO.usercompanycode eq companylistvo.companycode}">
					<tr>
						<td style="text-align: center;">${userVO.positionname}</td>
						<td style="text-align: center;">${userVO.username}</td>
						<td style="text-align: center;">${userVO.deptname}</td>
						<td style="text-align: center; mso-number-format:\@">${userVO.usermobile}</td>
						<td style="text-align: center;">${userVO.useremail}</td>
					</tr>
					</c:if>
				</c:forEach>
				<tr style="background-color: black;">
				
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>