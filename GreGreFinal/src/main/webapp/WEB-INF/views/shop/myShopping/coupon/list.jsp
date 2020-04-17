<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!--coupon css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/coupon.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre&family=Old+Standard+TT&display=swap"
	rel="stylesheet">
<style>
h2.dis-p {
	position: relative;
	top: -38px;
	left: 20px;
	color: rgb(67, 67, 69);
	font-family: 'Frank Ruhl Libre', serif !important;
}

.coupon-item {
	background-image:
		url('${pageContext.request.contextPath }/resources/images/shop/coupon/event_coupon.png');
	background-size: cover;
	height: 80%;
	text-align: center;
}

.cou-cont {
	padding-left: 60px;
}
.used-coupon{
	background-image: url('${pageContext.request.contextPath }/resources/images/shop/coupon/used-coupon.png') !important;
}
.cou-title{
    border-bottom: 1px solid;
    padding-bottom: 6px;
}
</style>
<!-- coupon list -->
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="${pageContext.request.contextPath }/shop/shop.do">
					<svg style="margin-bottom: 2.5px;"
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
					 Home</a> <a href="./shop.html">MY쇼핑</a> <span>보유 쿠폰</span>
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
			<!-- coupon List Begin -->
			<div class="col-md-9">
				<div class="row">
					<h4 style="margin-bottom: 20px;">
						<strong>보유 쿠폰</strong>
					</h4>
					<div style="margin-left: auto; margin-top: 20px;">
						* <span>모든 쿠폰은 타 쿠폰과 중복사용이 불가능합니다.</span>
					</div>
				</div>
				<div class="row" style="margin-bottom: 90px !important;">
					<div class="col-md-12 cou-title">
				    <h5>사용가능 쿠폰</h5>
				    </div>
					<c:if test="${empty myCouponList }">
						<div class="col-6 col-md-6">
							<div style="margin-bottom:120px; margin-top:60px; text-align:center; font-size:30px;">사용가능한 쿠폰이 없습니다.</div>
						</div>
					</c:if>
					<!-- 쿠폰이 있을 경우 -->
					<c:if test="${not empty myCouponList }">
						<!--  쿠폰 시작 -->
						<c:forEach var="coupon" items="${myCouponList }" varStatus="vs">
						<%-- <c:if test="${coupon.couponState eq 'N'}">
							<div class=" col-md-12">
								<div style="margin-bottom:120px; margin-top:60px; text-align:center; font-size:30px;">사용가능한 쿠폰이 없습니다.</div>
							</div>
						</c:if>  --%>
							<c:if test="${coupon.couponState eq 'Y' }">
								<div class="col-6 col-md-6">
									<div class="coupon-item">
										<div class="cou-cont">
											<div class="coupon-item__title coupon-item__title">${coupon.couponName}</div>

											<div class="coupon-item__info">
												<div class="coupon-item__info_">
													* <span>${coupon.couponDetail }</span><br> * <span><fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${coupon.maxValue }" />이상 구매시</span>
												</div>
											</div>
											<div class="coupon-item__due-date">
												<span> ${fn:substring(coupon.expireDate,0,4) }년
													${fn:substring(coupon.expireDate,5,7) }월
													${fn:substring(coupon.expireDate,8,10) }일 까지</span>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- 쿠폰 끝-->
					</c:if>
				</div>
				<div class="row">
				<div class="col-md-12 cou-title">
				  <h5>종료된 쿠폰</h5>
				  </div>
					<!-- 쿠폰이 있을 경우 -->
					<c:if test="${not empty myCouponList }">
						<!--  쿠폰 시작 -->
						<c:forEach var="coupon" items="${myCouponList }" varStatus="vs">
						<!-- 사용불가 쿠폰 -->
							<c:if test="${coupon.couponState eq 'N' }">
								<div class="col-6 col-md-6">
									<div class="coupon-item used-coupon">
										<div class="cou-cont">
											<div class="coupon-item__title coupon-item__title">${coupon.couponName}</div>

											<div class="coupon-item__info">
												<div class="coupon-item__info_">
												
												</div>
											</div>
											<div class="coupon-item__due-date">
												<span> ${fn:substring(coupon.expireDate,0,4) }년
													${fn:substring(coupon.expireDate,5,7) }월
													${fn:substring(coupon.expireDate,8,10) }일 까지</span>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- 쿠폰 끝-->
					</c:if>
				</div>



			</div>
			<!-- couponList End -->


		</div>
	</div>
</div>
<!--Section End -->



<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
