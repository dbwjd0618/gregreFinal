<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!-- 마이쇼핑 주문확인/배송조회 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/orderList.css">
<!--product view css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/productView.css"
	type="text/css"></link>

<!-- order list -->
<!-- Breadcrumb Section Begin -->
<style>
.order-container {
	width: 100%;
}

.order-list__item__production__item__info__brand,
	.order-list__item__production__item__info__brand--placeholder {
	margin-bottom: 2px;
}

.order-list__item__production__item__info__price {
	margin-bottom: 10px;
}

.order-list__item__production__item__info__option,
	.order-list__item__production__item__info__option--placeholder,
	.order-list__item__production__item__info__price,
	.order-list__item__production__item__info__price--placeholder,
	.order-list__item__production__item__info__status--placeholder {
	font-size: 15px;
	line-height: 20px;
}

.fa-star:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/star.png');
	background-size: 20px 20px;
	width: 20px;
	height: 20px;
	display: inline-block;
}

.fa-star-o:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/star-o.png');
	background-size: 18px 18px;
	width: 18px;
	height: 18px;
	display: inline-block;
	margin-bottom: 1px;
}
</style>

<script>
//리뷰작성하기
 function goReview(){

			window.parent.closeBtn();


		 	document.reviewFrm.action='${pageContext.request.contextPath }/shop/review/review.do';
			document.reviewFrm.submit(); 
			 
			alert('리뷰가 작성되었습니다');
}
		
$(function(){
    $(".review-btn").click(function(){
    	$('.review-modal__form__product__contents .opt-n').remove();
    	var optName = $(this).parent().prev().find('.optName');
    	var optId = $(this).parent().prev().find('input[name=opt-id]');
        var t = $(this);
        
        var optIdArr = new Array();
        $(optId).each(function (index, item) {
         optIdArr[index] = $(item).val();
        });
    	$(optName).each(function (index, item) { 	
    		 var addOpt = '<div class="review-modal__form__product__contents__options opt-n" id="opt-name">'+$(item).text()+'</div>';	
    		  addOpt += '<input type="hidden" name="optionId" value="'+optIdArr[index]+'" >'; 
    		 $('.review-modal__form__product__contents').append(addOpt); 
    	});
    	
    	var imgName = $(this).parent().find('input[name=imgName]').val();
    	var brandName = $(this).parent().find('input[name=brandName]').val();
    	var prodName = $(this).parent().find('input[name=prodName]').val();
    	var prodId = $(this).parent().find('input[name=prodId]').val();
    	var orderId = $(this).parent().find('input[name=orderId]').val();
        var imgSrc = "${pageContext.request.contextPath}/resources/upload/shop/productMainImg/"+imgName;
    	$('#prod-id').val(prodId);
    	$('#order-id').val(orderId);
    	$('#brand-name').text(brandName);
    	$('#prod-name').text(prodName);
    	$("#rv-img").attr("src",imgSrc);
    	
    	window.closeBtn = function() {
    		console.log(t);
    		$(t).html('리뷰보기');
    		/* console.log($(this).html()); */
    	}
  	$('#writeReviewModal').modal();

 
    })
})

</script>
<script>
$(function(){
    $("label.rating-input__star").on("click",function(){
        $(this).parent().children("label").removeClass("selected").children('i').addClass("fa-star-o"); 
        $(this).addClass("selected").prevAll("label").addClass("selected").children('i').removeClass("fa-star-o").addClass("fa-star");
        $(this).children("i").removeClass("fa-star-o").addClass("fa-star"); 
        $(this).children("input:radio[name='starPoint']").prop('checked', true); 
        return false;
    })
})
</script>
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
								<li>주문·배송<a
									href="${pageContext.request.contextPath }/shop/myShopping/order/list.do"
									class="_2XiEZGqw1K"><em>0</em>건</a>
								</li>
								<li>보유 쿠폰<a
									href="${pageContext.request.contextPath }/shop/myShopping/coupon/list.do"
									class="_2XiEZGqw1K"><em>2</em>장</a>
								</li>
								<li>포인트<a href="#" class="_2XiEZGqw1K "><em>5000</em>p</a>
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

			<!-- order List Begin -->
			<div class="col-md-9">
				<div class="row">
					<h4 style="margin-bottom: 20px;">
						<strong>주문확인/배송조회</strong>
					</h4>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="order-list__menu">
							<a class="order-list__menu__list" href="">
								<div class="order-list__menu__list__wrap">
									<div class="order-list__menu__list__title">입금대기</div>
									<div class="order-list__menu__list__value">${deliStateCount[0] }</div>
								</div>
							</a> <a class="order-list__menu__list" href="">
								<div class="order-list__menu__list__wrap">
									<div class="order-list__menu__list__title">결제완료</div>
									<div class="order-list__menu__list__value">${deliStateCount[1] }</div>
								</div>
							</a> <a class="order-list__menu__list" href="">
								<div class="order-list__menu__list__wrap">
									<div class="order-list__menu__list__title">배송준비</div>
									<div class="order-list__menu__list__value">${deliStateCount[2] }</div>
								</div>
							</a> <a class="order-list__menu__list" href="">
								<div class="order-list__menu__list__wrap">
									<div
										class="order-list__menu__list__title order-list__menu__list__title--focus">배송중
									</div>
									<div class="order-list__menu__list__value">${deliStateCount[3] }</div>
								</div>
							</a> <a class="order-list__menu__list" href="">
								<div class="order-list__menu__list__wrap">
									<div class="order-list__menu__list__title">배송완료</div>
									<div class="order-list__menu__list__value">${deliStateCount[4] }</div>
								</div>
							</a>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="">
						<div class="gray-search-box">
							<div class="gray-search-inner">
								<div class="gs-form-wrap">
									<dl>
										<dt class="offscreen">검색기간</dt>
										<dd>
											<div class="select-option sort-list">
												<select class="sorting">
													<option value="" selected>주문상태 전체</option>
													<option value="">입금대기</option>
													<option value="">결제완료</option>
													<option value="">배송준비</option>
													<option value="">베송중</option>
													<option value="">배송완료</option>
												</select>
											</div>
											<div class="select-option sort-list">
												<select class="sorting">
													<option value="" selected>기간</option>
													<option value="">1주일</option>
													<option value="">최근1개월</option>
													<option value="">최근3개월</option>
													<option value="">최근6개월</option>
													<option value="">최근1년</option>
												</select>
											</div>
										</dd>
									</dl>
								</div>
								<div class="btn-wrap">
									<button type="button" class="btn-black" id="searchBtn">조회</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach var="order" items="${orderList}" varStatus="vs">
						<div class="order-container">
							<div class="order-list__item">
								<div class="order-list__item__title">
									<div class="order-list__item__title__order">${order.orderNo}
										| ${order.orderDate }</div>
									<a class="order-list__item__title__link"
										href="${pageContext.request.contextPath }/shop/myShopping/order/detail.do?orderNo=${order.orderNo}">상세보기</a>
								</div>
								<c:forEach var="prodList" items="${order.orderProdList}"
									varStatus="prodVs">
									<div class="order-list__item__production">
										<div class="order-list__item__production__wrap">
											<div class="order-list__item__production__item">
												<div class="order-list__item__production__item__wrap">
													<img class="order-list__item__production__item__img"
														src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${prodList.renamedImg}">
													<div class="order-list__item__production__item__info">
														<div
															class="order-list__item__production__item__info__wrap order-list__item-container">
															<div
																class="order-list__item__production__item__info__brand">[${prodList.productBrand }]</div>
															<a class="order-list__item__production__item__info__name"
																href="/productions/229566/selling">${prodList.productName }</a>
														</div>
														<div
															class="order-list__item__production__item__info__wrap order-list_option-container">
															<c:if test="${prodList.optionName != null}">
																<c:forEach var="optionName"
																	items="${prodList.optionName}" varStatus="optVs">
																	<c:if test="${ optionName !=null }">
																		<c:set var="optName"
																			value="${fn:split(optionName,',') }" />
																		<c:set var="optValue"
																			value="${fn:split(prodList.optionValue[optVs.index],',') }" />
																		<!-- 옵션값이 두개인경우 -->
																		<c:if test="${ not empty optName[1] }">
																			<div
																				class="order-list__item__production__item__info__option optName">
																				${optValue[0]} / ${optValue[1]}</div>
																			<input type="hidden" name="opt-id"
																				value="${prodList.optionId[optVs.index] }" />
																		</c:if>
																		<!-- 옵션값이 한개인경우 -->
																		<c:if test="${  empty optName[1] }">
																			<div
																				class="order-list__item__production__item__info__option optName">
																				${optValue[0]}</div>
																			<input type="hidden" name="opt-id"
																				value="${prodList.optionId[optVs.index] }" />
																		</c:if>
																	</c:if>
																	<div
																		class="order-list__item__production__item__info__price">
																		<fmt:formatNumber type="number" maxFractionDigits="3"
																			value="${prodList.optionPrice[optVs.index] }" />
																		원 | ${prodList.prodCount[optVs.index] }개
																	</div>
																</c:forEach>

															</c:if>
															<!-- 옵션이 없을 경우 -->
															<c:if test="${prodList.optionName ==null }">
																<div
																	class="order-list__item__production__item__info__option">
																	${prodList.productName}</div>
																<div
																	class="order-list__item__production__item__info__price">
																	<fmt:formatNumber type="number" maxFractionDigits="3"
																		value="${prodList.optionPrice[0] }" />
																	원 | ${prodList.prodCount[0]}개
																</div>
															</c:if>
															<div
																class="order-list__item__production__item__info__status">${order.deliveryState}</div>
														</div>
													</div>
												</div>
												<div class="order-list__item__production__item__delivery">
													<c:if test="${ prodList.reviewId !=''}">
														<button class="button button--color-blue-inverted button--size-50 button--shape-4 order-list__item__production__item__delivery__btn my-review-btn">리뷰보기</button>
													</c:if>
													<c:if test="${ prodList.reviewId ==''}">
													  <button  class="button button--color-blue-inverted button--size-50 button--shape-4 order-list__item__production__item__delivery__btn review-btn">리뷰작성</button>
													</c:if>
													<input type="hidden" name="imgName"
														value="${prodList.renamedImg}" /> <input type="hidden"
														name="brandName" value="${prodList.productBrand}" /> <input
														type="hidden" name="prodName"
														value="${prodList.productName}" /> <input type="hidden"
														name="prodId" value="${prodList.productId}" /> <input
														type="hidden" name="orderId" value="${order.orderNo}" />
												</div>
											</div>
											<div class="order-list__item__production__item__seller">
												<c:if test="${ prodList.deliveryFee ==0 }">
													<div
														class="order-list__item__production__item__seller__delivery-pay">무료배송</div>
												</c:if>
												<c:if test="${ prodList.deliveryFee > 0 }">
													<div
														class="order-list__item__production__item__seller__delivery-pay">
														배송비
														<fmt:formatNumber type="number" maxFractionDigits="3"
															value="${prodList.deliveryFee}" />
														원
													</div>
												</c:if>
												<div
													class="order-list__item__production__item__seller__brand">
													아이그레몰 <a
														class="order-list__item__production__item__seller__brand__phone">031-567-5678</a>
												</div>
											</div>
										</div>

									</div>
								</c:forEach>
							</div>

						</div>
					</c:forEach>
				</div>





			</div>
			<!-- orderList End -->
		</div>
	</div>
</div>
<!-- contents end-->

<!-- 리뷰쓰기 modal -->
<div class="modal fade" id="writeReviewModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">리뷰쓰기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" name="reviewFrm" enctype="multipart/form-data">
					<div class="form-group review-modal__form__product ">
						<input type="hidden" name="productId" id="prod-id" value="" /> <input
							type="hidden" name="orderNo" id="order-id" value="" /> <input
							type="hidden" name="reviewerId"
							value="${memberLoggedIn.memberId}" /> <img id="rv-img"
							class="review-modal__form__product__image" src="">
						<div class="review-modal__form__product__contents">
							<div class="review-modal__form__product__contents__brand">
								[<em id="brand-name"></em>]
							</div>
							<div class="review-modal__form__product__contents__name"
								id="prod-name"></div>

						</div>
					</div>
					<div class="form-group">
						<label for="starting" class="col-form-label">별점 평가</label>
						<div class="at-rating" style="font-size: 30px; color: #FAC451;">
							<label class="rating-input__star " aria-label="별점 1점"> <input
								name="starPoint" type="radio" value="1"> <i
								class="fa fa-star-o"></i>
							</label> <label class="rating-input__star" aria-label="별점 2점"> <input
								name="starPoint" type="radio" value="2"> <i
								class="fa fa-star-o"></i>
							</label> <label class="rating-input__star" aria-label="별점 3점"> <input
								name="starPoint" type="radio" value="3"> <i
								class="fa fa-star-o"></i>
							</label> <label class="rating-input__star" aria-label="별점 4점"> <input
								name="starPoint" type="radio" value="4"> <i
								class="fa fa-star-o"></i>
							</label> <label class="rating-input__star" aria-label="별점 5점"> <input
								name="starPoint" type="radio" value="5"> <i
								class="fa fa-star-o"></i>
							</label>

						</div>
					</div>
					<div class="form-group">
						<label for="add-pic" class="col-form-label">사진첨부(선택)</label>
						<div class="review-modal__section__explain">사진을 첨부해주세요. (최대
							1장)</div>
						<input type="file" name="upFile" id="file" class="inputfile"
							value="사진 첨부하기">
					</div>

					<div class="form-group">
						<label for="review-text" class="col-form-label">리뷰작성</label>
						<textarea class="form-control" name="reviewContent"
							id="review-text"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="goReview();">완료</button>
			</div>
		</div>
	</div>
</div>
<!-- 리뷰 모달 끝 -->

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
