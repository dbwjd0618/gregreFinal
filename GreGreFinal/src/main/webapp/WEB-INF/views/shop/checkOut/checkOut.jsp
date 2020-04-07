<%@page import="java.util.List"%>
<%@page import="kh.mclass.IgreMall.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />

<%

  List<Product> prodList = (List<Product>)request.getAttribute("prodList");
  List<Integer> totalPriceList = (List<Integer>)request.getAttribute("totalPriceList");
  int totalPoint=0;
 for( int i=0; i<prodList.size();i++){
	 totalPoint += prodList.get(i).getPointRate()*0.01*totalPriceList.get(i); 
 }
//총 적림 예상금액
 pageContext.setAttribute("totalPoint", totalPoint );
%>
<!--checkOut css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/check-out.css">

<!-- 아임포트 호출 하는 스크립트 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!--bootpay api-->
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.1.min.js" type="application/javascript"></script>
<!-- 주소찾기 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/member/member.js"></script>
<style>
.member-info-form {
	background: #f5f5f5;
	height: 150px;
	padding-right: 20px;
	padding-left: 20px;
}

.table td, .table th {
	border-top: 0;
}
img.kakao-img {
    padding-top: 29px;
    padding-bottom: 6px;
}
input.site-btn.place-btn {
    width: 170px;
    height: auto;
}
td.first-row {
    border-right: 0 !important;
} 
td.qua-col.first-row {
    text-align: center;
}
.torder-info-t tr {
    border-bottom: 1px solid #ebebeb;
}
img.delivery-icon {
    width: 26px;
    margin-right: 2px;
    margin-bottom: 4px;
}
</style>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcru${pageContext.request.contextPath}/"><i class="fa fa-home"></i> Home</a> <a
						href="./shop.html">Shop</a> <span>Check Out</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="checkout-section spad">
	<form class="checkout-form">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<table class="order-info-t">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: 32%;">
								<col style="width: 15%;">
								<col style="width: 7%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
							</colgroup>
							<thead>
								<tr>
									<th class="title-col" colspan='2'>상품정보</th>
									<th class="title-col">배송비</th>
									<th class="title-col">수량</th>
									<th class="title-col">할인</th>
									<th class="title-col">주문금액</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="prod" items="${prodList}" varStatus="vs">
								<tr>
									<td class="cart-pic first-row">
									<c:forEach var="attach" items="${prod.attachList}" >
									<c:if test='${ "R" eq attach.imgType}'>
										<img src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${attach.renamedImg}"
										alt="">
										</c:if> 
									</c:forEach>	
									</td>
									<td class="cart-title first-row">
										<h5>
											[<span>${prod.brandName} </span>]
										</h5>
										<h3 class="product-name">${prod.productName}</h3>
										<div class="option">
										<c:if test="${ prod.optionList.get(0).optionId !=null }">
											<span class="ico_option"><span class="">옵션</span></span>
											<ul class="option_list">
												<c:forEach items="${prod.optionList}" var="optList">
													<c:if test="${ optList.optionId !=null }">
													<c:set var="optName"
														value="${fn:split(optList.optionName,',') }" />
													<c:set var="optValue"
														value="${fn:split(optList.optionValue,',') }" />
													<li>
														${optName[0]}:${optValue[0]}/${optName[1]}:${optValue[1]}/${optList.optionStock}개

													</li>
												</c:if>
												</c:forEach>
									
											</ul>
										</c:if>
										</div>
									</td>

									<td class="first-row">
										<c:if test="${ prod.deliveryFee eq 0}">
												<span class="deli-fee">
												<img class="delivery-icon" src="${pageContext.request.contextPath }/resources/images/shop/icon/delivery-icon.png"/>
												무료
												</span>
											</c:if> 
											<c:if test="${prod.deliveryFee> 0}">
											<span class="deli-fee">
											<img class="delivery-icon" src="${pageContext.request.contextPath }/resources/images/shop/icon/delivery-icon.png">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${prod.deliveryFee}" />원</span>
											</c:if> 
									</td>
									<td class="qua-col first-row">${totalAmountList.get(vs.index)}</td>
									<td class="qua-col first-row">
									<span class="discount">
											<c:set var="totalDiscount" value="${fn:length(prod.optionList)*prod.discountPrice }" /> <span
											class="_discountAmount">(-) </span> <span
											class="_discountAmountText"> 
											<fmt:formatNumber
													type="number" maxFractionDigits="3"
													value="${totalDiscount}" /> 원
										</span>
									</span></td>
									<td class="total-price first-row"><span
										class="orgn_price "><em><fmt:formatNumber
													type="number" maxFractionDigits="3"
													value="${totalPriceList.get(vs.index)+totalDiscount}" /></em>원</span> <strong><em
											class=""><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${totalPriceList.get(vs.index)}" /></em>원</strong></td>


								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<fmt:formatNumber var="licsNo" value="${memberLoggedIn.phone }"
				pattern="###,####,####" />
			<c:set var="phone" value="0${fn:replace(licsNo, ',', '-')}" />
			<div class="row" style="margin-top: 30px; margin-bottom: 50px;">
				<div class="col-lg-8">
					<h4>배송정보</h4>
					<div class="chkout-row">
						<div class="row">
							<div class="col-lg-3">
								<label for="fir">수령인<span>*</span></label> <input type="text"
									value="${memberLoggedIn.memberName }">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<label for="phone">연락처<span>*</span></label> <input type="text"
									id="phone" value="${phone }">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<label for="street">배송지 주소<span>*</span></label>
							</div>

						</div>
						<div class="row">
							<div class="col-lg-3" style="float: left;">
								<input type="text" name="addr1" id="zipcode" class="zipcode"
									value="" readonly>
							</div>
							<div class="col-lg-3">
								<input type="button" style="background: #ebebeb;" class="btn"
									onclick="execPostCode();" value="우편번호 찾기">
							</div>
						</div>

						<div class="row">
							<div class="col-lg-7" style="float: left;">
								<input type="text" name="addr2" id="address1" readonly>
							</div>
							<div class="col-lg-5">
								<input type="text" name="addr3" id="address2">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="dropdown_wrap">
									<label for="delivery-memo">배송메모</label> <input type="text"
										placeholder="요청사항을 직접 입력합니다" title="배송 메세지"
										name="deliveryMemo" class="deli_msg placeholder">

								</div>

							</div>

						</div>

					</div>
				</div>
				<div class="col-lg-4 member-info-form">
					<h5 style="font-weight: 700; padding-top: 15px;">주문자 정보</h5>
					<ul class="user_info">

						<li>${memberLoggedIn.memberName }</li>
						<li class="_telNoHighlight "><span class="_memberTelNumber">${phone }</span>
						<button class="update-btn">수정</button></li>
						<li><span class="_memberEmailAddress">${memberLoggedIn.email }</span>
						<button class="update-btn">수정</button></li>
					</ul>
				</div>


			</div>
			<hr>
			<div class="row" style="margin-top: 50px; margin-bottom: 50px;">
				<div class="col-lg-7">
					<div class="discount_info discountPriceInfo">
						<h4>
							<span class="blind">할인 및 포인트</span>
						</h4>
						<table cellspacing="0" class="tb_discount">
							<colgroup>
								<col width="121">
								<col width="126">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th rowspan="2">
										<div class="deliver_option_wrap">
											<strong class="req short">쿠폰 할인</strong>
										</div>
									</th>
									<th>상품/주문쿠폰</th>
									<td>
										<div class="input_area">
											<input type="text" name="productCouponPrice" id="pro_coupon"
												value="" class="value" title="상품/주문쿠폰금액"
												readOnly> <span class="measure">원</span>
										</div>
										<button type="button" class="coupon-btn" data-toggle="modal"
											data-target="#couponModal">쿠폰사용</button>
										<ul class="use_list">
											<li>(보유 쿠폰 : <em>${fn:length(sMem.couponList)}</em>장)
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						<table cellspacing="0" class="tb_discount">
							<colgroup>
								<col width="121">
								<col width="126">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th rowspan="2">
										<div class="deliver_option_wrap">
											<strong class="req long">포인트</strong>
										</div> <a href="#" title="?" class="sp_order "></a>
									</th>
									<th>보유 포인트</th>
									<td>
										<div class="input_area no_underline">
											 <span class="value" id="has-point">${sMem.point }</span>  
											<span class="measure" style="position: relative; top: -24px;">원</span>				
										</div>
									</td>
								</tr>
								<tr>
									<th>사용 포인트</th>
									<td>
										<div class="input_area">
										<c:if test="${sMem.point == 0 }">
											<input type="text" id="mileage" title="포인트" name="payAmounts"
												value="0" class="value" readonly /> 
												<span class="measure" style="position: relative; top: -24px;">원</span>
											</c:if> 
											<c:if test="${sMem.point!= 0 }">
												<input type="text" id="mileage" title="포인트" name="payAmounts"
													value="0" class="value"> 
													<span class="measure" style="position: relative; top: -24px;">원</span>
											</c:if>

										</div>

									</td>
								</tr>

							</tbody>
						</table>
					</div>
					<h4>예상 적립 포인트</h4>
					<div class="expect_mileage">
					
						<fmt:formatNumber type="number" maxFractionDigits="3"
							var="tPoint" value="${totalPoint }" />
						<div class="mileage" id="expect_mileage" data-benefit="1"
							data-hj-suppress="">${tPoint}P</div>
						<div>적립예정</div>
					</div>
				</div>

				<div class="col-lg-5">
					<div class="place-order">
						<div class="order-total">
							<h5 style="margin-bottom: 0 !important; font-weight: 700;">최종
								결제 금액</h5>
							<ul class="order-table">
								<li class="total-price" style="border: 0; margin-bottom: 20px;"><span
									style="font-size: 30px; padding-top: 5px; float: left;"><em id="total-pay"></em>원</span></li>
								<li class="fw-normal">총 상품금액 <span><em id="total-prod"></em>원</span></li>
								<li class="fw-normal">배송비 <span>(+)<em id="total-del"><fmt:formatNumber type="number" maxFractionDigits="3" value="" /></em>원</span></li>
								<li class="fw-normal">할인금액<span>(-)<em id="total-dis">${totalDiscount}</em>원</span></li>
								<li class="fw-normal">포인트 사용금액<span>(-)<em id="used-point"></em>원</span></li>
								<li class="fw-normal">쿠폰 사용금액<span>(-)<em id="used-coupon"></em>원</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top: 50px;">
				<div class="col-lg-12">
					<h4>결제수단</h4>
					<div class="pay_method">
						<div class="payment_panel">
						<!-- 결제선택  시작-->
							<!-- 신용카드 결제 -->
							<input type="radio" value="cr"
								name="payMethod"
								id="order_payment_method_kcp_credit_card"> 
								<label
								class="first top" for="order_payment_method_kcp_credit_card">
								<img class="img" width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png"
								alt="Card">
								<div class="title">카드</div>
							</label> 
							<!-- 실시간 계좌이체 -->
							<input type="radio" value="ra"
								name="payMethod" id="order_payment_method_smilepay">
							<label class=" top" for="order_payment_method_smilepay">
							   
								<div class="title">실시간계좌이체</div>
							</label>
							<!-- 휴대폰 결제 -->
							<input type="radio" value="ph" name="payMethod"
								id="order_payment_method_phone"> <label class=" top"
								for="order_payment_method_phone"> <img class="img"
								width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/phone.png"
								alt="Phone">
								<div class="title">핸드폰</div>

							</label> 
							<!-- 무통장입금 -->
							<input type="radio" value="ac"
								name="payMethod"
								id="order_payment_method_without_bankbook"> <label
								class=" top" for="order_payment_method_without_bankbook">
								<img class="img" width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/vbank.png"
								alt="Vbank">
								<div class="title">무통장입금</div>
							</label> 
							<!-- 네이버페이 -->
							<input type="radio" value="na"
								name="payMethod" id="order_payment_method_naverpay">
							<label class=" top" for="order_payment_method_naverpay">
								<img class="img" width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/naver.png"
								alt="Naver">
								<div class="title">네이버페이</div>

							</label> 
							<!-- 카카오페이 -->
							<input type="radio" value="ka" name="payMethod"
								id="order_payment_method_kakao"> <label class=" top"
								for="order_payment_method_kakao"> 
								<img 
								width="64"
								class="kakao-img"
								src="${pageContext.request.contextPath }/resources/images/shop/pay/kakaoPay.png"
								alt="kakaoPay">
								<div class="title">카카오페이</div>
							</label> 
								<!-- 토스결제 -->
							<input type="radio" value="to" name="payMethod"
								id="order_payment_method_tosspay"> <label
								class="top" for="order_payment_method_tosspay"> <img
								class="img" width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png"
								alt="Toss">
								<div class="title">토스</div>
							</label> 
							<!-- 결제선택 끝 -->
						</div>
					</div>
					<div id="confirm_checkbox">
						<div class="form-check check_agree_policy">
							<label class="form-check-label" for="check_agree_policy">
								<input type="checkbox" id="check_agree_policy"
								class="form-check"> <span class="check-img"></span> 결제
								진행 필수사항 동의
							</label>
						</div>

						<div class="all_policy">
							<div class="title">개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</div>
						</div>

						<div class="policies">
							<div class="policy">
								<div class="title_panel">
									<div class="title">개인정보 제 3자 제공</div>
								</div>
								<div class="content">
									<table>
										<thead>
											<tr>
												<th class="to">제공 받는자</th>
												<th class="goal">제공목적</th>
												<th class="information">항목</th>
												<th class="due_date">보유 및 이용 기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="to">다온에스아이</td>
												<td class="goal">상품 및 경품(서비스) 배송(전송), 제품 설치, 반품, 환불,
													고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)계약의 이행을 위해 필요한 업무의 처리</td>
												<td class="information">1) 구매자정보(닉네임, 성명, 휴대폰번호, 이메일주소)<br>
													2) 수령인정보(성명, 휴대폰번호, 주소)<br> 3) 상품 구매, 취소, 반품, 교환정보<br>
													4) 송장정보
												</td>
												<td class="due_date">상품 제공 완료 후 3개월</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


							<div class="policy">
								<div class="title_panel">
									<div class="title">개인정보 수집 및 이용</div>
								</div>
								<div class="content">
									<table>
										<thead>
											<tr>
												<th class="to">수집방법</th>
												<th class="goal">수집항목</th>
												<th class="information">목적</th>
												<th class="due_date">보유 및 이용 기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="to">상품구매</td>
												<td class="goal">1) 구매자 정보(성명, 휴대전화 번호)<br>2) 수령인
													정보(성명, 휴대전화 번호, 주소)
												</td>
												<td class="information">상품 배송 및 서비스 제공을 위한 사용자 정보 확인</td>
												<td class="due_date" rowspan="4">5년 (계약 및 철회, 결제 및 공급)</td>
											</tr>
											<tr>
												<td class="to">결제</td>
												<td class="goal">신용카드 정보</td>
												<td class="information">간편 결제 서비스 제공</td>
											</tr>
											<tr>
												<td class="to">취소·환불</td>
												<td class="goal">환불 계좌번호, 은행명, 예금주명</td>
												<td class="information">결제 서비스 환불</td>
											</tr>
											<tr>
												<td class="to">휴대전화 인증</td>
												<td class="goal">휴대전화 번호</td>
												<td class="information">상품 구매 및 포인트(적립금) 지급 시 본인 인증</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

						</div>
					</div>
					<div class="order-btn">
						<input type="button" class="site-btn place-btn" onclick="goPay();" value="결제하기"/>
					</div>
				</div>
			</div>
			</div>
		</form>

</section>

<!-- 	<button type="button" class="site-btn place-btn impPay">결제하기test</button> -->
	<!-- 쿠폰사용 modal -->
	<div class="modal fade" id="couponModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">쿠폰 할인적용</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<form>
				<div class="modal-body" >
						<div class="row">	
							<div class="col-lg-12">	
								<label for="coupon-title" class="col-form-label">할인 쿠폰 선택</label>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<span style="float:right;">* 모든 쿠폰은 중복사용이 불가능합니다.</span>
								<table class="fold-table table table-sm"
									style="border-top: 2px solid #dee2e6; text-align:center;">
									<colgroup>
											<col style="width: 3%;">
											<col style="width: 10%;">
											<col style="width: 25%;">
											<col style="width: 15%;">
											<col style="width: 22%;">
											<col style="width: 25%;">
								</colgroup>
									<thead>
										<tr>
											<th></th>
											<th>쿠폰번호</th>
											<th>쿠폰명</th>
											<th>할인액(율)</th>
											<th>사용제한 조건</th>
											<th>유효기간</th>
										</tr>
									</thead>
									<tbody style="border-bottom: 2px solid #dee2e6;">
									 <c:forEach items="${sMem.couponList}" var="cList">			 
										<tr>
											<td>
												<input type="radio" name="coupon-radio"  style="height:auto; margin:0px"/>
												<input type="hidden" name="couponId"  value="${cList.couponId }"/>
												<c:if test="${cList.discountType eq 'P'}">
													<fmt:parseNumber var="discountVal" integerOnly="true" value="${totalPrice*cList.discountValue*0.01} " />  													
													<input type="hidden" name="discountValue" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${discountVal}" />"/>
												</c:if>
												<c:if test="${cList.discountType eq 'C'}">
													<input type="hidden" name="discountValue" value="${cList.discountValue }"/>
												</c:if>
											
											</td>
											<td>${cList.couponId}</td>
											<td>${cList.couponName}</td>
											<td>
												<c:if test="${cList.discountType eq 'P'}">
												${cList.discountValue}%
												</c:if>
												<c:if test="${cList.discountType eq 'C'}">
 													${cList.discountValue}원
												</c:if>
											</td>
											<td>
											 <c:if test="${not empty cList.maxValue }">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${cList.maxValue }" />원 이상 구매
											</c:if>
											</td>
											<td>${cList.expireDate }일 까지</td>
										</tr>
									 </c:forEach>
									</tbody>
								</table>

							</div>


						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="goCoupon();">쿠폰적용</button>
					<button type="button"  class="btn btn-secondary"
						data-dismiss="modal" >취소</button>
				</div>
			</form>
			</div>
		</div>
	</div>
<!-- 모달 끝 -->

<!-- 결제하기 -->
<script>
function goPay(){
	var payMethod = $("input[name=payMethod]:checked").val();
	console.log("payMe"+payMethod);
	//무통장입금
	if(payMethod=='ka'){
		BootPay.request({
			price: '1000', //실제 결제되는 가격
			application_id: "5e8580d902f57e0036d63afd",
			name: '블링블링 마스카라', //결제창에서 보여질 이름
			pg: 'kakao',
			method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: '나는 아이템', //상품명
					qty: 1, //수량
					unique: '123', //해당 상품을 구분짓는 primary key
					price: 1000, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '사용자 이름',
				email: '사용자 이메일',
				addr: '사용자 주소',
				phone: '010-1234-4567'
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
		});
	}
	if(payMethod=='ac'){
		BootPay.request({
			price: '1000', //실제 결제되는 가격
			application_id: "5e8580d902f57e0036d63afd",
			name: '블링블링 마스카라', //결제창에서 보여질 이름
			pg: 'kcp',
			method: 'vbank', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: '나는 아이템', //상품명
					qty: 1, //수량
					unique: '123', //해당 상품을 구분짓는 primary key
					price: 1000, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '사용자 이름',
				email: '사용자 이메일',
				addr: '사용자 주소',
				phone: '010-1234-4567'
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
		});
	}
	//실시간계좌이체
	if(payMethod=='ra'){
		BootPay.request({
			price: '1000', //실제 결제되는 가격
			application_id: "5e8580d902f57e0036d63afd",
			name: '블링블링 마스카라', //결제창에서 보여질 이름
			pg: 'nicepay',
			method: 'bank', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: '나는 아이템', //상품명
					qty: 1, //수량
					unique: '123', //해당 상품을 구분짓는 primary key
					price: 1000, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '사용자 이름',
				email: '사용자 이메일',
				addr: '사용자 주소',
				phone: '010-1234-4567'
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
		});
	}
	//핸드폰결제
	if(payMethod=='ph'){
		BootPay.request({
			price: '1000', //실제 결제되는 가격
			application_id: "5e8580d902f57e0036d63afd",
			name: '블링블링 마스카라', //결제창에서 보여질 이름
			pg: 'mobilians',
			method: 'phone', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: '나는 아이템', //상품명
					qty: 1, //수량
					unique: '123', //해당 상품을 구분짓는 primary key
					price: 1000, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '사용자 이름',
				email: '사용자 이메일',
				addr: '사용자 주소',
				phone: '010-1234-4567'
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
		});
	}
	//네이버페이
	if(payMethod=='na'){
		 var oPay = Naver.Pay.create({
	          "mode" : "production", // development or production
	          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
	    });

	 
	        oPay.open({
	          "merchantUserKey": "bbbbb",
	          "merchantPayKey": "aaaa",
	          "productName": "물티슈테스트1",
	          "totalPayAmount": "1000",
	          "taxScopeAmount": "1000",
	          "taxExScopeAmount": "0",
	          "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
	        });
		
	}
	//신용카드결제
	if(payMethod =='cr'){
		var IMP = window.IMP; // 생략가능
        IMP.init('iamport');
		
	        IMP.request_pay({
	            pg : 'inicis', // version 1.1.0부터 지원.
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '주문명:결제테스트',
	            amount : 14000,
	            buyer_email : 'iamport@siot.do',
	            buyer_name : '구매자이름',
	            buyer_tel : '010-1234-5678',
	            buyer_addr : '서울특별시 강남구 삼성동',
	            buyer_postcode : '123-456',
	            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	        }, function(rsp) {
	            if ( rsp.success ) {
	                var msg = '결제가 완료되었습니다.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	            }
	            alert(msg);
        });
	}
	
	
}


</script>


<!-- 최종 금액 -->
<script>
$(function(){
	var totalProd = Number($('#total-prod').text());
	var totalDel = Number($('#total-del').text().replace(",",""));
	var totalDis = Number($('#total-dis').text());
	var totalPay = totalProd+totalDel - totalDis;
	
	$("#total-pay").text(totalPay);
});
</script>
<!-- 포인트 사용 -->
<script>
$(function(){
	$("input[name=payAmounts]").on("propertychange change keyup paste input",function(){
		var usingPoint = $(this).val();
		var hasPoint = Number($("#has-point").text());
		var totalPay = Number($("#total-pay").text());
		if(Number(usingPoint)>hasPoint){
			alert("보유하신 포인트보다 많습니다. ");
			$(this).val(hasPoint);
			return;
		}
		if(hasPoint>0){
		$('#used-point').text(usingPoint);	
		 	totalPay -= Number(usingPoint);
			$("#total-pay").text(totalPay);
		}
		
		return;
	});

});
</script>
<!--쿠폰 사용 -->
<script>
function goCoupon(){
 	var couponValue = $("input[name=coupon-radio]:checked").next().next().val();
	var totalPay = Number($("#total-pay").text());
	
	totalPay -= Number(couponValue.replace(",",""));
	$("#total-pay").text(totalPay);
	
	$("#pro_coupon").val(couponValue);
	$('#used-coupon').text(couponValue);
 	$('#couponModal').modal('hide');
	
}
</script>
<!-- bootpay 테스트  -->
<!--  <input type="button" id="phoneBtn" value="핸드폰 결제 버튼">  -->
<script>

$(function(){
	$("#phoneBtn").click(function(){
		console.log("폰");
	BootPay.request({
		price: '1000', //실제 결제되는 가격
		application_id: "5e8580d902f57e0036d63afd",
		name: '블링블링 마스카라', //결제창에서 보여질 이름
		pg: 'mobilians',
		method: 'phone', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		items: [
			{
				item_name: '나는 아이템', //상품명
				qty: 1, //수량
				unique: '123', //해당 상품을 구분짓는 primary key
				price: 1000, //상품 단가
				cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
				cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
				cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
			}
		],
		user_info: {
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
		order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
		account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
		extra: {
		    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
			end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
	        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
	        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
		}
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log(data);
	}).cancel(function (data) {
		//결제가 취소되면 수행됩니다.
		console.log(data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log(data);
	}).confirm(function (data) {
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
		console.log(data);
		var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
		if (enable) {
			BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
		} else {
			BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		}
	}).close(function (data) {
	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	    console.log(data);
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
		console.log(data);
	});
	});
});
</script>
<!-- 네이버페이 결제 테스트  -->
<!--// mode : development or production-->
<!-- <input type="button" id="naverPayBtn" value="네이버페이 결제 버튼"> -->
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "bbbbb",
          "merchantPayKey": "aaaa",
          "productName": "물티슈테스트1",
          "totalPayAmount": "1000",
          "taxScopeAmount": "1000",
          "taxExScopeAmount": "0",
          "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
        });
    });

</script>

<!-- 네이버페이 -->



 <!-- 아임포트 결제하기 테스트 -->
<script>
    $(function(){
    	$(".impPay").click(function(){
    		var IMP = window.IMP; // 생략가능
            IMP.init('iamport');
    		
		        IMP.request_pay({
		            pg : 'inicis', // version 1.1.0부터 지원.
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : '주문명:결제테스트',
		            amount : 14000,
		            buyer_email : 'iamport@siot.do',
		            buyer_name : '구매자이름',
		            buyer_tel : '010-1234-5678',
		            buyer_addr : '서울특별시 강남구 삼성동',
		            buyer_postcode : '123-456',
		            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		        }, function(rsp) {
		            if ( rsp.success ) {
		                var msg = '결제가 완료되었습니다.';
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
		            alert(msg);
	        });
    	});
    }); 
    
    </script>
<!-- 카카오페이 -->
<!-- <input type="button" id="kakaoPayBtn" value="카카오페이결제 버튼"> -->

<!-- Shopping Cart Section End -->


<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
