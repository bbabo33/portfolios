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
	var optionVal;

	$(document).ready(function(){
		//처음 검색 전 기본셋팅
		if($('.selectpicker option:selected').val() == "날짜"){
			defaultSearch();
		}
		// select option에 따른 검색 input 변경
		$('.selectpicker').click(function(){
			defaultSearch();
		});
		
		$('.activeBtn').click(function(){
			var no = $(this).parent().attr('class');
			location.href="${pageContext.request.contextPath}/admin/pageInfo/"+no;
		});
		
		$('input[name=admin_search]').click(function(){
			readySearch(optionVal);
		});
		
		$('#adminFormBtn').click(function(){
			$('#adminForm').submit();
		});
		
		/* $를 두개의 js 파일이 사용하고 있다. 기본 js 대신에 noConflict를 사용하여 $를 datetime.js가 사용하도록함*/
		jQuery.noConflict();
		$.datetimepicker.setLocale('ko');
		$('input[name=searchInput]').datetimepicker({
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
	
	function defaultSearch(){
		optionVal = $('.selectpicker option:selected').val();
		console.log(optionVal);
		if(optionVal == "예약자명"){
			$('#peoplePick_input').removeClass('disappearInput');
			$('#datePick_input').addClass('disappearInput');
		}else if(optionVal == "날짜"){
			$('#peoplePick_input').addClass('disappearInput');
			$('#datePick_input').removeClass('disappearInput');
		}else if(optionVal == "예약취소" || optionVal == "돌봄작성" || optionVal == "작성완료" || optionVal == "후기완료"){
			$('#peoplePick_input').addClass('disappearInput');
			$('#datePick_input').addClass('disappearInput');
		}
	}
	
	function checkEnter(event){
		if(event.key == "Enter"){
			readySearch();
		}
	}
	
	function readySearch(optionVal){
		var inputVal;
		var checkBoolean=true;
		
		if(optionVal == "날짜"){
			inputVal = $('#datePick_input').val();
			checkBoolean = checkInputVal(inputVal);
		}
		
		if(optionVal == "예약자명"){
			inputVal = $('#peoplePick_input').val();
			checkBoolean = checkInputVal(inputVal);
		}
		
		if(checkBoolean){
			$('input[name=searchCate]').val(optionVal);
			$('form').submit();	
		}
	}
	
	function checkInputVal(inputVal){
		if(inputVal.length == 0 ){
			alert("검색내용을 입력해주세요");
			return false;
		}
		return true;
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
						<option>예약취소</option>
						<option>돌봄작성</option>
						<option>작성완료</option>
						<option>후기완료</option> 
					</select>
					<input type="hidden" class="bookFormInput" name="searchCate">
	      			<input type="text" id="datePick_input" class="bookFormInput" name="searchDate" readonly>
	      			<input type="text" id="peoplePick_input" class="bookFormInput" name="searchDate">
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
            
            <!-- <a href="sidebar.html" class="list-group-item active">Sidebar Page</a> -->
           
          </div>
        </div>
        <!-- end Sidebar -->
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
          <h2>돌봄 작성</h2>	
	        <div class="confirmBoard">
	        	<h3>예약자 확인</h3><br>
	        	<div><span>예약자명</span> <strong>${book.bookingName}</strong></div>
				<div><span>방문날짜</span> <strong>${book.bookingDate}</strong></div>
				<div><span>연락번호</span> <strong>${book.bookingPhone}</strong></div>
				<div><span>방문장소</span> <strong>${book.bookLocation}</strong></div>
				<div><span>반려동물 정보</span></div>
				<div id="animalInfo">${book.bookingInfo}</div> 	
	        </div>
	        <form id="adminForm" action="${pageContext.request.contextPath}/admin/dolbom" method="post">
		        <div class="listBoard"> 
		        	 <h3>돌봄 리스트</h3> 	 
		        	<div class="parent_float">
		        		<input type="hidden" name="no" value="${book.no}">
			        	<div class="dolbomList">배변을 정리하였습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="toilet" id="jb-radio-1" class="custom-control-input" value="Y">
								<label class="custom-control-label" for="jb-radio-1">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="toilet" id="jb-radio-2" class="custom-control-input" value="N">
								<label class="custom-control-label" for="jb-radio-2">N</label>	        	
						</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">식기 세척과 밥, 물을 급여하였습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="food" id="jb-radio-3" class="custom-control-input" value="Y">
								<label class="custom-control-label" for="jb-radio-3">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="food" id="jb-radio-4" class="custom-control-input" value="N">
								<label class="custom-control-label" for="jb-radio-4">N</label>	        	
						</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">실내놀이를 진행하였습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="play" id="jb-radio-5" class="custom-control-input" value="Y">
								<label class="custom-control-label" for="jb-radio-5">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList"> 
								<input type="radio" name="play" id="jb-radio-6" class="custom-control-input" value="N">
								<label class="custom-control-label" for="jb-radio-6">N</label>	        	
						</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">요청사항을 완료하였습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="needs" id="jb-radio-7" class="custom-control-input" value="Y">
								<label class="custom-control-label" for="jb-radio-7">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="needs" id="jb-radio-8" class="custom-control-input" value="N">
								<label class="custom-control-label" for="jb-radio-8">N</label>	        	
						</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">산책을 다녀왔습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="walk" id="jb-radio-9" class="custom-control-input" value="Y">
								<label class="custom-control-label" for="jb-radio-9">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="walk" id="jb-radio-10" class="custom-control-input" value="N">
								<label class="custom-control-label" for="jb-radio-10">N</label>	        	
						</div>	
		        	</div>
		        	
		        </div>
		        
		        <div class="listBoard">
		        	<h3>돌봄후기</h3>
		        	<div class="dolbomList remark">특이사항</div>
		        	<div class="remarkText">
		        		<textarea name="remark" class="bookFormInput textA"></textarea>
		        	</div>
		        </div>
		        
		        <input type="button" id="adminFormBtn"class="btn btn-primary" value="등록">
		   </form>     
        </div>
        
        
        
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
