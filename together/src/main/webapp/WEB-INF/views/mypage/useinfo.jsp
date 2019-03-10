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

<!-- 이미지 저장하고 바꾸기 위한 js 파일-( handleImgFileSelect ) 함수, form onsubmit checkform함수 사용 목적 -->
<script src="${pageContext.request.contextPath }/resources/js/login_join.js"></script>
<script>
	window.ctx = "${pageContext.request.contextPath}";

	$(document).ready(function() {
		
		/* 유저 기존 프로필 이미지를 먼저 form에 저장 */
		$('form[name=inputForm] input[name=profileImg]').val('${userVO.profileImg}');
		/* 프로필 이미지 바꿨을 때 form 값 변경 */
		$('#proImgBtn').on("change", handleImgFileSelect);
		/* 탈퇴시 */
		$('#secession').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/login/withdraw',
				type : 'post',
				data : {
					email : '${userVO.email}',
					password : '${userVO.password}'
				},
				success : function(data){
					alert("your Account is deleted perfectly");
					location.href="${pageContext.request.contextPath}";
				},
				error : function(){}
			});
		});

		
	});


</script>
</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i>
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
							<h2 class="mb-4">Edit My Account</h2>
							<!-- <p>함께하는 동행을 구해보세요. 남들이 경험하지 못할 그 날의 행복을 누리세요.</p> -->
						</div>
					</div>
					<!-- // end title -->

					<div class="form-group profile_img_box">
						<p class="profile_con">
							<img id="profileImg"
								src="${pageContext.request.contextPath }/upload/userImg/${userVO.profileImg}"
								alt="프로필이미지">
						</p>
						<div class="profile_input_box" id="profileImg_btn">
							<label for="proImgBtn" class="icon icon-plus profile_img_label"></label>
							<!-- <input type="file" id="proImgBtn" name="profileImg" class="profile_img_input" value=""> -->
							<input type="file" id="proImgBtn" class="profile_img_input">
						</div>
					</div>

					<div class="col-md-6 order-md-last pr-md-5 padding_r15"
						style="padding-right: 15px !important;">
						<!-- <form name="inputForm" onsubmit="return checkData()" action="#"> -->
						<form name="inputForm" action="${ pageContext.request.contextPath }/login/updateUser" method="post">

							<!-- 프로필 이미지를 히든으로 받아서 저장하기 위한 input -->
							<input type="hidden" name="profileImg" value="">

							<p class="join_title">Name</p>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Your Name"
									name="name" value="${userVO.name }">
							</div>
							<p class="join_title">New Password</p>
							<div class="form-group">
								<input type="password" class="form-control"
									placeholder="Your Password" name="password">
							</div>
							<p class="join_title">Email <span style="color:red; font-size:15px">&nbsp;&nbsp;Your Email Address can't be changed</span></p>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Your Email"
									name="email" value="${userVO.email}" readonly>
							</div>
							<!-- <p class="join_title">Gender</p>
							<div class="form-group join_radio">
									<input type="radio" class="form_radio" name="gender" value="male" id="male">
									<label for="male">male</label>
									<input type="radio" class="form_radio" name="gender" value="female" id="female">
									<label for="female">female</label>
							</div> -->
							<p class="join_title">Country</p>
							<div class="form-group join_select">
								<select name="country">
									<c:forEach var="country" items="${countryList}">
										<c:choose>
											<c:when test="${userVO.country eq country }">
												<option selected>${country}</option>
											</c:when>
											<c:otherwise>		
												<option>${country}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>

								<!-- <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea> -->
							</div>
							<p class="join_title">Interest</p>
							<div class="form-group join_checkbox">

								<c:forEach var="interest" items="${interests}">
									<label><input type="checkbox" class="form_checkbox"
										name="interest" value="${interest}" id="${interest}"
										>${interest}</label>
										
								</c:forEach>								
								<%-- <c:set var="cnt" value="0" />
								<c:forEach var="interest" items="${interests}">
									<c:set var="flag" value="true" />
									<c:forEach var="inter" items="${userVO.interest }">
										<c:if test="${flag}">
											<c:if test="${interest eq inter}">
												<label><input type="checkbox" class="form_checkbox"
													name="interests" value="${interest}" id="${interest}"
													checked="checked">${interest}</label>
												<c:set var="flag" value="false" />
												<c:set var="cnt" value="1" />
											</c:if>
										</c:if>
									</c:forEach>
									<c:if test="${cnt eq 0 }">
										<c:if test="${interest ne inter}">
											<label><input type="checkbox" class="form_checkbox"
												name="interests" value="${interest}" id="${interest}">${interest}</label>

										</c:if>
									</c:if>
									<c:set var="cnt" value="0" />
								</c:forEach> --%>
								 

							</div>
							<!-- <p class="join_title">Are you a vegeterian?</p>
							<div class="form-group join_radio">
								<input type="radio" class="form_radio" name="vegetarian" value="yes" id="yes">
								<label for="yes">YES</label>
								<input type="radio" class="form_radio" name="vegetarian" value="no"  id="no">
								<label for="no">NO</label>
							</div> -->
							<div class="to_secession">
								<input type="button" value="Leave" data-toggle="modal"
									data-target="#exampleModal"> <span>Take button ,
									if you want to withdraw 'together'</span>
								<!-- <span>탈퇴를 원하시면 우축의 버튼을 눌러주세요</span> -->
							</div>
							<div class="form-group sub_Btn">
								<input type="submit" value="Edit"
									class="btn btn-primary py-3 px-5" id="useInfo">
							</div>
						</form>

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

	<!-- 부트스트랩 컨펌 창 Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content toConf_popup">
				<div class="modal-header">
					<h5 class="modal-title toConf_title" id="exampleModalLabel">Withdraw 'together'</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body toConf_body">Are you sure to withdraw 'together'?</div>
				<div class="modal-footer">
					<button type="button" class="btn-secondary conf_btn conf_c "
						data-dismiss="modal" aria-label="Close">Cancel</button>
					<button type="button" class="btn-primary conf_btn " id="secession">Confirm</button>
				</div>
			</div>
		</div>
		<!-- // end 부트스트랩 컨펌 창 -->

		<%@ include file="/WEB-INF/views/include/bottomlink.jsp"%>
</body>
</html>
