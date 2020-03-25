<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
   <!--coupon css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/coupon.css" type="text/css">
<!-- coupon list -->
<!-- Breadcrumb Section Begin -->
   <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="${pageContext.request.contextPath }/"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">MY쇼핑</a>
                        <span>주문확인/배송조회</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class ="row">
			<div class="col-md-12 mt-4 pt-4">
				<h1 class="mb-3 font-weight-bold text-teal ">MY쇼핑</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar" src="${pageContext.request.contextPath }/resources/images/myPage/user.png" />
							<div class="profile__name">user123</div>
						</div>
					</div>
					<div class="sidebar__middle">
						<div class="profile side__profile _3fftNQzxHO">
							<ul>
								<li>
									주문·배송<a href="${pageContext.request.contextPath }/shop/myShopping/order/list.do" class="_2XiEZGqw1K" ><em>0</em>건</a>
								</li>
								<li>
									보유 쿠폰<a href="${pageContext.request.contextPath }/shop/myShopping/coupon/list.do" class="_2XiEZGqw1K" ><em>2</em>장</a>
								</li>
								<li>
									포인트<a href="#" class="_2XiEZGqw1K " ><em>5000</em>p</a>
								</li>
							</ul>
						</div>
					
					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/order/list.do">
							<div class="menu__title">주문확인/배송조회</div>
                            </a> 
                            <a class="menu__item" href="${pageContext.request.contextPath }/shop/myShopping/wish/list.do">
                            <div class="menu__title">관심상품</div>
                            </a> 
                            <a class="menu__item"href="${pageContext.request.contextPath }/shop/myShopping/event/list.do">
                            <div class="menu__title">이벤트참여내역</div>
                            </a>
                            <a class="menu__item" href="${pageContext.request.contextPath }/shop/myShopping/review/list.do">
								<div class="menu__title">상품리뷰</div>
                            </a> 
                            <a class="menu__item" href="${pageContext.request.contextPath }/shop/myShopping/QnA/list.do">
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
                </div>
                <div class="row">
                    <div class="col-6 col-md-4">
                        <div class="coupon-item">
                            <div class="coupon-item__title coupon-item__title">첫 구매 10% 할인쿠폰</div>
                            <div class="coupon-item__valuation">
                               <img src="${pageContext.request.contextPath }/resources/images/shop/coupon/first_coupon.png" alt="">
                            </div>
                            <div class="coupon-item__info">
                                <div class="coupon-item__info_">* <span>전상품 할인쿠폰</span></div>
                                <div class="coupon-item__info_">* <span>타 쿠폰과 중복사용 불가능</span></div>
                            </div>
                            <div class="coupon-item__due-date"><span>2020년 06월 30일까지</span></div>
                            
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                            <div class="coupon-item">
                                <div class="coupon-item__title coupon-item__title">아이그레몰 오픈 이벤트<br> 10% 할인쿠폰</div>          
                                <div class="coupon-item__valuation">
                                   <img src="${pageContext.request.contextPath }/resources/images/shop/coupon/open_coupon.png" alt="">
                                </div>
                                <div class="coupon-item__info">
                                    <div class="coupon-item__info_">* <span>전상품 할인쿠폰</span></div>
                                    <div class="coupon-item__info_">* <span>타 쿠폰과 중복사용 불가능</span></div>
                                </div>
                                <div class="coupon-item__due-date"><span>2020년 06월 30일까지</span></div>
                            </div>
                        </div>
                 
            
                </div>



            </div>
            <!-- couponList End -->


        </div>
    </div>
 </div>
    <!--Section End -->



<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	
