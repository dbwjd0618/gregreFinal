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
					<c:if test="${ category1 eq 'CA1'|| category2 eq 'CA2'}">
						<span>분유/이유식</span>
					</c:if>
					<c:if test="${ category1 eq 'CA3'|| category2 eq 'CA4'}">
						<span>기저귀/물티슈</span>
					</c:if>
					<c:if test="${ category1 eq 'CA5'|| category2 eq 'CA6'}">
						<span>수유/이유용품</span>
					</c:if>
					<c:if test="${ category1 eq 'CA7'}">
						<span>목욕용품</span>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row product-category-title">
			<div class="col-lg-7">
				<c:if test="${ category1 eq 'CA1'|| category1 eq 'CA2'}">
					<h2 class="sub-title">분유/이유식</h2>
				</c:if>
				<c:if test="${ category1 eq 'CA3'|| category1 eq 'CA4'}">
					<h2 class="sub-title">기저귀/물티슈</h2>
				</c:if>
				<c:if test="${ category1 eq 'CA5'|| category1 eq 'CA6'}">
					<h2 class="sub-title">수유/이유용품</h2>
				</c:if>
				<c:if test="${ category1 eq 'CA7'}">
					<h2 class="sub-title">목욕용품</h2>
				</c:if>
			</div>
			<div class="col-lg-5 product-sub-nav">
				<nav class="nav">
					<c:if test="${category1 eq 'CA1' ||category1 eq 'CA2'}">
						<input type="button" class="nav-item is-active"
							active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA1&category2=CA2'"
							value="전체" />
						<input type="button" class="nav-item" active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA1'"
							value="분유" />
						<input type="button" class="nav-item" active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA2'"
							value="이유식" />
					</c:if>

					<c:if test="${category1 eq 'CA3' || category1 eq 'CA4'}">
						<input type="button" class="nav-item is-active"
							active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA3&category2=CA4'"
							value="전체" />
						<input type="button" class="nav-item" active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA3'"
							value="기저귀" />
						<input type="button" class="nav-item" active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA4'"
							value="물티슈" />
					</c:if>
					<c:if test="${category1 eq 'CA5' || category1 eq 'CA6'}">
						<input type="button" class="nav-item is-active"
							active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA5&category2=CA6'"
							value="전체" />
						<input type="button" class="nav-item" active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA5'"
							value="수유" />
						<input type="button" class="nav-item" active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA6'"
							value="이유용품" />
					</c:if>
					<c:if test="${category1 eq 'CA7' }">
						<input type="button" class="nav-item" active-color="rebeccapurple"
							onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category1=CA7'"
							value="목욕용품" />
					</c:if>
					<span class="nav-indicator"></span>
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
			<div
				class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
				<div class="filter-widget">
					<h4 class="fw-title">브랜드</h4>
					<div class="fw-brand-check">
						<div class="bc-item">
							<label for="bc-calvin"> 아이엠마더 <input type="checkbox"
								id="bc-calvin"> <span class="checkmark"></span>
							</label>
						</div>
						<div class="bc-item">
							<label for="bc-diesel"> 임페리얼XO <input type="checkbox"
								id="bc-diesel"> <span class="checkmark"></span>
							</label>
						</div>
						<div class="bc-item">
							<label for="bc-polo"> 산양분유 <input type="checkbox"
								id="bc-polo"> <span class="checkmark"></span>
							</label>
						</div>
						<div class="bc-item">
							<label for="bc-tommy"> 아기사랑수 <input type="checkbox"
								id="bc-tommy"> <span class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>
				<div class="filter-widget">
					<h4 class="fw-title">가격</h4>
					<div class="filter-range-wrap">
						<div class="range-slider">
							<div class="price-input">
								<input type="text" id="minamount"> <input type="text"
									id="maxamount">
							</div>
						</div>
						<div
							class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
							data-min="0" data-max="98">
							<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
							<span tabindex="0"
								class="ui-slider-handle ui-corner-all ui-state-default"></span>
							<span tabindex="0"
								class="ui-slider-handle ui-corner-all ui-state-default"></span>
						</div>
					</div>
					<a href="#" class="filter-btn">Filter</a>
				</div>
			</div>
			<div class="col-lg-9 order-1 order-lg-2">
				<div class="product-list">
					<div class="row">
						<!-- 적용되는 곳. -->
						<c:forEach items="${totalCategoryList}" var="p">
							<c:if
								test="${p.categoryId eq category1 || p.categoryId eq category2|| category3 eq p.categoryId}">
								<!-- 샘플데이터 -->
								<%-- <p>여기잖아${p.attachList.get(0).originalImg }</p>--%>
								<div class="col-lg-4 col-sm-6">
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
												<li class="w-icon active"><a
													href="${pageContext.request.contextPath }/shop/product/detail.do?productId=${p.productId}">상세보기</a>
												</li>
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
							</c:if>
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
							<li class="page-item"><c:if
									test="${ category2 =='' && category1!='' }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&cPage=${pageStart-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</c:if> <c:if test="${ category2 !='' && category1 =='' }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&cPage=${pageStart-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</c:if> <c:if test="${ category2!='' && category1!='' }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&category2=${category2}&cPage=${pageStart-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</c:if></li>
						</c:if>
				
						<!-- 넘버 -->
						<c:if test="${pageEnd >totalPage }">
							<c:set var="pageEnd" value="${totalPage }" />
						</c:if>
						<c:forEach begin="${pageStart }" end="${pageEnd}"
							varStatus="countVs">
							<c:if test="${ category2 =='' && category1!='' }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&cPage=${countVs.index}">${countVs.index }</a></li>
								<li class="page-item">
							</c:if>
							<c:if test="${ category2 !='' && category1 =='' }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/shop/category.do?category2=${category2}&cPage=${countVs.index}">${countVs.index }</a></li>
								<li class="page-item">
							</c:if>
							<c:if test="${ category2!='' && category1!='' }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&category2=${category2}&cPage=${countVs.index}">${countVs.index }</a></li>
								<li class="page-item">
							</c:if>

							<c:set var="pageNo" value="${countVs.index }" />
						</c:forEach>

						<!-- 다음 페이지 -->
						<c:if test="${pageNo >totalPage }">
							<li><a class="page-link" href="" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a></li>
						</c:if>
						<c:if test="${pageNo <=totalPage }">
							<c:if test="${pageNo == totalPage }">
								<a class="page-link"
									href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</c:if>
							<c:if test="${pageNo < totalPage }">
								<c:if test="${ category2 =='' && category1!='' }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&cPage=${pageEnd+1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a>
								</c:if>
								<c:if test="${ category2 !='' && category1 =='' }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&cPage=${pageEnd+1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a>
								</c:if>
								<c:if test="${ category2!='' && category1!='' }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/shop/category.do?category1=${category1}&category2=${category2}&cPage=${pageEnd+1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a>
								</c:if>
							</c:if>
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