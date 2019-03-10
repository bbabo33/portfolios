<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/user_dolbomRead.css" rel="stylesheet">
<head>

<script>

	$(document).ready(function(){
		/* 일지보기 */
		$('#gobackBtn').click(function(){
			window.history.back();
		});
		/* 서버에 있는 정보를 통해 라디오버튼 체크하기 */
		$('input[name=toilet][value=${dolbom.toilet}]').attr('checked','checked');
		$('input[name=food][value=${dolbom.food}]').attr('checked','checked');
		$('input[name=play][value=${dolbom.play}]').attr('checked','checked');
		$('input[name=needs][value=${dolbom.needs}]').attr('checked','checked');
		$('input[name=walk][value=${dolbom.walk}]').attr('checked','checked');
		
	});
	
	
	
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
	
	
	<div class="col-lg-9 mb-4 center_column">
         <h2>돌봄 일지</h2>	
         <div class="info_column">
	        <div class="confirmBoard">
	        	<h3>예약 정보</h3><br>
	        	<div><span>예약자명</span> <strong>${book.bookingName}</strong></div>
				<div><span>방문날짜</span> <strong>${book.bookingDate}</strong></div>
				<div><span>연락번호</span> <strong>${book.bookingPhone}</strong></div>
				<div><span>방문장소</span> <strong>${book.bookLocation}</strong></div>
				<div><span>반려동물 정보</span></div>
				<div id="animalInfo">${book.bookingInfo}</div> 	
	        </div>
	        
		        <div class="listBoard"> 
		        	 <h3>돌봄 리스트</h3> 	 
		        	<div class="parent_float">
		        		<input type="hidden" name="no" value="${book.no}">
			        	<div class="dolbomList">배변을 정리하였습니다</div>
				        	<div class="custom-control custom-radio dolbomList">
									<input type="radio" name="toilet" id="jb-radio-1" class="custom-control-input" value="Y" disabled="disabled">
									<label class="custom-control-label" for="jb-radio-1">Y</label>	        	
							</div>
							<div class="custom-control custom-radio dolbomList">
									<input type="radio" name="toilet" id="jb-radio-2" class="custom-control-input" value="N" disabled="disabled">
									<label class="custom-control-label" for="jb-radio-2">N</label>	        	
							</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">식기 세척과 밥, 물을 급여하였습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="food" id="jb-radio-3" class="custom-control-input" value="Y" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-3">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="food" id="jb-radio-4" class="custom-control-input" value="N" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-4">N</label>	        	
						</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">실내놀이를 진행하였습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="play" id="jb-radio-5" class="custom-control-input" value="Y" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-5">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList"> 
								<input type="radio" name="play" id="jb-radio-6" class="custom-control-input" value="N" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-6">N</label>	        	
						</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">요청사항을 완료하였습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="needs" id="jb-radio-7" class="custom-control-input" value="Y" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-7">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="needs" id="jb-radio-8" class="custom-control-input" value="N" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-8">N</label>	        	
						</div>	
		        	</div>
		        	
		        	<div class="parent_float">
			        	<div class="dolbomList">산책을 다녀왔습니다</div>
			        	<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="walk" id="jb-radio-9" class="custom-control-input" value="Y" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-9">Y</label>	        	
						</div>
						<div class="custom-control custom-radio dolbomList">
								<input type="radio" name="walk" id="jb-radio-10" class="custom-control-input" value="N" disabled="disabled">
								<label class="custom-control-label" for="jb-radio-10">N</label>	        	
						</div>	
		        	</div>
		        	
		        </div>
		        
		        <div class="listBoard">
		        	<h3>돌봄후기</h3>
		        	<div class="dolbomList remark">특이사항</div>
		        	<div class="remarkText">
		        		<textarea name="remark" class="bookFormInput textA" readonly>${dolbom.remark}</textarea>
		        	</div>
		        </div>
		        
		        <input type="button" id="gobackBtn"class="btn btn-primary" value="확인">
		</div>
       </div>  
   
	
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
