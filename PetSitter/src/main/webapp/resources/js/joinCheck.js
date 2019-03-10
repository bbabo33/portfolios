/**
 * 	회원가입시 null값 방지
 */

function joinCheck(){
	
	/* 아이디 */
	if($('input[name=userId]').val().length <5){
		$('#idAlert').html("아이디가 적절하지 않습니다(5자 이상)");
		$('input[name=userId]').focus();
		return false;
	}
	
	/* 아이디 중복체크 */
	if(idCheckFlag == false){
		$('#idAlert').html("아이디 중복체크를 수행해주세요");
		$('input[name=idCheck]').focus();
	}
	
	/* 이름 */
	if($("input[name=name]").val().length<1){
		$('#nameAlert').html("이름이 적절하지 않습니다");
		$('input[name=name]').focus();
		return false;
	}
	/* 패스워드 */
	if($('input[name=pw]').val().length <5){
		$('#pwAlert').html("패스워드를 확인해주세요(5자 이상)");
		$('input[name=pw]').focus();
		return false;
	}
	
	/* 패스워드 재확인*/
	if($('input[name=pw]').val() !=  $('input[name=pwCheck]').val()){
		$('#pwCheckAlert').html("패스워드가 일치하지 않습니다");
		$('input[name=pwCheck]').focus();
		return false;
	}
	
	/* 주소 확인*/
	if($('input[name=addr]').val().length <1){
		$('#addrAlert').html("주소를 입력해주세요");
		return false;
	}
	
	/* 전화번호 확인*/
	if($('input[name=tel2]').val()=="" || $('input[name=tel2]').val()==""){
		$('#telAlert').html("전화번호를 입력해주세요");
		return false;
	}
	
	/* 반려동물 확인*/
	if($('input[name=animal]:checked').val() == undefined){
		$('#animalAlert').html("함께하고 있는 반려동물을 입력해주세요");
		return false;
	}
	
	/* 회원약관 */
	if($('input[name=terms]:checked').val() != 'terms'){
		$('#termsAlert').html("회원약관에 동의를 눌러주세요");
		return false;
	}
	
	return true;
}