/**
 * 
 */

function reservationCheck(){
	
	if($('input[name=bookingDate]').val()==""){
		$('#book_time_alert').html("날짜와 시간을 입력해주세요");
		$('input[name=bookingDate]').focus();
		return false;
	}
	
	if($('input[name=bookServiceTime]:checked').val() == undefined){
		$('#book_service_alert').html("이용 시간을 입력해주세요");
		$('#jb-radio-1').focus();
		return false;
	}
	
	if($('input[name=bookingPhone]').val().length !=13){
		$('#book_phone_alert').html("휴대전화 번호를 확인해주세요(\'-\'포함)");
		$('input[name=bookingPhone]').focus();
		return false;
	}
	
	if($('input[name=bookingName]').val() == ""){
		$('#book_name_alert').html("예약하시는 분의 성함을 입력해주세요");
		$('input[name=bookingName]').focus();
		return false;
	}
	
	if($('textarea[name=bookingInfo]').val() == ""){
		$('#book_info_alert').html("반려동물의 정보를 입력해주세요");
		$('textarea[name=bookingInfo]').focus();
		return false;
	}
	
	if($('textarea[name=bookingInfo]').val().length > 380){
		$('#book_info_alert').html("반려동물의 정보가 너무 깁니다.\n 간략히 작성해주세요");
		$('textarea[name=bookingInfo]').focus();
		return false;
	}
	
	return true;
}