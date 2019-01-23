	<!-- 네비에이션 부분 (검색 및 확인 필요) -->	
    <nav class="navbar navbar-inverse">
	<div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/Cowork/List">Qsolutions업무관리 시스템</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-center">
            <li><a href="${pageContext.request.contextPath}/Cowork/List">업무</a></li>
            <li><a href="${pageContext.request.contextPath}/Company/List">사이트</a></li>
            <li><a href="${pageContext.request.contextPath}/User/List">사용자</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/Logout">LOGOUT</a></li>
          </ul>
		<form class="navbar-form navbar-right">
			<select class="btn btn-primary" name="SearchType">
	            <option value="userid" <c:if test="${pagingVO.searchType == 'userid'}">seleted</c:if> >사용자ID</option>
	            <option value="username"<c:if test="${pagingVO.searchType == 'username'}">seleted</c:if> >사용자명</option>
	            <option value="coworktitle"<c:if test="${pagingVO.searchType == 'coworktitle'}">seleted</c:if> >업무명</option>
	            <option value="	"<c:if test="${pagingVO.searchType == 'companyname'}">seleted</c:if> >사이트명</option>
	        </select>
            <input type="text" class="form-control" placeholder="Search..." value="${SearchData}" name=SearchData>
          </form>
        </div>
        </div>
    </nav>