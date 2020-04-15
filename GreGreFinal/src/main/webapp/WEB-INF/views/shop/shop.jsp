<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
   <!-- Hero Section Begin -->
   <section class="hero-section">
    <div class="hero-items owl-carousel">
       
        <div class="single-hero-items set-bg" data-setbg="${pageContext.request.contextPath }/resources/images/shop/mainSlider1.png"  style="background-color: #d1efec;">
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
                    <h2>Sale <span>50%</span></h2>
                </div>
            </div>
        </div>
        <div class="single-hero-items set-bg" data-setbg="${pageContext.request.contextPath }/resources/images/shop/mainSlider2.png" style="background-color:#ffeaea;">
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
    <div class="container-fluid">
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
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${pageContext.request.contextPath }/images/shop/products/women-1.jpg" alt="">
                            <div class="sale">Sale</div>
                            <div class="icon">
                                <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                  width="50" height="50"
                                  viewBox="0 0 172 172"
                                  style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
                                <li class="quick-view"><a href="#">상세보기</a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Coat</div>
                            <a href="#">
                                <h5>Pure Pineapple</h5>
                            </a>
                            <div class="product-price">
                                $14.00
                                <span>$35.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${pageContext.request.contextPath }/images/shop/products/women-2.jpg" alt="">
                            <div class="icon">
                                <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                  width="50" height="50"
                                  viewBox="0 0 172 172"
                                  style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
                                <li class="quick-view"><a href="#">상세보기</a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Shoes</div>
                            <a href="#">
                                <h5>Guangzhou sweater</h5>
                            </a>
                            <div class="product-price">
                                $13.00
                            </div>
                        </div>
                    </div>
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${pageContext.request.contextPath }/images/shop/products/women-3.jpg" alt="">
                            <div class="icon">
                                <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                  width="50" height="50"
                                  viewBox="0 0 172 172"
                                  style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
                                <li class="quick-view"><a href="#">상세보기</a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Pure Pineapple</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
                        </div>
                    </div>
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${pageContext.request.contextPath }/images/shop/products/women-4.jpg" alt="">
                            <div class="icon">
                                <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                  width="50" height="50"
                                  viewBox="0 0 172 172"
                                  style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
                                <li class="quick-view"><a href="#">상세보기</a></li> 
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Converse Shoes</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Women Banner Section End -->

<!-- Deal Of The Week Section Begin-->
<section class="deal-of-week set-bg spad" data-setbg="${pageContext.request.contextPath }/resources/images/shop/time-bg.jpg">
    <div class="container">
        <div class="col-lg-6 text-center">
            <div class="section-title">
                <h2>오늘의 딜</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed<br /> do ipsum dolor sit amet,
                    consectetur adipisicing elit </p>
                <div class="product-price">
                    $35.00
                    <span>/ HanBag</span>
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
            <a href="#" class="primary-btn">Shop Now</a>
        </div>
    </div>
</section>
<!-- Deal Of The Week Section End -->
	
<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	
