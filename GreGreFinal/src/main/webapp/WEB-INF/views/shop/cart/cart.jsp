<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
 <style>
.chk-col{
	text-align: center;
	width:70px;
}
.title-col{
	padding-left:20px !important;
	padding-right:20px !important;
}
</style>
<!-- Breadcrumb Section Begin -->
   <div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                   <a href="${pageContext.request.contextPath }/shop/shop.do">
                       <svg style="margin-bottom: 2.5px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                    width="16px" height="16px"
                    viewBox="0 0 172 172"
                    style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#b2b2b2"><path d="M86,15.0472l-78.83333,70.9528h21.5v64.5h43v-50.16667h28.66667v50.16667h43v-64.5h21.5z"></path></g></g></svg>
                    Home</a> 
                    <span>장바구니</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-table">
                    <table>
                        <thead>
                            <tr>
                                <th class="title-col"><input type="checkbox" id=""/></th>
                                <th  class="title-col" colspan="2">상품정보</th>
                                <th class="title-col">수량</th>
                                <th class="title-col">상품금액</th>
                                <th class="title-col">할인금액</th>
                                <th class="title-col">할인적용금액</th>
                                <th class="title-col">배송비</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="chk-col">       
                                    <input type="checkbox" id=""/>
                                </td>
                                <td class="cart-pic first-row"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                <td class="cart-title first-row">
                                    <h5>Pure Pineapple</h5>
                                </td>
                                <td class="qua-col first-row">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </div>
                                </td>
                                <td class="p-price first-row">10,000원</td>
                                <td class="discount-price first-row">2,000원</td>
                                <td class="total-price first-row">8,000원</td>
                                <td class="delivery-price first-row">2,500원</td>
                            </tr>
                            <tr>
                                <td class="chk-col">        
                                    <input type="checkbox" id=""/>
                                </td>
                                <td class="cart-pic"><img src="img/cart-page/product-2.jpg" alt=""></td>
                                <td class="cart-title">
                                    <h5>American lobster</h5>
                                </td>
                                <td class="qua-col">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </div>
                                </td>
                                <td class="p-price first-row">10,000원</td>
                                <td class="discount-price first-row">2,000원</td>
                                <td class="total-price first-row">8,000원</td>
                                <td class="delivery-price first-row">무료</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="cart-buttons">
                            <a href="#" class="primary-btn ">선택 삭제</a>
                            <a href="#" class="primary-btn continue-shop">계속 쇼핑하기</a>
                        </div>       
                    </div>
                    <div class="col-lg-4 offset-lg-4">
                        <div class="proceed-checkout">
                            <ul>
                                <li class="subtotal">총 상품금액 <span>20,000원</span></li>
                                <li class="subtotal">총 배송비 <span>2,500원</span></li>
                                <li class="subtotal">총 할인금액 <span>(-)4,000원</span></li>
                                <li class="cart-total">결제금액 <span>18,500원</span></li>
                            </ul>
                            <a href="${pageContext.request.contextPath }/shop/checkOut.do" class="proceed-btn">구매하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->



<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	