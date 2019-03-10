<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together : 함께하는 여행</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 -->
<script>
	function doAction(type){
		
		switch(type){
		case 'C' :	//닫기
			//뒤로가기
			history.go(-1);
			break;
		case 'O' :	//확인
			//이메일, 비번으로 계정 확인 위한 ajax
			var email = $('input[name=username]').val();
			var password = $('input[name=password]').val();
			console.log("email:"+email+",pw:"+ password);
			// 현재 계정으로 접속하는지 확인
			if(email != '${userVO.email}'){
				alert("please enter your account using now");
				break;
			}
			$.ajax({
				url : '${ pageContext.request.contextPath }/login/updateCheck',
				type : 'post',
				data : {
					email : email,
					password : password
				},
				success : function(data){
					console.log(data);
					 if(data == 1){
						location.href="${ pageContext.request.contextPath }/mypage/useinfo";
					}else if(data == 0){
						alert("your account is wrong, please enter your account again");
						location.href="${ pageContext.request.contextPath }/mypage/pwCheck";	
					} 
				},
				error : function(error){
					alert('error!!!');
				}
			})
		}
	}
</script> 
</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i></a>

		<!-- aside 좌측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/aside.jsp" />

		<!-- header 상단 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/topMenu.jsp" />

		<!-- main, footer -->
		<div id="colorlib-main">

			<!-- main content -->
			<section class="ftco-section">
				<div class="container">
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate signwrape">
							<h2 class="mb-4">Confirm Account</h2>
							<p>please enter your account for safety</p>
							<div class="wrapper">
								<form class="form-signin" method='post'>
									<input type="text" class="form-control idinput" name="username"
										placeholder="Email Address" required="" autofocus="" /> 
									<input type="password" class="form-control pswdinput" name="password"
										placeholder="Password" required="" />
									<div class="pwCh_btn_div">
										<button class="pwCh_btn" onclick="doAction('C')">close</button>
										<input class="pwCh_btn" type="button" onclick="doAction('O')" value="confirm">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- // end container -->
			</section>

			<!-- footer  -->
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>

		</div>
		<!-- END COLORLIB-MAIN -->
	</div>
	<!-- END COLORLIB-PAGE -->

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#e89981" /></svg>
	</div>

	<%@ include file="/WEB-INF/views/include/bottomlink.jsp"%>
</body>
</html>
