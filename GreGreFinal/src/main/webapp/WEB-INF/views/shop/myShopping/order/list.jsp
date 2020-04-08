<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
    <!-- 마이쇼핑 주문확인/배송조회 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/orderList.css">


<!-- order list -->
<!-- Breadcrumb Section Begin -->
<style>
.order-container {
    width: 100%;
}
</style>
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
                                    <div class="order-list__menu__list__value">0</div>
                                </div>
                            </a>
                            <a class="order-list__menu__list" href="">
                                <div class="order-list__menu__list__wrap">
                                    <div class="order-list__menu__list__title">결제완료</div>
                                    <div class="order-list__menu__list__value">0</div>
                                </div>
                            </a>
                            <a class="order-list__menu__list" href="">
                                <div class="order-list__menu__list__wrap">
                                    <div class="order-list__menu__list__title">배송준비</div>
                                    <div class="order-list__menu__list__value">0</div>
                                </div>
                            </a>
                            <a class="order-list__menu__list" href="">
                                <div class="order-list__menu__list__wrap">
                                    <div class="order-list__menu__list__title order-list__menu__list__title--focus">배송중
                                    </div>
                                    <div class="order-list__menu__list__value">0</div>
                                </div>
                            </a>
                            <a class="order-list__menu__list" href="">
                                <div class="order-list__menu__list__wrap">
                                    <div class="order-list__menu__list__title">배송완료</div>
                                    <div class="order-list__menu__list__value">0</div>
                                </div>
                            </a>
                            <a class="order-list__menu__list" href="">
                                <div class="order-list__menu__list__wrap">
                                    <div class="order-list__menu__list__title">구매확정</div>
                                    <div class="order-list__menu__list__value">0</div>
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
                                                    <option value="">구매확정</option>
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
                                <div class="order-list__item__title__order">${order.orderNo} | ${order.orderDate }</div>
                                <a class="order-list__item__title__link" href="orderListChenck.html">상세보기</a>
                            </div>
                            <c:forEach var="prodList" items="${order.orderProdList}" varStatus="prodVs">
                            <div class="order-list__item__production">
                                <div class="order-list__item__production__wrap">
                                    <div class="order-list__item__production__item">
                                        <div class="order-list__item__production__item__wrap">
                                            <img class="order-list__item__production__item__img"
                                                src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${prodList.renamedImg}">
                                            <div class="order-list__item__production__item__info">
                                                <div class="order-list__item__production__item__info__wrap order-list__item-container">
                                                    <div class="order-list__item__production__item__info__brand" >[${prodList.productBrand }]</div>
                                                    <a class="order-list__item__production__item__info__name"
                                                        href="/productions/229566/selling">${prodList.productName }</a>
                                                </div>
                                                <div class="order-list__item__production__item__info__wrap order-list_option-container">
                                                    <c:forEach var="optionName" items="${prodList.optionName}" varStatus="optVs">
                                                    <c:if test="${ optionName !=null }">
													<c:set var="optName"
														value="${fn:split(optionName,',') }" />
													<c:set var="optValue"
														value="${fn:split(prodList.optionValue[optVs.index],',') }" />
													<c:if test="${ not empty optName[1] }">
	                                                    <div class="order-list__item__production__item__info__option">${optName[0]} : ${optValue[0]} / ${optName[1]} : ${optValue[1]}</div>

													</c:if>
													<c:if test="${  empty optName[1] }">
													<div class="order-list__item__production__item__info__option">
														${optName[0]} : ${optValue[0]} 

													</div>
													</c:if>
												</c:if>
	                                                    <div class="order-list__item__production__item__info__price">
	                                                        265,000원 | 1개</div>                                         
                                                    </c:forEach>
                                                    <div class="order-list__item__production__item__info__status">구매확정</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-list__item__production__item__delivery">
                                            <button
                                                class="button button--color-blue-inverted button--size-50 button--shape-4 order-list__item__production__item__delivery__btn">재구매</button>
                                            <button
                                                class="button button--color-blue button--size-50 button--shape-4 order-list__item__production__item__delivery__btn">리뷰작성</button>
                                        </div>
                                    </div>
                                    <div class="order-list__item__production__item__seller">
                                        <div class="order-list__item__production__item__seller__delivery-pay">무료배송</div>
                                        <div class="order-list__item__production__item__seller__brand">casamia_본사운영
                                            <a class="order-list__item__production__item__seller__brand__phone">02-1588-3408</a>
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

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	
