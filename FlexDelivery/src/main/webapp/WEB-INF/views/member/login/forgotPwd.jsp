<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <link rel="icon" type="image/png" href="<c:url value='/resources/memberResources/img/fav.png' />">
    <title>비밀번호 찾기</title>
    <!-- Slick Slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/memberResources/vendor/slick/slick.min.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/memberResources/vendor/slick/slick-theme.min.css' />" />
    <!-- Feather Icon-->
    <link href="<c:url value='/resources/memberResources/vendor/icons/feather.css' />" rel="stylesheet" type="text/css">
    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/resources/memberResources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:url value='/resources/memberResources/css/style.css' />" rel="stylesheet">
    <!-- Sidebar CSS -->
    <link href="<c:url value='/resources/memberResources/vendor/sidebar/demo.css' />" rel="stylesheet">
</head>

<body>
    <div class="login-page vh-100">
        <video loop autoplay muted id="vid">
            <source src="<c:url value='/resources/memberResources/img/bg.mp4' />" type="video/mp4">
            <source src="<c:url value='/resources/memberResources/img/bg.mp4' />" type="video/ogg">
         </video>
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="px-5 col-md-6 ml-auto">
                <div class="px-5 col-10 mx-auto">
                    <h2 class="text-dark my-0">FIND PWD</h2>
                   	<br>
                    <p class="text-50 lead">비밀번호 찾기</p>
                    <form class="mt-5 mb-4" action="<c:url value='/login.do' />">
                    	<input type="hidden" name="idx" value="${param.idx}"> 
                        <div class="form-group">
                            <input type="text" placeholder="ID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="userId">
                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="EMAIL" class="form-control" id="exampleInputPassword1" name="email">
                        </div>
                        <button class="btn btn-primary btn-lg btn-block">LOGIN</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/jquery/jquery.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
    <!-- slick Slider JS-->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/slick/slick.min.js' />"></script>
    <!-- Sidebar JS-->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/sidebar/hc-offcanvas-nav.js' />"></script>
    <!-- Custom scripts for all pages-->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/js/osahan.js' />"></script>
</body>

</html>