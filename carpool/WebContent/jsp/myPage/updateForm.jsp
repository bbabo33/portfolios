<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/carpool/assets/css/myPageCss.css">
<script>

	$(document).ready(function(){
		$("form[name=uform]").submit(function(e) {
			
			e.preventDefault();
		
			var email = $("input[name=email]").val();
			var tel = $("input[name=tel]").val();
			var addr = $("input[name=addr]").val();
		
			console.log(email);
			console.log(tel);
			
			$.ajax({
				url : '<%=request.getContextPath()%>/member/UpdateMProcess.do',
					type : 'post',
					data : {
						'email' : email,
						'tel' : tel,
						'addr' : addr
					},
					success : callback,
					error : function(xhr, ajaxOptions, thrownError) {
						alert(xhr.status);
						alert(thrownError);
					}
				});
	
			});
	});
	
	function callback(data) {
		console.log(data);
		
		var jsonObj = JSON.parse(data);
		console.log(jsonObj);
		
		if(jsonObj['update_i'] == 1){
			alert("성공");
			location.href="<%=request.getContextPath()%>/myPage/MyPageMain.do";
		}else{
			alert("실패");
			location.href="<%=request.getContextPath()%>/member/UpdateMForm.do";
		}
	}
		
</script>		
<div class="myProfileArea">
	<div class="wrap">
		<h2>회원정보 수정</h2>
		<form name="uform">
			<table>
				<tr>
					<th>이름</th>
					<td>${login_result.name}</td>
					<th>이메일</th>
					<td><input type="text" name="email" value="${login_result.email }"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" value="${login_result.tel }"></td>
					
				</tr>
				<tr>
					<th colspan="2">주소</th>
					<td colspan="2"><input type="text" name="addr" value="${login_result.addr }"></td>
				</tr>
			</table>
			<input type="submit" value="수정">
		</form>	
	</div>
	<jsp:include page="/jsp/myPage/myPageMenu.jsp" />
	<div class="clear"></div>
</div>