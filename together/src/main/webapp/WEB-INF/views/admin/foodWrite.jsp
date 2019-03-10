<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>together : 함께하는 여행</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- date,time picker css-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.min.css"/>
<!-- 주소검색하여 마커, 주소텍스트 추가 및 form 유효성 검사 js파일  -->
<script src="${pageContext.request.contextPath}/resources/js/foodWrite_map_addrSearch.js"></script>
<script>   
   
   function goPopup(){
      // 주소검색을 수행할 팝업 페이지를 호출, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
      var pop = window.open("${pageContext.request.contextPath}/matching/matchingPopUp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
   }
   
   function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      console.log("line34: "+roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr);
      cntLocation++;
      /* 위치 추가  */
      if(cntLocation <= 4){
         console.log(cntLocation);
         //텍스트에 주소 추가하는 함수 실행
         addLocationList(korAddr, roadAddr);
      }else{
         alert("Maximum Adding location is 4");
      }
   }

</script>
</head>
<body>

   <div id="colorlib-page">
      <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i>
      </a>

      <!-- header 상단 메뉴 -->
      <jsp:include page="/WEB-INF/views/include/topMenuadmin.jsp" />

      <!-- main, footer -->

      <!-- main content -->
      <!-- <br> <br> <br> <br> -->
      <div class="container mt_100">
         <div class="row justify-content-center mb-5 pb-2">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <h2 class="mb-2">음식 글 등록</h2>
            </div>
         </div>
         <div class="row">
            <div class="blog-entry ftco-animate accompanyWrite">
               <form name="travelPlanForm" action="${ pageContext.request.contextPath }/admin/foodWriteUp"
                  enctype="multipart/form-data" method="post">
                  <table class="admin_write food_write">
                     <tbody>
                        <tr>
                           <th>상호명</th>
                           <td>
                              <input type="text" name="name" />
                           </td>
                        </tr>
                        <tr class="tel">
                           <th>전화번호</th>
                           <td>
                              <input type="tel" name="tel1" />
                              <span>-</span>
                              <input type="tel" name="tel2" />
                              <span>-</span>
                              <input type="tel" name="tel3" />
                           </td>
                        </tr>
                        <tr class="admin_map">
                           <th>주소</th>
                           <td>
                                 <div class="map_input_box">
                                    <!-- <input type="text" name="address" readonly="readonly" value="" /> -->
                                    <span id="korLocations"></span>
                                    <span id="engLocations"></span>
                                    <button type="button" value="food address" onclick="goPopup()">주소</button>
                                 </div>


                        <div class="food_map">
                           <div id="map"></div>
                        </div> 
                        <!-- 지도 api , id='map' 인 div 보다 밑에 있어야 함  --> 
                        <script>
                           var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                              mapOption = {
                              center : new daum.maps.LatLng(37.5532017297038, 126.97280752153232), // 지도의 중심좌표
                              level : 4 // 지도의 확대 레벨
                           };
   
                           // 지도를 생성합니다    
                           var map = new daum.maps.Map(mapContainer, mapOption);
                           // 지도에 교통정보 표시 
                           //map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);
                        </script> 
                        
                        
                           </td>
                        </tr>
                        <tr>
                           <th>카테고리</th>
                           <td>
                              <select name="cate">
                                 <option>KoreanFood</option>
                                 <option>Snack</option>
                                 <option>Meat</option>
                              </select>
                           </td>
                        </tr>
                        <tr class="resTime">
                           <th>영업시간</th>
                           <td>
                              <span>Open&#32;&#58;</span>
                              <input type="text" id="openTime" class="accompanyWrite" name="openTime" readonly>
                              <span>Close&#32;&#58;</span>
                              <input type="text" id="closeTime" class="accompanyWrite" name="closeTime" readonly>
                           </td>
                        </tr>
                        <tr class="resOff">
                           <th>휴무일</th>
                           <td class="form-group join_checkbox">
                              <label><input type="checkbox" class="form_checkbox" name="off" value="yearRound" id="yearRound">연중무휴</label>
                              <label><input type="checkbox" class="form_checkbox" name="off" value="monday" id="monday">월요일</label>
                              <label><input type="checkbox" class="form_checkbox" name="off" value="tuesday" id="tuesday">화요일</label>
                              <label><input type="checkbox" class="form_checkbox" name="off" value="wednesday" id="wednesday">수요일</label>
                              <label><input type="checkbox" class="form_checkbox" name="off" value="thursday" id="thursday">목요일</label>
                              <label><input type="checkbox" class="form_checkbox" name="off" value="friday" id="friday">금요일</label>
                              <label><input type="checkbox" class="form_checkbox" name="off" value="saturday" id="saturday">토요일</label>
                              <label><input type="checkbox" class="form_checkbox" name="off" value="sunday" id="sunday">일요일</label>
                           </td>
                        </tr>
                        <tr>
                           <th>대표메뉴</th>
                           <td>
                              <input type="text" name="food" />
                           </td>
                        </tr>
                        <tr class="food_info">
                           <th>소개글</th>
                           <td>
                              <textarea name="content"></textarea>
                           </td>
                        </tr>
                        <tr class="admin_file">
                           <th>첨부파일</th>
                           <td>
                              <input type="file" name="foodFile" /><!-- multiple="multiple"  -->
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <div class="write_btn">
                     <button type="button" value="cancle">취소</button>
                     <button type="submit" value="submit">등록</button>
                  </div>
               </form>
            </div>
         </div>
      </div>

      <!-- // end container -->

      <!-- footer  -->
      <%@ include file="/WEB-INF/views/include/footer.jsp"%>
      <script
         src="${ pageContext.request.contextPath }/resources/js/Chart.js"></script>
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
   
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.js"></script>
<script>
   
   $(document).ready(function() {
      $('#openTime').datetimepicker({
         format:'H:i',      // 시간, 분 
         datepicker:false,   //달력 안나오게
         step : 30,
         
      });
      
      $('#closeTime').datetimepicker({
         format:'H:i',      // 시간, 분 
         datepicker:false,   //달력 안나오게
         step : 30,
         
      });
    });
   
</script>
</body>
</html>