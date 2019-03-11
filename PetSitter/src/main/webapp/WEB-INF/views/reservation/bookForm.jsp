<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/bookForm.css" rel="stylesheet">

<!-- date,time picker css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.min.js"></script>

<!-- 예약 등록시 유효성 검사 -->
<script src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>

<head>
<script>
	
	$(document).ready(function(){
		
		/* 메인버튼 */
		$('.goMain').click(function(){
			location.href="${pageContext.request.contextPath}";
		})
		
		/* 주소검색버튼 */
		$('.addrChgBtn').click(function(){
			goPopup();
		});
		
		/* 등록 버튼 */
		$('.submitBtn').click(function(){
			
			if(reservationCheck() == true){
				$.ajax({
					url : "${pageContext.request.contextPath}/booking/booking",
					data : {
						bookLocation : $('input[name=bookLocation]').val(),
						bookingDate : $('input[name=bookingDate]').val(),
						bookServiceTime : $('input[name=bookServiceTime]:checked').val(),
						bookingPhone : $('input[name=bookingPhone]').val(),
						bookingName : $('input[name=bookingName]').val(),
						bookingInfo : $('textarea[name=bookingInfo]').val(),
						bookingId : '${user.id}'
					},
					type : 'post',
					success: bookSuccess,
					error : bookError
				})
			}
		});
		
		/* $를 두개의 js 파일이 사용하고 있다. 기본 js 대신에 noConflict를 사용하여 $를 datetime.js가 사용하도록함*/
		jQuery.noConflict();
		$.datetimepicker.setLocale('ko');
		$('input[name=bookingDate]').datetimepicker({
			 i18n:{ ko:{
				   months:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
				   dayOfWeek:["일", "월", "화", "수","목", "금", "토"]
				  }},
		     timepicker:true,
		     step : 20,
		     minDate:'-1970/01/01'	//오늘부터 캘린더 픽 할 수 있게 만듦   
		});
	})
	
	function goPopup(){
		var pop = window.open("${pageContext.request.contextPath}/login/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록
		var allAddr = roadAddrPart1+","+addrDetail;
		$('input[name=bookLocation]').val(allAddr);
	}
	
	function bookSuccess(data){
		if(data == 1){
			location.href="${pageContext.request.contextPath}/booking/confirm";
		}else{
			alert("오잉?!왜 안되지");
			location.href="${pageContext.request.contextPath}/booking/bookingForm";
		}
	}
	
	function bookError(data){
		alert("bookError :"+data);
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

	<div class="center_column">
		<form>
			<div id="title">
				<p id="sub_title"><strong><span>펫시팅 예약 신청</span></strong></p>
				<p id="sub_content">지역, 날짜, 연락처만 알려주시면 돌봄 플래너가 펫시팅 예약을 도와드립니다</p>
			</div>	
			<div class="notiBoard">		
				<p><b>예약 전 꼭! 읽어주세요</b></p>
				<div>
					돌봄은 <strong>1인 펫시팅 업체</strong>로써, 2박 이상의 펫시팅 서비스는 불가함을 미리 알려드립니다.
				</div>
				<div>
					<strong>펫시팅을 신청할 때 꼭! 연락받을 수 있는 번호를 알려주세요. </strong>
					돌봄 플래너와 연락이 닿아야 예약 진행이 원활하게 진행되며, 장시간 연락을 받지 않을 경우 예약이 취소될 수 있습니다.
					당일 예약은 매칭 성공률이 낮습니다. 
				</div>
				<div>
					<strong>예약을 희망하는 날 최소 3일 전에 연락주시면 예약 성공률이 3배 늘어납니다.</strong>
					영업시간 외에는 익일에 연락을 드립니다. 
					<div>영업시간은 주말과 공휴일을 제외한 평일 오전 9시부터 오후 6시까지입니다.</div> 
					단, 펫시팅 중 특이사항 발생 시 모든 채널로 연락이 가능합니다. 
				</div>
			</div>
			
			<div class="notiBoard">		
				<p><strong>1. 펫시팅 주소를 알려주세요</strong><input type="button" class="btn btn-primary addrChgBtn" value="주소변경"></p>
				<input type="text" class="bookFormInput" value="${user.addr},${user.detailAddr}" name="bookLocation" readonly> 
			</div>
			
			<div class="notiBoard">		
				<p><strong>2. 펫시팅 날짜와 시간을 선택해주세요</strong><span id="book_time_alert" class="reservationAlert"></span></p>
				<input type="text" class="bookFormInput" name="bookingDate" readonly>
			</div>
			
			<div class="notiBoard">		
				<p><strong>3. 서비스 이용시간을 선택해주세요</strong><span id="book_service_alert" class="reservationAlert"></span></p>
				<div class="radioBtns">		
					<div class="custom-control custom-radio stGroup">
						<input type="radio" name="bookServiceTime" value="1hour" id="jb-radio-1" class="custom-control-input serviceTime">
						<label class="custom-control-label" for="jb-radio-1">1시</label>
					</div>
					<div class="custom-control custom-radio stGroup">			
						<input type="radio" name="bookServiceTime" value="3hour" id="jb-radio-2" class="custom-control-input serviceTime">
						<label class="custom-control-label" for="jb-radio-2">3시</label>
					</div>
					<div class="custom-control custom-radio stGroup">
						<input type="radio" name="bookServiceTime" value="6hour" id="jb-radio-3" class="custom-control-input serviceTime">
						<label class="custom-control-label" for="jb-radio-3">6시</label>
					</div>
					<div class="custom-control custom-radio stGroup">	
						<input type="radio" name="bookServiceTime" value="24hour" id="jb-radio-4" class="custom-control-input serviceTime">
						<label class="custom-control-label" for="jb-radio-4">24시</label>
					</div>		
				</div>		
			</div>
			
			<div class="notiBoard">		
				<p><strong>4. 연락받을 휴대전화를 알려주세요</strong><span id="book_phone_alert" class="reservationAlert"></span></p>
				<input type="text" class="bookFormInput" value="${user.phone }" name="bookingPhone">
			</div>
			
			<div class="notiBoard">		
				<p><strong>5. 예약하시는 분 이름을 알려주세요</strong><span id="book_name_alert" class="reservationAlert"></span></p>
				<input type="text" class="bookFormInput" value="${user.name }" name="bookingName">
			</div>
			
			<div class="notiBoard">		
				<p><strong>6. 반려동물 정보<span id="smallText">(이름, 종, 성별, 나이, 몸무게, 중성화 여부, 예방접종 여부)</span> 및  특이사항을 알려주세요</strong><br><span id="book_info_alert" class="reservationAlert"></span></p>
				<textarea class="bookFormInput textA" name="bookingInfo" placeholder="돌봄플래너가 참고할 수 있는 정보를 기재해 주세요 "></textarea>
			</div>
						
			<input type="button" class="btn btn-primary submitBtn" value="등록">
			<input type="button" class="btn goMain" value="메인">
		</form>
	</div>
    
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
