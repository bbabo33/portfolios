<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/myProfile.css" rel="stylesheet">
<head>
<script>
	$(document).ready(function(){
		$('#addrSearch').click(function(){
			goPopup();
		});
		
		$('input[name=updateBtn]').click(function(){
			
			var animals="";
			
			$('input[name=animal]:checked').each(function(index,item){
				if(index != 0){
					animals += ","+item.value;				
				}else{
					animals += item.value;
				}
			});
			
			var phone= $("input[name=tel1]").val()+'-'+$("input[name=tel2]").val()+'-'+$("input[name=tel3]").val();
			$.ajax({
				url : '${pageContext.request.contextPath}/login/update',
				type : 'post',
				data : {
					id : $("input[name=updateId]").val(),
					name : $("input[name=updateName]").val(),
					password : $("input[name=updatePassword]").val(),
					addr : $("input[name=addr]").val(),
					detailAddr : $("input[name=addr_detail]").val(),
					phone : phone,
					pet : animals
				},
				success : updateSuccess,
				error : updateFail
			});
		});
		
		$('input[name=withdraw]').click(function(){
			
		});
	});
	
	function goPopup(){
		var pop = window.open("${pageContext.request.contextPath}/login/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록
		$('input[name=addr]').val(roadAddrPart1);
		$('input[name=addr_detail]').val(addrDetail);
	}
	
	function updateSuccess(data){
		if(data == 1){
			location.href="${pageContext.request.contextPath}";		
		}else{
			alert('정상적으로 처리되지 않았습니다');
			location.href="${pageContext.request.contextPath}/login/myProfile";
		}
		
	}
	
	function updateFail(data){
		alert('updateFail'+data);
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

	
	<div id="bg_joinForm">
			
		<form>
			<div>My Profile</div>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" class="join_control" name="updateId" size=15 value="${user.id}" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" class="join_control" name="updateName" size=15 value="${user.name}"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" class="join_control" name="updatePassword" value="${user.password }" size=15></td>
				</tr>
				<tr>
					<th>주소</th><td><input type="text" class="join_control" name="addr" value="${user.addr }" size=30><input type="button" id="addrSearch" class="btn" value="주소검색"></td>
				</tr>
				<tr>
					<th>상세주소</th><td><input type="text" class="join_control" name="addr_detail" value="${user.detailAddr }"size=30></td>
				</tr>
				<tr>
					<th>전화번호</th><td><input type="text" class="join_control" value="010" size=3 name="tel1" readonly>-<input type="text" class="join_control" name="tel2" size=4>-<input type="text" class="join_control" name="tel3" size=4></td> 
				</tr>	
				<tr>
					<th>반려동물</th>
					<td>
						<input type="checkbox" name="animal" value="dog">강아지
						<input type="checkbox" name="animal" value="cat">고양이
						<input type="checkbox" name="animal" value="etc">기타
					</td>
				</tr>
				
			</table>
			<div>
				<input type="button" class="btn btn-primary" name="updateBtn"value="수정">
				<input type="button" class="btn" name="withdraw" value="탈퇴">
			</div>
			
		</form>
	</div>	
    
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
