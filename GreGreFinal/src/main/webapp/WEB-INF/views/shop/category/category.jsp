<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
 <!-- 서브메뉴 -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/subMenu/h-subMenu.css">
 <!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="shop.html">
				   <svg style="margin-bottom: 2.5px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
					width="16px" height="16px"
					viewBox="0 0 172 172"
					style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#b2b2b2"><path d="M86,15.0472l-78.83333,70.9528h21.5v64.5h43v-50.16667h28.66667v50.16667h43v-64.5h21.5z"></path></g></g></svg>
					Home</a> 
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
					<input type="button" class="nav-item is-active" active-color="rebeccapurple" value="전체"/>
						<input type="button" class="nav-item" active-color="rebeccapurple" onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category3=CA1&category1=CA1'" value="분유"/>
						<input type="button" class="nav-item" active-color="rebeccapurple" onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category3=CA2&category1=CA2'" value="이유식"/>
					</c:if>
					
					<c:if test="${category1 eq 'CA3' || category1 eq 'CA4'}">
					<input type="button" class="nav-item is-active" active-color="rebeccapurple" value="전체"/>
						<input type="button" class="nav-item" active-color="rebeccapurple" onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category3=CA3&category1=CA3'" value="기저귀"/>
						<input type="button" class="nav-item" active-color="rebeccapurple" onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category3=CA4&category1=CA4'" value="물티슈"/>
					</c:if>
					<c:if test="${category1 eq 'CA5' || category1 eq 'CA6'}">
					<input type="button" class="nav-item is-active" active-color="rebeccapurple" value="전체"/>
						<input type="button" class="nav-item" active-color="rebeccapurple" onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category3=CA5&category1=CA5'" value="수유"/>
						<input type="button" class="nav-item" active-color="rebeccapurple" onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category3=CA6&category1=CA6'" value="이유용품"/>
					</c:if>
					<c:if test="${category1 eq 'CA7' }">
					<input type="button" class="nav-item is-active" active-color="rebeccapurple" value="전체"/>
						<input type="button" class="nav-item" active-color="rebeccapurple" onclick="location.href='${pageContext.request.contextPath }/shop/category.do?category3=CA7&category1=CA7'" value="목욕용품"/>
					</c:if>
					<span class="nav-indicator"></span>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5">
				<div class="tt-count-desc">총 <span id="totalCnt" class="fc-spot">
				${totalProducts}</span>개의 상품이 있습니다.</div>		
			</div>
		<div class="col-lg-7 col-md-7">
			<div class="product-show-option" style="float:right;">
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
						<div class="col-lg-4 col-sm-6">
							<div class="product-item">
								<div class="pi-pic">
									<img src="${pageContext.request.contextPath }/resources/images/shop/products/product-1.jpg" alt="">
									<div class="icon">
										<img src="https://img.icons8.com/ios/50/000000/hearts.png"
											style="width: 25px;">
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
										<li class="quick-view"><a href="${pageContext.request.contextPath }/shop/product/detail.do">상세보기</a></li>
									</ul>
								</div>
								<div class="pi-text">
									<div class="catagory-name">Towel</div>
									<a href="#">
										<h5>Pure Pineapple</h5>
									</a>
									<div class="product-price">$34.00</div>
								</div>
							</div>
						</div>
						<!-- 적용되는 곳. -->
						<c:forEach items="${list}" var="p"> 
						<c:if test="${p.categoryId eq category1 || p.categoryId eq category2|| category3 eq p.categoryId}">
						<!-- 샘플데이터 -->
							<%-- <p>여기잖아${p.attachList.get(0).originalImg }</p>--%>
							<div class="col-lg-4 col-sm-6">
							<div class="product-item">
								<div class="pi-pic">
									<img src="${p.attachList.get(0).originalImg}" alt="">
									<div class="icon">
										<img src="https://img.icons8.com/ios/50/000000/hearts.png"
											style="width: 25px;">
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
										<li class="quick-view"><a href="${pageContext.request.contextPath }/shop/product/detail.do">상세보기</a></li>
									</ul>
								</div>
								<div class="pi-text">
								<!-- 카테고리별 이름 정해진 곳. -->
								<c:if test="${p.categoryId eq 'CA1'}">		
									<div class="catagory-name">
									분유</div>
									</c:if>
									<c:if test="${p.categoryId eq 'CA2'}">
									<div class="catagory-name">
									이유식</div>
									</c:if>
									<c:if test="${p.categoryId eq 'CA3'}">
									<div class="catagory-name">
									기저귀</div>
									</c:if>
									<c:if test="${p.categoryId eq 'CA4'}">
									<div class="catagory-name">
									물티슈</div>
									</c:if>
									<c:if test="${p.categoryId eq 'CA5'}">
									<div class="catagory-name">
									수유</div>
									</c:if>
									<c:if test="${p.categoryId eq 'CA6'}">
									<div class="catagory-name">
									이유</div>
									</c:if>
									<c:if test="${p.categoryId eq 'CA7'}">
									<div class="catagory-name">
									목욕</div>
									</c:if>
									<a href="#">
										<h5>${p.productName }</h5>
									</a>
									<div class="product-price">${p.price-p.discountPrice }원</div>
								</div>
							</div>
						</div>
						<!-- //샘플데이터 -->
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
				
				
				
				<div id='pageBar'>${pageBar }</div>
				<!-- 페이지 바 시작-->
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"   ><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				<!-- 페이지 바 끝-->
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->
<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>