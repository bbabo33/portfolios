<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- Timepicker 관련 -->
<link rel="stylesheet"
   href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- end timepicker -->

<!-- 제이쿼리 datepicker 관련  -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- end datepicker  -->

<!-- 제이쿼리 timepicker -->
<script
   src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- end timepicker -->

<!-- 제이쿼리 구버전과 최신버전의 혼용을 위한 쿼리소스 -->
<script
   src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
<!-- migrate end -->

<!-- 카카오 맵 api -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5bf9ccbd97a21e86fc6689488b54cd2e"></script>

<script>

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
      <!-- 동행게시글 쓰기 폼 -->
      <div id="colorlib-main">
         <%-- <!-- 모바일 헤더  -->
         <jsp:include page="/WEB-INF/views/include/topMenuMo.jsp" /> --%>

         <section class="ftco-section">
            <div class="container">
               <div><h3>관광지 상세</h3></div>
            </div>
            <div class="KorRes_detail">
               <div id="KorRes_pic">
                  <img alt="" src="http://www.gokoreatour.com/files/package/20141126151758_XSJB.jpg">
               </div>
               <div id="KorRes_texts">
                  <div><h4>광화문</h4></div>
                  <div>
                     <ul>
                        <li><span>주소</span>서울특별시 종로구 세종로 세종대로 172</li>
                        <li><span>연락처</span>(서울특별시청)02-2133-7732</li>
                        <li><span>볼거리</span>광화문 광장,광화문 ,세종대왕동상</li>
                        <li><span>상세설명</span>광화문광장은 대한민국 서울특별시 종로구에 위치한 광장이다. 2009년 8월 1일 12시 일반시민에게 개방되었다</li>
                     </ul>
                  </div>   
               </div>
               <div id="KorRes_texts_detail">
                  상세정보
               </div>
            </div>
         </section>
         <!-- end section -->

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