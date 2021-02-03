<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../adminInc/top.jsp" %>

<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

<script>
$(function(){
	/* $('#detailReplyEdit').click(function(){
		location.href="${pageContext.request.contextPath}/admin/menu5/oneToOne/edit.do?no="+${vo.askNo};
	}); */
	
	/* $('#btReplyWriteSubmit').click(function(){
		var content=$('#replyAskContent').val();
		if (content.length==0){
			alert("내용을 입력해주세요!");
			prevent.eventDefault();
		}
	}); */
	
	
	$('#detailList').click(function(){
		location.href="${pageContext.request.contextPath}/admin/menu5/oneToOne.do";
	});
});
</script>

<div class="container">
	<div class="row">
	    <div class="col-12">
           <div class="card">

				<div class="card-content"> 
		           <div class="card-body">
						<div class="main-content container-fluid">
			                <div class="col-12">
			                    <div class="single-blog-area blog-style-2 mb-100">
		                       <!-- ##### Post Content Area ##### -->
					                <div class="col-12">
					                    <!-- Single Blog Area  -->
					                    <div class="single-blog-area blog-style-2 mb-50">
					                        <!-- Blog Content -->
					                        <div class="single-blog-content">
					                            <div class="line"></div>
					                            <a href="#" class="post-tag">${vo.askNo }번째 문의</a>
					                            <h4><a href="#" class="post-headline mb-0">${vo.askTitle }</a></h4>
					                            <div class="post-meta mb-50">
					                                <p> ${vo.askRegdate }, By <a href="#">${vo.askId }</a></p>
					                                <hr>
					                            </div>
					                            <div class="text-left">
					                            	<br><br><br>
						                            <p>${vo.askContent }</p>
					                            </div>
											</div>
					                    </div>
										<div class="text-center" style="text-center">
											<br><br>
											<button type="button" class="btn round block btn-dark" id="detailList">목록</button>
										</div>
				                    </div><!-- 본문 내용 col-12 -->
				                    
									<div class="col-12 mt-50 text-center">
										<hr>
										<c:if test="${empty rVo}">
										
											<p class="mt-50 mb-50" style="font-weight: bolder;">등록된 답변이 없습니다.</p>
											<hr>
	                                       <div class="post-a-comment-area mt-70">
						                        <!-- <h5 style="text-algin: left;">답변</h5> -->
						                        <div class="card-body">
							                        <!-- Reply Form -->
							                        <form name="frmReplyWrite" action="<c:url value='/admin/menu5/oneToOne/writeReply.do' />" method="post">
							                            <div class="row">
							                                <div class="col-12 col-md-6">
							                                    <div class="group">
							                                    	<input type="hidden" name="askNo" value="3">
							                                    	<input type="hidden" name="askId" value="admin">
							                                    	<input type="hidden" name="askGroupNo" value="${vo.askNo }">
							                                    	<input type="hidden" name="askStep" value="${vo.askStep +1}">
							                                    	<input type="hidden" name="authorityNo" value="6">
							                                        <input style="text-align: right;" type="text" name="askId" id="replyAskId" value="플렉스 딜리버리" readonly required>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>작성자</label>
							                                    </div>
							                                </div>
							                                <div class="col-12 col-md-6">
							                                    <div class="group">
							                                        <input style="text-align: right;" type="text" name="askTitle" id="replyAskTitle" value="RE:${vo.askTitle }" readonly required>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>제목</label>
							                                    </div>
							                                </div>
							                                <div class="col-12">
							                                    <div class="group">
							                                        <textarea name="askContent" id="replyAskContent" required></textarea>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>답변내용</label>
							                                    </div>
							                                </div>
		<!-- 					                                <div class="col-12">
							                                    <div class="group">
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>Comment</label>
							                                    </div>
							                                </div>
		 -->					                                <div class="col-12">
							                                    <!-- <button type="submit" class="btn original-btn">답변 등록</button> -->
							                                    <button type="submit" id="btReplyWriteSubmit" class="btn round block btn-primary">답변 등록</button>
							                                </div>
							                            </div>
							                        </form>
						                        </div>
						                    </div>
                  
										</c:if>
	                                    
										<c:if test="${!empty rVo}">
	                                      <!-- Comment Area Start -->
					                    <div class="comment_area clearfix mt-70">
					                        <h5 class="title">답변</h5>
					
					                        <ol>
					                            <!-- Single Comment Area -->
					                            <li class="single_comment_area">
					                                <!-- Comment Content -->
					                                <div class="comment-content d-flex">
					                                    <!-- Comment Meta -->
					                                    <div class="comment-meta">
					                                        <a href="#" class="post-date">${rVo.askId } | ${rVo.askRegdate }</a>
					                                        <p>${rVo.askTitle }</p>
					                                        <p>${rVo.askContent }</p>
					                                        <a href="#" class="comment-reply">수정</a> | 
					                                        <a href="#" class="comment-reply" data-toggle="modal" 
																data-backdrop="false" data-target="#askReplyDelete">삭제</a>
																<button type="button" class="comment-reply" id="modalDeleteBt" data-toggle="modal" 
												data-backdrop="false" data-target="#askReplyDelete" >삭제</button>
					                                    </div>
					                                </div>
					                            </li>
					                        </ol>
					                    </div>
					                    </c:if>
	                                   
                    
                    <!-- #noticeDetailDelete 삭제 모달 -->
	                                       <div class="modal fade text-left" id="askReplylDelete" tabindex="-1" role="dialog"
	                                          aria-labelledby="답변 삭제" aria-hidden="true">
	                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                             <div class="modal-content">
	                                                <form name="frmReplyDel" id="frmReplyDel" method="post" action="<c:url value='/admin/menu5/oneToOne/replyDelete.do' />">
	                                                   <div class="modal-header bg-danger">
	                                                      <h5 class="modal-title white" id="myModalLabel140">1:1문의 답변 삭제</h5>
	                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                          <i data-feather="x"></i>
	                                                      </button>
	                                                   </div>
	                                                   <div class="modal-body">
	                                                      
	                                                      	[<span style="font-weight: bolder;">${vo.askNo}번 게시글: ${vo.askTitle }</span>] 의 답변을 삭제하시겠습니까?
	                                                   </div>
	                                                   <div class="modal-footer">
	                                                      <button type="button" class="btn btn-light-secondary" data-dismiss="modal" id="modalDelCancel">
	                                                         <i class="bx bx-x d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">취소</span>
	                                                      </button>
	                                                      
	                                                      <button type="button" class="btn btn-danger ml-1" data-dismiss="modal" id="modalDelOk" onclick="form.submit()">
	                                                         <i class="bx bx-check d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">삭제</span>
	                                                      </button>
	                                                   </div>
	                                                </form>
	                                             </div>
	                                          </div>
	                                       </div> <!-- #honeytipDetailDelete 삭제 모달 end-->
	                                       
										</div>       
					                </div><!-- col-12 -->
				                </div>
				            </div>
				        </div>
    				</div>
   				</div>
	    		
		    </div><!-- card -->
	    </div>
    </div>
</div>

<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>  
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->

    
<%@ include file="../../../adminInc/bottom.jsp" %>
