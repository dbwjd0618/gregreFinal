<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!-- Js Plugins -->
<script
	src="${pageContext.request.contextPath }/resources/js/shop/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/QnA.css"
	type="text/css">
<style>
.fold-table th, .fold-table .view td{
	padding-top : 16px !important;
}
</style>
<!-- QnA table  -->
<script>
	$(function() {
		$(".fold-table .fold-open").on(
				"click",
				function() {
					$(this).parent().toggleClass("open").next(".fold")
							.toggleClass("open");
				});
	});
</script>

<script>
//문의수정하기
function goQnA(){
	
	document.qaFrm.action='${pageContext.request.contextPath }/shop/QnA/updateQnA.do';
	document.qaFrm.submit();
	alert("수정되었습니다. 빠른시일내에 답변드리겠습니다^^");
	 
}

//문의삭제하기
function qaDelete(){

	 if (confirm("문의를 삭제하시겠습니까?")) {

		$("#deleteFrm").attr("action", "${pageContext.request.contextPath }/shop/QnA/deleteQnA.do").submit();

		alert('문의가 삭제되었습니다');
	 }
	
}
</script>
<script>
//리뷰수정 모달 
$(function(){
    $(".qa-btn").click(function(){
        
    
    	var qtnTitle = $(this).parent().find('input[name=qtnTitle]').val();
    	var qtnContent = $(this).parent().find('input[name=qtnContent]').val();
    	var qaId = $(this).parent().find('input[name=qaId]').val();
    	var setSecret = $(this).parent().find('input[name=setSecret]').val();
    	
    	
    	$('[name=qtnTitle]').val(qtnTitle);
    	$('[name=qtnContent]').val(qtnContent);
    	$('[name=qaId]').val(qaId);

    	
  		$('#qNaModal').modal();

    	if(setSecret=='Y'){
        console.log(setSecret);
    		$('#bc-calvin').prop("checked", true);
    	}
 
 
    })
})

</script>
<!--  myShopping QnA list -->
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="${pageContext.request.contextPath }/"><i
						class="fa fa-home"></i> Home</a> <a href="./shop.html">MY쇼핑</a> <span>주문확인/배송조회</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-4 pt-4">
				<h1 class="mb-3 font-weight-bold text-teal ">MY쇼핑</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar"
								src="${pageContext.request.contextPath }/resources/images/myPage/user.png" />
							<div class="profile__name">${memberLoggedIn.memberId }</div>
						</div>
					</div>
					<div class="sidebar__middle">
						<div class="profile side__profile _3fftNQzxHO">
							<ul>
								<li>보유 쿠폰<a
									href="${pageContext.request.contextPath }/shop/myShopping/coupon/list.do"
									class="_2XiEZGqw1K"><em>${myCouponCount }</em>장</a>
								</li>
								<li>포인트<a href="#" class="_2XiEZGqw1K "><em>
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${point }" /></em>p</a>
								</li>
							</ul>
						</div>

					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/order/list.do">
								<div class="menu__title">주문확인/배송조회</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/wish/list.do">
								<div class="menu__title">관심상품</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/event/list.do">
								<div class="menu__title">이벤트참여내역</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/review/list.do">
								<div class="menu__title">상품리뷰</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/QnA/list.do">
								<div class="menu__title">상품문의 내역</div>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!--상품문의내역 시작-->
			<div class="col-md-9">
				<div class="row">
					<h4 style="margin-bottom: 20px;">
						<strong>상품문의내역</strong>
					</h4>
				</div>
				<div class="row">

					<div class="col-lg-12">
						<table class="fold-table table table-sm">
							<thead>
								<tr>
									<th>번호</th>
									<th>답변상태</th>
									<th>제목</th>
									<th>등록일</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${empty prodQnAList}">
							<tr  style="text-align:center;">
							<td colspan="6" style="padding-top:10px; padding-bottom:10px;">문의한 내역이 없습니다.</td>
							</tr>
							</c:if>
								<c:if test="${not empty prodQnAList}">
									<c:forEach var="QnA" items="${prodQnAList}" varStatus="qVs">
										<tr class="view">
											<td class="fold-open">${qVs.index+1 }</td>
											<c:if test="${QnA.qaState eq'N'}">
												<td class="fold-open">검토중</td>
											</c:if>
											<c:if test="${QnA.qaState eq'Y'}">
												<td class="fold-open">답변완료</td>
											</c:if>
											<c:if test="${QnA.setSecret eq'Y'}">
												<c:if test="${QnA.qtnerId eq memberLoggedIn.memberId }">
													<td class="fold-open"><span class="secret-icon">
															<img
															src="${pageContext.request.contextPath }/resources/images/shop/icon/secret.png"
															alt="">
													</span> ${QnA.qtnTitle}</td>
												</c:if>
											</c:if>
											<c:if test="${QnA.setSecret eq 'N'}">
												<td class="fold-open">${QnA.qtnTitle}</td>
											</c:if>

											<td class="fold-open">${QnA.qtnDate }</td>
											<td class="fold-open"></td>
											<td style="padding-bottom: 10px !important;">
											<form id="deleteFrm" method="post" >
											<c:if test="${QnA.qaState eq'N'}">
												<input type="button" class="btn btn-outline-secondary qa-btn" value="수정">
												</c:if>
												<input type="hidden" name="qtnTitle" value="${QnA.qtnTitle}" /> 
												<input type="hidden" name="qtnContent" value="${QnA.qtnContent}" /> 
												<input type="hidden" name="setSecret" value="${QnA.setSecret }" /> 
												<input type="hidden" name="qaId" value="${QnA.qaId}" /> 
												<input type="button" class="btn btn-outline-secondary" onclick="qaDelete();" value="삭제">

											</form>
											</td>
										</tr>
										<tr class="fold">
											<td colspan="6">
												<div class="fold-content">
													<div class="qt">
														<span class="ic_qt"><img
															src="${pageContext.request.contextPath }/resources/img/QnA/q-icon.png"
															alt=""></span>${QnA.qtnContent }
													</div>
													<c:if test="${QnA.qaState eq'Y'}">
													<div class="as">
														<span class="ic_as"><img
															src="${pageContext.request.contextPath }/resources/img/QnA/a-icon.png"
															alt=""></span>안녕하세요 고객님. 접수해주신 상품문의에 대한 답변드립니다. 주문하신 상품은
														어제 출고되었으며, 배송은 1~2일 소요 예상됩니다. 감사합니다. 즐거운 하루 보내세요.
													</div>
													<p class="reginfo">
														<span class="wh">판매자의 답변</span> <span class="date">등록일
															: <em>2020-02-28 오후 4:32:44</em>
														</span>
													</p>
												</c:if>

												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>

					</div>
				</div>
			</div>
			<!--상품문의내역 끝-->




		</div>
	</div>
</div>
<!-- contents end-->

	<!-- 문의하기 modal -->

	<div class="modal fade" id="qNaModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상품 문의 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="qaFrm" method="post">
						<div class="form-group">
							<label for="QnA-title" class="col-form-label">제목</label> <input
								type="text" class="form-control" name="qtnTitle" id="QnA-title">
						</div>
						<div class="bc-item">
							<label for="bc-calvin"><input type="checkbox"
								id="bc-calvin" name="setSecret" id="secret-check" value="Y"> 비밀글 설정<span class="checkmark"></span>
							</label>
						</div>
						<div class="form-group">
							<label for="QnA-text" class="col-form-label">문의 내용</label>
							<textarea class="form-control" name="qtnContent" id="QnA-text"
								placeholder="문의 내용을 입력하세요"></textarea>
						</div>
						<input type="hidden" name="qaId" value="" /> 
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="goQnA();">완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />