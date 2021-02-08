<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row mt-3">
	<div class="col-md-2 col-sm-12"></div>
	<div class="col-md-8 col-sm-12">
		<ul class="nav nav-pills" style="float: right;">
			<li class="nav-item">
				<a class="nav-link " aria-current="page" href="<c:url value="/owner/menu2/reviewOwner/reviewOwner.do"/>">전체(${fn:length(reviewList) })</a>
			</li>
			<li class="nav-item">
			<button type="button" class="btn btn-primary" id="btNocomment">미답변 </button>
				<a class="nav-link active" href="<c:url value="/owner/menu2/reviewOwner/nocomment.do"/>">미답변()
			</a></li>
			<li class="nav-item">
				<a class="nav-link active" href="<c:url value="/owner/menu2/reviewOwner/blockcmt.do"/>">차단()
			</a></li>
		</ul>
	</div>
	<div class="col-md-2 col-sm-12"></div>
</div>
<br>
<!--  -->
<div class="row" id="table-hover-row">
	<div class="col-md-2 col-sm-12"></div>
	<div class="col-md-8 col-sm-12">
		<div class="card">
		<br>
			<div class="card-content">
				<div class="card-body">
					<p class="card-text text-center" style="font-size: 20px; font:bold;">리뷰 관리 </p>
					<p class="card-text text-left" >평균 별점 입니다. </p>
					<br> <br>
			<div class="card-content">
				<div class="card-body text-center">
					<div class="all-div" id="AllDiv">
					<div class="row">
						<div class="col-md-4 col-12"></div>
						<div class="col-md-6 col-12 ">
							<form name="frmPage" method="post" name="frm1"
								action="<c:url value='/owner/menu2/reviewOwner/reviewOwner.do'/>">
								<%@include file="../../../owner/datePicker/datePicker.jsp"%>
								<input type="hidden" name="currentPage" value="1">
						</div>
						<div class="col-md-2 col-12">
							<input type="submit" style="background-color: rgb(223, 108, 220); color: white;" value="조회">
						</div>
							</form>
					</div>
					<br>
					<c:if test="${empty reviewList }">
						<div class="row">
							<div class="ccol-md-8">데이터가 존재하지 않습니다.</div>
						</div>
					</c:if>
					<c:if test="${!empty reviewList }">
						<c:forEach var="map" items="${reviewList }">
							<hr>
							<br>
							<div class="review-list">
								<div class="row ">
									<div class="col-md-3">
										<h4 class="card-title">${map['MEMBER_ID']}</h4>
									</div>
									<div class="row">
										<div class="col-md-3">${map['REVIEW_RATING'] }점</div>
										<div class="col-md-1">.col-md-1</div>
										<div class="col-md-5 text-left">${map['MENU_NAME']}+
											${map['M_OPTION_NAME']}</div>
									</div>
								</div>
								<div class="row ">
									<div class="col-md-3">
										<fmt:formatDate value="${map['REVIEW_REGDATE']}"
											pattern="yyyy-MM-dd" />
									</div>
									<div class="col-md-7 text-left">${map['REVIEW_CONTENT']}</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<br>
							<br>
							<!-- table hover -->
							<div class="table-responsive">
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-8"> </div>
									<div class="col-xs-6 col-md-4"></div>
								</div>
								<!-- CEO comment start !! -->
								<c:if test="${!empty map['R_COMMENT_CONTENT']}">
								<div class="CEO-comment" style="background-color:rgba(208, 201, 208, 0.12); color: #333;">
									<form id="frm2" method="post"
										action="<c:url value='/owner/menu2/reviewOwner/edit.do'/>">
										<input type="hidden" id="reviewNo" name="reviewNo"
											value="${map['REVIEW_NO'] }"> <input type="hidden"
											id="storeNo" name="storeNo" value="1">
										<div class="reply" style="padding:7%;">
										<div class="row" >
											<div class="col-md-3">
												<h4>사장님&nbsp;</h4>
											</div>
											<div class="col-md-6 text-left">${map['MEMBER_ID'] }님,</div>
											<div class="col-md-1"></div>
										</div>
										<div class="row" >
											<div class="col-md-3">
												<fmt:formatDate value="${map['R_COMMENT_REGDATE'] }"
													pattern="yyyy-MM-dd" />
											</div>
											<div class="listDiv col-md-7 text-left text-left">${map['R_COMMENT_CONTENT'] }</div>
											<div class="result" id="resultDiv"></div>
											</div>
										<div class="row">
											<div class=".col-xs-12 .col-sm-6 .col-md-8"></div>
											<div class="text-right" style="margin-bottom:10px;">
											<div class="button-group button-group-row align-right "><br><br>
												<input type="button" class="button small danger inGroup" onclick="btDel(${map['REVIEW_NO']})"
													style="background-color: rgb(223, 108, 220); color: white;" value="삭제 ">
												<input type="submit" class="button small secondary inGroup"
													id="btEdit" onclick="Edit_form(${map['REVIEW_NO']})"
													style="background-color: rgb(223, 108, 220); color: white;" value="수정 ">
												</div>
											</div>
										</div>
									</div>
										<!-- ${sessionScope.storeNo} 변경하기  -->
									</form>
									</div>
									<div class="col-md-2 col-sm-12"></div>
									<br>
									<br>
								
								</c:if>
								<!-- 댓글이 없는 경우 활성화  -->
								<c:if test="${empty map['R_COMMENT_CONTENT']}">
									<div class="card-body">
										<form id="frm1" method="post"
											action="<c:url value='/owner/menu2/reviewOwner/reviewOwnerWrite.do'/>">
											<!-- hidden  -->
											<input type="hidden" id="reviewNo" name="reviewNo" value="${map['REVIEW_NO'] }">
												 <input type="hidden" id="storeNo" name="storeNo" value="1">
												 <label for="content"></label>
												 <div style="border: radius 2px solid lightgray;">
											<textarea class="form-control form-control-lg" id="content" name="rCommentContent" placeholder="사장님 ! 댓글을 등록해주세요.">
											</textarea>
												<input class="button medium" type="submit" onclick="" style="background-color: rgb(223, 108, 220); color: white;" value="댓글작성">
												 </div>
										</form>
									</div>
								</c:if>
								<br> <br>
						</c:forEach>
					</c:if>
					</div><!-- AllDiv -->
				</div>
			</div>
		</div>
		</div>
		</div>
	</div>
</div><!-- The end -->
<div class="col-md-2 col-sm-12"></div>
<br>

<!-- 페이지 시작-->
<div class="card-body">
	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-primary justify-content-center">
			<!-- 페이지 번호 추가 -->
			<!-- 이전 블럭으로 이동 -->
			<c:if test="${pagingInfo.firstPage>1 }">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage}"
				end="${pagingInfo.lastPage}">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pageFunc(${i})">${i}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous" onclick="pageFunc(${pagingInfo.lastPage+1})">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>

</div>
<br>
<br>

<!-- two  -->

<script type="text/javascript">
	function btDel(reviewNo){
		if(confirm("리뷰 답변을 삭제하시겠습니까?")) {
			location.href= "<c:url value='/owner/menu2/reviewOwner/reviewOwnerDelete.do?reviewNo='/>" + reviewNo;
			event.preventDefault();
		}else {
			return false;
		}
	}
	//댓글 수정버튼 눌렀을 시 폼
    function Edit_form(num) {
     	$(this).parent().prev().css("display", "none");
     	console.log(this);
$(function(){
     	var params = $("#frm2").serialize();
     	
     	$.ajax({
			url:"<c:url value='/owner/menu2/reviewOwner/edit.do'/>",
			type:"GET",
			data: params, //입력양식의 내용을 객체로 만든다
			dataType:"json",
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(res){
				//alert(res);
				var output="<textarea class='form-control form-control-lg' id='content' name='rCommentContent'>";
					output+=res.rCommentContent+" </textarea><br>";
					output+="<button type='submit' class='button small secondary inGroup' id='btEdit' >수정하기 </button>";
				
				$('#resultDiv').append(output);
					$('#listDiv').hide();
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}				
		});//ajax
 
	});
event.preventDefault();
}
	
	$(function(){
		$('#btNocomment').click(function(){
			$('#AllDiv').hide();
			$('#Nocomment').show();
		});
	});
	
	// 탭 
	$(function(){
	$('input[type=radio]').click(function(){
		if($(this).attr('id')=='ck2'){
			$('#AllDiv').hide();
		}else if($(this).attr('id')=='ck1'){
			$('#AllDiv').show();
		}else if($(this).attr('id')=='ck3'){
			$('#AllDiv').hide();
		}
	});
});
	
function pageFunc(curPage){
	$('form[name=frmDate]').find('input[name=currentPage]').val(curPage);	
	$('form[name=frmDate]').submit();
}


</script>
<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>