<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>[QSOLUTIONS]업무관리 시스템</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
  <script type="text/javascript">
	function updateform(){
		//var coworkcode = document.getElementById("coworkcode").value
		var companycode = $("#companycode").val();
		var url = "/qsolcowork/Company/Updateform?companycode="+companycode;
		location.href = url;
	}

	function deleteform(){
		var companycode = $("#companycode").val();

		$.ajax({
        url:"Delete",
        type:"get",
        data:{"companycode":companycode},
        datatype:"html",
        contentType:"application/html;charset=UTF-8",
        success:function(response){
            alert("삭제되었습니다.");
    		location.href = "/qsolcowork/Company/List";
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
		});
		
	}
	function cancel(){
		location.href = "/qsolcowork/Company/List";
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

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
    <div class="viewListTop">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">고객사 상세 조회</span>
    	<button type="button" class="btn btn-danger pull-right" onclick="deleteform()" style="margin-right: 10px; margin-top: 8px;">고객사 삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateform()" style="margin-right: 10px; margin-top: 8px;">고객사 수정</button>
    </div>
<!--  -->
	<div class="viewList">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 10%; text-align: center;">분류</th>
						<th style="width: 15%; text-align: center;">고객사코드</th>
						<th style="width: 15%; text-align: center;">고객사명</th>
						<th style="width: 30%; text-align: center;">홈페이지</th>
						<th style="width: 30%; text-align: center;">주소</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>
							${companyVO.companyclass}
							<input type="hidden" id="coworkcode" value="${companyVO.companycode}"/>
							</td>
							<td>
							${companyVO.companycode}
							<input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
							</td>
							<td>${companyVO.companyname}</td>
							<td><a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></td>
							<td>[${companyVO.companyzipcode}] ${companyVO.companyaddress} ${companyVO.companyaddress2}</td>
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
						<th style="width: 15%; text-align: center;">소속</th>
						<th style="width: 15%; text-align: center;">담당자</th>
						<th style="width: 35%; text-align: center;">담당자연락처</th>
						<th style="width: 35%; text-align: center;">담당자이메일</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${userList}" var="userList" varStatus="rowCount">
						<tr>
							<td>
								<c:if test="${userList.usercompanyname == 0}">퀀텀솔루션즈</c:if>
								<c:if test="${userList.companyusercode == 1}">고객사</c:if>
								<c:if test="${userList.companyusercode == 2}">파트너사</c:if>
							</td>
							<td>${userList.username}</td>
							<td><a href='tel:${userList.usermobile}'>${userList.usermobile}</a></td>
							<td><a href='mailto:${userList.useremail}'>${userList.useremail}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="viewList">
		<div>
				<div class="table-responsive">
					<table class="table table-striped">
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
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.coworkcode}'>${coworkList.coworktitle}</a></td>
									<td><a href='${pageContext.request.contextPath}/User/View?userid=${coworkList.userid}'>${coworkList.userid}</a></td>
									<td><fmt:formatDate value="${coworkList.coworkdate}" pattern="yyyy/MM/dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	</div>
	
	
    
	<%-- <!-- 상세 뷰 페이지  -->
	<div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">사이트 명 :${companyVO.companyname}</h1>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>사이트코드 :${companyVO.companycode} </h4>
              <input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
            </div>
            <div class="col-xs-12 col-sm-4 placeholder">
              <h4>담당자 :</h4>
            </div>
          </div>
          <br><br>
          <div class="row placeholders">
            <div class="col-xs-12 col-sm-12 placeholder">
              <h4>회사 홈페이지 :&nbsp <a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></h4>
            </div>
            <div class="col-xs-12 col-sm-12 placeholder">
              <h4>회사주소 : ${companyVO.companyaddress}</h4>
            </div>
          </div>
          <br><br>
          <!-- 회사 담당자  -->
          <div class="col-xs-24 col-sm-12 placeholder">
          	담당자1<br>
          	담당자2
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
			
			<div>
				<div class="table-responsive">
					<table class="table table-striped">
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
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.coworkcode}'>${coworkList.coworktitle}</a></td>
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.userid}'>${coworkList.userid}</a></td>
									<td>${coworkList.coworkdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
        </div>
	</div> --%>
</body>
</html>