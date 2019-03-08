
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="org.springframework.stereotype.Component" %>
<%@ page import="org.springframework.mail.MailException" %>
<%@ page import="org.springframework.mail.javamail.JavaMailSender" %>
<%@ page import="org.springframework.mail.javamail.MimeMessageHelper" %>

<!DOCTYPE html>
<html>
<head>
<title>[QSOLUTIONS]업무관리 시스템</title>

<%!

@Autowired
private JavaMailSender mailSender;

public void sendMail(String userId, String filePath, HttpSession session) throws IOException {

	MimeMessage message = mailSender.createMimeMessage();

    String file = session.getServletContext().getRealPath("WEB-INF/views") + filePath;
    InputStream is = new FileInputStream(file);
    String htmlContent = "";
    
    //스트링 버퍼를 이용하여 inputStream을 스트링으로 변환하고 utf-8로 변환하는 방법
    String UTF8 = "utf8";
    StringBuffer buffer = new StringBuffer();
    int BUFFER_SIZE = 8192;
    BufferedReader br = new BufferedReader(new InputStreamReader(is, UTF8), BUFFER_SIZE);
    String str;
    
    while ((str = br.readLine()) != null) {
       htmlContent += str;
    }

    try {

       MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

       messageHelper.setSubject("[업무관리시스템] 메일서비스");
       messageHelper.setText(htmlContent, true);
       messageHelper.setFrom("zzanzzanyoung@gmail.com", "QSolutions");
       messageHelper.setTo(new InternetAddress(userId, "utf-8"));
       
/*         // 파일 첨부
       messageHelper.addAttachment(MimeUtility.encodeText("사용자관리.xlsx", "UTF-8", "B"), new FileDataSource("C:/OpenProject/사용자관리.xlsx"));
       
       // 파일 첨부2 - 이미지파일만 가능, 본문에 미리보기 기능 추가
       messageHelper.addInline("qwer", new FileDataSource("C:/OpenProject/qwer.jpg"));*/
       
       //메일 보내기
       mailSender.send(message);
       
    } catch (MailException e) {
    	e.printStackTrace();
    	return;
    } catch (Throwable e) {
    	e.printStackTrace();
    	return;
    }
    
}

%>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>

<script type="text/javascript">
	function updateform(){
		//var coworkcode = document.getElementById("coworkcode").value
		var coworkcode = $("#coworkcode").val();
		var url = "/Cowork/Updateform?coworkcode="+coworkcode;
		location.href = url;
	}
	
	function deleteform() {
		var answer = confirm("삭제하시겠습니까??")
		var coworkcode = $("#coworkcode").val();
		if (answer) {
			$.ajax({
	        url:"Delete",
	        type:"get",
	        data:{"coworkcode":coworkcode},
	        datatype:"html",
	        contentType:"application/html;charset=UTF-8",
	        success:function(response){
	            alert("삭제되었습니다.");
	    		location.href = "/Cowork/List";
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
			});
		}
	}
	
	function insertsubcowork(){
		var subcoworktext = $("#subcoworktext").val();
		var coworkcode = $("#coworkcode").val();
		if(subcoworktext == "" || subcoworktext == null){
			alert("내용을 입력해주시기 바랍니다.");
			
			return;
		}
	    var temp_obj = {};
	    temp_obj["coworkcode"] = coworkcode;
	    temp_obj["subcoworktext"] = subcoworktext;

	    $.ajax({
        url:"SubCoworkInsert",
        type:"post",
        data:JSON.stringify(temp_obj),
        datatype:"json",
        contentType:"application/json;charset=UTF-8",
        success:function(data){
            alert("등록되었습니다.");
            document.getElementById("subcoworktext").value = "";
            location.reload();
            
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
		});
		
	}
	
	function deletesubcowork(){
	    var temp_obj = {};
	    var answer = confirm("삭제하시겠습니까??")
	    if (answer) {
		    temp_obj["coworkcode"] = $("#coworkcode").val();
		    temp_obj["subcoworkcode"] = $("#subcoworkcode").val();

		    $.ajax({
	        url:"SubCoworkDelete",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
	        success:function(data){
	            alert("삭제되었습니다.");
	            document.getElementById("subcoworktext").value = "";
	            location.reload();
	            
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
		location.href = "/Cowork/List";
	}
	
	/* function mailSend(){
		
		var receiver = $("#receiver").val(); // 받는사람
		var coworkcode = $("#coworkcode").val();
		
		$.ajax({
	        url:"/toMail/coworkViewToMail",
	        type:"post",
	        data:{
	        	receiver:receiver, 
	        	coworkcode:coworkcode
	        },
	        success:function(data){
	            alert("메일이 전송되었습니다.");
	            
	            location.reload();
	            
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
		});
		
	} */
	
	function mailSend(){
		
		var receiver = $("#receiver").val(); // 받는사람
		var subject = $("#subject").val(); // 제목
		var content = $("#content").val(); // 내용
		
		$.ajax({
	        url:"send",
	        type:"post",
	        data:{
	        	receiver:receiver,
	        	subject:subject,
	        	content:content
	        },
	        success:function(data){
	            alert("메일이 전송되었습니다.");
	            
	            location.reload();
	            
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
		});
		
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
	vertical-align: middle;
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
	vertical-align: middle;
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
	vertical-align: middle;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

	<!-- 상세 뷰 페이지  -->
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">${CoworkVO.coworktitle}</span>
    	<button type="button" class="btn btn-danger pull-right" onclick="deleteform()" style="margin-right: 10px; margin-top: 8px;">업무 삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateform()" style="margin-right: 10px; margin-top: 8px;">업무 수정</button>
    	<button type="button" class="btn btn-info pull-right" onclick="mailSend()" style="margin-right: 10px; margin-top: 8px;">메일 전송</button>
		<select class="form-control pull-right" id="receiver" name="receiver" style="width: 150px; height: 34px; display: inline-block; margin-right: 10px; margin-top: 8px;">
			<option value="" selected disabled hidden>== 받는사람 ==</option>
			<option value="we@qsolutions.co.kr">전체</option>
			<c:forEach items="${userList}" var="userList" varStatus="rowCount">
				<c:if test="${userList.usercompanycode eq 'C0000001'}">
					<option id="useremail" value="${userList.useremail}">${userList.username}</option>
				</c:if>
			</c:forEach>
		</select>
    </div>
<!--  -->
	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">카테고리</th>
						<th style="width: 20%; text-align: center;">업무코드</th>
						<th style="width: 30%; text-align: center;">고객사명</th>
						<th style="width: 15%; text-align: center;">등록자</th>
						<th style="width: 20%; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>
							${CoworkVO.coworksubject}
							<input type="hidden" id="coworkcode" value="${CoworkVO.coworkcode}"/>
							</td>
							<td>${CoworkVO.coworkcode}</td>
							<td><a href='${pageContext.request.contextPath}/Company/View?companycode=${CoworkVO.companycode}'>${CoworkVO.companyname}</a></td>
							<td><a href='${pageContext.request.contextPath}/User/View?userid=${CoworkVO.userid}'>${CoworkVO.username}</a></td>
							<td><fmt:formatDate value="${CoworkVO.coworkdate}" pattern="yyyy/MM/dd"/></td>
						</tr>
				</tbody>
			</table>
	</div>
	</div>
	
	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 20%; text-align: center;">진행단계</th>
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
		</div>
		<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">담당자 목록</span>
		<div class="table-responsive">
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
		</div>
		<% pageContext.setAttribute("newLineChar", "\n"); %>
		<div class="rounded" style="line-height: 1.5em; font-size: 16px; overflow: scroll; overflow-x : hidden; word-break:break-all; word-wrap:break-word;">
		${fn:replace(CoworkVO.coworktext, newLineChar, "<br>")}
		</div>
		
	</div>
	
	<div class="viewList">
		<textarea id="subcoworktext" name="subcoworktext" class="form-control" rows="3" placeholder="추가 업무 내용을 입력해주세요." style="width: 90%; display: inline-block;"></textarea>
		<button type="button" class="btn btn-primary pull-right" onclick="insertsubcowork()" style="width: 9%; height: 74px;">작성</button>
	</div>
	        	<c:forEach var="SubCoworkVO" items="${SubCoworkVO}" varStatus="linenum">
	        	<div class="viewList">
					<div class="roundedSubNo">
						No. ${SubCoworkVO.subcoworkcode}
						<input type="hidden" id="subcoworkcode" name="subcoworkcode" value="${SubCoworkVO.subcoworkcode}">
					</div>
		            <div class="roundedSubText" style="overflow: scroll; overflow-x : hidden; word-break:break-all; word-wrap:break-word;">
		            	${fn:replace(SubCoworkVO.subcoworktext, newLineChar, "<br>")}
		            </div>
		            <div class="roundedSubName">
		            	${SubCoworkVO.username}
		            </div>
		            <div class="roundedSubName">
		            	<fmt:timeZone value="GMT">
		            	<fmt:formatDate value="${SubCoworkVO.subcoworkdate}" pattern="yyyy/MM/dd a h:mm"/>
		            	</fmt:timeZone>
		            </div>
		            <button type="button" class="btn btn-danger pull-right" onclick="deletesubcowork()" style="width: 9%; height: 74px; display: inline-block;">삭제</button>
	        	</div>
	        	</c:forEach>
	
	<!-- 메일 전송 부분 -->
	
	<form action="send" method="post">
		<input type="hidden" id="subject" type="text" name="subject" value="[업무관리시스템] ${CoworkVO.companyname} - ${CoworkVO.coworktitle}"><br>
		<input type="hidden" id="content" name="content" value='<div style="width: 80%; height: 80%; margin: 0 auto; margin-top: 15px;">
			<table border="1" cellpadding="10px">
				<thead align="center">
					<tr>
						<th style="width: 150px; text-align: center;">카테고리</th>
						<th style="width: 300px; text-align: center;">업무명</th>
						<th style="width: 200px; text-align: center;">고객사명</th>
						<th style="width: 200px; text-align: center;">업무코드</th>
						<th style="width: 150px; text-align: center;">등록자</th>
						<th style="width: 150px; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<td>${CoworkVO.coworksubject}</td>
						<td>${CoworkVO.coworktitle}</td>
						<td>${CoworkVO.companyname}</td>
						<td>${CoworkVO.coworkcode}</td>
						<td>${CoworkVO.username}</td>
						<td><fmt:formatDate value="${CoworkVO.coworkdate}" pattern="yyyy/MM/dd"/></td>
					</tr>
					<tr style="height: 10px;"></tr>
					<tr>
						<th colspan="1" style="text-align: center;">진행단계</th>
						<th colspan="2" style="text-align: center;">시작시간</th>
						<th colspan="3" style="text-align: center;">종료시간</th>
					</tr>
					<tr>
						<td colspan="1">${CoworkVO.coworkstep}</td>
						<td colspan="2">${CoworkVO.startdate}</td>
						<td colspan="3">${CoworkVO.enddate}</td>
					</tr>
					<tr style="height: 10px;"></tr>
					<tr>
						<th style="text-align: center;">직급</th>
						<th style="text-align: center;">담당자</th>
						<th style="text-align: center;">소속</th>
						<th style="text-align: center;">담당자연락처</th>
						<th colspan="2" style="text-align: center;">담당자이메일</th>
					</tr>
					<c:forEach items="${userList}" var="userList" varStatus="rowCount">
						<tr>
							<td>${userList.positionname}</td>
							<td>${userList.username}</td>
							<td>${userList.companyname}</td>
							<td>${userList.usermobile}</td>
							<td colspan="2">${userList.useremail}</td>
						</tr>
					</c:forEach>
					<tr style="height: 10px;"></tr>
						<tr>
							<th colspan="6" style="text-align: center;">업무내용</th>
						</tr>
						<tr>
							<td colspan="6">${CoworkVO.coworktext}</td>
						</tr>
					<tr style="height: 10px;"></tr>
					<tr>
						<th style="text-align: center;">번호</th>
						<th colspan="2" style="text-align: center;">추가업무</th>
						<th style="text-align: center;">등록자</th>
						<th colspan="2" style="text-align: center;">등록시간</th>
					</tr>
					<c:forEach var="SubCoworkVO" items="${SubCoworkVO}" varStatus="linenum">
						<tr>
							<td>${SubCoworkVO.subcoworkcode}</td>
							<td colspan="2" style="text-align: center;">>${SubCoworkVO.subcoworktext}</td>
							<td>${SubCoworkVO.username}</td>
							<td colspan="2" style="text-align: center;">><fmt:formatDate value="${SubCoworkVO.subcoworkdate}" pattern="yyyy/MM/dd a h:mm"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<%-- <table border="1">
				<thead align="center">
					<tr>
						<th style="width: 200px; text-align: center;">진행단계</th>
						<th style="width: 400px; text-align: center;">시작시간</th>
						<th style="width: 400px; text-align: center;">종료시간</th>
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
			<table border="1">
				<thead align="center">
					<tr>
						<th style="width: 200px; text-align: center;">소속</th>
						<th style="width: 100px; text-align: center;">직급</th>
						<th style="width: 100px; text-align: center;">담당자</th>
						<th style="width: 200px; text-align: center;">담당자연락처</th>
						<th style="width: 400px; text-align: center;">담당자이메일</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${userList}" var="userList" varStatus="rowCount">
						<tr>
							<td>${userList.companyname}</td>
							<td>${userList.positionname}</td>
							<td>${userList.username}</td>
							<td>${userList.usermobile}</td>
							<td>${userList.useremail}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="width: 80%; height: 80%; background-color: #E6E6E6; border:2px solid #ddd; padding:0.5em; line-height: 1em; border-radius:0.5em; -moz-border-radius: 0.5em; -webkit-border-radius: 0.5em;">
				${CoworkVO.coworktext}
			</div> --%>
		</div>
		<%-- <c:forEach var="SubCoworkVO" items="${SubCoworkVO}" varStatus="linenum">
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
		    	<button type="button" class="btn btn-danger pull-right" onclick="deletesubcowork()" style="width: 9%; height: 74px; display: inline-block;">삭제</button>
	        </div>
	    </c:forEach> --%>
		'>
	</form>
	        	
	        	
	<%-- <div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">업무명 :${CoworkVO.coworktitle}</h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>업무코드 :${CoworkVO.coworkcode} </h4>
              <input type="hidden" id="coworkcode" value="${CoworkVO.coworkcode}"/>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>작성자 : ${CoworkVO.userid}(${CoworkVO.username})</h4>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>작성일 : ${CoworkVO.coworkdate}</h4>
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>업체명 :${CoworkVO.companyname}</h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>담당자명:</h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>담당자연락처</h4>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <h4>담당자 이메일</h4>
            </div>
          </div>
          <br><br>
          <div class="col-xs-24 col-sm-12 placeholder" align="center">
			<h2>${CoworkVO.coworktext}</h2>
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
        </div>
	</div>
   <div class="row placeholders"></div>
	
	<br><br>
	<div  class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        	<div class="raw placeholders">
	            <div class="col-xs-9 col-sm-9 placeholder">
	            	내용 : <textarea id="subcoworktext" name="subcoworktext" rows="10" cols="120"></textarea>
	            	<button type="button" class="btn btn-primary" onclick="insertsubcowork()">작성</button>
	            </div>
	            <div class="col-xs-3 col-sm-3 placeholder" align="left" >
	            </div>
   	     	</div>
        </div>
	</div>
	
	
	<br><br>
	<div  class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        	<c:forEach var="SubCoworkVO" items="${SubCoworkVO}" varStatus="linenum">
        	<div class="raw placeholders">
				<div class="col-xs-2 col-sm-1 placeholder">
					No. ${SubCoworkVO.subcoworkcode}
					<input type="hidden" id="subcoworkcode" name="subcoworkcode" value="${SubCoworkVO.subcoworkcode}">
				</div>
	            <div class="col-xs-10 col-sm-5 placeholder">
	            	내용 : ${SubCoworkVO.subcoworktext}
	            </div>
	            <div class="col-xs-6 col-sm-3 placeholder">
	            	작성자 : ${SubCoworkVO.userid}
	            </div>
	            <div class="col-xs-6 col-sm-3 placeholder">
	            	작성자 : ${SubCoworkVO.subcoworkdate}
	            </div>
	            <div>
			        <button type="button" class="btn btn-primary" onclick="deletesubcowork()">삭제</button>
	            </div>
   	     	</div>
        	</c:forEach>
        </div>
	</div> --%>
</body>
</html>