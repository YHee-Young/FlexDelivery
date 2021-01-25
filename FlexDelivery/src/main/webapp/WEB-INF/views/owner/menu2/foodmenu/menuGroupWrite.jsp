<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- 나중에 storeNo 수정필요 -->
<!DOCTYPE html>
<html lang="ko">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴그룹사이트</title>
 
 
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">

 <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>



	
	<!-- 클릭시 비밀번호 유효성 검사 및 페이지 이동 -->
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script type="text/javascript">

	   
	  $(function(){
			$('form[name=frm]').submit(function(){
				if($('input[id=sMGroupName]').val().length<1){
					alert('그룹명을 입력해 주세요');
					$('input[id=sMGroupName]').focus();
					event.preventDefault();
				}
			});
			
		}); 

		 if(${result}==${SUCCESSPOST}){
			opener.parent.location.reload();
			self.close();
		} 

	</script>
</head>
<body style="overflow-x:hidden;">	
		<br>	<br>	
		<section id="basic-vertical-layouts">
		    <div class="row match-height">
		    	<div class="col-md-3 col-sm-12"></div>
		        <div class="col-md-6 col-sm-12">
		        <div class="card">
		            <div class="card-header" style="background-color:white;">
		            <h4 class="card-title">메뉴 그룹 등록</h4>
		            </div>
		            <div class="card-content">
		            <div class="card-body">
		                <form class="form form-vertical" name="frm" method="post" action='<c:url value="/owner/menu2/foodmenu/menuGroupWrite.do"/>'>
		                   <div class="form-body">
		                    <div class="row">
		                    <div class="col-12">
		                        <div class="form-group">
		                        <label for="first-name-vertical">메뉴 그룹 이름</label>
		                        <input type="text" id="sMGroupName" class="form-control" name="sMGroupName">
		                        <input type="hidden" name="storeNo" value="${storeNo}"> 
		                        <!-- 나중에 storeNo 수정필요 -->
		                        </div>
		                    </div>
		                    <div class="col-12 d-flex justify-content-center">
		                        <input type="submit" class="btn btn-primary mr-1 mb-1" value="등록">
		                        <button type="reset" class="btn btn-light-secondary mr-1 mb-1" onclick="history.back()">취소</button>
		                    </div>
		                    </div>
		                </div>
		                </form>
		            </div>
		            </div>
		        </div>
		        </div>
		        <div class="col-md-3 col-sm-12"></div>
		    </div>
		</section>
			
			  
			  	 
        <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
    

    
    
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
    
    
    
   
			
</body>
</html>
    	