<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true" %>
<html>
<head>
<title>together : 함께하는 여행</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/login_join.js"></script>
<script>

	//js파일에서 ajax url을 잡아주기 위한 변수 
	window.ctx="${pageContext.request.contextPath}";
	//다른 폼 양식 체크는 login_join.js파일에..
	
	//이메일 중복 체크
	var idCheck = 0;
	var idCheckBool = false;
	
	$(document).ready(function() { 
		$('#proImgBtn').on("change", handleImgFileSelect);
		
		$('#emailCheckBtn').click(function() {
			if($('#email').val() == ''){
				alert('Enter your email.');
				$('#email').focus();
			} else {
				var data = {
					email : $('#email').val()
				}
				console.log(data);
				$.ajax({
					url : '${pageContext.request.contextPath}/login/check',
					type : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json',
					success : function(data) {
						console.log(data);
						if(data > 0) {
							$('#emailCheckBtn').css("background", "#ff3b00");
							$('#emailCheckBtn').val("NO / 중복");
						} else {
							$('#emailCheckBtn').css("background", "#65d3ff");
							$('#emailCheckBtn').css("border-color", "#61b7da");
							$('#emailCheckBtn').val("YES / 사용 가능");
							//아이디가 중복하지 않으면  idCheck = 1 
							idCheck = 1;
							idCheckBool = true;
						} 
					},
					error : function(e) {
			           alert(e);
			        }
				});  
			}
		});
		
	}); 

</script>
</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle">
			<i></i>
		</a>
		
		<!-- aside 좌측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/aside.jsp" />
		
		<!-- header 상단 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/topMenu.jsp" />
		
		<!-- main, footer -->
		<div id="colorlib-main">
		
			<!-- main content -->
			<section class="ftco-section">
				<div class="container">
					<!-- title -->
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate">
							<h2 class="mb-4">Join</h2>
							<!-- <p>함께하는 동행을 구해보세요. 남들이 경험하지 못할 그 날의 행복을 누리세요.</p> -->
						</div>
					</div><!-- // end title -->
					
					
					<div class="col-md-6 order-md-last pr-md-5 padding_r15" style="padding-right: 15px !important;">
						<form name="inputForm" action="${ pageContext.request.contextPath }/login/join" method="post" onsubmit="return checkForm()">
						<!-- <input type="hidden" name="interest" value=""> -->
						<%-- <form method="post" commandName="member"> --%>
						
						<!-- #proImgBtn이 클릭되고, handleImgFileSelect 가 실행되면 이미지 서버루트를 기억할 input 히든 -->
							
							<!-- 프로필 이미지를 히든으로 받아서 저장하기 위한 input -->
							<input type="hidden" name="profileImg" value="">
							
							<div class="form-group profile_img_box">
								<p class="profile_con"><img id="profileImg" src="/together/resources/images/proImg.png" alt="프로필이미지"></p>
								<div class="profile_input_box" id="profileImg_btn">
									<label for="proImgBtn" class="icon icon-plus profile_img_label"></label>
									<!-- <input type="file" id="proImgBtn" name="profileImg" class="profile_img_input" value=""> -->
									<input type="file" id="proImgBtn" class="profile_img_input">
								</div>
							</div>
							
							<p class="join_title">Email</p>
							<div class="form-group overflow">
								<input type="text" class="form-control" placeholder="Your Email" name="email" id="email" onkeypress="emailCheck()">
								<span class="duplicate_join" id="emailCheck"></span>
								<input type="button" value="Duplicate check" class="duplicate_joinBtn" id="emailCheckBtn">
							</div>
							<p class="join_title">Password</p>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Your Password" name="password" id="password">
							</div>
							<p class="join_title">Password Check</p>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Your Password Check" name="passwordCk" id="passwordCk" onkeyup="passwordConfirm()">
								<span class="confirmMsg" id="confirmMsg"></span>
							</div>
							<p class="join_title">Name</p>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Your Name" name="name">
							</div>
							<p class="join_title">Gender</p>
							<div class="form-group join_radio">
								<input type="radio" class="form_radio" name="gender" value="male" id="male">
								<label for="male">male</label>
								<input type="radio" class="form_radio" name="gender" value="female" id="female">
								<label for="female">female</label>
							</div>
							<p class="join_title">Country</p>
							<div class="form-group join_select">
								<select name="country">
									<option>Korea</option>
									<option>Belgium</option>
									<option>China</option>
									<option>England</option>
									<option>France</option>
									<option>Germany</option>
									<option>Italy</option>
									<option>Japan</option>
									<option>Philippines</option>
									<option>Spain</option>
									<option>Thailand</option>
									<option>USA</option>
									<option>Vietnam</option>
								</select>
							</div>
							<p class="join_title">Interest</p>
							<div class="form-group join_checkbox">
								<label><input type="checkbox" class="form_checkbox" name="interest" value="food" id="food">food</label>
								<label><input type="checkbox" class="form_checkbox" name="interest" value="culture" id="culture">culture</label>
								<label><input type="checkbox" class="form_checkbox" name="interest" value="shopping" id="shopping">shopping</label>
								<label><input type="checkbox" class="form_checkbox" name="interest" value="history" id="history">history</label>
								<label><input type="checkbox" class="form_checkbox" name="interest" value="music" id="music">music</label>
								<label><input type="checkbox" class="form_checkbox" name="interest" value="recreation" id="recreation">recreation</label>
								<label><input type="checkbox" class="form_checkbox" name="interest" value="cafe" id="cafe">cafe</label>
								<label><input type="checkbox" class="form_checkbox" name="interest" value="view" id="view">view</label>
							</div>
							<div class="form-group sub_Btn">
								<input type="submit" value="join" class="btn btn-primary py-3 px-5"  data-toggle="modal" data-target="#exampleModal">
							</div>
						</form>

					</div>
					
				</div><!-- // end container -->
			</section>
	    
		    <!-- footer  -->
		    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

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
