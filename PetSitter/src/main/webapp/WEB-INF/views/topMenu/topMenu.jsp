<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/DolBom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/DolBomFont.css" rel="stylesheet">
  
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">

<!-- 제이쿼리 -->  
<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  
<script>
 
   $(document).ready(function(){
	    
	 	// When the user clicks on the button, open the modal
	    $('#loginModal').click(function() {
	        $('#myModal').css('display','block');
	    });

	    // When the user clicks on <span> (x), close the modal
	    $(".close").click(function() {
	        $('#myModal').css('display','none');
	    })

	    // When the user clicks anywhere outside of the modal, close it
	    $(window).click(function(event) {
	        if (event.target.id == 'myModal') {
	            $('#myModal').css('display','none');
	        }
	    });
	   
		$('span[id=loginBtn]').click(function(){
			$.ajax({
				url : '${pageContext.request.contextPath}/login/login',
				data : {
					id : $('input[name=id]').val(),
					password : $('input[name=password]').val()
				},
				type : 'post',
				success : loginSuccess,
				error : loginFail
			});
		});
	
		$('span[id=enrollBtn]').click(function(){
			location.href="${pageContext.request.contextPath}/login/joinForm";
		});
	});
   
   function loginSuccess(data){
	   
	   if(data ==1){
		   location.href="${pageContext.request.contextPath}";   
	   }else{
			alert('loginFail'+data);
			location.href="${pageContext.request.contextPath}";	  
	   }
   }
   
   function loginFail(data){
	   alert('loginfail');
   }
   
</script>   
     
<body>
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>
	        <div>                                                            
		       	 아이디<input type="text" class="form-control" name="id" >
		   		 패스워드<input type="password" class="form-control" name="password">
	   		</div>
   		<span class="btn btn-primary loginBtn" id="loginBtn">DOG IN</span>
   		<span class="btn loginBtn" id="enrollBtn">회원가입</span>
   		      
      </div>
 
    </div>	
	
	<!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/">돌봄</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 	돌봄
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/introduce">돌봄은?</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/faq">자주 받는 질문</a>
              </div>
            </li>
            
            <c:if test="${!empty user}">
            
	            <li class="nav-item dropdown">
	              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                	예약
	              </a>
	              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
	                <a class="dropdown-item" href="${pageContext.request.contextPath}/booking/bookingForm">예약 하기</a>
	                <a class="dropdown-item" href="${pageContext.request.contextPath}/booking/confirm">예약 확인</a>
	              </div>
	            </li>
	            
	            <li class="nav-item dropdown">
	              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                	My Page
	              </a>
	              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
	                <a class="dropdown-item" href="${pageContext.request.contextPath }/login/logout">로그 아웃</a>
	                <a class="dropdown-item" href="${pageContext.request.contextPath }/login/myProfile">정보 수정</a>
	                <a class="dropdown-item" href="portfolio-3-col.html">돌봄 메신저</a>
	                <a class="dropdown-item" href="${pageContext.request.contextPath }/mypage/summary">이용 내역 및 후기</a>
	              </div>
	            </li>
	            
	            <c:if test="${user.type == 'S'}">
		            <li class="nav-item">
		              <a class="nav-link" href="${pageContext.request.contextPath }/admin/adminMain">Admin</a>
		            </li>
		        </c:if>    
            </c:if>
            
            <c:if test="${empty user}">
	            <li class="nav-item">
	              <a class="nav-link" id="loginModal">DOG IN</a>
	            </li>
            </c:if>     
          </ul>
        </div>
      </div>
    </nav>
</body>