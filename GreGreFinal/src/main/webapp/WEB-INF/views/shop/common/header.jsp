<%@page import="java.util.ArrayList"%>
<%@page import="kh.mclass.IgreMall.shopMember.model.vo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>igre mall</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/bootstrap.min.css"
	type="text/css">
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/font-awesome.min.css" type="text/css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/themify-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/shopStyle.css"
	type="text/css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--myPage-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/myPage/myPage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/orderList.css">

<!-- Js Plugins -->
<script
	src="${pageContext.request.contextPath }/resources/js/shop/jquery-3.3.1.min.js"></script>

<!--jsrender.min-->
<script
	src="${pageContext.request.contextPath }/resources/js/jsrender.min.js"></script>
<script src="https://www.jsviews.com/download/jsrender.min.js"></script>

</head>
<style>
img.prod-main-img {
	width: 100px;
}

.info-con {
	font-size: 14px;
	font-height: 10px;
}

span.deli-fee {
	color: black;
	font-weight: 400;
	font-size: 0.9em;
}
</style>
<script>
	function goSearch() {

		document.searchFrm.action = '${pageContext.request.contextPath }/shop/searchList.do';
		document.searchFrm.submit();

	}
</script>
<script>
	function hCartSubmit(index) {
		//장바구니 구매하기
		if (index == 1) {
			document.hCartFrm.action = '${pageContext.request.contextPath }/shop/order/checkOut.do';
			document.hCartFrm.submit();

		}
	}
</script>
<!-- Breadc
<body>
	<!-- 아이그레몰 header -->
<!-- Header Section Begin -->
<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="ht-left">
				<div class="mail-service"></div>
			</div>
			<div class="ht-right">
				<a href="${pageContext.request.contextPath }/" class="login-panel">아이그레
					<img src="/Igre/resources/images/index/circled-right-icoon.png"
					width="17px" style="margin-bottom: 1px;" alt="">
				</a>
				<!--로그인 -->
				<c:if test="${memberLoggedIn == null }">
					<a href="${pageContext.request.contextPath }/member/login.do"
						class="login-panel">로그인</a>
				</c:if>
				<c:if test="${memberLoggedIn != null }">
					<!-- 로그아웃 -->
					<a href="${pageContext.request.contextPath }/member/logout.do"
						class="login-panel">로그아웃</a>
					<!--마이쇼핑 -->
					<a
						href="${pageContext.request.contextPath }/shop/myShopping/order/list.do"
						class="login-panel">MY쇼핑</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="inner-header">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="logo">
						<a href="${pageContext.request.contextPath }/shop/shop.do"> <img
							src="${pageContext.request.contextPath }/resources/images/logo/igre_mall_logo.png"
							alt="">
						</a>
					</div>
				</div>

				<div class="col-lg-7 col-md-7" style="padding-top: 5px;">
					<!--검색시작 -->
					<form name="searchFrm" method='GET' enctype="multipart/form-data">
						<div class="advanced-search">
							<div class="input-group">
								<input type="text"
									onKeyPress="if(event.keyCode==13) { 
                            	console.log('이거는='+$('[name=keyword]').val());
                            	if($('[name=keyword]').val()== ''){
	                            	alert('검색어를 입력하세요');
	                            	return false; 
                            	}else{
	           						document.searchFrm.action='${pageContext.request.contextPath }/shop/searchList.do';
	                				document.searchFrm.submit(); 
                            	}
                            	return false; }"
									name="keyword" placeholder="What do you need?">
								<button type="button">
									<svg style="padding-bottom: 4px;"
										xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20"
										height="20" viewBox="0 0 172 172" style=" fill:#000000;"
										onclick="goSearch();">
											<g fill="none" fill-rule="nonzero" stroke="none"
											stroke-width="1" stroke-linecap="butt"
											stroke-linejoin="miter" stroke-miterlimit="10"
											stroke-dasharray="" stroke-dashoffset="0" font-family="none"
											font-weight="none" font-size="none" text-anchor="none"
											style="mix-blend-mode: normal">
											<path d="M0,172v-172h172v172z" fill="none"></path>
											<g fill="#ffffff">
											<path
											d="M72.24,10.32c-32.33062,0 -58.48,26.14938 -58.48,58.48c0,32.33063 26.14938,58.48 58.48,58.48c11.54281,0 22.22563,-3.38625 31.2825,-9.1375l42.2475,42.2475l14.62,-14.62l-41.71,-41.6025c7.49813,-9.83625 12.04,-22.02406 12.04,-35.3675c0,-32.33062 -26.14937,-58.48 -58.48,-58.48zM72.24,24.08c24.76531,0 44.72,19.95469 44.72,44.72c0,24.76531 -19.95469,44.72 -44.72,44.72c-24.76531,0 -44.72,-19.95469 -44.72,-44.72c0,-24.76531 19.95469,-44.72 44.72,-44.72z"></path></g></g></svg>
								</button>
							</div>
						</div>
					</form>
					<!--검색끝 -->
				</div>
				<div class="col-lg-2 text-right col-md-2">
					<c:if test="${memberLoggedIn != null }">
						<ul class="nav-right">

							<li class="heart-icon"><a
								href="${pageContext.request.contextPath }/shop/myShopping/wish/list.do">
									<img src="https://img.icons8.com/ios/50/000000/hearts.png"
									width="25px"> <span>${wishListConut }</span>
							</a></li>
							<li class="cart-icon"><a
								href="${pageContext.request.contextPath }/shop/myShopping/cart.do">
									<img
									src="https://img.icons8.com/ios/50/000000/shopping-bag.png"
									width="20px"> <span>${cartListCount }</span>
							</a>
						<div class="cart-hover">
									<div class="select-items">
										<form name="hCartFrm" method='POST'
											enctype="multipart/form-data">
											<table>
												<tbody>
													<c:if test="${empty cartList }">
														<tr>
															<td class="si-pic"><img
																src="img/select-product-1.jpg" alt=""></td>
															<td class="si-text">
																<div class="product-selected">장바구니가 비어있습니다.</div>
															</td>
															<td class="si-close"><i class="ti-close"></i></td>
														</tr>
													</c:if>
													<c:if test="${not empty cartList }">
														<c:forEach var="cart" items="${cartList}" varStatus="vs">

															<tr style="border-bottom: 0;">
																<td class="si-pic"><c:if
																		test="${fn:contains(cart.product.attachList.get(0).originalImg, 'http://')}">
																		<img class="prod-main-img"
																			src="${cart.product.attachList.get(0).originalImg}"
																			alt="">
																	</c:if> <c:if
																		test="${fn:contains(cart.product.productId, 'p')}">
																		<c:forEach var="img"
																			items="${cart.product.attachList }">
																			<c:if test="${img.imgType eq 'R' }">
																				<img class="prod-main-img"
																					src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${img.renamedImg}"
																					alt="">
																			</c:if>
																		</c:forEach>
																	</c:if></td>
																<td class="si-text">
																	<div class="product-selected">
																		<input type="hidden" name="check"
																			value="${cart.cartId }">
																		<h6>[${cart.product.brandName }]</h6>
																		<h6>${cart.product.productName }</h6>
																		<c:if test="${not empty cart.optionId }">
																			<c:forEach items="${cart.optionList}" var="optList"
																				varStatus="optVs">
																				<input type="hidden" name="optionId"
																					value="${optList.optionId}">
																				<c:set var="optName"
																					value="${fn:split(optList.optionName,',') }" />
																				<c:set var="optValue"
																					value="${fn:split(optList.optionValue,',') }" />
																				<div class=" fn-count">
																					<ul class="">
																						<li><span class="info-con"> <c:forEach
																									items="${optName }" var="optNm"
																									varStatus="nmVs">
																${optNm} : ${optValue[nmVs.index]} / 
																		</c:forEach> <em class="opt-count">${cart.prodCount[optVs.index] }</em>개
																						</span></li>
																					</ul>
																				</div>
																			</c:forEach>
																		</c:if>
																		<c:if test="${ empty cart.optionId }">
																			<div class="fn-count">
																				<ul class="">
																					<li><span class="info-con"> 상품 주문 수량 :
																							<em class="opt-count">${cart.prodCount[0]}</em>개
																					</span></li>
																				</ul>
																			</div>
																		</c:if>

																		<p>
																			<fmt:formatNumber type="number" maxFractionDigits="3"
																				value="${allPriceList.get(vs.index) }" />
																			</span>원
																			<c:if test="${ cart.product.deliveryFee eq 0}">
																				<span class="deli-fee">(배송비 무료)</span>
																				<input type="hidden" name="deliveryFee"
																					value="${cart.product.deliveryFee }" />
																			</c:if>
																			<c:if test="${ cart.product.deliveryFee > 0}">
																				<span class="deli-fee">(배송비 <em><fmt:formatNumber
																							type="number" maxFractionDigits="3"
																							value="${cart.product.deliveryFee }" /></em>원)
																				</span>
																				<input type="hidden" name="deliveryFee"
																					value="${cart.product.deliveryFee }" />
																			</c:if>

																		</p>
																	</div>
																</td>
																<td class="si-close"></td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>

										</form>
									</div>
									<div class="select-total">
										<div class="row">
											<div class="col-lg-12">
												<span style="color: black;">총 상품금액:</span>
												<h5 style="color: black;">
													<em id="totalProdPrice2" style="color: black;"> <fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${totalProdPrice}" />
													</em>원
												</h5>
											</div>

										</div>
										<div class="row">
											<div class="col-lg-12">
												<span style="color: black;">총 배송비:</span>
												<h5 style="color: black;">
													<em id="totalDeliPrice2" style="color: black;"> <fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${totalDeliPrice}" />
													</em>원
												</h5>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<span style="color: black;">총 할인금액:</span>
												<h5 style="color: black;">
													(-)<em id="totalDisPrice2" style="color: black;"> <fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${totalDisPrice}" />
													</em>원
												</h5>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<span>결제금액:</span>
												<h5>
													<em id="totalOrderPrice2"> <fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${totalOrderPrice}" />
													</em>원
												</h5>
											</div>
										</div>
									</div>
									<div class="select-button">
										<input type="button" class="btn btn-dark" style="width: 100%;"
											onclick="hCartSubmit(1);" value="구매하기" />
									</div>

								</div>
					
								
								</li>

						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="nav-item main-nav">
		<div class="container" style="text-align: center;">

			<nav class="nav-menu mobile-menu">
				<ul>
					<li class="active"><a
						href="${pageContext.request.contextPath }/shop/category.do?category1=CA1&category2=CA2">분유/이유식</a></li>
					<li><a
						href="${pageContext.request.contextPath }/shop/category.do?category1=CA3&category2=CA4">기저귀/물티슈</a></li>
					<li><a
						href="${pageContext.request.contextPath }/shop/category.do?category1=CA5&category2=CA6">수유/이유용품</a></li>
					<li><a
						href="${pageContext.request.contextPath }/shop/category.do?category1=CA7">목욕용품</a></li>
					<li><a
						href="${pageContext.request.contextPath }/shop/event/list.do">이벤트</a></li>
				</ul>
			</nav>
			<div id="mobile-menu-wrap"></div>
		</div>
	</div>


</header>
<!-- Header End -->