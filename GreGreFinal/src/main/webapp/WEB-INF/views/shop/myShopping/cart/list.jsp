<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kh.mclass.IgreMall.shopMember.model.vo.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<%
	List<Cart> cartList = (List<Cart>) request.getAttribute("cartList");
	List<String> imgList = new ArrayList<>();
	if (cartList != null) {
		for (int i = 0; i < cartList.size(); i++) {
			for (int j = 0; j < cartList.get(i).getProduct().getAttachList().size(); j++) {
				if ("R".equals(cartList.get(i).getProduct().getAttachList().get(j).getImgType())) {
					imgList.add(cartList.get(i).getProduct().getAttachList().get(j).getRenamedImg());
				}
			}
		}
	}

	List<String> allPriceList = (List<String>) request.getAttribute("allPriceList");
	int totalProdPrice = 0;
	int totalDeliPrice = 0;
	int totalDisPrice = 0;
	for (int i = 0; i < allPriceList.size(); i++) {
		totalProdPrice += Integer.parseInt(allPriceList.get(i));
		totalDeliPrice += Integer.parseInt(cartList.get(i).getProduct().getDeliveryFee());

		int discountPrice = cartList.get(i).getProduct().getDiscountPrice();
		for (int j = 0; j < cartList.get(i).getProdCount().length; j++) {
			int count = Integer.parseInt(cartList.get(i).getProdCount()[j]);
			totalDisPrice += discountPrice * count;
		}

	}

	totalProdPrice += totalDisPrice;
	int totalOrderPrice = totalProdPrice + totalDeliPrice - totalDisPrice;

	//총 상품금액
	pageContext.setAttribute("totalProdPrice", totalProdPrice);
	//총 배송비
	pageContext.setAttribute("totalDeliPrice", totalDeliPrice);
	//총 할인금액
	pageContext.setAttribute("totalDisPrice", totalDisPrice);
	//결제금액
	pageContext.setAttribute("totalOrderPrice", totalOrderPrice);
	//이미지 리스트
	pageContext.setAttribute("imgList", imgList);
%>

<style>
ul.option_list {
	list-style: none;
}

.prod-main-img {
	width: 120px;
	border: 1px solid #848484;
}

tr {
	border-bottom: 1px solid #ebebeb;
}

.chk-col {
	text-align: center;
	width: 70px;
}

.title-col {
	padding-left: 20px !important;
	padding-right: 20px !important;
}

.button_delete--3w1UpShPvn:after {
	background-image:
		url(${pageContext.request.contextPath }/resources/images/shop/icon/letter-x.png);
	background-repeat: no-repeat;
	background-size: cover;
	display: block;
	width: 12px;
	height: 12px;
	content: '';
}

span.opt-info {
	float: left;
}

span.opt-info {
	font-size: 0.9em;
}

.cart-table table tr td.qua-col .pro-qty {
	width: 90px;
	border-radius: 20px;
	padding: 0 8px;
	margin-left: auto;
	margin-right: 10%;
	margin-bottom: 10px;
	margin-top: 15px;
}

.cart-table table tr td.qua-col .pro-qty .qtybtn {
	width: 14px;
	height: 14px;
}

.cart-table table tr td.qua-col .pro-qty input {
	width: 42px;
}

.number-count.fn-count {
	border-bottom: 1px solid #ebebeb;
	margin-bottom: 10px;
}

button.button_delete--3w1UpShPvn.del-opt {
	float: right;
}

span.deli-fee {
	color: black;
	font-weight: 400;
	font-size: 0.9em;
}

.filter-widget {
	margin-bottom: 15px
}

.filter-widget .fw-brand-check .bc-item label .checkmark {
	border: 2px solid #cbcbcb;
	height: 17px;
	width: 17px;
}

.filter-widget .fw-brand-check .bc-item label .checkmark:after {
	left: 1.3px;
}
</style>
<script>
//체크박스
$(function(){
 	$('input.bc-calvin').prop("checked",true); 
	
 	//전체상품 체크 및 해제
	$("span#allCheck").click(function(){ 

		if($('input.bc-calvin').prop("checked")){
			$("input.bc-calvin").prop("checked",false); 
			
			$('#totalProdPrice').text(0);
			$('#totalDeliPrice').text(0);
		  	$('#totalDisPrice').text(0);
			$('#totalOrderPrice').text(0);
		}else{
			$("input.bc-calvin").prop("checked",true); 
			 
			var thisCount =$('[name=count]');
 			var notDisP =$('input.notDisP');			
 			//수량
 			var countArr = new Array();
 			//판매가
 			var priceArr = new Array();
 			$(thisCount).each(function (index, item) { 
 				countArr.push(Number($(item).val()));
 		 	});
 			$(notDisP).each(function (index, item) { 
 				priceArr.push(Number($(item).val()));
 		 	});
 			
 			var allPrice =0;
 			for(var idx=0; idx<countArr.length;idx++){
 				allPrice +=countArr[idx]*priceArr[idx];
 			}
			//총 상품금액
			var totalPrice = Number(allPrice);
 			$('#totalProdPrice').text(comma(totalPrice));  
 			
 			//배달비
 			var totalDeli= 0;
 			$('input[name=deliveryFee]').each(function (index, item) { 
 				totalDeli += Number(uncomma($(item).val()));
 		 	});
 			$('#totalDeliPrice').text(comma(totalDeli));
 			
 			//할인금액
 			var discountedPrice = 0;
 			$('span.allPrice').each(function (index, item) { 
 				discountedPrice += Number(uncomma($(item).text()));
 		 	});
 			console.log("dis="+discountedPrice);
			var disPrice = Number(allPrice) - Number(discountedPrice);
 		  	$('#totalDisPrice').text(comma(disPrice)); 
 		 	
 		  	//총 결제금액 
 			var totalOrder = Number(uncomma($('#totalProdPrice').text()))
 							+ Number(uncomma($('#totalDeliPrice').text()))
 						   - Number(uncomma($('#totalDisPrice').text()));
 			
 			$('#totalOrderPrice').text(comma(totalOrder));
		}
		
	});

 	//상품 하나 체크
 	$("span.one-chk").click(function(){ 
 		if($(this).prev().prop("checked")){
 			$("span#allCheck").prev().prop("checked",false); 
 			$(this).prev().prop("checked",false); 
 			
 			var thisCount =$(this).parent().parent().parent().parent().parent().parent().find('[name=count]');
 			var notDisP =$(this).parent().parent().parent().parent().parent().parent().find('input.notDisP');
 			
 			//수량
 			var countArr = new Array();
 			//판매가
 			var priceArr = new Array();
 			$(thisCount).each(function (index, item) { 
 				countArr.push(Number($(item).val()));
 		 	});
 			$(notDisP).each(function (index, item) { 
 				priceArr.push(Number($(item).val()));
 		 	});
 			
 			var allPrice =0;
 			for(var idx=0; idx<countArr.length;idx++){
 				allPrice +=countArr[idx]*priceArr[idx];
 			}
 			//총 상품금액
		 	var totalPrice = Number(uncomma($('#totalProdPrice').text())) - Number(allPrice);
 			$('#totalProdPrice').text(comma(totalPrice)); 
 			
 			//배달비
 			var deliveryFee = $(this).parent().parent().parent().parent().parent().parent().find('input[name=deliveryFee]').val();
 			var totalDeli = Number(uncomma($('#totalDeliPrice').text())) - Number(deliveryFee);
 			$('#totalDeliPrice').text(comma(totalDeli));
 			
 			//할인금액
 			var discountedPrice = $(this).parent().parent().parent().parent().parent().parent().find('.allPrice').text();
			var disPrice = Number(allPrice) - Number(uncomma(discountedPrice));
 			var totalDisPrice = Number(uncomma($('#totalDisPrice').text())) -Number(disPrice);
 		  	$('#totalDisPrice').text(comma(totalDisPrice));
 		 	
 		  	//총 결제금액 
 			var totalOrder = Number(uncomma($('#totalProdPrice').text()))
 							+ Number(uncomma($('#totalDeliPrice').text()))
 						   - Number(uncomma($('#totalDisPrice').text()));
 			
 			$('#totalOrderPrice').text(comma(totalOrder));
		
 		}else{
			$(this).parent('tr').css('background','red');
			$(this).prev().prop("checked",true); 
			
			var thisCount =$(this).parent().parent().parent().parent().parent().parent().find('[name=count]');
 			var notDisP =$(this).parent().parent().parent().parent().parent().parent().find('input.notDisP');
 			
 			//수량
 			var countArr = new Array();
 			//판매가
 			var priceArr = new Array();
 			$(thisCount).each(function (index, item) { 
 				countArr.push(Number($(item).val()));
 		 	});
 			$(notDisP).each(function (index, item) { 
 				priceArr.push(Number($(item).val()));
 		 	});
 			
 			var allPrice =0;
 			for(var idx=0; idx<countArr.length;idx++){
 				allPrice +=countArr[idx]*priceArr[idx];
 			}
 			//총 상품금액
		 	var totalPrice = Number(uncomma($('#totalProdPrice').text())) + Number(allPrice);
 			$('#totalProdPrice').text(comma(totalPrice)); 
 			
 			//배달비
 			var deliveryFee = $(this).parent().parent().parent().parent().parent().parent().find('input[name=deliveryFee]').val();
			var totalDeli = Number(uncomma($('#totalDeliPrice').text())) + Number(deliveryFee);
 			$('#totalDeliPrice').text(comma(totalDeli));
 			
 			//할인금액
 			var discountedPrice = $(this).parent().parent().parent().parent().parent().parent().find('.allPrice').text();
			var disPrice = Number(allPrice) - Number(uncomma(discountedPrice));
 			var totalDisPrice = Number(uncomma($('#totalDisPrice').text())) +Number(disPrice);
 		  	$('#totalDisPrice').text(comma(totalDisPrice));
 		 	//총 결제금액 
 			var totalOrder = Number(uncomma($('#totalProdPrice').text()))
 							+ Number(uncomma($('#totalDeliPrice').text()))
 						   - Number(uncomma($('#totalDisPrice').text()));
 			
 			$('#totalOrderPrice').text(comma(totalOrder));
 		}
		
  
 		 var checkedLen = $("input:checkbox[name='check']:checked").length;
         var checkBoxCount = $("input:checkbox[name='check']").length;
         if(checkedLen == checkBoxCount){
        	 $("span#allCheck").prev().prop("checked",true); 
         }
	});
	
});

//수량체크
	function dec(t, optPrice, plusPrice, cartId) {
		
		var num = Number($(t).parent('div').find('[name=count]').val());
		if (num == 1) {
			alert('더이상 줄일수 없습니다.');
			num = 1;
		} else if (num > 1) {
			num--;
			var resultOptPrice  = Number(uncomma($(t).parent().parent().parent().parent().parent().parent().find('.allPrice').text()));
			resultOptPrice -= Number(optPrice); 
			$(t).parent().parent().parent().parent().parent().parent().find('.allPrice').text(comma(resultOptPrice));
		}
		$(t).parent('div').find('[name=count]').val(comma(num));
		$(t).parent().parent().parent().find('.opt-count').text(comma(num));
		
		var plusPrices = Number(plusPrice)*num;
		$(t).parent().parent().parent().find('.plus-price em').text(comma(plusPrices));
		
		
		//상품수량
		var optCountArr = new Array();
		$('.opt-count').each(function (index, item) { 
			optCountArr.push(uncomma($(item).text()));
		});
		//총 상품금액
		var totalPrice = 0;
		$('.notDisP').each(function (index, item) { 
			totalPrice += Number(uncomma($(item).val()))*Number(optCountArr[index]);
	 	});
		$('#totalProdPrice').text(comma(totalPrice));
		
		
	 	var all = 0;//할인된 금액 총합
		$('.allPrice').each(function (index, item) { 
			all += Number(uncomma($(item).text()));
	 	});
	 	//총상품금액 - 할인적용된 금액 총합 = 총할인금액
		var totalDisPrice = totalPrice -all;
		$('#totalDisPrice').text(comma(totalDisPrice));
	 
		//총 결제금액 
		var totalOrder = Number(uncomma($('#totalProdPrice').text()))
						+ Number(uncomma($('#totalDeliPrice').text()))
					   - Number(uncomma($('#totalDisPrice').text()));
		
		$('#totalOrderPrice').text(comma(totalOrder));
		

	}
	function inc(t, optPrice, plusPrice, cartId) {

		var num = Number($(t).parent('div').find('[name=count]').val());
	
		if (num >= $(t).parent('div').find('[name=count]').attr('max')) {
			alert('더이상 늘릴수 없습니다.');

		} else if (num < $(t).parent('div').find('[name=count]').attr('max')) {
			num++;
			var resultOptPrice  = Number(uncomma($(t).parent().parent().parent().parent().parent().parent().find('.allPrice').text()));
			resultOptPrice += Number(optPrice); 
			$(t).parent().parent().parent().parent().parent().parent().find('.allPrice').text(comma(resultOptPrice));
			
		}
		$(t).parent('div').find('[name=count]').val(comma(num));
		$(t).parent().parent().parent().find('.opt-count').text(comma(num));
		var plusPrices = Number(plusPrice)*num;
		$(t).parent().parent().parent().find('.plus-price em').text(comma(plusPrices));
		
		//상품수량
		var optCountArr = new Array();
		$('.opt-count').each(function (index, item) { 
			optCountArr.push(uncomma($(item).text()));
		});
		//총 상품금액
		var totalPrice = 0;
		$('.notDisP').each(function (index, item) { 
			totalPrice += Number(uncomma($(item).val()))*Number(optCountArr[index]);
	 	});
		$('#totalProdPrice').text(comma(totalPrice));
		
		
		
	 	var all = 0;//할인된 금액 총합
		$('.allPrice').each(function (index, item) { 
			all += Number(uncomma($(item).text()));
	 	});
	 	//총상품금액 - 할인적용된 금액 총합 = 총할인금액
		var totalDisPrice = totalPrice -all;
		$('#totalDisPrice').text(comma(totalDisPrice));
	 
		//총 결제금액 
		var totalOrder = Number(uncomma($('#totalProdPrice').text()))
						+ Number(uncomma($('#totalDeliPrice').text()))
					   - Number(uncomma($('#totalDisPrice').text()));
		
		$('#totalOrderPrice').text(comma(totalOrder));
		

	}


</script>
<script>
//옵션삭제하기
function optionDelete(cartId, optionId){

	 if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")) {
		console.log("여기로오나");
		console.log("cartId"+cartId);
		console.log(" optionId"+ optionId);
		var objParams = {
				"cartId" : cartId,
				"optionId" : optionId
		} 

		$.ajax({
			url: "${pageContext.request.contextPath}/shop/myShopping/optionDelete.do",
			type: "POST",
			dataType : "json",
			data: objParams,
			success: function (data) {
				var cId = data.cartId;
				var oId = data.optionId;
				
				
				
				alert("삭제 되었습니다.");
				
					
			},
			error:(x,s,e)=>{
				console.log(x,s,e);
			}
		}); 
	  
	} 


}
</script>
<script>
function cartSubmit(index, cartId){
	//장바구니 구매하기
	if(index == 1){
		document.cartFrm.action='${pageContext.request.contextPath }/shop/order/checkOut.do';
		document.cartFrm.submit();
	
	}
	//바로구매하기 상품하나
	if(index==2){
		var a = '${pageContext.request.contextPath }/shop/order/checkOut.do?cartIdOne='+cartId;
		console.log("cartId"+cartId)
 		document.cartFrm.action= a;
		document.cartFrm.submit();
		
	}
}

</script>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="${pageContext.request.contextPath }/shop/shop.do"> <svg
							style="margin-bottom: 2.5px;" xmlns="http://www.w3.org/2000/svg"
							x="0px" y="0px" width="16px" height="16px" viewBox="0 0 172 172"
							style=" fill:#000000;">
							<g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1"
								stroke-linecap="butt" stroke-linejoin="miter"
								stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
								font-family="none" font-weight="none" font-size="none"
								text-anchor="none" style="mix-blend-mode: normal">
							<path d="M0,172v-172h172v172z" fill="none"></path>
							<g fill="#b2b2b2">
							<path
								d="M86,15.0472l-78.83333,70.9528h21.5v64.5h43v-50.16667h28.66667v50.16667h43v-64.5h21.5z"></path></g></g></svg>
						Home
					</a> <span>장바구니</span>
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
					<form name="cartFrm" method='POST' enctype="multipart/form-data">
						<table>
							<col style="width: 3%;">
							<col style="width: 10%;">
							<col style="width: 27%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<thead>
								<tr>
									<th class="title-col">
										<div class="filter-widget">
											<div class="fw-brand-check">
												<div class="bc-item">
													<label for="bc-calvin"> <input type="checkbox"
														id="input-all" class="bc-calvin" /> <span id="allCheck"
														class="checkmark"></span>
													</label>
												</div>
											</div>
										</div>
									</th>
									<th class="title-col" colspan="2">상품정보</th>
									<th class="title-col">옵션</th>
									<th class="title-col">상품금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cart" items="${cartList}" varStatus="vs">
									<tr>
										<td class="chk-col">
											<div class="filter-widget">
												<div class="fw-brand-check">
													<div class="bc-item">
														<label for="bc-calvin"> 
														<input type="checkbox"
															name="check" class="bc-calvin" value="${cart.cartId }"> 
															<span class="checkmark one-chk"></span>
														</label>
													</div>
												</div>
											</div>
										</td>
										<td class=" first-row prod-img"><img
											class="prod-main-img"
											src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${imgList.get(vs.index)}"
											alt=""></td>
										<!-- 상품정보 -->
										<td class="cart-title first-row">
											<div class="product_button_area--2QEjZg27nU">
												<button type="button" class="button_delete--3w1UpShPvn">
													<span class="blind">상품삭제버튼</span>
												</button>
											</div>
											<div class="prod-info-container">
												<h5>
													[<span>${ cart.product.brandName}</span>]
												</h5>
												<h3 class="product-name">${ cart.product.productName}</h3>
												<c:set var="discountedPrice"
													value="${cart.product.price - cart.product.discountPrice}" />
												<span class="orgn_price "><em><fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${cart.product.price}" /></em>원</span> <span
													class="product_price_"><fmt:formatNumber
														type="number" maxFractionDigits="3"
														value="${discountedPrice}" />원</span>
											</div>
										</td>
										<!-- 옵션 -->
										<td class="qua-col first-row">
											<div class="option">
												<c:forEach items="${cart.optionList}" var="optList"
													varStatus="optVs">
													<input type="hidden" name="optionId"
														value="${optList.optionId}">
													<button type="button"
														class="button_delete--3w1UpShPvn del-opt"
														onclick="optionDelete('${cart.cartId }','${optList.optionId}');">
														<span class="blind">옵션삭제버튼</span>
													</button>
													<c:set var="optName"
														value="${fn:split(optList.optionName,',') }" />
													<c:set var="optValue"
														value="${fn:split(optList.optionValue,',') }" />
													<div class="number-count fn-count">
														<ul class="option_list">
															<li><span class="opt-info"> <c:forEach
																		items="${optName }" var="optNm" varStatus="nmVs">
																${optNm} : ${optValue[nmVs.index]} / 
														</c:forEach> <em class="opt-count">${cart.prodCount[optVs.index] }</em>개
															</span></li>
															<li><span class="plus-price">(+ <em> <fmt:formatNumber
																			type="number" maxFractionDigits="3"
																			value="${(optList.optionPrice - cart.product.price)*cart.prodCount[optVs.index]}" />
																</em> )

															</span></li>
														</ul>
														<div class="quantity">
															<div class="pro-qty">
																<span class="dec qtybtn" id="dec-button"
																	onclick="dec(this,'${optList.optionPrice - cart.product.discountPrice}', '${optList.optionPrice - cart.product.price}', '${cart.cartId}');">-</span>
																<input type="text" name="count"
																	value="${cart.prodCount[optVs.index] }" min="1"
																	max="${optList.optionStock }"> <span
																	class="inc qtybtn" id="inc-button"
																	onclick="inc(this, '${optList.optionPrice - cart.product.discountPrice}','${optList.optionPrice - cart.product.price}','${cart.cartId}');">+</span>
																<input type="hidden" class="notDisP"
																	value='${optList.optionPrice }' />
															</div>
														</div>
													</div>
												</c:forEach>
												<c:if test="${ empty cart.optionId }">
													<div class="number-count fn-count">
														<ul class="option_list">
															<li><span class="opt-info"> 상품 주문 수량 : <em
																	class="opt-count">${cart.prodCount[0]}</em>개
															</span></li>
														</ul>
														<div class="quantity">
															<div class="pro-qty">
																<span class="dec qtybtn" id="dec-button"
																	onclick="dec(this,${discountedPrice}, ${cart.product.discountPrice });">-</span>
																<input type="text" name="count"
																	value="${cart.prodCount[0]}" min="1"
																	max="${cart.product.productStock }"> <span
																	class="inc qtybtn" id="inc-button"
																	onclick="inc(this,${discountedPrice}, ${cart.product.discountPrice });">+</span>
																<input type="hidden" class="notDisP"
																	value='${cart.product.price}' />
															</div>
														</div>
													</div>
												</c:if>
											</div>
										</td>
										<!-- 주문금액 -->
										<td class="total-price first-row"><span class="allPrice"><fmt:formatNumber
													type="number" maxFractionDigits="3"
													value="${allPriceList.get(vs.index) }" /> </span>원 <br> 
											<c:if
												test="${ cart.product.deliveryFee eq 0}">
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
											<input type="button" class="btn btn-light"
											style="margin-top: 10px;" value="바로구매"
											onclick="cartSubmit(2, '${cart.cartId}');" /></td>
										<!-- 배송비 -->
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</form>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="cart-buttons">
							<a href="#" class="primary-btn continue-shop">선택 삭제</a> <a
								href="#" class="primary-btn continue-shop">계속 쇼핑하기</a>
						</div>
					</div>
					<div class="col-lg-4 offset-lg-4">
						<div class="proceed-checkout">
							<ul>
								<li class="subtotal">총 상품금액 <span> <em
										id="totalProdPrice"> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${totalProdPrice}" />
									</em> 원
								</span>
								</li>
								<li class="subtotal">총 배송비 <span> <em
										id="totalDeliPrice"> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${totalDeliPrice}" />
									</em> 원
								</span>
								</li>
								<li class="subtotal">총 할인금액 <span>(-) <em
										id="totalDisPrice"> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${totalDisPrice}" />
									</em> 원
								</span>
								</li>
								<li class="cart-total">결제금액 <span> <em
										id="totalOrderPrice"> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${totalOrderPrice}" />
									</em> 원
								</span>
								</li>
							</ul>
							<input type="button" class="btn proceed-btn" onclick="cartSubmit(1);"
								value="구매하기" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shopping Cart Section End -->



<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
