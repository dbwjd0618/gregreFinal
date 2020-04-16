<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />

<script
	src="https://d1nyaccf3kuclt.cloudfront.net/dist/js/vendor-dbf2fc730f0d241a92fd.js"></script>
<script
	src="https://d1nyaccf3kuclt.cloudfront.net/dist/js/3-f9befe5198ad479e7822.chunk.js"></script>
<script
	src="https://d1nyaccf3kuclt.cloudfront.net/dist/js/utils-16a90111784d8c9d08ed.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&amp;display=swap&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/components/modal-f0d0d6d3de7c6af277cedf14e63e81f35de21fddb39c29158ee5240d6ef4698a.css">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/components/modal/unsigned_expert_promotion-84289ae4552836c376b20eb6af913e1d218288f49b558b3c640514dc7391136f.css">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/components/autocomplete-b90e5093fd6272bf968b24073411e196f032d826a99ce7c79f61f975b6cfef98.css">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/_form-3b5b9d2d1ff7c1d9811e26f6f505c864ab580fd490ea13dcd8d9e9f2df445892.css">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v2/application-35a435324586a6ebd33801586d8ea8ccaa5c1a6c15ed6e798617248ef11e8b4b.css">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket-icons-666f525bc684b3218656f27b690456c21b5f2dead1e01573259a2a5dd0614170.css">

<script
	src="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/components/toast-314fdee1231f99d8f1ff10cc8d21ffb8e129d20edc30d5160124c80310774b03.js"></script>
<script
	src="https://d1nyaccf3kuclt.cloudfront.net/assets/v2/application-c71ab3a4f58f9e2de1fe968ff38e5c6d2724a2f3cdb0103153d7d28a354911bc.js"></script>
<style type="text/css">
.layout-top-banner-mobile {
	display: none !important;
}
</style>
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/8-564fc522.chunk.css">
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/16-05cd051c.chunk.css">
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/LayoutNavigation-3cf7e773.css">
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/LayoutFooter-6df5a0c2.css">

<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v2/orders/show-eff86b252cdfd40efe18a1655c98c78736ee97c648aea32e03470fcfad00c044.css">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v2/order_options/recommand_review-f392b6f818b956467c417ce9c481da6e7736eb30c3e01487c95a08422393825d.css">
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v2/production_reviews/new-3a2c9a653b2066b8c0c66eb4cf778be4445a9e530bc9f61993ab4e43bb929e00.css">
<style>
div.option {
	margin-bottom: 0px !important;
	line-height: 18px;
	color: #727272 !important;
}

.count {
	color: #727272 !important;
}

.cost {
	margin-right: 10px !important;
}
.order_list:last-child {
    border-bottom: solid 1px #dcdcdc;
}
</style>
<div id="body" class="orders show"
	data-s_id="868ed5fcb7a9578747162306ace05acf"
	style="padding-bottom: 0px;">
	<script>
		sessionStorage["share_code"] = '';
		sessionStorage["beforeContentType"] = 'UserOrder';
		sessionStorage["beforeContentId"] = '';
	</script>

	<div class="contents">
		<div class="title">주문상세정보</div>
		<!-- finish title -->

		<div id="detail_info">
			<div class="subtitle">주문번호 : ${orderList.orderNo } | 주문일자 :
				${orderList.orderDate }</div>
				<div class="table">
			<c:forEach var="prodList" items="${orderList.orderProdList}"
				varStatus="prodVs">
					<div class="order_list">
						<div class="product_image">
							<div class="image"
								style="background-image: url('${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${prodList.renamedImg}')"></div>
						</div>

						<div class="product_detail">
							<a class="name" target="_blank"
								href="${pageContext.request.contextPath }/shop/product/detail.do?productId=${prodList.productId}">
								[${prodList.productBrand}]
								${prodList.productName }</a>
							<c:if test="${prodList.optionName != null}">
								<c:forEach var="optionName" items="${prodList.optionName}"
									varStatus="optVs">
									<c:if test="${ optionName !=null }">
										<c:set var="optName" value="${fn:split(optionName,',') }" />
										<c:set var="optValue"
											value="${fn:split(prodList.optionValue[optVs.index],',') }" />
										<c:if test="${ not empty optName[1] }">
											<div class="option">${optValue[0]}/${optValue[1]}</div>

										</c:if>
										<c:if test="${  empty optName[1] }">
											<div class="option">${optValue[0]}</div>
										</c:if>
									</c:if>
									<div class="cost">
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${prodList.optionPrice[optVs.index] }" />
										원
									</div>
									<div class="count">|
										&nbsp;${prodList.prodCount[optVs.index] }개</div>
								</c:forEach>

							</c:if>
							<c:if test="${prodList.optionName ==null }">
								<div class="option">${prodList.productName}</div>
								<div class="cost">
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${prodList.optionPrice[0] }" />
									원
								</div>
								<div class="count">| &nbsp;${prodList.prodCount[0] }개</div>
							</c:if>
							<c:if test="${ prodList.deliveryFee ==0 }">
								<div class="method">무료배송</div>
							</c:if>
							<c:if test="${ prodList.deliveryFee > 0 }">
								<div class="method">
									배송비 <fmt:formatNumber type="number" maxFractionDigits="3"
										value="${prodList.deliveryFee}" />
									원
								</div>
							</c:if>
							<div class="status">${orderList.deliveryState }</div>
						</div>

						<c:if test="${orderList.deliveryState == '입금대기' }">
						<div class="button_set">
							<div class="fake"></div>
							<div class="buttons">
								<a class="button" href="/orders/17323851/order_cancel">주문취소</a>
							</div>
						</div>
					  </c:if>
					</div>

			</c:forEach>
				</div>
		</div>
		<!-- finish detail_info -->
		<c:if test="${orderList.payMethod eq 'ac'}">
		<div id="vbank_info">
			<div class="subtitle">가상계좌정보</div>
			<div class="wrap_panel">
				<div class="field">
					<div class="title">은행명</div>
					<div class="content">${payAccInfo.bankName}</div>
				</div>
				<div class="field">
					<div class="title">계좌번호</div>
					<div class="content">${payAccInfo.accountNo}</div>
				</div>
				<div class="field">
					<div class="title">예금주</div>
					<div class="content">${payAccInfo.accountHolder }</div>
				</div>
				<div class="field">
					<div class="title">입금금액</div>
					<div class="content emphasis">
					<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${orderList.totalPrice}" />원</div>
				</div>
				<div class="field">
					<div class="title">기한</div>
					<div class="content">${payAccInfo.expireDate} 까지</div>
				</div>
			</div>
		</div>
		<!-- finish vbank_info -->
		</c:if>
		<div id="payment_info">
			<div class="subtitle">결제 정보</div>

			<div class="wrap_panel divide one">
				<div class="field">
					<div class="title">상품금액</div>
					<div class="content">
					<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${orderList.paymentInfo.prodPrice }" />원
					</div>
				</div>
				<div class="field">
					<div class="title">할인금액</div>
					<div class="content">(-) <fmt:formatNumber type="number" maxFractionDigits="3"
										value="${orderList.paymentInfo.totalDiscount}" />원</div>
				</div>
				<div class="field">
					<div class="title">사용 포인트</div>
					<div class="content">(-) <fmt:formatNumber type="number" maxFractionDigits="3"
										value="${orderList.paymentInfo.usedPoint}" />원</div>
				</div>
				<div class="field">
					<div class="title">쿠폰 할인가</div>
					<div class="content">(-) <fmt:formatNumber type="number" maxFractionDigits="3"
										value="${orderList.paymentInfo.usedCoupon}" />원</div>
				</div>
				<div class="field">
					<div class="title">결제금액</div>
					<div class="content emphasis">
					<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${orderList.totalPrice}" />원
					</div>
				</div>
				<div class="field">
					<div class="title">결제방법</div>
					<div class="content">
						${payMethod } 
						
					<!-- 	<a target="_blank"
							href="https://npg.nicepay.co.kr/issue/IssueLoader.do?TID=bucketplam03012003151627355924&amp;type=0&amp;InnerWin=Y">(영수증)</a> -->
					</div>
				</div>
			</div>

			<div class="wrap_panel divide two">
				<div class="field">
					<div class="title">주문자</div>
					<div class="personal">${memberLoggedIn.memberName }</div>
				</div>
				<div class="field">
					<div class="title">연락처</div>
					<fmt:formatNumber var="licsNo" value="${memberLoggedIn.phone }"
					pattern="###,####,####" />
					<c:set var="phone" value="0${fn:replace(licsNo, ',', '-')}" />
					<div class="personal">${phone }</div>
				</div>
				<div class="field">
					<div class="title">이메일</div>
					<div class="personal">${memberLoggedIn.email }</div>
				</div>
			</div>
		</div>
		<!-- finish payment_info -->

		<div id="delivery_info">
			<div class="subtitle">배송지 정보</div>

			<div class="wrap_panel">
				<div class="field">
					<div class="title">수령인</div>
					<div class="content">${orderList.recptName}</div>
				</div>
				<div class="field">
					<div class="title">연락처</div>
					<fmt:formatNumber var="recptNo" value="${orderList.recptPhone }"
					pattern="###,####,####" />
					<c:set var="recptPhone" value="0${fn:replace(recptNo, ',', '-')}" />
					<div class="content">${recptPhone }</div>
				</div>
				<div class="field">
					<div class="title">주소</div>
					<div class="content">(${orderList.recptZipcode }) ${orderList.recptAddr } ${orderList.recptDetailAddr }
					</div>
				</div>
				<div class="field">
					<div class="title">배송메모</div>
					<div class="content">
						<div class="memo">${orderList.deliveryText }</div>
					</div>
				</div>
			</div>
		</div>
		<!-- finish delivery_info -->

	</div>

</div>

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />

