/**
 * 
 */
	//프로필이미지 등록시 회원가입 폼에서 보여주는 기능
	var sel_file;
	//ajax 보내기 위한 formData
	var picData;
	
	function handleImgFileSelect(e) {
		
		console.log(e.target);
		var files = e.target.files;
		console.log('files');
		console.log(files);
		var filesArr = Array.prototype.slice.call(files);
		
		//ajax 보내기 위한 formData
		picData = new FormData();
		picData.append(files[0].name,files[0]);
		
		filesArr.forEach(function(f) {
			console.log(f);
			if(!f.type.match("image.*")) {
				alert("image file only");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				console.log(e);
				console.log(e.target);
				$('#profileImg').attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
			
			$.ajax({
				url : window.ctx+'/login/joinProfileImg',
				type : 'post',
				data : picData,
				enctype: 'multipart/form-data',
				contentType: false,
				processData: false,
				success : profileSuccess,
				error : profileError
			})
		});
	}
	
	function profileSuccess(response){
		console.log(response);
		$('form[name=inputForm] input[name=profileImg]').val(response);
	}
	
	function profileError(){
		console.log("Img fail");
	}
	
	// 아이디 정규표현식
	var emailForm = false;
	
	function emailCheck() {
		// 이메일 검증 스크립트 작성
		var emailVal = $("#email").val();
		// 검증에 사용할 정규식 변수 regExp에 저장
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
		// 텍스트 뿌려질 곳
		var emailCheck = document.getElementById('emailCheck'); 
		var correctColor = "#555";	// 맞았을 때 출력되는 색
		var wrongColor = "#ff0000";		// 틀렸을 때 출력되는 색

		// 만약 정규표현식에 맞는 문자열이 없다면 null을 반환
		if (emailVal.match(regExp) != null) {
			emailCheck.style.color = correctColor;
			emailCheck.innerHTML = "Please check email duplication";
			emailForm = true;
		} else {
			emailCheck.style.color = wrongColor;
			emailCheck.innerHTML = "Re-enter email format";
			emailForm = false;
		}
	}
	

	// 패스워드 입력 체크
	function passwordConfirm() {
		/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
		/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
		/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
		var password = document.getElementById('password'); //비밀번호 
		var passwordCk = document.getElementById('passwordCk'); //비밀번호 확인 값
		var confrimMsg = document.getElementById('confirmMsg'); //확인 메세지
		var correctColor = "#555"; //맞았을 때 출력되는 색깔.
		var wrongColor = "#ff0000"; //틀렸을 때 출력되는 색깔

		if (password.value == passwordCk.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.display = 'block';
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML = "Password match";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		} else {
			confirmMsg.style.display = 'block';
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML = "Password discrepancy";
		}
	}

	// 회원가입 폼 체크
	function checkForm() {
		var f = document.inputForm;
		
		// 이메일
		if (f.email.value.length == 0) {
			alert('Enter your email.');
			f.email.focus();
			return false;
		}
		// 이메일 형식체크
		if(emailForm == false) {
			alert('Re-enter email format');
			return false;
		}
		// 이메일 중복체크
		if(idCheckBool == false) {
			alert('Please check email duplication');
			return false;
		}

		//idCheck 상태 => 0 - 버튼 안누름, 1- 중복, -2 중복되지 않는 상태
		/*if(idCheck == 0 || idCheck == 1){
			console.log("idCheck:"+idCheck);
			alert("your Email isn't checked. please check your Email");
			f.email.focus();
			return false;
		}*/
		
		// 비밀번호
		if (f.password.value.length == 0) {
			alert('Enter your password.');
			f.password.focus();
			return false;
		}
		// 비밀번호 체크
		if (f.passwordCk.value.length == 0) {
			alert('Check your password.');
			f.passwordCk.focus();
			return false;
		}
		// 비밀번호 같은지 확인
		if (f.passwordCk.value !== f.password.value) {
			alert('Passwords do not match.');
			f.passwordCk.focus();
			return false;
		}
		// 이름
		if (f.name.value.length == 0) {
			alert('Enter your name.');
			f.name.focus();
			return false;
		} 
		// 성별
		if (f.gender.value.length == 0) {
			alert('Select your gender.');
			f.gender.focus();
			return false;
		}
		
		// 국적
		if (f.country.value.length == 0) {
			alert('Select your country.');
			f.country.focus();
			return false;
		}
		// 관심분야
		var fields = $("input[name='interest']").serializeArray(); 
	    if (fields.length === 0) { 
	        alert('nothing selected'); 
	        return false;
	    } 
	}