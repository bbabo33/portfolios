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
<script>
   $(document).ready(function(){
      // 보드리스트 전체선택 및 전체해제
      $( '.boardAll' ).click( function() {
         $( '.boardSelect' ).prop( 'checked', this.checked );
      } );
      
      // 삭제 후 받는 메세지
      if('${param.msg}'){
         alert('${param.msg}');
      }
   });
   
   // 새글쓰기 이동
   function foodWrite() {
      location.href="${ pageContext.request.contextPath }/admin/foodWrite";
   }
   
   // 보드리스트 선택 삭제
   function foodDelete() {
      var no = "";
      $("input[name='no']:checked").each(function(){
         no = no + $(this).val()+",";
      });
      no = no.substring(0,no.lastIndexOf( ","));
      
      if(no == ''){
         alert("삭제할 대상을 선택하세요");
         return false;
      }
      console.log("삭제할 리스트 번호 : "+no); 
      
      if(confirm("삭제 하시겠습니까?")) {
         $.ajax({
            url : '${ pageContext.request.contextPath }/admin/foodDel',
            type : 'get',
            data : {no : no},
            success : function(data) {
               console.log(data);
               if(data < 1) {
                  alert("문제생겨 삭제 안됨");
               } else {
                  alert(data+ "deleted complete");
               }
               location.href="${ pageContext.request.contextPath }/admin/food";
            },
            error : function(e) {
               alert(e);
            }
         });
      }
   }
   
</script>
</head>
<body>

   <div id="colorlib-page">
      <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i>
      </a>

      <!-- aside 좌측 메뉴 -->
      <%-- <jsp:include page="/WEB-INF/views/include/aside.jsp" /> --%>

      <!-- header 상단 메뉴 -->
      <jsp:include page="/WEB-INF/views/include/topMenuadmin.jsp" />

      <!-- main, footer -->

         <!-- main content -->
         <br><br><br><br>
         <section class="ftco-section">
            <div class="container">
               <div class="row justify-content-center mb-5 pb-2">
                  <div class="col-md-7 heading-section text-center ftco-animate">
                     <h2 class="mb-4">음식 리스트</h2>
                  </div>
               </div>
               <div class="row">
                  <div class="blog-entry ftco-animate accompanyWrite">
                     <form name="travelPlanForm">
                        <div class="board_all_div">
                           <button type="button" class="admin_board_btn list_del_btn" id="foodDelBtn" onclick="foodDelete()">삭제</button>
                           <button type="button" class="admin_board_btn list_insert_btn" onclick="foodWrite()">글 등록</button>
                           <div class="board_search">
                              <select>
                                 <option value="allBoard">전체글</option>
                                 <option value="no">번호</option>
                                 <option value="title">제목</option>
                              </select>
                              <p class="board_search_p">
                                 <input type="text" title="검색" maxlength="255" class="snb_search_text">
                                 <button type="submit" class="board_search_btn">검색</button>
                              </p>
                           </div>
                           
                           <!-- 게시판 리스트 시작 -->
                           <div class="board_list">
                              <table class="list adminList">
                                 <tr>
                                    <th width="8%"><label>All<input type="checkbox" name="all" class="boardAll"></label></th>
                                    <th width="8%">번호</th>
                                    <th>제목</th>
                                    <th width="16%">카테고리</th>
                                    <th width="20%">등록일</th>
                                 </tr>
                                 <c:forEach items="${ all }" var="food">
                                    <tr>
                                       <td><input type="checkbox" name="no" value="${ food.no }" class="boardSelect"></td>
                                       <td>${ food.no }</td>
                                       <c:forEach items="${ images }" var="image">
                                          <c:if test="${ (food.no eq image.boardno) and (image.tablename eq 'food') }">
                                             <td>
                                                <a href="${ pageContext.request.contextPath }/board/pick/foodDetail/${food.no}/${image.no}">
                                                   <img class="food_board_img" src="${pageContext.request.contextPath }/upload/food/${image.fileSaveName }" alt="">
                                                   ${ food.name } 
                                                </a>
                                             </td>
                                          </c:if>
                                       </c:forEach>
                                       <td>${ food.cate }</td>
                                       <td>${ food.regDate }</td>
                                    </tr>
                                 </c:forEach>
                              </table>
                              <!-- <input type="submit" value="글쓰기" class="btn btn-primary py-3 px-5 board_btn"> -->
                           </div><!-- end board_list 게시판 리스트 끝 -->
                           <!-- 
                           <div class="list_page">
                              <ul>
                                 <li><a href="#">&laquo;</a></li>
                                 <li><a href="#">1</a></li>
                                 <li><a href="#">2</a></li>
                                 <li><a href="#">3</a></li>
                                 <li><a href="#">4</a></li>
                                 <li><a href="#">5</a></li>
                                 <li><a href="#">&raquo;</a></li>
                              </ul>
                           </div> -->
                        </div><!-- // end  전체 감싸고있는 div -->
                     </form>
                  </div>
               </div>
            </div>
         </section>
         <!-- // end container -->

         <!-- footer  -->
         <%@ include file="/WEB-INF/views/include/footer.jsp"%>
         <script src="${ pageContext.request.contextPath }/resources/js/Chart.js"></script>
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