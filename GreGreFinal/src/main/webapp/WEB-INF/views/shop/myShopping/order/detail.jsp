<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
 <div id="body" class="orders show" data-s_id="868ed5fcb7a9578747162306ace05acf" style="padding-bottom: 0px;">
        <script>
      sessionStorage["share_code"] = '';
      sessionStorage["beforeContentType"] = 'UserOrder';
      sessionStorage["beforeContentId"] = '';
    </script>

    <div class="contents">
      <div class="title">주문상세정보</div>
      <!-- finish title -->
    
      <div id="detail_info">
        <div class="subtitle">주문번호 : 17323851 | 주문일자
          : 2020.03.15</div>
    
          <div class="table">
              <div class="order_list">
                <div class="product_image">
                  <div class="image" style="background-image: url('https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-productions-158373007123910799.jpg/250/none')"></div>
                </div>
    
                <div class="product_detail">
                  <a class="name" target="_blank" href="/productions/253483/selling">[공간조명] 첼시아 1등 벽등_크리스탈</a>
    
                  <div class="option">첼시아 1등 벽등_크리스탈</div>
    
    
    
                  <div class="cost">110,000원</div>
                  <div class="count">| 1개</div>
    
                  <div class="status">
                      입금대기
                    <span class="status__divider"></span>일반택배배송
                  </div>
                </div>
    
                <div class="button_set">
                  <div class="fake"></div>
                  <div class="buttons">
                      <a class="button" href="/orders/17323851/order_cancel">주문취소</a>
    
    
    
                  </div>
                </div>
              </div>
    
    
                <div class="order_delivery">
                  <div class="method">
                      무료배송
                  </div>
                  <span class="brand">
                    공간조명1 배송
                  </span>
                    <a class="phone" href="tel:07049496792 ">
                      070-4949-6792 
    </a>            </div>
          </div>
      </div>
      <!-- finish detail_info -->
    
        <div id="vbank_info">
          <div class="subtitle">가상계좌정보</div>
          <div class="wrap_panel">
              <div class="field">
                <div class="title">은행명</div>
                <div class="content">국민은행</div>
              </div>
              <div class="field">
                <div class="title">계좌번호</div>
                <div class="content">7124u123912</div>
              </div>
              <div class="field">
                <div class="title">예금주</div>
                <div class="content">주식회사 버킷플레이스</div>
              </div>
              <div class="field">
                <div class="title">입금금액</div>
                <div class="content emphasis">110,000원</div>
              </div>
                <div class="field">
                  <div class="title">기한</div>
                  <div class="content">2020.03.20
                    까지
                  </div>
                </div>
          </div>
        </div>
      <!-- finish vbank_info -->
    
      <div id="payment_info">
        <div class="subtitle">결제 정보</div>
    
          <div class="wrap_panel divide one">
            <div class="field">
              <div class="title">상품금액</div>
              <div class="content">135,000원</div>
            </div>
            <div class="field">
              <div class="title">할인금액</div>
              <div class="content">(-) 25,000원</div>
            </div>
            <div class="field">
              <div class="title">사용 포인트</div>
              <div class="content">
                (-) 0원
                
              </div>
            </div>
            <div class="field">
              <div class="title">쿠폰 할인가</div>
              <div class="content">
                (-) 0원
                
              </div>
            </div>
            <div class="field">
              <div class="title">결제금액</div>
              <div class="content emphasis">
                10,000원
              </div>
            </div>
            <div class="field">
              <div class="title">결제방법</div>
              <div class="content">
                  가상계좌 입금
                  <a target="_blank" href="https://npg.nicepay.co.kr/issue/IssueLoader.do?TID=bucketplam03012003151627355924&amp;type=0&amp;InnerWin=Y">(영수증)</a>
              </div>
            </div>
          </div>
    
          <div class="wrap_panel divide two">
            <div class="field">
              <div class="title">주문자</div>
              <div class="personal">
                조정우
              </div>
            </div>
            <div class="field">
              <div class="title">연락처</div>
              <div class="personal">010-1234-1234</div>
            </div>
            <div class="field">
              <div class="title">이메일</div>
              <div class="personal">test123@nate.com</div>
            </div>
          </div>
      </div>
      <!-- finish payment_info -->
    
      <div id="delivery_info">
        <div class="subtitle">배송지 정보</div>
    
        <div class="wrap_panel">
          <div class="field">
            <div class="title">수령인</div>
            <div class="content">조정우</div>
          </div>
          <div class="field">
            <div class="title">연락처</div>
            <div class="content">010-1234-1234</div>
          </div>
          <div class="field">
            <div class="title">주소</div>
            <div class="content">경기 수원시 </div>
          </div>
          <div class="field">
            <div class="title">배송메모</div>
                <div class="content">
                  <div class="memo">감사합니다</div>
                </div>
          </div>
        </div>
      </div>
      <!-- finish delivery_info -->
    
    </div>
    
      </div>

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	

