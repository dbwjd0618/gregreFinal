<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<!-- webpack vendor module -->
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
.subtitle {
	border-bottom: solid 2px #000 !important;
	margin-bottom: 5px !important;
	border-bottom: 1px solid #ebebeb;
}

#vbank_info {
	border-bottom: solid 1px #dcdcdc;
}

#payment_info {
	border-bottom: solid 1px #dcdcdc;
}

#delivery_info {
	border-bottom: solid 1px #dcdcdc;
}
.btn{
    padding: 10px 30px;
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
		<div class="row" style="margin-bottom: 30px; text-align: center;">
			<div class="col-lg-12">
				<h2>구매가 정상적으로 완료되었습니다.</h2>
			</div>
		</div>

		<!-- finish detail_info -->

		<div id="vbank_info">
			<div class="subtitle"></div>
			<div class="wrap_panel">
				<div class="field">
					<div class="title">주문번호</div>
					<div class="content">435943503530</div>
				</div>
				<div class="field">
					<div class="title">주문 접수일</div>
					<div class="content">2015년 10월 14일</div>
				</div>
				<div class="field">
					<div class="title">결제금액</div>
					<div class="content">1,000원</div>
				</div>
				<div class="field">
					<div class="title">결제수단</div>
					<div class="content">카드결제</div>
				</div>
			
			</div>
		</div>
		<!-- finish vbank_info -->
		</div>
		<!-- finish delivery_info -->
		<div class="row" style="text-align: center;">
			<div class="col-lg-12" >
				<input type="button" class="btn btn-secondary" value="계속 쇼핑하기"  onclick="detailSubmit(2);" /> 
				<input type="button" class="btn btn-primary" value="주문내역 확인하기"   onclick="detailSubmit(2);" />
			</div>
		</div>
	</div>

</div>

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />

