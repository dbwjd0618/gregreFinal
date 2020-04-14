<%@page import="kh.mclass.Igre.counselling.model.vo.BookingInfo"%>
<%@page import="kh.mclass.Igre.counselling.model.vo.Counselor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!--checkOut css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/check-out.css">
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	$(function() {
		$(".price").click(function(e) {
			$(".price").attr('checked', true);
			$('#total-price').text(comma($(this).attr('value')));
			$("[name=payPrice]").val($('#total-price').text());
			$("[name=coin]").val($(this).attr("id"));
		});
	});

	$('input:radio[name=options]').is(':checked');
</script>
<style>
img.kakao-img {
	padding-top: 29px;
	padding-bottom: 6px;
}

input.site-btn.place-btn {
    width: 170px;
    height: auto;
}
.col-md-10 {
     text-align: right; 
}
[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
    cursor: pointer;
}
.checkout-form input {
    width: 100%;
    height: 40px;
    border: 2px solid #ebebeb;
    margin-bottom: 15px;
    padding-left: 15px;
    padding-right: 15px;
}
.site-btn {
    color: #ffffff;
    background: #4CA4ED;
    border: 1px solid #4CA4ED;
    font-size: 14px;
    font-weight: 700;
    text-transform: uppercase;
    padding: 13px 45px 11px;
    cursor: pointer;
    margin-left: 70%;
}

.col-md-10 > h4{
text-align: right;
}

.col-md-8 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 66.66667%;
    flex: 0 0 66.66667%;
    max-width: 66.66667%;
    padding-top: 20px;
}

.col-lg-12 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
    border: 1px solid lightgray;
    border-left: 0;
    border-right: 0;
    border-bottom: 0;
}
</style>
<%
	Counselor C = (Counselor) request.getAttribute("counselor");
	BookingInfo book = (BookingInfo) request.getAttribute("bookingInfo");
	pageContext.setAttribute("price1", Integer.parseInt(C.getAdvisPrice()) * 2);
	pageContext.setAttribute("price2", Integer.parseInt(C.getAdvisPrice()) * 4);
%>

<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/counselling/counselling.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">상담 결제</h1>
					<p>
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a>
						<span class="mx-3">/</span> <strong>상담센터</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<style>
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}

.align-self-center {
	width: 200px;
	height: 200px;
}

h4 {
	text-align: center;
	margin-top: 10%;
	margin-left: -80px;
	margin-bottom: 20px;
}

.c-title {
	text-align: center;
	font-size: 20px;
}

table {
	cursor: pointer;
}

span#total-price{
	color: red;
}

.c-grade{
	color: #48DA91;
}
</style>
<!-- 여기부터 container -->
<form name="bookingFrm" method="POST">
	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<img
						src="${pageContext.request.contextPath}/resources/images/counselling/${counselor.advisImg}"
						class="align-self-center mr-3" alt="..."> <input
						type="hidden" name="advisImg" value="${counselor.advisImg}" />
					<h4>${counselor.advisName }&nbsp;<span class="c-grade">${counselor.advisGrade }</span>상담사</h4>
					<input type="hidden" name="advisName"
						value="${counselor.advisName }" />
				</div>
				<div class="col-md-8">
					<table class="table table-hover">
						<thead>
							<tr>
								<th colspan="2" class="c-title">상담권 선택하기</th>
							</tr>
						</thead>
						<tbody>
							<tr class="price" id="1" value="${counselor.advisPrice}">
								<th scope="row">1회 상담권</th>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${counselor.advisPrice}" />원</td>
							</tr>
							<tr class="price" id="2" value="${price1}">
								<th scope="row">2주 프로그램</th>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price1}" />원</td>
							</tr>
							<tr class="price" id="4" value="${price2 }">
								<th scope="row">4주 프로그램</th>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price2}" />원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-md-10">
					<h5>최종 결제 금액</h5>
					<h4>
						<strong><span id="total-price">0</span>원</strong>
					</h4>
				</div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-lg-12">
					<h4>결제수단</h4>
					<div class="pay_method">
						<div class="payment_panel">
							<!-- 결제선택  시작-->
							<!-- 신용카드 결제 -->
							<input type="radio" value="cr" name="payMethod"
								id="order_payment_method_kcp_credit_card"> <label
								class="first top" for="order_payment_method_kcp_credit_card">
								<img class="img" width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png"
								alt="Card">
								<div class="title">카드</div>
							</label>
							<!-- 실시간 계좌이체 -->
							<input type="radio" value="ra" name="payMethod"
								id="order_payment_method_smilepay"> <label class=" top"
								for="order_payment_method_smilepay">
								<img class="img" width="64"
								src="${pageContext.request.contextPath}/resources/images/shop/pay/paycon.png"
								alt="Account">

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
							<input type="radio" value="ac" name="payMethod"
								id="order_payment_method_without_bankbook"> <label
								class=" top" for="order_payment_method_without_bankbook">
								<img class="img" width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/vbank.png"
								alt="Vbank">
								<div class="title">무통장입금</div>
							</label>
							<!-- 네이버페이 -->
							<input type="radio" value="na" name="payMethod"
								id="order_payment_method_naverpay"> <label class=" top"
								for="order_payment_method_naverpay"> <img class="img"
								width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/naver.png"
								alt="Naver">
								<div class="title">네이버페이</div>

							</label>
							<!-- 카카오페이 -->
							<input type="radio" value="ka" name="payMethod"
								id="order_payment_method_kakao"> <label class=" top"
								for="order_payment_method_kakao"> <img width="64"
								class="kakao-img"
								src="${pageContext.request.contextPath }/resources/images/shop/pay/kakaoPay.png"
								alt="kakaoPay">
								<div class="title">카카오페이</div>
							</label>
							<!-- 토스결제 -->
							<input type="radio" value="to" name="payMethod"
								id="order_payment_method_tosspay"> <label class="top"
								for="order_payment_method_tosspay"> <img class="img"
								width="64"
								src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png"
								alt="Toss">
								<div class="title">토스</div>
							</label>
							<!-- 결제선택 끝 -->
						</div>
					</div>
				</div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<input type="button" class="site-btn place-btn" onclick="goPay();" value="결제하기">
				</div>
				<input type="hidden" name="memberId"
					value="${memberLoggedIn.memberId}" /> 
					<input type="hidden" name="advisId" value="${counselor.advisId }" /> 
					<input type="hidden" name="payPrice" value="" /> 
					<input type="hidden" name="coin" />
				
			</div>
		</div>
	</div>
</form>

<script>
	function insert() {
		$("#bookingFrm").attr('action',
				"${pageContext.request.contextPath}/counselling/bookingEnd.do")
				.attr("method", "post").submit();
	}
</script>
<script>
//콤마찍기
function comma(str) {
str = String(str);
return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
//콤마풀기
function uncomma(str) {
str = String(str);
return str.replace(/[^\d]+/g, '');
}
</script>
<!-- 아임포트 호출 하는 스크립트 -->
<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!--bootpay api-->
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.1.min.js"
	type="application/javascript"></script>
<!-- 네이버페이 -->
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<!-- 결제하기 -->
<script>
	function goPay() {
		var payMethod = $("input[name=payMethod]:checked").val();
		 var nowDate = new Date();
		var accExprieDate = nowDate.getFullYear()+"-"+(nowDate.getMonth()+1)+"-"+(nowDate.getDate()+5);
		var totalPrice = uncomma($("#total-price").text());
		$("[name=payPrice]").val(totalPrice);
		
		console.log("payMe" + payMethod);
		//카카오페이
		if (payMethod == 'ka') {
			BootPay.request({
				price : totalPrice, //실제 결제되는 가격
				application_id : "5e8580d902f57e0036d63afd",
				name : '상담 이용권', //결제창에서 보여질 이름
				pg : 'kakao',
				method : 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부
				items : [ {
					item_name : '나는 아이템', //상품명
					qty : 1, //수량
					unique : '123', //해당 상품을 구분짓는 primary key
					price : 1000, //상품 단가
				
				} ],
				user_info : {
					username : '사용자 이름',
					email : '사용자 이메일',
					addr : '사용자 주소',
					phone : '010-1234-4567'
				},
				order_id : '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params : {
					callback1 : '그대로 콜백받을 변수 1',
					callback2 : '그대로 콜백받을 변수 2',
					customvar1234 : '변수명도 마음대로'
				},
				account_expire_at : '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra : {
					start_at : '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at : '2022-05-10', // 정기결제 만료일 - 기간 없음 - 무제한
					vbank_result : 0, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
					quota : '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			}).error(function(data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function(data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function(data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
				
			}).confirm(function(data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function(data) {
				// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
				console.log(data);
			}).done(function(data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
				
				 var finishPayment = "${pageContext.request.contextPath}/counselling/bookingEnd.do";
	             document.bookingFrm.action= finishPayment;
	        	 document.bookingFrm.submit();
	                
			});
		}
		//무통장입금
		if (payMethod == 'ac') {
			BootPay.request({
				price : totalPrice, //실제 결제되는 가격
				application_id : "5e8580d902f57e0036d63afd",
				name : '상담 이용권', //결제창에서 보여질 이름
				pg : 'kcp',
				method : 'vbank', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부
				items : [ {
					item_name : '나는 아이템', //상품명
					qty : 1, //수량
					unique : '123', //해당 상품을 구분짓는 primary key
					price : 1000, //상품 단가
					cat1 : 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2 : '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3 : '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				} ],
				user_info : {
					username : '사용자 이름',
					email : '사용자 이메일',
					addr : '사용자 주소',
					phone : '010-1234-4567'
				},
				order_id : '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params : {
					callback1 : '그대로 콜백받을 변수 1',
					callback2 : '그대로 콜백받을 변수 2',
					customvar1234 : '변수명도 마음대로'
				},
				account_expire_at : accExprieDate, // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra : {
					start_at : '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at : '2022-05-10', // 정기결제 만료일 - 기간 없음 - 무제한
					vbank_result : 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
					quota : '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			}).error(function(data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function(data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function(data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
				
			}).confirm(function(data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function(data) {
				// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
				console.log(data);
			}).done(function(data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
			});
		}
		//실시간계좌이체
		if (payMethod == 'ra') {
			BootPay.request({
				price : totalPrice, //실제 결제되는 가격
				application_id : "5e8580d902f57e0036d63afd",
				name : '상담 이용권', //결제창에서 보여질 이름
				pg : 'nicepay',
				method : 'bank', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부
				items : [ {
					item_name : '나는 아이템', //상품명
					qty : 1, //수량
					unique : '123', //해당 상품을 구분짓는 primary key
					price : 1000, //상품 단가
					cat1 : 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2 : '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3 : '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				} ],
				user_info : {
					username : '사용자 이름',
					email : '사용자 이메일',
					addr : '사용자 주소',
					phone : '010-1234-4567'
				},
				order_id : '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params : {
					callback1 : '그대로 콜백받을 변수 1',
					callback2 : '그대로 콜백받을 변수 2',
					customvar1234 : '변수명도 마음대로'
				},
				account_expire_at : '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra : {
					start_at : '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at : '2022-05-10', // 정기결제 만료일 - 기간 없음 - 무제한
					vbank_result : 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
					quota : '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			}).error(function(data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function(data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function(data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			}).confirm(function(data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function(data) {
				// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
				console.log(data);
			}).done(function(data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
			});
		}
		//핸드폰결제
		if (payMethod == 'ph') {
			BootPay.request({
				price : totalPrice, //실제 결제되는 가격
				application_id : "5e8580d902f57e0036d63afd",
				name : '상담 이용권', //결제창에서 보여질 이름
				pg : 'mobilians',
				method : 'phone', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부
				items : [ {
					item_name : '나는 아이템', //상품명
					qty : 1, //수량
					unique : '123', //해당 상품을 구분짓는 primary key
					price : 1000, //상품 단가
					cat1 : 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2 : '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3 : '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				} ],
				user_info : {
					username : '사용자 이름',
					email : '사용자 이메일',
					addr : '사용자 주소',
					phone : '010-1234-4567'
				},
				order_id : '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params : {
					callback1 : '그대로 콜백받을 변수 1',
					callback2 : '그대로 콜백받을 변수 2',
					customvar1234 : '변수명도 마음대로'
				},
				account_expire_at : '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra : {
					start_at : '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at : '2022-05-10', // 정기결제 만료일 - 기간 없음 - 무제한
					vbank_result : 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
					quota : '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			}).error(function(data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function(data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function(data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			}).confirm(function(data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function(data) {
				// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
				console.log(data);
			}).done(function(data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
			});
		}
		//네이버페이
		if (payMethod == 'na') {
			var oPay = Naver.Pay.create({
				"mode" : "production", // development or production
				"clientId" : "u86j4ripEt8LRfPGzQ8" // clientId
			});
			oPay.open({
				"merchantUserKey" : "bbbbb",
				"merchantPayKey" : "aaaa",
				"productName" : "물티슈테스트1",
				"totalPayAmount" : "1000",
				"taxScopeAmount" : "1000",
				"taxExScopeAmount" : "0",
				"returnUrl" : "사용자 결제 완료 후 결제 결과를 받을 URL"
			});
		}
		//신용카드결제
		if (payMethod == 'cr') {
			var IMP = window.IMP; // 생략가능
			IMP.init('iamport');
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : totalPrice,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
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

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
