<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/event.css" type="text/css">
 <!-- Breadcrumb Section Begin -->
  <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./home.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">Shop</a>
                        <span>event</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
        <!--event begin-->
        <!-- 이벤트 공지 -->
        <div class="row">
            <div class="col mb-5" style=" margin-top: 50px;">
                    <h2 class="sub-title">이벤트</h2>
            </div>

        </div>
        <div class="row">

            <div class="evt-grid-wrap">
                
                    <div class="gcol">
                        <div class="evt-sm-banner">
                            <ul class="fn-evt-banner-2 slick-initialized slick-slider">
                                
                                    <div aria-live="polite" class="slick-list">
                                    	<div class="slick-track" style="opacity: 1; width: 550px; transform: translate3d(0px, 0px, 0px);" role="listbox"><li class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 550px;" tabindex="-1" role="option" aria-describedby="slick-slide10">
                                        <a href="/exhibition/form/7" tabindex="0"><img src="https://shoppingcdn.namyangi.com/attach/site/2020/202001/f30dde76-0fbc-4df5-9f10-e0f204011017.png" alt="남양분유 인기상품 모음전"></a>
                                    </li></div></div>
                                
                            </ul>
                        </div>
                    </div>
                
                    
                    <div class="gcol">
                        <div class="evt-notice-box">
                            <div class="fleft">
                                <h3 class="ctitle">이벤트 결과</h3>
                            </div>
                            <div class="fright">
                                <div class="notice-list">
                                        <ul>
                                             <li>
                                                <a href="${pageContext.request.contextPath }/shop/event/noticeDetail.do" class="item">
                                                    <span class="ntit">프리미엄 상품 구매시 팸퍼스 기저귀 100% 증정 이벤트 감자퐁 당첨자발표</span>
                                                    <span class="ndate">20.02.19</span>
                                                </a>
                                            </li>
                                                
                                        </ul>					
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--이벤트공지 끝-->
        </div>
        <div class="row">
                <div class="col mb-3" style=" margin-top: 90px;">
                        <h2 class="sub-title">진행중인 이벤트</h2>
                </div>
    
            </div>
        <div class="row">
            <!--이벤트 리스트-->
            <div class="event-list">
                	
                            <ul>
                            <c:forEach items="${list }" var="l">
                                    <li class="item">
                                        <a href="${pageContext.request.contextPath }/shop/event/detail.do?eventNo=${l.eventNo}" class="evt">
                                            <span class="evt-img">
                                                <img src="https://shoppingcdn.namyangi.com/attach/item/2020/202002/21520ab5-fa54-417a-a174-d5f64f5d805b.png" onerror="this.src='/resources/images/common/evt_noimg_560.jpg'" alt="[케어비몰]새로운 이유식 케어비 사전예약 공유이벤트">
                                            </span>
                                            <span class="evt-info">
                                                <span class="evt-title">${l.eventTitle }</span>
                                                <span class="evt-list">
                                                    <span class="evt-li">
                                                        <span class="el-title">기간</span>
                                                                                                        
                                                        <span class="el-cont">${l.eventStart } ~ ${l.eventEnd }</span>
                                                    </span>
                                                </span>
                                                <span class="evt-sticky">
                                                    
                                                        <span class="sticky black">댓글</span>
                                                    
                                                    <span class="sticky red">D-3 ====${l.eventEnd-l.eventStart }</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    </c:forEach>
                                
                                    <li class="item">
                                        <a href="javascript:cl.page.getDetail(19);" class="evt">
                                            <span class="evt-img">
                                                <img src="https://shoppingcdn.namyangi.com/attach/item/2020/202002/001533e8-94d9-4f47-af89-f1a85a828ce8.png" onerror="this.src='/resources/images/common/evt_noimg_560.jpg'" alt="[케어비몰]첫만남 첫소개 첫-사전예약!">
                                            </span>
                                            <span class="evt-info">
                                                <span class="evt-title">[그레몰]이벤트2</span>
                                                <span class="evt-list">
                                                    <span class="evt-li">
                                                        <span class="el-title">기간</span>
                                                        
                                                        
                                                        <span class="el-cont">20.03.02 ~ 20.03.24</span>
                                                    </span>
                                                </span>
                                                <span class="evt-sticky">
                                                    
                                                        <span class="sticky black">댓글</span>
                                                    
                                                        <span class="sticky red">D-16</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                
                                    <li class="item">
                                        <a href="javascript:cl.page.getDetail(17);" class="evt">
                                            <span class="evt-img">
                                                <img src="https://shoppingcdn.namyangi.com/attach/item/2020/202002/dc3d19ad-2d37-4931-aeda-4c732ff71a32.png" onerror="this.src='/resources/images/common/evt_noimg_560.jpg'" alt="남양몰 프리미엄멤버십 무료가입&amp;쇼핑지원금 증정이벤트">
                                            </span>
                                            <span class="evt-info">
                                                <span class="evt-title">[그레몰]이벤트3</span>
                                                <span class="evt-list">
                                                    <span class="evt-li">
                                                        <span class="el-title">기간</span>
                                                        
                                                        
                                                        <span class="el-cont">20.02.19 ~ 20.04.05</span>
                                                    </span>
                                                </span>
                                                <span class="evt-sticky">
                                                    
                                                        <span class="sticky black">댓글</span>
                                                    
                                                    <span class="sticky red">D-16</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                
                            </ul>
                        
                        
                
        		</div>
			</div>
        <!--event end-->
    	</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	