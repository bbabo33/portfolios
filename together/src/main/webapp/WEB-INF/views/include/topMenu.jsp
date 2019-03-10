<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<script>
   $(document).ready(function() {
      // 헤더고정
      var jbOffset = $('.topMenu_nav').offset();
      $(window).scroll(function() {
         if ($(document).scrollTop() > jbOffset.top) {
            $('header').addClass('hFixed');
         } else {
            $('header').removeClass('hFixed');
         }
      });
         
      // 메뉴 마우스오버 슬라이드 
       $('.top_menu1').on({
         'mouseenter':function() {
            $('.sub_menu1').stop().animate({
               width:'100%',
               height:'252px',
               'display':'block'
            });
         }, 'mouseleave':function() {
            $('.sub_menu1').stop().animate({
               width:'0px',
               height:'0px',
               'display':'none'
            });
         }
      }); // end top_menu1 on
      
      $('.top_menu2').on({
         'mouseenter':function() {
            $('.sub_menu2').stop().animate({
               width:'100%',
               height:'252px',
               'display':'block'
            });
         }, 'mouseleave':function() {
            $('.sub_menu2').stop().animate({
               width:'0px',
               height:'0px',
               'display':'none'
            });
         }
      }); // end top_menu2 on
      $.ajax({
            url : "${ pageContext.request.contextPath }/matching/topinclude",
            type : "get",
            dataType:'JSON',
            success : function(data){
               console.log(data);
               var cnt = 0;
               $(data).each(function(){
                  if(cnt < 3){
                  var str = '<div class="travel_list"><a href="${ pageContext.request.contextPath }/matching/searchDetail/'+this.no+'" class="img img-2" >';
                    str += '<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/upload/country/'+this.member.country+'.jpg););"></p>';
                    str += '<span class="category mb-3 d-block">'+this.member.country+'</span>';
                    str += '<h3 class="mb-4">'+this.title+'</h3></a></div>';
                    $('.to_sub_list').append(str);
                    cnt++;
                  }
                 });
            }
      });
   
      $('.vosearch').on('click keyup',function(){
         var vtype = $(".votype option:selected").val();
         var vvalue = $(".voval").val();
         console.log(vtype+vvalue)
         $.ajax({
            url : "${ pageContext.request.contextPath }/searchboard",
            type : "post",
            dataType:'JSON',
            data : 'type='+vtype+'&value='+vvalue,
            success : function(data){
               $('.tbdyyy').html('');
               $(data).each(function(){
                     var str = '<li>';
                     str += '<div scope="row" class="search_con_proImg"><a href="#" class="img profile_info" ><p style="background-image: url(${ pageContext.request.contextPath }/upload/userImg/'+this.member.profileImg+');"></p></a><div class="search_con_name">'+ this.writer +'</div>';
                     str += '<div class="search_con_title">' + this.title +'</div></div>';
                     /* if(this.matchingMsg != undefined){
                        str += '<td>'+ this.matchingMsg+'</td>';
                     }else if(this.content != undefined){
                        str += '<td>'+ this.content+'</td>';
                     } */
                     if(this.content != undefined){
                        str += '<div class="search_con_goBtn"><a href="#" > <img id="${pageContext.request.contextPath }/matching/accompanyAfterDetail/'+this.no+'" class="borlink" src="${pageContext.request.contextPath }/resources/images/rtarrow.png"/></a></div></li>';
                     }else if(this.matchingMsg != undefined){
                        str += '<div class="search_con_goBtn"><a href="#" > <img id="${pageContext.request.contextPath }/matching/searchDetail/'+this.no+'" class="borlink" src="${pageContext.request.contextPath }/resources/images/rtarrow.png"/></a></div></li>';
                     }
                     
                     $('.tbdyyy').append(str);
               });
            }
         });
      });
      
      $('.tbdyyy').on('click', '.borlink', function() {
         console.log($(this).attr('id'));
         var clickemail = $(this).attr('id');
         window.location.href = clickemail;
      });
   });
</script>  

   <!-- web전용 큰화면 -->
   <header id="headerW">
      <nav class="topMenu_nav">
         <ul class="top_menu1">
            <li class="top_menu "><a href="">together</a></li>
            <!-- 동행 서브 메뉴 -->
            <div class="to_sub_menu sub_menu1">
               <ul class=" ">
                  <li class="toSub_menu"><a href="${ pageContext.request.contextPath }/matching/matching/1">List</a></li>
                  <li class="toSub_menu"><a href="${ pageContext.request.contextPath }/matching/accompanyWrite">Write</a></li>
                  <%-- <li class="toSub_menu"><a href="${ pageContext.request.contextPath }/matching/accompanyAfterWrite">후기 글 쓰기</a></li> --%>
                  <li class="toSub_menu"><a href="${ pageContext.request.contextPath }/matching/accompanyAfter">Review</a></li>
               </ul>
               <!-- 최신 동행글 3개 -->
               <div class="to_sub_list">
                  <!-- 동행 글 -->
                  <!-- end 동행 글 -->
               </div><!-- end 최신 동행글 3개 -->
            </div><!-- end 동행 서브 메뉴 -->
         </ul>
         <ul class="top_menu2">
            <li class="top_menu "><a href="">Recommand</a></li>
            <!-- 추천 서브 메뉴 -->
            <div class="to_sub_menu sub_menu2">
               <ul class=" ">
                  <li class="toSub_menu"><a href="${ pageContext.request.contextPath }/board/pick/foodList"> Food </a></li>
                  <li class="toSub_menu"><a href="${ pageContext.request.contextPath }/board/pick/tourList"> Tour </a></li>
                  <%-- <li class="toSub_menu"><a href="${ pageContext.request.contextPath }/matching/accompanyAfter">후기</a></li> --%>
               </ul>
               <!-- 최신 동행글 3개 -->
               <div class="to_sub_list">
                  <!-- 동행 글 -->
                  <!-- end 동행 글 -->
                  <!-- 동행 글 -->
                  <!-- end 동행 글 -->
               </div><!-- end 최신 동행글 3개 -->
            </div><!-- end 추천 서브 메뉴 -->
         </ul>
         
         <span class="top_seatch"><a class="searchOn searchBtn_w" data-toggle="modal" data-target="#myModal">Search</a></span>
         <!-- 
         <span class="top_sapn"><a href="">English</a></span>
         <span class="top_sapn"><a href="">한국어</a></span>
          -->
          <c:if test="${userVO.type eq 'S' }">
         	<span class="top_sapn"><a href="${ pageContext.request.contextPath }/admin/admin">Admin</a></span>
      	  </c:if>
      </nav>
   </header>  
   
   <!-- mobile 전용 작은화면 -->
   <div class="headerM">
      <h1 id="colorlib-logo" class="m_logo"><a href="${ pageContext.request.contextPath }">together<span>.</span></a></h1>
      <p class="search_m"><button class="searchOn searchBtn_m" data-toggle="modal" data-target="#myModal">Search</button></p>
   </div>

<!-- Modal 검색창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog modal_" role="document">
      <div class="modal-content ">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>

         </div>
         <div class="modal-body">
            <!-- <h1>Search</h1> -->
            <form class="navbar-form " role="search">
               <select name="search" class="votype">
                  <option value="writer">작성자</option>
                  <option value="title">제목</option>
                  <option value="content">내용</option>
               </select>
               <input type="text" class="form-control modal_search_text vosearch voval" placeholder="Search">
               <a class="btn btn-default modal_search_sub vosearch">Search</a>
            </form>
            <div class="modal-result mt-5" >
               <h4><p class="font-weight-bold">Search Result</p></h4>
                  <ul class="tbdyyy search_con">
                  </ul>                  
            </div>
            <div class="chatrestag"></div>
         </div>
      </div>
   </div>
</div>