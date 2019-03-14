<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/dolbomWrite.css" rel="stylesheet">

<!-- date,time picker css-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.min.js"></script>

<head>

<script>

	<c:if test="${msg}">
		alert('${msg}');
	</c:if>

	$(document).ready(function(){
		//처음 검색 전 기본셋팅
		if($('.selectpicker option:selected').val() == "날짜"){
			$('#peoplePick_input').addClass('disappearInput');
		}
		// select option에 따른 검색 input 변경
		$('.selectpicker').click(function(){
			if($('.selectpicker option:selected').val() == "예약자명"){
				$('#peoplePick_input').removeClass('disappearInput');
				$('#datePick_input').addClass('disappearInput');
			}else if($('.selectpicker option:selected').val() == "날짜"){
				$('#peoplePick_input').addClass('disappearInput');
				$('#datePick_input').removeClass('disappearInput');
			}
		});
		
		$('.activeBtn').click(function(){
			var no = $(this).parent().attr('class');
			location.href="${pageContext.request.contextPath}/admin/pageInfo/"+no;
		});
		
		$('input[name=admin_search]').click(function(){
			readySearch();
		});
		
		/* $를 두개의 js 파일이 사용하고 있다. 기본 js 대신에 noConflict를 사용하여 $를 datetime.js가 사용하도록함*/
		jQuery.noConflict();
		$.datetimepicker.setLocale('ko');
		$('#datePick_input').datetimepicker({
			 i18n:{ ko:{
				   months:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
				   dayOfWeek:["일", "월", "화", "수","목", "금", "토"]
				  }},
		     timepicker:false,
		     step : 20,
		     format:"Y/m/d"
		     //minDate:'-1970/01/01'	//오늘부터 캘린더 픽 할 수 있게 만듦   
		});
	});
	
	function checkEnter(event){
		if(event.key == "Enter"){
			readySearch();
		}
	}
	
	function readySearch(){
		$('input[name=searchCate]').val($('.selectpicker option:selected').val());
		console.log($('input[name=searchCate]').val());
		$('form').submit();
	}
</script>
	
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>DolBom</title>

</head>

<body>
	<!-- topMenu + scss, css파일 -->
	<jsp:include page="/WEB-INF/views/topMenu/topMenu.jsp" />

	<!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">돌봄
        <small>관리자</small>
      </h1>

      <div class="breadcrumb">
      		<div id="searchBar">
	      		<form action="${pageContext.request.contextPath}/admin/search">
					<select class="selectpicker"> 
						<option>날짜</option> 
						<option>예약자명</option>  
					</select>
					<input type="hidden" class="bookFormInput" name="searchCate">
	      			<input type="text" id="datePick_input" class="bookFormInput" name="searchDate" readonly>
	      			<input type="text" id="peoplePick_input" class="bookFormInput" name="searchDate" onkeypress="checkEnter(event)">
	      			<input type="button" name="admin_search" class="btn btn-primary adminSearch" value="검색">
	      		</form>
	      	</div>	
      </div>
	  	
      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="${pageContext.request.contextPath }" class="list-group-item">Home</a>
            <a href="${pageContext.request.contextPath }/admin/dolbomWrite" class="list-group-item">돌봄작성</a>
            <a href="${pageContext.request.contextPath }/admin/statistics" class="list-group-item">돌봄통계</a>
            <!-- <a href="sidebar.html" class="list-group-item active">Sidebar Page</a> -->
           
          </div>
        </div>
        <!-- end Sidebar -->
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
          <table class="table table-hover searchTable">
			  <thead>
			    <tr>
			      <th scope="col">날짜</th>
			      <th scope="col">장소</th>
			      <th scope="col">예약자명</th>
			      <th scope="col">돌봄</th>
			    </tr>
			  </thead>
		  <tbody>
		  	<c:forEach var="list" items="${bookList}">
			  	<tr>
			      <th scope="row">${list.bookingDate}</th>
			      <td>${list.bookLocation}</td>
			      <td>${list.bookingName}</td>
			      <c:choose>
			      	<c:when test="${list.bookStatus eq 'W' }">
			      		<td class="${list.no}"><input type="button" class="btn btn-primary afterWriteBtn activeBtn" value="돌봄작성"></td> 
			      	</c:when>
			      	<c:when test="${list.bookStatus eq 'C' }">
			      		<td class="${list.no}"><input type="button" class="btn afterWriteBtn" value="예약취소"></td> 
			      	</c:when>
			      	<c:when test="${list.bookStatus eq 'D' }">
			      		<td class="${list.no}"><input type="button" class="btn btn-primary afterWriteBtn" value="작성완료"></td> 
			      	</c:when>
			      	<c:when test="${list.bookStatus eq 'R' }">
			      		<td class="${list.no}"><input type="button" class="btn btn-primary afterWriteBtn" value="후기완료"></td> 
			      	</c:when>
			      </c:choose>	
			    </tr>
		  	</c:forEach>
		  
		  </tbody>
		</table>   
        </div>
        
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
