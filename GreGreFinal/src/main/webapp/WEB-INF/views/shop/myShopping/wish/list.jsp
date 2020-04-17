<%@page import="java.util.ArrayList"%>
<%@page import="kh.mclass.IgreMall.wish.model.vo.Wish"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/wishList.css"> --%>
<%
	List<Wish> wishList = (List<Wish>) request.getAttribute("wishList");
	List<String> imgList = new ArrayList<>();
	if (wishList != null) {
		for (int i = 0; i < wishList.size(); i++) {
			for (int j = 0; j < wishList.get(i).getProduct().getAttachList().size(); j++) {
				if ("R".equals(wishList.get(i).getProduct().getAttachList().get(j).getImgType())) {
					imgList.add(wishList.get(i).getProduct().getAttachList().get(j).getRenamedImg());
				}
			}
		}
	}

	//이미지 리스트
	pageContext.setAttribute("imgList", imgList);
%>
<style>
.button_delete--3w1UpShPvn:after {
	background-image: url(/Igre/resources/images/shop/icon/letter-x.png);
	background-repeat: no-repeat;
	background-size: cover;
	display: block;
	width: 12px;
	height: 12px;
	content: '';
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
			
		}else{
			$("input.bc-calvin").prop("checked",true); 

		}
		
	});

 	//상품 하나 체크
 	$("span.one-chk").click(function(){ 
 		if($(this).prev().prop("checked")){
 		console.log("여기오나");
 			$("span#allCheck").prev().prop("checked",false); 
			$(this).prev().prop("checked",false); 
		
 		}else{
			$(this).parent('tr').css('background','red');
			$(this).prev().prop("checked",true); 
			
 		}
		
  
 		 var checkedLen = $("input:checkbox[name='check']:checked").length;
         var checkBoxCount = $("input:checkbox[name='check']").length;
         if(checkedLen == checkBoxCount){
        	 $("span#allCheck").prev().prop("checked",true); 
         }
	});
	
});
</script>
<script>
//선택된 상품 삭제(복수개)
function deleteWishList(){
	 if (confirm("해당 상품을 삭제하시겠습니까?")) {
			var  checkedWish =$('input[name=check]:checked');	
			//수량
			var wishIdArr = new Array();
		
			$(checkedWish).each(function (index, item) { 
				wishIdArr.push($(item).val());
		 	});
			var objParams = {
					"wishIdArr" : wishIdArr
			}
			console.log("wishIdArr="+wishIdArr);
			$.ajax({
				url: "${pageContext.request.contextPath}/shop/wish/wishListDelete.do",
				type: "POST",
				dataType : "json",
				data: objParams,
				success: function (data) {
	
					location.reload();
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
//관심상품 상품 삭제 (한개)
function wishDeleteOne(wishId){
	 if (confirm("해당 상품을 삭제하시겠습니까?")) {		
			var objParams = {
					"wishId" : wishId
			} 
			$.ajax({
				url: "${pageContext.request.contextPath}/shop/wish/wishDeleteOne.do",
				type: "POST",
				dataType : "json",
				data: objParams,
				success: function (data) {
	
					location.reload();
					alert("삭제 되었습니다.");
						
				},
				error:(x,s,e)=>{
					console.log(x,s,e);
				}
			}); 
		  
		} 

}
</script>

<!-- wishlist -->
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="${pageContext.request.contextPath }/"><svg style="margin-bottom: 2.5px;"
							xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="16px"
							height="16px" viewBox="0 0 172 172" style=" fill:#000000;">
							<g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1"
								stroke-linecap="butt" stroke-linejoin="miter"
								stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
								font-family="none" font-weight="none" font-size="none"
								text-anchor="none" style="mix-blend-mode: normal">
							<path d="M0,172v-172h172v172z" fill="none"></path>
							<g fill="#b2b2b2">
							<path
								d="M86,15.0472l-78.83333,70.9528h21.5v64.5h43v-50.16667h28.66667v50.16667h43v-64.5h21.5z"></path></g></g></svg>Home</a> <a href="./shop.html">MY쇼핑</a> <span>관심상품</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-4 pt-4">
				<h1 class="mb-3 font-weight-bold text-teal ">MY쇼핑</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar"
								src="${pageContext.request.contextPath }/resources/images/myPage/user.png" />
							<div class="profile__name">${memberLoggedIn.memberId }</div>
						</div>
					</div>
					<div class="sidebar__middle">
						<div class="profile side__profile _3fftNQzxHO">
							<ul>
								<li>보유 쿠폰<a
									href="${pageContext.request.contextPath }/shop/myShopping/coupon/list.do"
									class="_2XiEZGqw1K"><em>${myCouponCount }</em>장</a>
								</li>
								<li>포인트<a href="#" class="_2XiEZGqw1K "><em> <fmt:formatNumber
												type="number" maxFractionDigits="3" value="${point }" /></em>p</a>
								</li>
							</ul>
						</div>

					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/order/list.do">
								<div class="menu__title">주문확인/배송조회</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/wish/list.do">
								<div class="menu__title">관심상품</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/event/list.do">
								<div class="menu__title">이벤트참여내역</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/review/list.do">
								<div class="menu__title">상품리뷰</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/QnA/list.do">
								<div class="menu__title">상품문의 내역</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Whish List Begin -->
			<div class="col-md-9">
				<div class="row">
					<div class="col-lg-12">
						<h4 style="margin-bottom: 20px;">
							<strong>관심상품</strong>
						</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="cart-buttons">
							<button class="primary-btn continue-shop"
								style="float: right; border-radius: 0;"
								onclick="deleteWishList();">선택 삭제</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="cart-table">
							<form name="wishFrm" method='POST' enctype="multipart/form-data">
								<table>
									<col style="width: 5%;">
									<col style="width: 10%;">
									<col style="width: 85%;">
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
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty wishList }">
											<tr>
												<td></td>
												<td class="chk-col" colspan="2">
													<div class="filter-widget">
														<div class="fw-brand-check">
															<div class="bc-item" style="padding-top: 60px;">관심상품이
																없습니다.</div>
														</div>
													</div>
												</td>

											</tr>
										</c:if>
										<c:if test="${not empty wishList }">
											<c:forEach var="wish" items="${wishList}" varStatus="vs">
												<tr>
													<td class="chk-col">
														<div class="filter-widget">
															<div class="fw-brand-check">
																<div class="bc-item">
																	<label for="bc-calvin"> <input type="checkbox"
																		name="check" class="bc-calvin" value="${wish.wishId }">
																		<span class="checkmark one-chk"></span>
																	</label>
																</div>
															</div>
														</div>
													</td>
													<td class=" first-row prod-img">
													<a href="${pageContext.request.contextPath }/shop/product/detail.do?productId=${wish.productId}">
															<c:if
																test="${fn:contains(wish.product.attachList.get(0).originalImg, 'http://')}">
																<img class="prod-main-img"
																	src="${wish.product.attachList.get(0).originalImg}"
																	alt="">
															</c:if> <c:if test="${fn:contains(wish.product.productId, 'p')}">
																<img class="prod-main-img"
																	src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${imgList.get(vs.index)}"
																	alt="">
															</c:if>
													</a>
													</td>
													<!-- 상품정보 -->
													<td class="cart-title first-row">
														<div class="product_button_area--2QEjZg27nU">
															<button type="button" class="button_delete--3w1UpShPvn"
																onclick="wishDeleteOne('${wish.wishId }');">
																<span class="blind">관심상품삭제버튼</span>
															</button>
														</div>
														<div class="prod-info-container">
															<a href="${pageContext.request.contextPath }/shop/product/detail.do?productId=${wish.productId}">
																<h5>
																	[<span>${ wish.product.brandName}</span>]
																</h5>
																<h3 class="product-name">${ wish.product.productName}</h3>
																<c:set var="discountedPrice"
																	value="${wish.product.price - wish.product.discountPrice}" />
																<c:if test="${wish.product.discountPrice > 0 }">
																	<span class="orgn_price "> <em><fmt:formatNumber
																				type="number" maxFractionDigits="3"
																				value="${wish.product.price}" /></em>원
																	</span>
																</c:if> <span class="product_price_"> <fmt:formatNumber
																		type="number" maxFractionDigits="3"
																		value="${discountedPrice}" />원
															</span>
															</a>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</form>
						</div>


					</div>
				</div>
			</div>
			<!-- Whish List End -->
		</div>
	</div>
</div>
<!-- contens End -->


<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
