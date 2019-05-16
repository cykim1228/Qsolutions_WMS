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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paging.js"></script>

<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/Q_logo.png"> 

<script type="text/javascript">
	function updateform(){
		//var coworkcode = document.getElementById("coworkcode").value
		var companycode = $("#companycode").val();
		var url = "/Company/Updateform?companycode="+companycode;
		location.href = url;
	}

	function deleteform(){
		
		var answer = confirm("삭제하시겠습니까??")
		if (answer) {
			var companycode = $("#companycode").val();
			$.ajax({
	        url:"Delete",
	        type:"get",
	        data:{"companycode":companycode},
	        datatype:"html",
	        contentType:"application/html;charset=UTF-8",
	        success:function(response){
	            alert("삭제되었습니다.");
	    		location.href = "/Company/List";
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
		location.href = "/qsolcowork/Company/List";
	}
	
	function uploadfile(){
 		
 		var temp_obj = {};
 		
		temp_obj["companycode"] = $("#companycode").val();
		temp_obj["filename"] = $("#filename").val();
		temp_obj["filepathname"] = $("#filepathname").val();
	    
		alert("test--"+JSON.stringify(temp_obj));

		$.ajax({
	        url:"Upload",
	        type:"post",
	        data:JSON.stringify(temp_obj),
	        enctype: "multipart/form-data",
	        datatype:"json",
			cache : false,
	        contentType:"application/json; charset=UTF-8",
	        success:function(resqonse){
	            alert("파일이 업로드되었습니다.");
	    		location.href = "/Company/List";
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
	function deletefile(val){
 		
		// var str = "";
		// var tdArr = new Array();
		// var checkBtn = $(this);
		
		// var tr = checkBtn.parent().parent();
		// var td = tr.children();
		
		// console.log("클릭한 Row의 모든 데이터 : "+tr.text());
        
        // var filepathname = td.eq(0).value();
		
 		var temp_obj = {};
 		
		temp_obj["companycode"] = $("#companycode").val();
		temp_obj["filepathname"] = val;
		// temp_obj["filename"] = $("#filename").val();
		// temp_obj["filepathname"] = $("#filepathname").val();
	    
		// alert("test--"+JSON.stringify(temp_obj));

		var answer = confirm("삭제하시겠습니까??")
		
		if(answer) {
			$.ajax({
		        url:"fileDelete",
		        type:"post",
		        data:JSON.stringify(temp_obj),
		        enctype: "multipart/form-data",
		        datatype:"json",
				cache : false,
		        contentType:"application/json; charset=UTF-8",
		        success:function(resqonse){
		            alert("파일을 삭제하였습니다.");
		            location.reload();
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		        }
		    });
		}
	}
	
	function fileSubmit() {
		
		var forms = document.fileForm;
		
		if(forms.fileUp.value == "") {
			alert("파일을 선택해주세요.")
			return forms.fileUp.focus();
		}
		
		if(forms.filename.value == "") {
			alert("파일 업로드 이름을 작성해주세요.")
			return forms.filename.focus();
		}
		
        var formData = new FormData($("#fileForm")[0]);
        $.ajax({
            type : 'post',
            url : 'fileUpload',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
                alert("파일 업로드하였습니다.");
                location.reload();
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
	
	$(function() {

		$(".tableUser").tablesorter(
			{
				theme : "bootstrap",

				widthFixed : true,

				// widget code contained in the jquery.tablesorter.widgets.js file
				// use the zebra stripe widget if you plan on hiding any rows (filter widget)
				// the uitheme widget is NOT REQUIRED!
				widgets : [ "columns", "zebra" ],

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
			container : $(".ts-pagerUser"),
			
			size : 5,
			
			cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

			// target the pager page select dropdown - choose a page
			cssGoto : ".pagenum",

			// remove rows from the table to speed up the sort of large tables.
			// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
			removeRows : false,

			// output string - default is '{page}/{totalPages}';
			// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
			output : '{page} / {totalPages}'

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

				size : 5,
				
				cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

				// target the pager page select dropdown - choose a page
				cssGoto : ".pagenum",

				// remove rows from the table to speed up the sort of large tables.
				// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
				removeRows : false,

				// output string - default is '{page}/{totalPages}';
				// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
				output : '{page} / {totalPages}'

			});
		
		$(".tableFile").tablesorter(
			{
				theme : "bootstrap",
				
				widthFixed : true,

				// widget code contained in the jquery.tablesorter.widgets.js file
				// use the zebra stripe widget if you plan on hiding any rows (filter widget)
				// the uitheme widget is NOT REQUIRED!
				widgets : [ "columns", "zebra" ],

				widgetOptions : {
					// using the default zebra striping class name, so it actually isn't included in the theme variable above
					// this is ONLY needed for bootstrap theming if you are using the filter widget, because rows are hidden
					zebra : [ "even", "odd" ],

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
			container : $(".ts-pagerFile"),

			size : 5,
			
			cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

			// target the pager page select dropdown - choose a page
			cssGoto : ".pagenum",

			// remove rows from the table to speed up the sort of large tables.
			// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
			removeRows : false,

			// output string - default is '{page}/{totalPages}';
			// possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
			output : '{page} / {totalPages}'

		});
	
	});
	
	$(document).ready(function() {
		$("#excelConvertBtn").on('click', function() {
			location.href = "../toExcel/companyViewToExcel?companycode=${companyVO.companycode}";
		})
	})
	
	$(document).ready(function() {
		$("#excelConvertBtns").on('click', function() {
			location.href = "../toExcel/companyViewToExcel?companycode=${companyVO.companycode}";
		})
	})
	
	function fn_paging(curPage) {
		location.href = "/Company/View?curPage=" + curPage;
	}
	
	/* function insertuserform(){
		
			var companycode = $("#companycode").val();
			$.ajax({
	        url:"InsertUserForm",
	        type:"get",
	        data:{"companycode":companycode},
	        datatype:"text",
	        contentType:"application/text;charset=UTF-8",
	        success:function(response){
	    		location.href = "/Company/InsertUserForm";
	        },
	       	 error:function(jqXHR, textStatus, errorThrown){
	           alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	       }
		});
	} */
	
	function insertuserform(){
		//var coworkcode = document.getElementById("coworkcode").value
		var companycode = $("#companycode").val();
		var url = "/Company/InsertUserForm?companycode="+companycode;
		location.href = url;
	}
	
  </script>
  
  <script>
	// $(window).on("load", pagingUser); 
	/* $(document).ready(
		function pagingUser(){
			var companycode = $("#companycode").val();
			// var userpagenum = $("#userpagenum").val();
			console.log("companycode : " + companycode);
			
		    var temp_obj = {};
		    temp_obj["companycode"] = companycode;
		    // temp_obj["userpagenum"] = userpagenum;
		    
		    $.ajax({
	        url:"PagingUser",
	        type:"get",
	        data:{'companycode':companycode},
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
	        success:function(data){
	        	
	        	console.log("data : " + data);
	        	
	            var lists = JSON.stringify(data);
	            
	            console.log("lists : " + lists);
	            
	            var temp = "<thead align='center'><tr>"+
	            "<th class='listth' style='width: 15%; text-align: center;' >직급</th>"+
	            "<th class='listth' style='width: 15%; text-align: center;' >이름</th>"+
	            "<th class='listth' style='width: 35%; text-align: center;' >연락처</th>"+
	            "<th class='listth' style='width: 35%; text-align: center;' >이메일</th></tr></thead>";
	            
	            for (var i=0; i< data.length; i++) {
	            temp += '<tbody align="center"><tr><td class="listtd" >' + data[i].positionname +'</td>' +
	            '<td class="listtd" ><a href="${pageContext.request.contextPath}/User/View?userid=' + data[i].userid + '">' + data[i].username +'</a></td>' +
	            '<td class="listtd" ><a href="tel:' + data[i].usermobile + '">' + data[i].usermobile +'</a></td>' +
	            '<td class="listtd" ><a href="mailto:' + data[i].useremail + '">' + data[i].useremail +'</a></td>' +
	            '</tr></tbody>';
	            }
	            
	            $("#tbl").html(temp);
	            page();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
			});
			
		}); */
	
		// 만들어진 테이블에 페이지 처리
		function page(){ 
		var reSortColors = function($table) {
		  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
		  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
		 };
		 $('table.paginated').each(function() {
		  var pagesu = 5;  //페이지 번호 갯수
		  var currentPage = 0;
		  var numPerPage = 5;  //목록의 수
		  var $table = $(this);    
		  
		  //length로 원래 리스트의 전체길이구함
		  var numRows = $table.find('tbody tr').length;
		  //Math.ceil를 이용하여 반올림
		  var numPages = Math.ceil(numRows / numPerPage);
		  //리스트가 없으면 종료
		  if (numPages==0) return;
		  //pager라는 클래스의 div엘리먼트 작성
		  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
		  
		  var nowp = currentPage;
		  var endp = nowp+5;
		  
		  //페이지를 클릭하면 다시 셋팅
		  $table.bind('repaginate', function() {
		  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		  
		   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
		   $("#remo").html("");
		   
		   if (numPages > 1) {     // 한페이지 이상이면
		    if (currentPage < 2 && numPages-currentPage >= 2) {   // 현재 5p 이하이면
		     nowp = 0;     // 1부터 
		     endp = pagesu;    // 10까지
		    }else{
		     nowp = currentPage -3;  // 6넘어가면 2부터 찍고
		     endp = nowp+pagesu;   // 10까지
		     pi = 1;
		    }
		    
		    if (numPages < endp) {   // 10페이지가 안되면
		     endp = numPages;   // 마지막페이지를 갯수 만큼
		     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
		    }
		    if (nowp < 1) {     // 시작이 음수 or 0 이면
		     nowp = 0;     // 1페이지부터 시작
		    }
		   }else{       // 한페이지 이하이면
		    nowp = 0;      // 한번만 페이징 생성
		    endp = numPages;
		   }
		   // [처음]
		   $('<br /><span class="page-number box" cursor: "pointer"><<</span>').bind('click', {newPage: page},function(event) {
		          currentPage = 0;   
		          $table.trigger('repaginate');  
		          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
		      }).appendTo($pager).addClass('clickable');
		    // [이전]
		      $('<span class="page-number box" cursor: "pointer"><</span>').bind('click', {newPage: page},function(event) {
		          if(currentPage == 0) return; 
		          currentPage = currentPage-1;
		    $table.trigger('repaginate'); 
		    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		   }).appendTo($pager).addClass('clickable');
		    // [1,2,3,4,5,6,7,8]
		   for (var page = nowp ; page < endp; page++) {
		    $('<span class="page-number box" cursor: "pointer"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
		     currentPage = event.data['newPage'];
		     $table.trigger('repaginate');
		     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		     }).appendTo($pager).addClass('clickable');
		   } 
		    // [다음]
		      $('<span class="page-number box" cursor: "pointer">></span>').bind('click', {newPage: page},function(event) {
		    if(currentPage == numPages-1) return;
		        currentPage = currentPage+1;
		    $table.trigger('repaginate'); 
		     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		   }).appendTo($pager).addClass('clickable');
		    // [끝]
		   $('<span class="page-number box" cursor: "pointer">>></span>').bind('click', {newPage: page},function(event) {
		           currentPage = numPages-1;
		           $table.trigger('repaginate');
		           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
		   }).appendTo($pager).addClass('clickable');
		     
		     $($(".page-number")[2]).addClass('active');
		reSortColors($table);
		  });
		   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
		   $pager.appendTo($table);
		   $table.trigger('repaginate');
		 });
		}
		
	$(document).ready(
		function pagingCowork(){
			var companycode = $("#companycode").val();
			// var userpagenum = $("#userpagenum").val();
			console.log("companycode : " + companycode);
			
		    var temp_obj = {};
		    temp_obj["companycode"] = companycode;
		    // temp_obj["userpagenum"] = userpagenum;
		    
		    $.ajax({
	        url:"PagingCowork",
	        type:"get",
	        data:{'companycode':companycode},
	        datatype:"json",
	        contentType:"application/json;charset=UTF-8",
	        success:function(data){
	        	
	            var lists = JSON.stringify(data);
	            
	            var temp = "<thead align='center'><tr>"+
	            "<th class='listth' style='width: 20%; text-align: center;' >카테고리</th>"+
	            "<th class='listth' style='width: 20%; text-align: center;' >업무코드</th>"+
	            "<th class='listth' style='width: 20%; text-align: center;' >제목</th>"+
	            "<th class='listth' style='width: 20%; text-align: center;' >등록자</th>"+
	            "<th class='listth' style='width: 20%; text-align: center;' >작성일</th></tr></thead>";
	            
	            for (var i=0; i< data.length; i++) {
	            temp += '<tbody align="center"><tr><td class="listtd" >' + data[i].coworksubject +'</td>' +
	            '<td class="listtd" >' + data[i].coworkcode +'</a></td>' +
	            '<td class="listtd" ><a href="${pageContext.request.contextPath}/Cowork/View?coworkcode=' + data[i].coworkcode + '">' + data[i].coworktitle +'</td>' +
	            '<td class="listtd" ><a href="${pageContext.request.contextPath}/User/View?userid=' + data[i].userid + '">' + data[i].username +'</a></td>' +
	            '<td class="listtd" >' + data[i].coworkdates +'</td>' +
	            '</tr></tbody>';
	            }
	            
	            $("#tbl").html(temp);
	            page();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
			});
			
		});
		
	/* // 만들어진 테이블에 페이지 처리
	function pageCowork(){ 
	var reSortColorsc = function($tablec) {
	  $('tbody tr:oddc td', $tablec).removeClass('evenc').removeClass('listtdc').addClass('oddc');
	  $('tbody tr:evenc td', $tablec).removeClass('oddc').removeClass('listtdc').addClass('evenc');
	 };
	 $('tablec.paginated').each(function() {
	  var pagesuc = 5;  //페이지 번호 갯수
	  var currentPagec = 0;
	  var numPerPagec = 5;  //목록의 수
	  var $tablec = $(this);    
	  
	  //length로 원래 리스트의 전체길이구함
	  var numRowsc = $tablec.find('tbody tr').length;
	  //Math.ceil를 이용하여 반올림
	  var numPagesc = Math.ceil(numRowsc / numPerPagec);
	  //리스트가 없으면 종료
	  if (numPagesc==0) return;
	  //pager라는 클래스의 div엘리먼트 작성
	  var $pagerc = $('<td align="center" id="remoc" colspan="10"><div class="pagerc"></div></td>');
	  
	  var nowpc = currentPagec;
	  var endpc = nowpc+5;
	  
	  //페이지를 클릭하면 다시 셋팅
	  $tablec.bind('repaginate', function() {
	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
	   $tablec.find('tbody tr').hide().slice(currentPagec * numPerPagec, (currentPagec + 1) * numPerPagec).show();
	   $("#remoc").html("");
	   
	   if (numPagesc > 1) {     // 한페이지 이상이면
	    if (currentPagec < 2 && numPagesc-currentPagec >= 2) {   // 현재 5p 이하이면
	     nowpc = 0;     // 1부터 
	     endpc = pagesuc;    // 10까지
	    }else{
	     nowpc = currentPagec -3;  // 6넘어가면 2부터 찍고
	     endpc = nowpc+pagesuc;   // 10까지
	     pic = 1;
	    }
	    
	    if (numPagesc < endpc) {   // 10페이지가 안되면
	     endpc = numPagesc;   // 마지막페이지를 갯수 만큼
	     nowpc = numPagesc-pagesuc;  // 시작페이지를   갯수 -10
	    }
	    if (nowpc < 1) {     // 시작이 음수 or 0 이면
	     nowpc = 0;     // 1페이지부터 시작
	    }
	   }else{       // 한페이지 이하이면
	    nowpc = 0;      // 한번만 페이징 생성
	    endpc = numPagesc;
	   }
	   // [처음]
	   $('<br /><span class="page-number box" cursor: "pointer"><<</span>').bind('click', {newPagec: pagec},function(event) {
	          currentPagec = 0;   
	          $tablec.trigger('repaginate');  
	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
	      }).appendTo($pagerc).addClass('clickable');
	    // [이전]
	      $('<span class="page-number box" cursor: "pointer"><</span>').bind('click', {newPagec: pagec},function(event) {
	          if(currentPagec == 0) return; 
	          currentPagec = currentPagec-1;
	    $tablec.trigger('repaginate'); 
	    $($(".page-number")[(currentPagec-nowpc)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pagerc).addClass('clickable');
	    // [1,2,3,4,5,6,7,8]
	   for (var pagec = nowpc ; pagec < endpc; pagec++) {
	    $('<span class="page-number box" cursor: "pointer"></span>').text(pagec + 1).bind('click', {newPagec: pagec}, function(event) {
	     currentPagec = event.data['newPagec'];
	     $tablec.trigger('repaginate');
	     $($(".page-number")[(currentPagec-nowpc)+2]).addClass('active').siblings().removeClass('active');
	     }).appendTo($pagerc).addClass('clickable');
	   } 
	    // [다음]
	      $('<span class="page-number box" cursor: "pointer">></span>').bind('click', {newPagec: pagec},function(event) {
	    if(currentPagec == numPagesc-1) return;
	        currentPagec = currentPagec+1;
	    $tablec.trigger('repaginate'); 
	     $($(".page-number")[(currentPagec-nowpc)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pagerc).addClass('clickable');
	    // [끝]
	   $('<span class="page-number box" cursor: "pointer">>></span>').bind('click', {newPagec: pagec},function(event) {
	           currentPagec = numPagesc-1;
	           $tablec.trigger('repaginate');
	           $($(".page-number")[endpc-nowpc+1]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pagerc).addClass('clickable');
	     
	     $($(".page-number")[2]).addClass('active');
	reSortColorsc($tablec);
	  });
	   $pagerc.insertAfter($tablec).find('span.page-number:first').next().next().addClass('active');   
	   $pagerc.appendTo($tablec);
	   $tablec.trigger('repaginate');
	 });
	} */
	
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

.file_input_textbox {
	float:left
}

.file_input_div {
	position:relative;
	width:100px;
	height:23px;
	overflow:hidden;
}

.file_input_button {
	width:100px;
	position:absolute; 
	top:0px; 
	background-color:#aaa; 
	color:#fff; 
	border-style:solid;
}

.file_input_hidden {
	font-size:45px; 
	position:absolute; 
	right:0px; 
	top:0px; 
	opacity:0; 
	filter:alpha(opacity=0); 
	-ms-filter:"alpha(opacity=0)"; 
	-khtml-opacity:0; 
	-moz-opacity:0;
}

.box {
	border:0.5px solid #ddd;
	padding:8px 12px;
	border-radius:5px;
}
.box:hover{
	background-color:#A9D0F5;
}

.clickable {cursor: pointer;}
.hover {text-decoration: underline;}
.odd{ background: #FFFFFF;}
.even{ background: #F9F9F9;}
.active{ width:10px; height:10px; background:#337ab7; color:white;}

.listth {
	background : #EEEEEE;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<%@ include file="/WEB-INF/views/header/footer.jsp"%>

<!-- <body  style="background-color: #d4d4d4"> -->

    <!-- 상세 뷰 페이지  -->
    <div class="viewListTop hidden-xs">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">${companyVO.companyname}</span>
    	<br class="visible-xs">
    	<button type="button" class="btn btn-danger pull-right" onclick="deleteform()" style="margin-right: 10px; margin-top: 8px;">고객사 삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateform()" style="margin-right: 10px; margin-top: 8px;">고객사 수정</button>
    	<input type="button" class="btn btn-success pull-right" name="excelConvertBtn" id="excelConvertBtn" value="엑셀 출력" style="cursor:hand; margin-right:10px; margin-top: 8px;" />
		<button type="button" class="btn btn-info pull-right" onclick="insertuserform()" style="margin-right: 10px; margin-top: 8px;">담당자 등록</button>
		<br class="visible-xs">
	</div>
	<div class="viewListTop visible-xs">
    	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 30px; font-weight: bold;">${companyVO.companyname}</span>
    	<br class="visible-xs">
    	<button type="button" class="btn btn-danger pull-right" onclick="deleteform()" style="margin-top: 8px; margin-bottom: 10px;">삭제</button>
    	<button type="button" class="btn btn-primary pull-right" onclick="updateform()" style="margin-right: 10px; margin-top: 8px; margin-bottom: 10px;">수정</button>
    	<input type="button" class="btn btn-success pull-right" name="excelConvertBtn" id="excelConvertBtns" value="엑셀 출력" style="cursor:hand; margin-right:10px; margin-top: 8px; margin-bottom: 10px;" />
		<br class="visible-xs">
	</div>
<!--  -->
	<div class="viewList">
	
		<div class="table-responsive">
			<table class="table table-striped">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">분류</th>
						<th class="hidden-xs" style="width: 20%; text-align: center;">고객사코드</th>
						<th class="hidden-xs" style="width: 35%; text-align: center;">홈페이지</th>
						<th style="width: 40%; text-align: center;">주소</th>
					</tr>
				</thead>
				<tbody align="center">
						<tr>
							<td>
							${companyVO.companyclass}
							<input type="hidden" id="coworkcode" value="${companyVO.companycode}"/>
							</td>
							<td class="hidden-xs">
							${companyVO.companycode}
							<input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
							<input type="hidden" id="companyname" name="companyname" value="${companyVO.companyname}"/>
							</td>
							<td class="hidden-xs"><a href="${companyVO.companyhomepg}">${companyVO.companyhomepg}</a></td>
							<td>[${companyVO.companyzipcode}] ${companyVO.companyaddress} ${companyVO.companyaddress2}</td>
						</tr>
				</tbody>
			</table>
	</div>
	</div>
	
	<div class="viewList">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">직원 목록</span>
		<div class="table-responsive">
			<table class="table table-striped tableUser">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;" class="filter-select filter-exact" data-placeholder="직급을 선택해주세요.">직급</th>
						<th style="width: 15%; text-align: center;">이름</th>
						<th style="width: 35%; text-align: center;">연락처</th>
						<th style="width: 35%; text-align: center;">이메일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="4" class="ts-pagerUser">
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
								<select class="pagesize" hidden="hidden">
								    <option value="5">5</option>
								    <option value="5" seleced>5</option>
							    </select>
							</div>
						</th>
					</tr>
				</tfoot>
				<tbody align="center">
					<c:forEach items="${userList}" var="userList" varStatus="rowCount">
						<tr>
							<td>${userList.positionname}</td>
							<td><a href="${pageContext.request.contextPath}/User/View?userid=${userList.userid}">${userList.username}</a></td>
							<td><a href='tel:${userList.usermobile}'>${userList.usermobile}</a></td>
							<td><a href='mailto:${userList.useremail}'>${userList.useremail}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<%-- <table id="myTable" class="table table-striped tablesorter tableUser">
				<thead align="center">
					<tr>
						<th style="width: 15%; text-align: center;">직급</th>
						<th style="width: 15%; text-align: center;">이름</th>
						<th style="width: 35%; text-align: center;">연락처</th>
						<th style="width: 35%; text-align: center;">이메일</th>
					</tr>
				</thead>
				
				<tbody align="center">
					<c:forEach items="${companyuserslist}" var="companyuserslist" varStatus="rowCount">
						<tr>
							<td>${companyuserslist.positionname}</td>
							<td><a href="${pageContext.request.contextPath}/User/View?userid=${companyuserslist.userid}">${companyuserslist.username}</a></td>
							<td><a href='tel:${companyuserslist.usermobile}'>${companyuserslist.usermobile}</a></td>
							<td><a href='mailto:${companyuserslist.useremail}'>${companyuserslist.useremail}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<!-- 5. paging view -->
		    <div>
			    <div align="center" class=".col-md-3 .col-md-offset-3 pagingView">
				    <ul class="pagination">
				        <c:if test="${userPagingVO.pageStartNum ne 1}">
				            <!--맨 첫페이지 이동 -->
				            <li><a onclick='pagePre(${userPagingVO.pageCnt+1},${userPagingVO.pageCnt});'>‹‹</a></li>
				            <!--이전 페이지 이동 -->
				            <li><a onclick='pagePre(${userPagingVO.pageStartNum},${userPagingVO.pageCnt});'>‹</a></li>
				        </c:if>
				        
				        <!--페이지번호 -->
				        <c:forEach var="i" begin="${userPagingVO.pageStartNum}" end="${userPagingVO.pageLastNum}" step="1">
				            	<li class='pageIndex${i}'>
				             		<a onclick="pageIndex(${i});">${i}</a>
				            	</li>					
				        </c:forEach>
				        <c:if test="${userPagingVO.lastChk}">
							<!--다음 페이지 이동 -->
				            <li><a onclick='pageNext(${userPagingVO.pageStartNum},${userPagingVO.total},${userPagingVO.listCnt},${userPagingVO.pageCnt});'>›</a></li>
				            <!--마지막 페이지 이동 -->
				            <li><a onclick='pageLast(${userPagingVO.pageStartNum},${userPagingVO.total},${userPagingVO.listCnt},${userPagingVO.pageCnt});'>»</a></li>
				        </c:if>
				<!-- 	        	<select class='btn btn-primary' id='listCount' name='listCount' onchange='listCnt();'> -->
				<!-- 		            <option value='5' >5</option> -->
				<!-- 		            <option value='10'>10</option> -->
				<!-- 		            <option value='15'>15</option> -->
				<!-- 		            <option value='20'>20</option> -->
				<!-- 	   		   </select>	 -->
				    </ul>
			    </div>
		    </div>
		    <div class="viewList">
		    <form method="post" id='frmPaging'>
		        <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
		        <input type='hidden' name='index' id='index' value='${userPagingVO.index}'>
		        <input type='hidden' name='pageStartNum' id='pageStartNum' value='${userPagingVO.pageStartNum}'>
		        <input type='hidden' name='listCnt' id='listCnt' value='${userPagingVO.listCnt}'>
		        <input type='hidden' name='searchType' id='searchType' value='${userPagingVO.searchType}'>
		        <input type='hidden' name='searchData' id='searchData' value='${userPagingVO.searchData}'>
		    </form>
		    </div> --%>
		    
		</div>
	</div>
	
	<div class="viewList">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">업무 목록</span>
		<div>
		
			<table class="tbl paginated table table-striped tablesorter" id="tbl">
	
			</table>
				<%-- <div class="table-responsive">
					<table class="table table-striped tableCowork">
						<thead align="center">
							<tr>
								<th style="width: 20%; text-align: center;" class="filter-select filter-exact" data-placeholder="카테고리를 선택해주세요.">카테고리</th>
								<th style="width: 20%; text-align: center;">업무코드</th>
								<th style="width: 20%; text-align: center;">제목</th>
								<th style="width: 20%; text-align: center;">등록자</th>
								<th style="width: 20%; text-align: center;">작성일</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="5" class="ts-pagerCowork">
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
										<select class="form-control-sm custom-select btn btn-primary px-1 pagesize" 
											title="Select page size" style="width: 50px; height: 37px;">
											<option selected="selected" value="5">5</option>
											<option value="10">10</option>
											<option value="15">15</option>
										</select>
										<select class="form-control-sm btn btn-primary custom-select pagenum"
											title="Select page number" style="width: 50px; height: 37px;">
										</select>
									</div>
								</th>
							</tr>
						</tfoot>
						<tbody align="center">
							<c:forEach items="${coworkList}" var="coworkList" varStatus="rowCount">
								<tr>
									<td>${coworkList.coworksubject}</td>
									<td>${coworkList.coworkcode}</td>
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.coworkcode}'>${coworkList.coworktitle}</a></td>
									<td><a href='${pageContext.request.contextPath}/User/View?userid=${coworkList.userid}'>${coworkList.username}</a></td>
									<td>${coworkList.coworkdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div> --%>
			</div>
	</div>
	
	<%-- <div class="viewList">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">업무 목록</span>
		<div>
				<div class="table-responsive">
				
				<table class="tbl paginated table table-striped tablesorter" id="tblc">
	
				</table>
			
					<table id="myTable" class="table table-striped tablesorter">
						<thead align="center">
							<tr>
								<th style="width: 20%; text-align: center;" class="filter-select filter-exact" data-placeholder="카테고리를 선택해주세요.">카테고리</th>
								<th style="width: 20%; text-align: center;">업무코드</th>
								<th style="width: 20%; text-align: center;">제목</th>
								<th style="width: 20%; text-align: center;">등록자</th>
								<th style="width: 20%; text-align: center;">작성일</th>
							</tr>
						</thead>
						
						<tbody align="center">
							<c:forEach items="${coworksList}" var="coworkList" varStatus="rowCount">
								<tr>
									<td>${coworkList.coworksubject}</td>
									<td>${coworkList.coworkcode}</td>
									<td><a href='${pageContext.request.contextPath}/Cowork/View?coworkcode=${coworkList.coworkcode}'>${coworkList.coworktitle}</a></td>
									<td><a href='${pageContext.request.contextPath}/User/View?userid=${coworkList.userid}'>${coworkList.username}</a></td>
									<td>${coworkList.coworkdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 5. paging view -->
		    <div>
			    <div align="center" class=".col-md-3 .col-md-offset-3 pagingView">
				    <ul class="pagination">
				        <c:if test="${coworkpagingVO.pageStartNum ne 1}">
				            <!--맨 첫페이지 이동 -->
				            <li><a onclick='pagePreCowork(${coworkpagingVO.pageCnt+1},${coworkpagingVO.pageCnt});'>‹‹</a></li>
				            <!--이전 페이지 이동 -->
				            <li><a onclick='pagePreCowork(${coworkpagingVO.pageStartNum},${coworkpagingVO.pageCnt});'>‹</a></li>
				        </c:if>
				        
				        <!--페이지번호 -->
				        <c:forEach var="i" begin="${coworkpagingVO.pageStartNum}" end="${coworkpagingVO.pageLastNum}" step="1">
				            	<li class='pageIndexCowork${i}'>
				             		<a onclick="pageIndexCowork(${i});">${i}</a>
				            	</li>					
				        </c:forEach>
				        <c:if test="${coworkpagingVO.lastChk}">
							<!--다음 페이지 이동 -->
				            <li><a onclick='pageNextCowork(${coworkpagingVO.pageStartNum},${coworkpagingVO.total},${coworkpagingVO.listCnt},${coworkpagingVO.pageCnt});'>›</a></li>
				            <!--마지막 페이지 이동 -->
				            <li><a onclick='pageLastCowork(${coworkpagingVO.pageStartNum},${coworkpagingVO.total},${coworkpagingVO.listCnt},${coworkpagingVO.pageCnt});'>»</a></li>
				        </c:if>
				<!-- 	        	<select class='btn btn-primary' id='listCount' name='listCount' onchange='listCnt();'> -->
				<!-- 		            <option value='5' >5</option> -->
				<!-- 		            <option value='10'>10</option> -->
				<!-- 		            <option value='15'>15</option> -->
				<!-- 		            <option value='20'>20</option> -->
				<!-- 	   		   </select>	 -->
				    </ul>
			    </div>
		    </div>
		    <div class="viewList">
		    <form method="post" id='frmPagingCowork'>
		        <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
		        <input type='hidden' name='indexCowork' id='indexCowork' value='${coworkpagingVO.index}'>
		        <input type='hidden' name='pageStartNumCowork' id='pageStartNumCowork' value='${coworkpagingVO.pageStartNum}'>
		        <input type='hidden' name='listCntCowork' id='listCntCowork' value='${coworkpagingVO.listCnt}'>
		        <input type='hidden' name='searchTypeCowork' id='searchTypeCowork' value='${coworkpagingVO.searchType}'>
		        <input type='hidden' name='searchDataCowork' id='searchDataCowork' value='${coworkpagingVO.searchData}'>
		    </form>
		    </div>
		    
	</div> --%>
	
	<div class="viewList" style="margin-bottom: 100px;">
	<form id="fileForm" name="fileForm" action="fileUpload" onsubmit="return false;" method="post" enctype="multipart/form-data" style="height: 40px;">
	<span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">파일 목록</span>
	<br class="visible-xs">
	<br class="visible-xs">
        <input class="btn btn-primary pull-right" type="button" value="파일업로드" onClick="fileSubmit();">
       	<input type="text" class="form-control pull-right" placeholder='업로드 이름..' id="filename" name="filename" style="width: 20%; margin-right: 10px;">
        <input class="btn btn-primary pull-right" type="file" id="fileUp" name="fileUp" style="width: 20%; margin-right: 10px;"><br>
        <input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}">
    </form>
    <br><br>
		<div>
				<div class="table-responsive">
					<table class="table table-striped tableFile">
						<thead align="center">
							<tr>
								<th style="width: 40%; text-align: center;">업로드 이름</th>
								<th style="width: 40%; text-align: center;">업로드 날짜</th>
								<th style="width: 20%; text-align: center;">파일 삭제</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="3" class="ts-pagerFile">
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
										<select class="pagesize" hidden="hidden">
										    <option value="5">5</option>
										    <option value="5" seleced>5</option>
									    </select>
									</div>
								</th>
							</tr>
						</tfoot>
						<tbody align="center">
							<c:forEach items="${fileList}" var="fileList" varStatus="rowCount">
								<tr>
									<td><input type="hidden" id="filepathname" name="filepathname" value="${fileList.filepathname}">
									<a href="http://qsol.synology.me/${fileList.filepathname}">${fileList.filename}</a></td>
									<td><fmt:formatDate value="${fileList.uploaddate}" pattern="yyyy/MM/dd"/></td>
									<td><button id="checkBtn" type="button" class="btn btn-danger" value="${fileList.filepathname}" onclick="deletefile(this.value)" style="display: inline-block;">삭제</button>
									</td>
								</tr>
							</c:forEach>
							<!-- <a href="http://localhost:8080/upload/C0000003/1552287574583.png">asd</a> -->
						</tbody>
					</table>
				</div>
			</div>
			
	</div>
	
	<%-- <form method="post" action="upload" enctype="multipart/form-data">
		<input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
		<label>파일 명:</label>
		<input type="text" id="filename" name="filename">
		<input type="file" id="file" name="file">
		<br><br>
		<button type="button" class="btn btn-primary pull-right" onclick="uploadfile()" style="margin-right: 10px; margin-top: 8px;">파일 업로드</button>
	</form> --%>
	
	<%-- <form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
        <input class="btn btn-primary pull-right" type="button" value="파일업로드" onClick="fileSubmit();">
        <input class="btn btn-primary" type="file" id="fileUp" name="fileUp"/><br>
        <input type="hidden" id="companycode" name="companycode" value="${companyVO.companycode}"/>
       	파일명 : <input type="text" id="filename" name="filename">
    </form> --%>
	
	<%-- <span class="sub-header" style="margin-left: 10px; position: relative; font-size: 23px; font-weight: bold;">파일 목록</span>
	<div class="result-images">
		<img src="${pageContext.request.contextPath }${url }" style="width:150px">
	</div> --%>

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