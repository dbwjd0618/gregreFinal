<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!-- Hero Section Begin -->
<section class="hero-section">
	<div class="hero-items owl-carousel">

		<div class="single-hero-items set-bg"
			data-setbg="${pageContext.request.contextPath }/resources/images/shop/mainSlider1.png"
			style="background-color: #d1efec;">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<span>이벤트</span>
						<h2>소중한 내 아이를 위한</h2>
						<h2>분유 인기상품 모음전</h2>
						<p></p>
						<a href="#" class="primary-btn">자세히보기</a>
					</div>
				</div>
				<div class="off-card">
					<h2>
						Sale <span>50%</span>
					</h2>
				</div>
			</div>
		</div>
		<div class="single-hero-items set-bg"
			data-setbg="${pageContext.request.contextPath }/resources/images/shop/mainSlider2.png"
			style="background-color: #ffeaea;">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<span>이벤트</span>
						<h2>프리미엄멤버십</h2>
						<h2>무료가입&쇼핑지원금 증정</h2>
						<p>프리미엄멤버십 특별혜택</p>
						<a href="#" class="primary-btn">자세히보기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->



<!-- Women Banner Section Begin -->
<section class="women-banner spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="product-large set-bg">
					<h2>추천상품</h2>
					<a href="#">더 다양한 상품도 둘러보세요!</a>
				</div>
			</div>
			<div class="col-lg-8 offset-lg-1">
				<div class="filter-control">
					<ul>
						<li class="active"></li>
					</ul>
				</div>
				<div class="product-slider owl-carousel">
					<c:forEach var="prod" items="${recoProdList}" varStatus="vs">
						<div class="product-item">
							<div class="pi-pic">
								<c:if test="${fn:contains(prod.attachList.get(0).originalImg, 'http://')}">
									<img src="${prod.attachList.get(0).originalImg}" alt="">
								</c:if>
								<c:if test="${fn:contains(prod.productId, 'p')}">
									<img
										src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${prod.attachList.get(0).renamedImg}"
										alt="">
								</c:if>
								<c:if test="${prod.discountPrice >0 }">
									<div class="sale">Sale</div>
								</c:if>
							<!-- 	<div class="icon">
									<img src="https://img.icons8.com/ios/50/000000/hearts.png"
										style="width: 25px;">
								</div> -->
								<ul>

									<li class="w-icon active"><a href="#">상세보기</a></li>
								</ul>
							</div>
							<div class="pi-text">
								<!-- 카테고리별 이름 정해진 곳. -->
								<c:if test="${p.categoryId eq 'CA1'}">
									<div class="catagory-name">분유</div>
								</c:if>
								<c:if test="${prod.categoryId eq 'CA2'}">
									<div class="catagory-name">이유식</div>
								</c:if>
								<c:if test="${prod.categoryId eq 'CA3'}">
									<div class="catagory-name">기저귀</div>
								</c:if>
								<c:if test="${prod.categoryId eq 'CA4'}">
									<div class="catagory-name">물티슈</div>
								</c:if>
								<c:if test="${prod.categoryId eq 'CA5'}">
									<div class="catagory-name">수유</div>
								</c:if>
								<c:if test="${prod.categoryId eq 'CA6'}">
									<div class="catagory-name">이유</div>
								</c:if>
								<c:if test="${prod.categoryId eq 'CA7'}">
									<div class="catagory-name">목욕</div>
								</c:if>
								<a
									href="${pageContext.request.contextPath }/shop/product/detail.do?productId=${prod.productId}">
									<h5>${prod.productName }</h5>
								</a>
								<div class="product-price">
									
									<c:set var="discountedPrice"
										value="${prod.price-prod.discountPrice}" />
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${discountedPrice }" />
									원 
									<c:if test="${prod.discountPrice > 0 }">
									<span> 
									<fmt:formatNumber type="number"
											maxFractionDigits="3" value="${prod.price}" />원
									</span>
									</c:if>

								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 추천 상품 끝 -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Women Banner Section End -->

<!-- Deal Of The Week Section Begin-->
<section class="deal-of-week set-bg spad"
	data-setbg="" style="background: rgb(255,250,229);">
	<div class="container">
		<div class="row">
		<div class="col-lg-4">
			<img  style="width:100%; position: absolute; right: -100px;bottom: 20px;" 
			src="${pageContext.request.contextPath }/resources/images/shop/today-deal-img.png"/>
		</div>
		<div class="col-lg-8 text-center">
			<div class="section-title">
				<h2>오늘의 딜</h2>
				<h4>
				[페넬로페] 퍼스트클래스 밴드 기저귀 특별전
				</h4>
				<p></p>
				<div class="product-price">
					40% <span style="font-size:19px;">16,600원</span>
				</div>
			</div>
			<div class="countdown-timer" id="countdown">
				<div class="cd-item">
					<span>7</span>
					<p>일</p>
				</div>
				<div class="cd-item">
					<span>12</span>
					<p>시간</p>
				</div>
				<div class="cd-item">
					<span>40</span>
					<p>분</p>
				</div>
				<div class="cd-item">
					<span>52</span>
					<p>초</p>
				</div>
			</div>
			<a href="${pageContext.request.contextPath }/shop/product/detail.do?productId=p0000354" class="primary-btn">Shop Now</a>
		</div>
		</div>
	</div>
</section>
<!-- Deal Of The Week Section End -->

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
