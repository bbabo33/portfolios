<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/joinForm.css" rel="stylesheet">

<!-- 회원가입시 유효성 검사 -->
<script src="${pageContext.request.contextPath}/resources/js/joinCheck.js"></script>

<head>

<script>

	var idCheckFlag=false;

	$(document).ready(function(){
		
		$('input[name=goMain]').click(function(){
			location.href="${pageContext.request.contextPath}";
		});
		
		/* 아이디 중복체크 검사 버튼 */
		$('#idCheck').click(function(){
			
			if($('input[name=userId]').val().length <5 ){
				$('#idAlert').html('올바른 아이디 양식이 아닙니다(5자이상)');
				$('input[name=userId]').focus();
				return;
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/login/idcheck',
				data : {id : $('input[name=userId]').val()},
				type : 'get',
				success : idCheckSuccess,
				error : idCheckFail
			})
		
		});
		
		/* 주소검색 버튼 눌렀을 때 */
		$('#addrSearch').click(function(){
			goPopup();
		});
		
		/* 회원가입 버튼 눌렀을 때 */
		$('input[name=joinBtn]').click(function(){
			/* joinForm에 null값이 없는지 유효한 값인지 판단하는 함수로 반환은 boolean */
			var joinFlag = joinCheck();
			
			/* 반려동물 값을 담을 변수  */
			var animals="";
			
			if(joinFlag == true){
				/* 체크박스 값을 하나의 변수에 담는 함수 */
				$('input[name=animal]:checked').each(function(index,item){
					if(index != 0){
						animals += ","+item.value;				
					}else{
						animals += item.value;
					}
				});
				
				var phone= $("input[name=tel1]").val()+'-'+$("input[name=tel2]").val()+'-'+$("input[name=tel3]").val();
				console.log(phone);
				/* 가입을 위한 ajax */
				$.ajax({
					url : '${pageContext.request.contextPath}/login/join',
					type : 'post',
					data : {
						id : $("input[name=userId]").val(),
						name : $("input[name=name]").val(),
						password : $("input[name=pw]").val(),
						addr : $("input[name=addr]").val(),
						detailAddr : $("input[name=addr_detail]").val(),
						phone : phone,
						pet : animals
					},
					success : joinSuccess,
					fail : joinFail
				})
			}
		});
	});
	
	function joinSuccess(data){
		if(data==1){
			location.href="${pageContext.request.contextPath}";
		}
	}
	
	function joinFail(data){
		alert("어떠한 문제가 발생하여 제대로 처리되지 않았습니다. 다시 작성해 주세요.");
		location.href="${pageContext.request.contextPath}/login/joinForm";
	}
	
	function goPopup(){
		var pop = window.open("${pageContext.request.contextPath}/login/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록
		$('input[name=addr]').val(roadAddrPart1);
		$('input[name=addr_detail]').val(addrDetail);
	}
	
	function idCheckSuccess(data){
		console.log("아이디 중복여부 : "+data);
		if(data == 0){
			idCheckFlag = true;
			$('#idAlert').empty();
			$('#idCheck').val("사용가능");
		}else{
			$('#idAlert').html('중복된 아이디입니다');
			$('input[name=userId]').focus();
		}
	}
	
	function idCheckFail(data){
		console.log("아이디 중복 검사 실패: "+data);
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
	<div>
		<div id="bg_joinForm">
				
			<form>
				<div class="cen">회원가입</div>
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" class="join_control" name="userId" size=15><input type="button" id="idCheck" class="btn btn-primary" value="중복확인"><div id="idAlert" class="textAlert"></div></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="join_control" name="name" size=15><div id="nameAlert" class="textAlert"></div></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" class="join_control" name="pw" size=15><div id="pwAlert" class="textAlert"></div></td>
					</tr>
					<tr>
						<th>패스워드 확인</th>
						<td><input type="password" class="join_control" name="pwCheck" size=15><div id="pwCheckAlert" class="textAlert"></div></td>
					</tr>
					<tr>
						<th>주소</th><td><input type="text" class="join_control" name="addr" size=30 readonly><input type="button" id="addrSearch" class="btn btn-primary" value="주소검색"></td>
					</tr>
					<tr>
						<th>상세주소</th><td><input type="text" class="join_control" name="addr_detail" size=30 readonly><div id="addrAlert" class="textAlert"></div></td>
					</tr>
					<tr>
						<th>전화번호</th><td><input type="text" class="join_control" value="010" size=3 name="tel1" readonly>-<input type="text" class="join_control" name="tel2" size=4>-<input type="text" class="join_control" name="tel3" size=4><div id="telAlert" class="textAlert"></div></td> 
					</tr>	
					<tr>
						<th>반려동물</th>
						<td>
							<input type="checkbox" name="animal" value="dog">강아지
							<input type="checkbox" name="animal" value="cat">고양이
							<input type="checkbox" name="animal" value="etc">기타
							<div id="animalAlert" class="textAlert"></div>
						</td>
					</tr>
					<tr>
						<th id="terms">회원약관</th>
						<td>
							<textarea rows="5" cols="20" readonly>회원약관입니다. 회원약관을 기재할 예정입니다.
							</textarea>
							
							<div>
								<input type="checkbox" name="terms" value="terms">약관을 확인하였으며, 동의합니다.
							</div>
							<div id="termsAlert" class="textAlert"></div>
						</td>
							
					</tr>
				</table>
				<div class="cen">
					<input type="button" class="btn btn-primary" name="joinBtn"value="가입">
					<input type="button" class="btn" name="goMain" value="메인">
				</div>
				
			</form>
		</div>
	</div>		
   
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
