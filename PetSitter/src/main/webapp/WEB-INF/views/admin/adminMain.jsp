<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/admin.css" rel="stylesheet">

<head>
<script>
	

</script>
	
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>DolBom</title>

</head>

<body>
	<!-- topMenu + scss, css파일 -->
	<jsp:include page="/WEB-INF/views/topMenu/topMenu.jsp" />

	<!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">돌봄
        <small>관리자</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">About</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="${pageContext.request.contextPath }" class="list-group-item">Home</a>
            <a href="${pageContext.request.contextPath }/admin/dolbomWrite" class="list-group-item">돌봄작성</a>
            <!-- <a href="services.html" class="list-group-item">Services</a>
            <a href="sidebar.html" class="list-group-item active">Sidebar Page</a> -->
          </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
          <h2>돌봄 통계</h2>
          <p>통계자료를 보여주자</p>
        </div>
        
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	
</body>

</html>
