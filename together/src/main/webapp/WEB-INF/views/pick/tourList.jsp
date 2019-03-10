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
			<div class="container themain">
				<div class="row justify-content-center mb-5 pb-2">
					<div class="col-md-7 heading-section text-center ftco-animate">
						<h2 class="mb-4">관광 게시글</h2>
						<p>한국의 핫플레이스들을 만나보세요</p>
					</div>
				</div>
				<div class="row">

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="${ pageContext.request.contextPath }/board/pick/tourDetail"><img class="card-img-top" src="http://tong.visitkorea.or.kr/cms/resource/37/1554837_image2_1.jpg" alt=""></a>
                <div class="card-body">
                  <h5><strong>마로니에 공원</strong></h5>
                  <p class="card-text">유명한 공원</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small><span class="phone-number">010-3333-4445</span>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="https://image.ytn.co.kr/general/jpg/2018/0410/201804101927431316_t.jpg" alt=""></a>
                <div class="card-body">
                   <h5><strong>광화문</strong></h5>
                   <p class="card-text">서울의 중심</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small><span class="phone-number">010-3333-4445</span>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://image.chosun.com/sitedata/image/201703/21/2017032102652_0.jpg" alt=""></a>
                <div class="card-body">
                  <h5><strong>동대문</strong></h5>
                  <p class="card-text">흥인지문 , 동대문디자인플라자</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small><span class="phone-number">010-3333-4445</span>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://nimage.newsway.kr/photo/2015/12/24/2015122417460681024_20151224174725_1.jpg" alt=""></a>
                <div class="card-body">
                   <h5><strong>명동거리</strong></h5>
                  <p class="card-text">맛집,관광지</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small><span class="phone-number">010-3333-4445</span>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="https://t1.daumcdn.net/cfile/tistory/2637584052B54AD412" alt=""></a>
                <div class="card-body">
                  <h5><strong>대학로</strong></h5>
                  <p class="card-text">문화의 거리,낙산공원</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small><span class="phone-number">010-3333-4445</span>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://mblogthumb1.phinf.naver.net/MjAxNzA2MDhfMjUy/MDAxNDk2OTMxNDk0Njcw.BHMclH_Z8a6R2r1DbdF37gXRpSRINVafdWtbwDtCLOMg.TtSUlv9ugaO7jyLtG3FgMbw9ug15rUOOWz12LIekIZQg.JPEG.jvj24601/170605.%EC%84%9C%EC%9A%B8.04.%EC%A2%85%EB%A1%9C.05.%ED%83%91%EA%B3%A8%EA%B3%B5%EC%9B%90_%2849%29.jpg?type=w800" alt=""></a>
                <div class="card-body">
                  <h5><strong>탑골공원</strong></h5>
                  <p class="card-text">무료 음식</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small><span class="phone-number">010-3333-4445</span>
                </div>
              </div>
            </div>

          </div>
			</div>

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
