<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!-- 서브메뉴 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/subMenu/h-subMenu.css">
<style>
.pi-pic {
	height: 265px;
}

button.heart-icon {
	border: 0;
	background-color: transparent;
}
</style>
<script>
$(function(){
	var keyword = '${keyword}';
	$('[name=keyword]').val(keyword);
});
</script>
<script>
//찜하기 등록 및 업데이트
function goWish(productId, t){
	<c:if test="${empty memberLoggedIn}">
	alert("로그인 후 이용가능합니다.");
	return;
	</c:if>
	

	var objParams = {
			"productId" : productId
	} 
	$.ajax({
		url: "${pageContext.request.contextPath}/shop/wish/wishUpdate.do",
		type: "POST",
		dataType : "json",
		data: objParams,
		success: function (data) {
			
			if( data.wishCheck == 'Y'){
				console.log("레드");
				$(t).find('.heart-img').remove();
				var redHeart = '<img class="heart-img" src="${pageContext.request.contextPath }/resources/images/shop/icon/heart-icon-p.png" style="width: 30px;">';
				$(t).append(redHeart);
			}else if( data.wishCheck == 'N'){
				console.log("화이트");
				$(t).find('.heart-img').remove();
				var whiteHeart = '<img  class="heart-img" src="${pageContext.request.contextPath }/resources/images/shop/icon/heart-icon.png" style="width: 30px;">';
				$(t).append(whiteHeart); 
			}
		
				
		},
		error:(x,s,e)=>{
			console.log(x,s,e);
		}
	}); 
}
</script>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="shop.html"> <svg style="margin-bottom: 2.5px;"
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
								d="M86,15.0472l-78.83333,70.9528h21.5v64.5h43v-50.16667h28.66667v50.16667h43v-64.5h21.5z"></path></g></g></svg>
						Home
					</a>
				</div>
			</div>
		</div>
		<div class="row product-category-title">
			<div class="col-lg-7">
				
			</div>
			<div class="col-lg-5 product-sub-nav">
				<nav class="nav">
	
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5">
				<div class="tt-count-desc">
					총 <span id="totalCnt" class="fc-spot"> ${totalAllProd}</span>개의 상품이
					있습니다.
				</div>
			</div>
			<div class="col-lg-7 col-md-7">
				<div class="product-show-option" style="float: right;">
					<div class="select-option">
						<select class="sorting">
							<option value="" selected>인기상품순</option>
							<option value="">신상품순</option>
							<option value="">낮은가격순</option>
							<option value="">높은가격순</option>
							<option value="">상품평순</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->
<!-- Product Shop Section Begin -->
<section class="product-shop spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 order-1 order-lg-2">
				<div class="product-list">
					<div class="row">
						<!-- 적용되는 곳. -->
						<c:forEach items="${totalCategoryList}" var="p">		
								<!-- 샘플데이터 -->
								<%-- <p>여기잖아${p.attachList.get(0).originalImg }</p>--%>
								<div class="col-lg-3 col-sm-6">
									<div class="product-item">
										<div class="pi-pic">
											<c:if
												test="${fn:contains(p.attachList.get(0).originalImg, 'http://')}">
												<img src="${p.attachList.get(0).originalImg}" alt="">
											</c:if>
											<c:if test="${fn:contains(p.productId, 'p')}">
												<img
													src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${p.attachList.get(0).renamedImg}"
													alt="">
											</c:if>
											<div class="icon">
												<c:if test="${ p.wish !=null }">
													<c:forEach var="wish" items="${wishList }">
														<c:if
															test="${ wish.wishCheck eq 'Y' && wish.productId eq p.productId}">
																<button class="heart-icon"
																onclick="goWish('${p.productId}',this);">
																<img class="heart-img"
																	src="${pageContext.request.contextPath }/resources/images/shop/icon/heart-icon-p.png"
																	style="width: 30px;">
															</button>
														</c:if>
														<c:if
															test="${ wish.wishCheck eq 'N'  && wish.productId eq p.productId}">
																<button class="heart-icon"
																onclick="goWish('${p.productId}',this);">
																<img class="heart-img"
																	src="${pageContext.request.contextPath }/resources/images/shop/icon/heart-icon.png"
																	style="width: 30px;">
															</button>
														</c:if>
												
													</c:forEach>
													<c:if
														test="${ wish.wishCheck eq 'N'  && wish.productId != p.productId}">
														<button class="heart-icon"
															onclick="goWish('${p.productId}',this);">
															<img class="heart-img"
																src="${pageContext.request.contextPath }/resources/images/shop/icon/heart-icon.png"
																style="width: 30px;">
														</button>
													</c:if>
												</c:if>
												<c:if test="${p.wish ==null }">
													<button class="heart-icon"
														onclick="goWish('${p.productId}',this);">
														<img class="heart-img"
															src="${pageContext.request.contextPath }/resources/images/shop/icon/heart-icon.png"
															style="width: 30px;">
													</button>
												</c:if>
											</div>
											<ul>
												<li class="w-icon active"><a href="#"><svg
															style="width: 18px; height: 16px; margin-bottom: 3px;"
															xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
															width="50" height="50" viewBox="0 0 172 172"
															style=" fill:#000000;">
													<g fill="none" fill-rule="nonzero" stroke="none"
																stroke-width="1" stroke-linecap="butt"
																stroke-linejoin="miter" stroke-miterlimit="10"
																stroke-dasharray="" stroke-dashoffset="0"
																font-family="none" font-weight="none" font-size="none"
																text-anchor="none" style="mix-blend-mode: normal">
													<path d="M0,172v-172h172v172z" fill="none"></path>
													<g fill="#ffffff">
													<path
																d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
												<li class="quick-view"><a
													href="${pageContext.request.contextPath }/shop/product/detail.do?productId=${p.productId}">상세보기</a></li>
											</ul>
										</div>
										<div class="pi-text">
											<!-- 카테고리별 이름 정해진 곳. -->
											<c:if test="${p.categoryId eq 'CA1'}">
												<div class="catagory-name">분유</div>
											</c:if>
											<c:if test="${p.categoryId eq 'CA2'}">
												<div class="catagory-name">이유식</div>
											</c:if>
											<c:if test="${p.categoryId eq 'CA3'}">
												<div class="catagory-name">기저귀</div>
											</c:if>
											<c:if test="${p.categoryId eq 'CA4'}">
												<div class="catagory-name">물티슈</div>
											</c:if>
											<c:if test="${p.categoryId eq 'CA5'}">
												<div class="catagory-name">수유</div>
											</c:if>
											<c:if test="${p.categoryId eq 'CA6'}">
												<div class="catagory-name">이유</div>
											</c:if>
											<c:if test="${p.categoryId eq 'CA7'}">
												<div class="catagory-name">목욕</div>
											</c:if>
											<a href="#">
												<h5>${p.productName }</h5>
											</a>
											<div class="product-price">
												<fmt:formatNumber type="number" maxFractionDigits="3"
													value="${p.price-p.discountPrice}" />
												원
											</div>
										</div>
									</div>
								</div>
								<!-- //샘플데이터 -->
						</c:forEach>
					</div>
				</div>


				<!-- 페이지 바 시작-->
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<!-- 이전 페이지 -->
						<c:if test="${pageNo ==1 }">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
						</c:if>
						<c:if test="${pageNo >1 }">
							<li class="page-item">
									<a class="page-link"
										href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&cPage=${pageStart-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
							</li>
						</c:if>
						<!-- 넘버 -->
						<c:if test="${pageEnd >totalPage }">
							<c:set var="pageEnd" value="${totalPage }" />
						</c:if>
						<c:forEach begin="${pageStart }" end="${pageEnd}"
							varStatus="countVs">
						
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }shop/searchList.do?keyword=${keyword}&cPage=${countVs.index}">${countVs.index }</a></li>
								<li class="page-item">	

							<c:set var="pageNo" value="${countVs.index }" />
						</c:forEach>

						<!-- 다음 페이지 -->
						<c:if test="${pageNo >totalPage }">
							<li><a class="page-link" href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a></li>
						</c:if>
						<c:if test="${pageNo <=totalPage }">
								<a class="page-link"
									href="${pageContext.request.contextPath }shop/searchList.do?keyword=${keyword}&cPage=${pageEnd+1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
						</c:if>
					</ul>
				</nav>
				<!-- 페이지 바 끝-->
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->
<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />