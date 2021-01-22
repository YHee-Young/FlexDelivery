<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../ownerInc/top.jsp"%>
<%@include file="../../ownerInc/jianSidebarTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/jquery/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/businessLicense.css" />
<script type="text/javascript" src="<c:url value='${pageContext.request.contextPath}/resources/ownerResources/assets/js/storesregister.js'/>"></script>
<script type="text/javascript">
$(function(){
	$('#wr_submit').click(function(){
		if($('#oRegisterNo').val().length<1){
			alert('사업자 번호 10자리를 입력해주세요.');
			$('#oRegisterNo').focus();
			event.preventDefault();
		}
	});
	
	$('#oRegisterNo').keyup(function(){
		var oRegisterNo=$(this).val();
		if( oRegisterNo.length>=1 && oRegisterNo.length<=10){
			$('.error').html(oRegisterNo.length+'/10');
		}
	
/* 	function validate_oRegisterNo(oRegisterNo){
		$('.error').html("숫자 10자리만 입력해주세요.");
	} */
	});
});
</script>
<!-- 다음에 옮기기 CSS작업할때 -->
<style type="text/css">
   .error{
      color:purple;
      font-weight:bold;
   }
</style>
	<div class="row">
		<div class="col-md-4 col-12"></div>
		<div class="col-md-4 col-12">
		     <div class="card">
		         <div class="card-header">
		           		 <h4 class="card-title">사업자등록증 등록신청</h4>
			     </div>
			     
			     <div class="card-content">
				 	  <div class="card-body">
				 	  
				            <!-- form 시작 -->
			                <form class="form form-horizontal" method="post" 
			        action="<c:url value='/owner/menu1/businessLicense.do'/>" >
			                <div class="form-body">
			                    <div class="row">
			                 <%--       <div class="col-md-4">
				                        <label>사업자 대표명</label>
				                        <!--  ?? 사업자 대표명이랑 회원가입한 네임이랑 다를경우 ?? 
				                        게다가 컬럼명도 없는데 없애 버릴까 -->
				                    </div>
				                    <div class="col-md-8 form-group" >
				                        <input type="text" id="userName" class="form-control text-right" placeholder="대표자명을 입력해주세요." name="" value="${param.choice }" >
				                    </div> --%>
				                    <div class="col-md-4">
				                        <label>사업자등록 번호</label>
				                        <!-- 예시 : 고유번호: 104-83-00469 (대표: ㅇㅇㅇ)  (10자리) -->
				                    </div>
				                    <div class="col-md-8 form-group" >
				                        <input type="text" id="oRegisterNo" name="oRegisterNo" 
				                        class="form-control text-right" placeholder="숫자만 입력, 예시 :  1048300469"   value="">
				                   	<span class="error"></span>
				                    </div>
				                    <div class="col-md-4">
				                        <label>사업자등록증</label>
				                    </div>
				                    <div class="col-md-8 form-group">
				                        <input type="file" id="oRegisterOriginalFileName" name="oRegisterOriginalFileName"
				                         class="form-control text-right border none" value="" >
				                    </div>
				                    <div class="col-sm-12 d-flex justify-content-end pt-5">
				                        <input type="submit" class="btn btn-primary mr-1 mb-1"
				                        id="wr_submit" name="wr_submit">신청</button>
				                        <button type="reset" class="btn btn-light-secondary mr-1 mb-1">취소</button>
				                    </div>
			                    </div>
			                </div>
			                </form>
			                
			   		   </div>
	              </div>
	         </div>
	    </div>
	    <div class="col-md-4 col-12"></div>
	</div>
<%@include file="../../ownerInc/jianSidebarBottom.jsp"%>
<%@include file="../../ownerInc/bottom.jsp"%>