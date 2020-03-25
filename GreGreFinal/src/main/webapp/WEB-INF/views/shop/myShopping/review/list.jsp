<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!--myReview--> 
    <link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/App-ba29e8bb.css">
    <link rel="stylesheet" type="text/css"
      href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/templates-Review-MyHome-MyReviewList-fe78dbee.chunk.css">
    
<!-- review list -->
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="${pageContext.request.contextPath }/"><i
						class="fa fa-home"></i> Home</a> <a href="./shop.html">MY쇼핑</a> <span>주문확인/배송조회</span>
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
							<div class="profile__name">user123</div>
						</div>
					</div>
					<div class="sidebar__middle">
						<div class="profile side__profile _3fftNQzxHO">
							<ul>
								<li>주문·배송<a
									href="${pageContext.request.contextPath }/shop/myShopping/order/list.do"
									class="_2XiEZGqw1K"><em>0</em>건</a>
								</li>
								<li>보유 쿠폰<a
									href="${pageContext.request.contextPath }/shop/myShopping/coupon/list.do"
									class="_2XiEZGqw1K"><em>2</em>장</a>
								</li>
								<li>포인트<a href="#" class="_2XiEZGqw1K "><em>5000</em>p</a>
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
				</div>
				<div class="my-review-list__list row"
					style="padding-top: 0px; padding-bottom: 0px;">
					<div class="my-review-list__list__item col-lg-12">
						<div class="my-review-list__list__item__wrap">
							<div class="my-review-list__list__item__product">
								<a class="my-review-list__list__item__product__name"
									href="/productions/29029/selling"> [2단계] 아이엠마더 2단계 800g *
									3캔 </a>
								<div class="my-review-list__list__item__product__explain"></div>
								<!--별점 나오는 곳-->
								<div class="my-review-list__list__item__product__info">
									<span class="my-review-list__list__item__product__info__star"
										aria-label="별점 4.5점"> <svg fill="#35C5F0" width="1em"
											height="1em" preserveAspectRatio="xMidYMid meet"
											viewBox="0 0 16 16">
                  <defs>
                    <path id="star-path-1.000"
												d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z">
                    </path>
                    <clipPath id="star-clip-1.000">
                      <rect x="0" y="0" width="16" height="16"></rect>
                    </clipPath>
                  </defs>
                  <use xlink:href="#star-path-1.000" fill="#DBDBDB"></use>
                  <use clip-path="url(#star-clip-1.000)"
												xlink:href="#star-path-1.000"></use>
                </svg>
										<svg fill="#35C5F0" width="1em" height="1em"
											preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
                  <defs>
                    <path id="star-path-1.000"
												d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z">
                    </path>
                    <clipPath id="star-clip-1.000">
                      <rect x="0" y="0" width="16" height="16"></rect>
                    </clipPath>
                  </defs>
                  <use xlink:href="#star-path-1.000" fill="#DBDBDB"></use>
                  <use clip-path="url(#star-clip-1.000)"
												xlink:href="#star-path-1.000"></use>
                </svg>
										<svg fill="#35C5F0" width="1em" height="1em"
											preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
                  <defs>
                    <path id="star-path-1.000"
												d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z">
                    </path>
                    <clipPath id="star-clip-1.000">
                      <rect x="0" y="0" width="16" height="16"></rect>
                    </clipPath>
                  </defs>
                  <use xlink:href="#star-path-1.000" fill="#DBDBDB"></use>
                  <use clip-path="url(#star-clip-1.000)"
												xlink:href="#star-path-1.000"></use>
                </svg>
										<svg fill="#35C5F0" width="1em" height="1em"
											preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
                  <defs>
                    <path id="star-path-1.000"
												d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z">
                    </path>
                    <clipPath id="star-clip-1.000">
                      <rect x="0" y="0" width="16" height="16"></rect>
                    </clipPath>
                  </defs>
                  <use xlink:href="#star-path-1.000" fill="#DBDBDB"></use>
                  <use clip-path="url(#star-clip-1.000)"
												xlink:href="#star-path-1.000"></use>
                </svg>
										<svg fill="#35C5F0" width="1em" height="1em"
											preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
                  <defs>
                    <path id="star-path-0.500"
												d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z">
                    </path>
                    <clipPath id="star-clip-0.500">
                      <rect x="0" y="0" width="8" height="16"></rect>
                    </clipPath>
                  </defs>
                  <use xlink:href="#star-path-0.500" fill="#DBDBDB"></use>
                  <use clip-path="url(#star-clip-0.500)"
												xlink:href="#star-path-0.500"></use>
                </svg></span>
									<!--//별점 나오는 곳-->

									<!--유저 아이디, 날짜, 리뷰 작성된곳 출력-->
									<div class="my-review-list__list__item__product__info__text">test123
										| 2020.03.12 | 아이그레몰 리뷰</div>
								</div>
								<!-- 리뷰 내용-->
								<div class="my-review-list__list__item__product__content">Lorem
									ipsum dolor sit amet consectetur!</div>
							</div>
							<div>
								<!-- 수정버튼 -->
								<button class="btn btn-outline-secondary">수정</button>
								<div class="btn btn-outline-secondary">삭제</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- review List 끝 -->
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
