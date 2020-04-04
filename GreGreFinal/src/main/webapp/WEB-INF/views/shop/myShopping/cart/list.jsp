<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kh.mclass.IgreMall.shopMember.model.vo.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
<%
	List<Cart> cartList = (List<Cart>)request.getAttribute("cartList");
    List<String> imgList= new ArrayList<>();
	if(cartList != null){
		for(int i=0;i<cartList.size();i++){
			for(int j=0; j<cartList.get(i).getProduct().getAttachList().size();j++){
				 if("R".equals(cartList.get(i).getProduct().getAttachList().get(j).getImgType())){
					imgList.add(cartList.get(i).getProduct().getAttachList().get(j).getRenamedImg());	
				}
			}
		}
	}

	//이미지 리스트
	pageContext.setAttribute("imgList", imgList); 
%>

 <style>
.prod-main-img{
  width:120px;
  border: 1px solid #848484;
}
tr {
    border-bottom: 1px solid #ebebeb;
	
}
.chk-col{
	text-align: center;
	width:70px;
}
.title-col{
	padding-left:20px !important;
	padding-right:20px !important;
}
.button_delete--3w1UpShPvn:after {
    background-image: url(${pageContext.request.contextPath }/resources/images/shop/icon/letter-x.png);
    background-repeat: no-repeat;
    background-size: cover;
    display: block;
    width: 12px;
    height: 12px;
    content: '';
}
.cart-table table tr td.qua-col .quantity {
    display: inline-block !important;
   
}
</style>

<script>
//수량체크
	function dec(t, optPrice) {
		
		var num = Number($(t).parent('div').find('[name=count]').val());
		if (num == 1) {
			alert('더이상 줄일수 없습니다.');
			num = 1;
		} else if (num > 1) {
			num--;
		}
		$(t).parent('div').find('[name=count]').val(num);
		var resultOptPrice = Number(optPrice) * num;
		var prevPrice = Number($('#totalPrice').text())-Number(optPrice);
		if(num>1){
			$(t).parent().parent().parent().parent().parent().find('.optPrice').text(resultOptPrice);
			$('#totalPrice').text(prevPrice);	
		}if(num==1){
			 $('#totalPrice').text(prevPrice); 
			 $('#totalPrice').text(prevPrice);
			$(t).parent().parent().parent().parent().parent().find('.optPrice').text(resultOptPrice);
		}

	}
	function inc(t, optPrice) {

		var num = Number($(t).parent('div').find('[name=count]').val());
	
		if (num >= $(t).parent('div').find('[name=count]').attr('max')) {
			console.log("증가값=" + num);
			alert('더이상 늘릴수 없습니다.');

		} else if (num < $(t).parent('div').find('[name=count]').attr('max')) {
			num++;
			console.log("max값=" + $(t).parent('div').find('[name=count]').attr('max'));
		}
		$(t).parent('div').find('[name=count]').val(num);
		var resultOptPrice = Number(optPrice) * num;
		var prevPrice = Number($('#totalPrice').text())+Number(optPrice);
		if(num < $(t).parent('div').find('[name=count]').attr('max')){
			$(t).parent().parent().parent().parent().parent().find('.optPrice').text(resultOptPrice);	
			$('#totalPrice').text(prevPrice);
		}

	}
</script>
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
                    	<col style="width: 3%;">
						<col style="width: 10%;">
						<col style="width: 27%;">
						<col style="width: 30%;">
						<col style="width: 15%;">
						<col style="width: 20%;">
                        <thead>
                            <tr>
                                <th class="title-col"><input type="checkbox" id=""/></th>
                                <th  class="title-col" colspan="2">상품정보</th>
                                <th class="title-col">옵션</th>
                                <th class="title-col">상품금액</th>
                                <th class="title-col">배송비</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cart" items="${cartList}" varStatus="vs">
                            <tr>
                                <td class="chk-col">    
                      
                                    <input type="checkbox" id=""/>
                                </td>
                                <td class=" first-row prod-img">
                                	<img  class="prod-main-img" src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${imgList.get(vs.index)}" alt="">
                                </td>
                                <!-- 상품정보 -->
                                <td class="cart-title first-row">
                                   <div class="product_button_area--2QEjZg27nU">
                                   		<button type="button" class="button_delete--3w1UpShPvn">
                                   			<span class="blind">상품삭제버튼</span>
                                   		</button>
                                   	</div>
                                   <div class="prod-info-container">
                                    	<h5>[<span>${ cart.product.brandName}</span>]</h5>
                                    	<h3 class="product-name">${ cart.product.productName}</h3>
                                    	<c:set var="discountedPrice" value= "${cart.product.price - cart.product.discountPrice}"/>
                                    	<span class="orgn_price "><em><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.product.price}" /></em>원</span>
                                    	<span class="product_price_"><fmt:formatNumber type="number" maxFractionDigits="3" value="${discountedPrice}" />원</span>
                                   </div>
                                </td>
                                <!-- 옵션 -->
                                <td class="qua-col first-row">
                                		10,000원
                                	<div class="number-count fn-count">
                                           <div class="quantity">
                                                 <div class="pro-qty">
													<span class="dec qtybtn" id="dec-button" onclick="dec(this,1);">-</span>
                                                     <input type="text" name="count" value="1"  min="1" max="">
                                                     <span class="inc qtybtn" id="inc-button" onclick="inc(this,1);">+</span></div>
                                          </div>
                                     </div>
                                </td>
                                <!-- 주문금액 -->
                                <td class="total-price first-row">
                                	<span>
	                                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${allPriceList.get(vs.index) }"/>원
                                	</span>
 									<button type="button" class="btn btn-light" style="margin-top: 10px;">바로구매</button>                               	
                                </td>
                                <!-- 배송비 -->
                                <c:if test ="${ cart.product.deliveryFee eq 0}">
                                <td class="delivery-price first-row">무료</td>
                                </c:if>
                                <c:if test ="${ cart.product.deliveryFee > 0}">
                                <td class="delivery-price first-row"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.product.deliveryFee }" />원</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                            
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