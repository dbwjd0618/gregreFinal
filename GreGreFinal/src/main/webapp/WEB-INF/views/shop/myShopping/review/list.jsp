<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!--myReview-->
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/App-ba29e8bb.css">
<link rel="stylesheet" type="text/css"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/templates-Review-MyHome-MyReviewList-fe78dbee.chunk.css">

<!--product view css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/productView.css"
	type="text/css"></link>
<style>
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
.my-review-list__list__item__product.col-lg-9 {
    padding-left: 25px;
}
.my-review-list__list__item.col-lg-2 {
    padding-right: 40px;
}
button.btn.btn-outline-secondary.review-btn {
    margin-bottom: 10px;
}
</style>
<script>
//리뷰작성하기
 function goReview(){


		 	document.reviewFrm.action='${pageContext.request.contextPath }/shop/review/reviewUpdate.do';
			document.reviewFrm.submit(); 
			 
			alert('리뷰가 수정되었습니다');
}
</script>
<script>
//옵션삭제하기
 function reviewDelete(){

 	 if (confirm("리뷰를 삭제하시겠습니까?")) {

 		$("#deleteFrm").attr("action", "${pageContext.request.contextPath }/shop/review/prodReviewDelete.do").submit();

		alert('리뷰가 삭제되었습니다');
 	 }
 	
}
//리뷰수정 모달 
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
    	var reviewId = $(this).parent().find('input[name=reviewId]').val();
    	var prodContent = $(this).parent().find('input[name=prod-content]').val();
        var imgSrc = "${pageContext.request.contextPath}/resources/upload/shop/productMainImg/"+imgName;
    	$('#prod-id').val(prodId);
    	$('#review-id').val(reviewId);
    	$('#brand-name').text(brandName);
    	$('#prod-name').text(prodName);
    	$('[name=reviewContent]').val(prodContent);
    	$("#rv-img").attr("src",imgSrc);
    	
 
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
<!-- review list -->
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="${pageContext.request.contextPath }/"><svg style="margin-bottom: 2.5px;"
							xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="16px"
							height="16px" viewBox="0 0 172 172" style=" fill:#000000;">
							<g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1"
								stroke-linecap="butt" stroke-linejoin="miter"
								stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
								font-family="none" font-weight="none" font-size="none"
								text-anchor="none" style="mix-blend-mode: normal">
							<path d="M0,172v-172h172v172z" fill="none"></path>
							<g fill="#b2b2b2">
							<path
								d="M86,15.0472l-78.83333,70.9528h21.5v64.5h43v-50.16667h28.66667v50.16667h43v-64.5h21.5z"></path></g></g></svg> Home</a> <a href="./shop.html">MY쇼핑</a> <span>상품리뷰</span>
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

			<!--리뷰 리스트 시작-->
			<div class="col-md-9">
				<div class="row">
					<h4 style="margin-bottom: 20px;">
						<strong>상품리뷰</strong>
					</h4>
				</div>
				<div class="my-review-list__list row"
					style="padding-top: 0px; padding-bottom: 0px;">
					<c:if test="${empty reviewList }">
					<div class="my-review-list__list__item col-lg-12">
					  작성된 리뷰가 없습니다. 리뷰를 자성해주세요!
					  </div>
					</c:if>
					<c:if test="${not empty reviewList }">
						<c:forEach var="review" items="${reviewList}">
							<div class="my-review-list__list__item col-lg-10">
								<div class="my-review-list__list__item__wrap row ">
									<div class="my-review-list__list__item__product col-lg-9">
									<a class="my-review-list__list__item__product__name"
									href="${pageContext.request.contextPath }/shop/product/detail.do?productId=${review.productId}"> [${review.brandName }]
											${review.productName } </a>
										<div class="my-review-list__list__item__product__explain">
											<c:forEach var="optName" items="${review.optionName}"
												varStatus="opN">
												<div>
													<span class="optName">${optName}</span>
												</div>
											</c:forEach>
										</div>
										<!--별점 나오는 곳-->
										<div class="my-review-list__list__item__product__info">
											<div class="at-rating">
												<c:if test="${review.starPoint == 1}">
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</c:if>
												<c:if test="${review.starPoint == 2}">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</c:if>
												<c:if test="${review.starPoint == 3}">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</c:if>
												<c:if test="${review.starPoint == 4}">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</c:if>
												<c:if test="${review.starPoint == 5}">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</c:if>
											</div>
											<!--//별점 나오는 곳-->

											<!--유저 아이디, 날짜, 리뷰 작성된곳 출력-->
											<div class="my-review-list__list__item__product__info__text">${review.reviewerId }
												| ${review.reviewDate }</div>
										</div>
										<!-- 리뷰 내용-->
										<div class="my-review-list__list__item__product__content prod-content">${review.reviewContent }</div>
									</div>
									<!-- 리뷰사진 -->
									<div class="review-img col-lg-3 mb-2">
										<img
											src="${pageContext.request.contextPath}/resources/upload/shop/memberProdReview/${review.renamedImg}"
											alt="">
									</div>
								</div>
							</div>
							<div class="my-review-list__list__item col-lg-2"
								style="border-left: 1px solid rgb(184, 181, 181); text-align:right;">
								<button class="btn btn-outline-secondary review-btn" >수정</button>
								<form id="deleteFrm" method="post" >
								<!-- 수정버튼 -->
								<input type="hidden" name="imgName" value="${review.prodImg}" /> 
								<input type="hidden" name="brandName" value="${review.brandName}" /> 
								<input type="hidden" name="prodName" value="${review.productName}" /> 
								<input type="hidden" name="prodId" value="${review.productId}" /> 
								<input type="hidden" name="reviewId" value="${review.reviewId}" />
								<input type="hidden" name="prod-content" value="${review.reviewContent }" />
								<input type="button" class="btn btn-outline-secondary" onclick="reviewDelete();" value="삭제">
								</form>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<!-- review List 끝 -->
		</div>
	</div>
</div>

<!-- 리뷰 수정  modal -->
<div class="modal fade" id="writeReviewModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">리뷰 수정하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" name="reviewFrm" enctype="multipart/form-data">
					<div class="form-group review-modal__form__product ">
						<input type="hidden" name="productId" id="prod-id" value="" /> <input
							type="hidden" name="reviewId" id="review-id" value="" /> <input
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
