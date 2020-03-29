<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
    <!--checkOut css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/check-out.css">
    
    <!-- 아임포트 호출 하는 스크립트 -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    
    
<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">Shop</a>
                        <span>Check Out</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <form action="#" class="checkout-form">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                            <div class="cart-table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th  class="title-col" colspan="2">상품정보</th>
                                                <th class="title-col">배송비</th>
                                                <th class="title-col">수량</th>
                                                <th class="title-col">할인</th>
                                                <th class="title-col">주문금액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="cart-pic first-row"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                                <td class="cart-title first-row">
                                                    <h5>Pure Pineapple</h5>
                                                    <div class="option">
                                                            <span class="ico_option"><span class="blind">옵션</span></span>
                                                            <ul class="option_list">
                                                                    <!-- 상품 공통 코드에 대한 convert 작업이 필요하다. -->
                                                                    <li>
                                                                    COLOR:River/SIZE:Free/1개
                                                                    </li>
                                                            </ul>
                                                        </div>
                                                </td>
                                                <td class="p-price first-row">2000원</td>
                                                <td class="qua-col first-row">2</td>
                                                <td class="qua-col first-row">
                                                    <span class="discount">
                                                            <span class="_discountAmount">(-) </span>
                                                            <span class="_discountAmountText">
                                                                29,200원</span>
                                                        </span>
                                                </td>
                                                <td class="total-price first-row">
                                                        <span class="orgn_price "><em>69,000</em>원</span>
                                                        <strong><em class="">39,800</em>원</strong>
                                                </td>
                                     
                                               
                                            </tr>
                                    
                                        </tbody>
                                    </table>
                                </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 30px; margin-bottom: 50px;  ">
                        <div class="col-lg-8">           
                                <h4>배송정보</h4>
                                <div class="chkout-row">
      
                                    <div class="col-lg-3">
                                        <label for="fir">수령인<span>*</span></label>
                                        <input type="text" id="fir" value="이진희">
                                    </div>
                                    <div class="col-lg-5">
                                            <label for="phone">연락처<span>*</span></label>
                                            <input type="text" id="phone" value="010-1234-1234">
                                    </div>
                                        <div class="col-lg-5">
                                            <label for="email">이메일</label>
                                            <input type="text" id="email">
                                        </div>
                                    <div class="col-lg-3" style="float: left;">
                                        <label for="street">배송지 주소<span>*</span></label>
                                        <input type="text" name="zipcode" id="zipcode" class="zipcode" value="12345" readonly>
                                    </div>
                                    <div  class="col-lg-3" style="float: left;">
                                            <label >&nbsp;</label>
                                        <input type="button"  value="우편번호찾기"/>
                                    </div>
                                    <div  class="col-lg-3" style="float: left;">
                                            <label >&nbsp;</label>
                                        <input type="text"  value="" style="border:0;"/>
                                    </div>
                                    <div class="col-lg-4" style="float: left;">
                                        <input type="text" name="address1" readonly>          
                                    </div>
                                    <div class="col-lg-5" style="float: left;">                                 
                                        <input type="text" name="address2">
                                    </div>
                               
                                    <div class="col-lg-12">
                                        <div class="dropdown_wrap">
                                                <label for="delivery-memo">배송메모</label>
                                                <input type="text" placeholder="요청사항을 직접 입력합니다" title="배송 메세지" name="deliveryMemo" class="deli_msg placeholder">
                                                 
                                            </div>
                                  
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <h5 style="font-weight: 700;">주문자 정보</h5>
                                <ul class="user_info">
                                    <li>이진희</li>
                                    <li class="_telNoHighlight "><span class="_memberTelNumber">010-1234-1234</span><button class="update-btn">수정</button></li>
                                    <li><span class="_memberEmailAddress">test123@naver.com</span><button class="update-btn">수정</button></li>
                                </ul>
                            </div> 
                            
                            
                        </div>
                        <hr>      
                    <div class="row" style="margin-top: 50px; margin-bottom: 50px;">
                        <div class="col-lg-7">     
                                <div class="discount_info discountPriceInfo">
                                        <h4><span class="blind">할인 및 포인트</span></h4>
                                        <table cellspacing="0" class="tb_discount">
                                            <colgroup>
                                                <col width="121">
                                                <col width="126">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th rowspan="2">
                                                        <div class="deliver_option_wrap"> <strong class="req short">쿠폰 할인</strong></div>
                                                    </th>
                                                    <th>상품/주문쿠폰</th>
                                                    <td>
                                                        <div class="input_area">
                                                            <input type="text" name="productCouponPrice" id="pro_coupon" value="29,200" class="value" title="상품/주문쿠폰금액" disabled="disabled">
                                                            <span class="measure">원</span>
                                                        </div>
                                                            <button class="coupon-btn">쿠폰사용</button>
                                                        <ul class="use_list">
                                                            <li>(사용가능 쿠폰 : <em>1</em>장</li>
                                                            <li>보유 쿠폰 : <em>0</em>장)</li>
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
                                                    <div class="deliver_option_wrap"><strong class="req long">포인트</strong></div>
                                                    <a href="#" title="?" class="sp_order "></a>
                                                </th>
                                                <th>보유 포인트</th>
                                                <td>
                                                    <div class="input_area no_underline">
                                                        <span class="value">541</span>
                                                        <span class="measure" style="position: relative; top: -24px;">원</span>
                                                    </div>                                            
                                                 </td>
                                            </tr>
                                            <tr>
                                                <th>사용 포인트</th>
                                                <td>
                                                    <div class="input_area">
                                                        <input type="text" id="mileage" title="포인트" name="payAmounts" value="0" class="value">
                                                        <span class="measure" style="position: relative; top: -24px;">원</span>
                                                     
                                                    </div>
                       
                                                </td>
                                            </tr>
                                    
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4>예상 적립 포인트</h4>
                                    <div class="expect_mileage">
                                            <div class="mileage" id="expect_mileage" data-benefit="1" data-hj-suppress="">379P</div>
                                            <div>적립예정</div>
                                    </div>
                            </div>
               
                    <div class="col-lg-5">
                        <div class="place-order">
                            <div class="order-total">
                                <h5 style="margin-bottom:0 !important; font-weight: 700;">최종 결제 금액</h5>
                                <ul class="order-table">
                                    <li class="total-price" style="border: 0; margin-bottom:20px; "><span style="font-size:30px; padding-top:5px; float:left;">242,500원</span></li>
                                    <li class="fw-normal">총 상품금액 <span>60,000원</span></li>
                                    <li class="fw-normal">배송비 <span>2500원</span></li>
                                    <li class="fw-normal">할인금액<span>(-)2500원</span></li> 
                                    <li class="fw-normal">포인트 사용금액<span>(-)2500원</span></li>
                                    <li class="fw-normal">쿠폰 사용금액<span>(-)2500원</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row" style="margin-top: 50px; ">
                        <div class="col-lg-12">           
                            <h4>결제수단</h4>
                            <div class="pay_method">
                                    <div class="payment_panel">
                                        <input type="radio" value="tosspay" name="order[payment_method]" id="order_payment_method_tosspay">
                                        <label class="first  top" for="order_payment_method_tosspay">
                                          <img class="img" width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png" alt="Toss">
                                          <div class="title">토스</div>
                                        </label>            
                                    <input type="radio"  value="kcp_credit_card" name="order[payment_method]" id="order_payment_method_kcp_credit_card">
                                        <label class=" top" for="order_payment_method_kcp_credit_card">
                                          <img class="img" width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png" alt="Card">
                                          <div class="title">카드</div>                                   
                            </label>            <input type="radio" value="payco" name="order[payment_method]" id="order_payment_method_payco">
                                        <label class=" top" for="order_payment_method_payco">
                                          <img class="img" width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/payco.png" alt="Payco">
                                          <div class="title">페이코</div>                            
                            </label>            <input type="radio" value="smilepay" name="order[payment_method]" id="order_payment_method_smilepay">
                                        <label class=" top" for="order_payment_method_smilepay">
                                          <img class="img" width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/smilepay.png" alt="Smilepay">
                                          <div class="title">스마일페이</div>
                            </label>            <input type="radio" value="naverpay" name="order[payment_method]" id="order_payment_method_naverpay">
                                        <label class=" top" for="order_payment_method_naverpay">
                                          <img class="img" width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/naver.png" alt="Naver">
                                          <div class="title">네이버페이</div>

                            </label>            
                            <input type="radio" value="without_bankbook" name="order[payment_method]" id="order_payment_method_without_bankbook">
                                        
                            <label class=" top" for="order_payment_method_without_bankbook">
                                <img class="img" width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/vbank.png" alt="Vbank">
                                <div class="title">무통장입금</div>                               
                            </label>    
                            <input type="radio" value="phone" name="order[payment_method]" id="order_payment_method_phone">
                                        <label class=" top" for="order_payment_method_phone">
                                          <img class="img" width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/phone.png" alt="Phone">
                                          <div class="title">핸드폰</div>
                                      
                            </label>

                        </div>
                    </div>
                    <div id="confirm_checkbox">
                            <div class="form-check check_agree_policy">
                              <label class="form-check-label" for="check_agree_policy">
                                <input type="checkbox" id="check_agree_policy" class="form-check">
                                <span class="check-img"></span>
                                결제 진행 필수사항 동의
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
                                      <td class="goal">상품 및 경품(서비스) 배송(전송), 제품 설치, 반품, 환불, 고객상담 등 정보통신서비스제공계약 및
                                        전자상거래(통신판매)계약의
                                        이행을 위해 필요한 업무의 처리
                                      </td>
                                      <td class="information">
                                        1) 구매자정보(닉네임, 성명, 휴대폰번호, 이메일주소)<br>
                                        2) 수령인정보(성명, 휴대폰번호, 주소)<br>
                                        3) 상품 구매, 취소, 반품, 교환정보<br>
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
                                      <td class="goal">1) 구매자 정보(성명, 휴대전화 번호)<br>2) 수령인 정보(성명, 휴대전화 번호, 주소)</td>
                                      <td class="information">상품 배송 및 서비스 제공을 위한 사용자 정보 확인</td>
                                      <td class="due_date" rowspan="4"> 5년 (계약 및 철회, 결제 및 공급)</td>
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
                        <button type="submit" class="site-btn place-btn">결제하기</button>
                    </div>
                 </div>
            </div>
        </form>
       <button type="button" class="site-btn place-btn impPay"  >결제하기test</button>
    </section>
    <!-- 아임포트 결제하기 부분 -->
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
    <!-- Shopping Cart Section End -->


<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	
