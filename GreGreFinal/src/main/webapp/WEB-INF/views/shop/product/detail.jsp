<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />

<!--product view js -->
<script
	src="${pageContext.request.contextPath }/resources/js/shop/productView.js"></script>
<!--product view css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/productView.css"
	type="text/css"></link>
<style>
.dropdown-wrap.select .btn-sel-option {
	width: 100%;
	height: 38px;
	padding: 10px 15px 10px 15px;
	vertical-align: top;
	color: #000;
	background: #fff
		url(${pageContext.request.contextPath }/resources/images/ui/ui_select_arr.png)
		right center no-repeat;
	cursor: pointer;
	line-height: 16px;
	border: solid 1px #ddd;
	text-align: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.fa-star:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/star.png');
	background-size: 20px 20px;
	width: 20px;
	height: 20px;
	display: inline-block;
}

.fa-star-o:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/star-o.png');
	background-size: 18px 18px;
	width: 18px;
	height: 18px;
	display: inline-block;
	margin-bottom: 1px;
}

span.optVal1 {
	color: #FF5722;
	font-weight: 500;
}
span.opt-price {
    float: right;
}

span.optNm2 {
    color: #FF5722;
    font-weight: 500;
}
</style>
<script>
	function addOpt1(optVal1) {
		var dataOpt1 = new Array();
		<c:forEach items="${optionValue1}" var ="item">
			dataOpt1.push("${item}");
		</c:forEach>
		var dataOpt2 = new Array();
		<c:forEach items="${optionValue2}" var ="item">
			dataOpt2.push("${item}");
		</c:forEach>
		var dataOptList = new Array();
		<c:forEach items="${optionList}" var ="item">
			var optItem = new Object();
			optItem.optionId = "${item.optionId}";
			optItem.optionName = "${item.optionName}";
			optItem.optionValue = "${item.optionValue}";
			optItem.optionStock = "${item.optionStock}";
			optItem.optionPrice = "${item.optionPrice}";
			dataOptList.push(optItem);
		</c:forEach>
		var dataResultOption = new Array();

		
		var idx=0;
		var t=0;
		var optPriceArr = new Array();
		var optValueArr = new Array();
		var optStockArr = new Array();
		var optIdArr = new Array();
		
		var discountPrice = Number("${p.discountPrice}");
 		for( idx ; idx<dataOpt1.length;idx++){
			for( t ; t<dataOpt2.length;t++){
				var resultOption = optVal1+','+dataOpt2[t];
				 for (var a=0; a<dataOptList.length;a++) {
					if(resultOption == dataOptList[a].optionValue){
						optPriceArr.push(Number(dataOptList[a].optionPrice)-discountPrice);
						optValueArr.push(dataOpt2[t]);
						optStockArr.push(dataOptList[a].optionStock);
						optIdArr.push(dataOptList[a].optionId);
					}
					
				} 
			}
		}

		$('span.optVal1').remove();
		$('#btn-sel-option1').toggleClass("open").next(".dropdown-cont").toggleClass("open");
		var optValHtml = '<span class="optVal1">' + optVal1 + '</span>';
		$('#btn-sel-option1').append(optValHtml);
		
		var data = [ { 
			"optVal1" :   optVal1,
			"optPriceArr" :  optPriceArr[0],
			"optValueArr" :   optValueArr[0],
			"optStockArr" :   optStockArr[0],
			"optIdArr" :   optIdArr[0]
			
		    },
		    { 
				"optVal1" :   optVal1,
				"optPriceArr" :  optPriceArr[1],
				"optValueArr" :   optValueArr[1],
				"optStockArr" :   optStockArr[1],
				"optIdArr" :   optIdArr[1]
				
			  },
			  { 
					"optVal1" :   optVal1,
					"optPriceArr" :  optPriceArr[2],
					"optValueArr" :   optValueArr[2],
					"optStockArr" :   optStockArr[2],
					"optIdArr" :   optIdArr[2]
					
				  },
				  { 
						"optVal1" :   optVal1,
						"optPriceArr" :  optPriceArr[3],
						"optValueArr" :   optValueArr[3],
						"optStockArr" :   optStockArr[3],
						"optIdArr" :   optIdArr[3]
						
					  }
			    
		    
		    ];
		var template = $.templates("#itemTmplOption2");
		var htmlOutput = template.render(data);
		$('#opt2-list .item').remove();
		$("#opt2-list").append(htmlOutput);
		
		//optionValue가 없을 때
		if(${optionValue2}==""){
			
			var optId="";
			var optPrice=0;
			var optNm1="";
			var optStock=0;
			for(var vIdx =0; vIdx <dataOptList.length ; vIdx++){
				if(dataOptList[vIdx].optionValue == optVal1){
			
					optId = dataOptList[vIdx].optionId;
					optPrice = dataOptList[vIdx].optionPrice;
					optNm1 = dataOptList[vIdx].optionValue;
					optStock = dataOptList[vIdx].optionStock;
				}
			}
			var price = "${p.price-p.discountPrice}";

			var data = [ {
				"optId" : optId,
				"optPrice" : Number(optPrice),
				"optNm" : optNm1,
				"optStock" : Number(optStock)
			} ];
			
			$('span.optNm2').remove();


			
			var template = $.templates("#itemTmplOption");
			var htmlOutput = template.render(data);
			$("#selected-option").append(htmlOutput);
			var prevPrice = Number($('#totalPrice').text())+Number(optPrice);
		
			$('#totalPrice').text(prevPrice);		
		}

	}
</script>
<script>
	function addOption(optId, optPrice, optNm1, optNm2, optStock) {
		var price = "${p.price-p.discountPrice}";
		//$('.optPrice').val(price);
		var data = [ {
			"optId" : optId,
			"optPrice" : Number(optPrice),
			"optNm" : optNm1+"/"+optNm2,
			"optStock" : Number(optStock)
		} ];
		
		$('span.optNm2').remove();
		$('#btn-sel-option2').toggleClass("open").next(".dropdown-cont").toggleClass("open");
		var optValHtml = '<span class="optNm2">' + optNm2 + '</span>';
		$('#btn-sel-option2').append(optValHtml);
		
		var template = $.templates("#itemTmplOption");
		var htmlOutput = template.render(data);
		$("#selected-option").append(htmlOutput);
		var prevPrice = Number($('#totalPrice').text())+Number(optPrice);
	
		$('#totalPrice').text(prevPrice);			
		
	
	}
</script>
<script>
	function optDelete(t) {
		var rePrice = Number($('#totalPrice').text())-Number($(t).parent().parent().find('.optPrice').text());
		$('#totalPrice').text(rePrice);
		$(t).parent().parent().remove();
	}
</script>
<script>
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
<script>
function detailSubmit(index){
	if(index == 1){
		 var optionIdArr = [];
		 if($('[name=optionId]').val()!=null){
	         $('[name=optionId]').each(function(i){//체크된 리스트 저장
	    		optionIdArr.push($(this).val()); 
	         	console.log("이거는="+$(this).val());
	          });		 
		 }        
		 var countArr = [];
         $('[name=count]').each(function(i){//체크된 리스트 저장
        	 countArr.push($(this).val());
         	console.log("이거는="+$(this).val());
          }); 
		
		/* 		document.detailFrm.action=' ${pageContext.request.contextPath }/shop/myShopping/cart.do'; */
		var objParams = {
			"memberId" : $("[name=memberId]").val(),
			"optionIdList" : optionIdArr,
			"countList" : countArr
		} 
		$.ajax({
		    type : 'POST',
		    dataType : "json",
			url:"${pageContext.request.contextPath}/shop/myShopping/cartInsert.do",
			 data : objParams,
			success: function(retVal){
                    alert(retVal.message);
                 
            },
			error:(x,s,e)=>{
				console.log(x,s,e);
			}
		}); 
	
	
	}
	if(index==2){
		document.detailFrm.action='${pageContext.request.contextPath }/shop/order/checkOut.do';
		document.detailFrm.submit();
		
	}
}

</script>

<script>
$(function(){
	$("#dec-button").prev().hide();
	$("#inc-button").next().hide();
});
</script>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="./home.html"><i class="fa fa-home"></i> Home</a> <a
						href="./shop.html">Shop</a> <span>Detail</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="container">
	<!-- Product Shop Section Begin -->
	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-6">
							<div class="product-pic-zoom">
								<c:if
									test="${fn:contains(attachList.get(0).originalImg, 'http://')}">
									<img class="product-big-img"
										src="${attachList.get(0).originalImg}" alt="">
								</c:if>
								<c:if test="${fn:contains(p.productId, 'p')}">
									<c:forEach var="attach" items="${attachList}" varStatus="vs">
									<c:if test='${ "R" eq attach.imgType}'>
										<img class="product-big-img"
											src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${attach.renamedImg}"
											alt="">
								
									</c:if>
									</c:forEach>
								</c:if>
								<div class="zoom-icon">
									<i class="fa fa-search-plus"></i>
								</div>
							</div>
							<div class="product-thumbs">
								<div class="product-thumbs-track ps-slider owl-carousel">
									<c:forEach var="attach" items="${attachList}" varStatus="vs">
									<c:if test='${ "R" eq attach.imgType}'>
											<div class="pt active"
												data-imgbigurl="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${attach.renamedImg}">
												<img
													src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${attach.renamedImg}"
													alt="">
											</div>
										</c:if> 
									</c:forEach>
									<c:forEach var="attach" items="${attachList}" varStatus="vs"> 
										<c:if test='${ "D" eq attach.imgType}'>
											<div class="pt"
												data-imgbigurl="${pageContext.request.contextPath}/resources/upload/shop/productSubImg/${attach.renamedImg}">
												<img
													src="${pageContext.request.contextPath}/resources/upload/shop/productSubImg/${attach.renamedImg}"
													alt="">
											</div> 
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<span>${p.brandName }</span>
									<h3>${p.productName }</h3>
									<a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
								</div>
								<div class="pd-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i> <span>(5)</span>
								</div>
								<div class="pd-desc">
									<h4>
										<c:set var="discountedPrice" value= "${p.price-p.discountPrice}"/>
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${p.price-p.discountPrice}" />
										원 <span> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${p.price}" />원
										</span>
									</h4>
								</div>
								<hr>
								<ul class="pd-tags">
									<li><span>배송비</span> ${p.deliveryFee }원</li>
									<li><span>포인트</span> 최대 ${p.pointRate }% 적립</li>
								</ul>
								<hr>
								<div class="prd-option">
									<c:if test="${not empty optionName}">
										<c:forEach items="${optionName}" var="optNm" varStatus="vs1">
											<c:if test="${ vs1.index eq 0}">
												<div class="dropdown-wrap select fn-select"
													data-role="dropdown" data-effect="slide"
													style="z-index: 1;">
													<button type="button" id="btn-sel-option1"
														class="btn-sel-option fn-btn">
														${optNm}<span class="down-up-icon"></span>
													</button>
													<div class="dropdown-cont fn-cont right share-cont"
														data-width="550" style="width: 550px;"
														id="dropdown-menu-3" aria-hidden="true"
														aria-owns="dropdown-btn-3">
														<c:if test="${not empty optionValue1}">
															<c:forEach items="${optionValue1}" var="opt1"
																varStatus="vs">
																<ul class="option-list">
																	<li class="item">
																		<!-- 가격 넘겨주기 addOption()  -->
																		<button class="btn-option"
																			onclick="addOpt1('${opt1}');">${opt1}</button>
																			<c:set var="selectedOpt1" value="${opt1 }" scope="page" />
																	</li>
																</ul>
															</c:forEach>
														</c:if>
													</div>
												</div>
											</c:if>

											<c:if test="${  vs1.index eq 1 }">
												<div class="dropdown-wrap select fn-select"
													data-role="dropdown" data-effect="slide"
													style="z-index: 1;">
													<button type="button" class="btn-sel-option fn-btn" id="btn-sel-option2">
														${optNm}<span class="down-up-icon"></span>
													</button>
													<div class="dropdown-cont fn-cont right share-cont"
														data-width="550" style="width: 550px;"
														id="dropdown-menu-opt2" aria-hidden="true"
														aria-owns="dropdown-btn-3">
														<ul class="option-list" id="opt2-list">
														</ul>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</c:if>
									<script id="itemTmplOption2" type="text/x-jsrender"
										data-jsv-tmpl="jsvTmpl">
															{{if optValueArr}}
																<li class="item">
																	<!-- 가격 넘겨주기 addOption()  --> 
																	<button class="btn-option"
																	onclick="addOption({{:optIdArr}}, {{:optPriceArr}}, '{{:optVal1}}','{{:optValueArr}}','{{:optStockArr}}');">{{:optValueArr}}<span class="opt-price">{{:optPriceArr}}</span></button>
																</li>
															{{/if}}

												
									</script>
									<script id="itemTmplOption" type="text/x-jsrender"
										data-jsv-tmpl="jsvTmpl">
									
                                        <div class="option-box">
                                            <input type="hidden" name="optionId"  value="{{:optId}}"> 
                                            <input type="hidden" name="optionPrice"  value="{{:optPrice}}">
                                            <div class="sel-title">
                                                                                                        선택 : {{:optNm}}
                                                <button type="button" class="btn-option-delete" onclick="optDelete(this);"><span class="" style="color:#979696; margin: 0 auto;"><strong>X</strong></span></button>
                                            </div>
                                            
                                            <div class="option-info">
                                                <div class="fleft">
                                                    <!--수량체크-->
                                                    <div class="number-count fn-count">
                                                            <div class="quantity">
                                                                <div class="pro-qty">
																	<span class="dec qtybtn" onclick="dec(this,{{:optPrice}});">-</span>
                                                                    <input type="text" name="count"  value="1"  min="1" max="{{:optStock}}">
                                                               		<span class="inc qtybtn" onclick="inc(this,{{:optPrice}});">+</span></div>
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="fright">
                                                    <div class="price-select">
                                                        <span class="number optPrice">{{:optPrice}}</span><span class="unit">원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
									
                                    </script>
                                <form name="detailFrm" method='POST' enctype="multipart/form-data">
                                	<input type="hidden" name="memberId" value="${memberLoggedIn.memberId }"> 
									<!-- 선택정보영역 -->
									<div id="selected-option">
									
										<!-- 옵션이 없을 경우 -->
										<c:if test="${ empty optionList }">
										
											 <div class="option-box">
                                            <input type="hidden" name="optionId" value="${p.productId }"> 
                                            <input type="hidden" name="optionPrice" value="${discountedPrice }">
                                            <div class="sel-title">
                                                                                                        선택 : ${p.productName}
                                              
                                            </div>
                                            
                                            <div class="option-info">
                                                <div class="fleft">
                                                    <!--수량체크-->
                                                    <div class="number-count fn-count">
                                                            <div class="quantity">
                                                                <div class="pro-qty">
																	<span class="dec qtybtn" id="dec-button" onclick="dec(this,${discountedPrice});">-</span>
                                                                    <input type="text" name="count" value="1"  min="1" max="${p.productStock }">
                                                               		<span class="inc qtybtn" id="inc-button" onclick="inc(this,${discountedPrice});">+</span></div>
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="fright">
                                                    <div class="price-select">
                                                        <span class="number optPrice">${discountedPrice}</span><span class="unit">원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
										</c:if>
										
										<!--  옵션이 없을 경우 끝 -->
									</div>
								</form>
								</div>
								<div class="row">
									<div class="col">
										<div class="prd-price-total">
											<div class="fleft">
												<div class="tt-title">총 결제 예상 금액</div>
											</div>
											<div class="fright">
												<div class="price-total" style="overflow: inherit;">
													<c:if test="${ empty optionList }" >
														<span class="number" id="totalPrice">${discountedPrice}</span>
													</c:if >
													<c:if test="${ not empty optionList }" >
														<span class="number" id="totalPrice">0</span>
													</c:if >
													<span class="unit">원</span>
												</div>
												<div class="price-saving">
													최대 예상적립P <span class="number pointAmt">0</span><span
														class="unit">P</span>
												</div>
											</div>
										</div>
							
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6" style="padding: 0 5px 0 10px !important;">
										<input type="button" onclick="detailSubmit(1);"
											class="btn btn-outline-dark product-btn pd-cart" value="장바구니">
									</div>
									<div class="col-lg-6" style="padding: 0 5px 0 10px !important;">
										<input type="button"  onclick="detailSubmit(2);"
											class="btn btn-outline-dark product-btn check-out" value="바로구매">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="product-tab">
						<div class="row">
							<div class="tab-item">
								<ul class="nav" role="tablist">
									<li><a class="active" data-toggle="tab" href="#tab-1"
										role="tab">상품상세정보</a></li>
									<li><a data-toggle="tab" href="#tab-3" role="tab">상품리뷰(02)</a>
									</li>
									<li><a data-toggle="tab" href="#tab-4" role="tab">상품Q&A(0)</a>
									</li>
								</ul>
							</div>

						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="product-content">
										<div class="row">
											<div class="col-lg-12">${p.productDetail }</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-3" role="tabpanel">
									<div class="customer-review-option">
										<div class="row">
											<div class="mr-auto">
												<h4>상품리뷰(02)</h4>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="at-rating production-review-feed__header__stars">
													<div>
														<h5 style="text-align: center; margin-bottom: 20px;">사용자
															총 평점</h5>
													</div>
													<div>
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o"></i> <i class="total_stars"><strong>4</strong>/5</i>
													</div>
												</div>

											</div>

										</div>
										<div class="row">

											<div class="production-review-feed__filter">
												<div class="production-review-feed__filter__order-list">
													<div>
														<button class="btn btn-outline-dark" type="button">베스트순</button>
														<button class="btn btn-outline-dark" type="button">최신순</button>
														<button class="btn btn-outline-dark " type="button">
															<svg class="icon" width="18" height="18"
																viewBox="0 0 18 18" preserveAspectRatio="xMidYMid meet">
                                                                <path
																	fill="currentColor"
																	d="M15.821 3a.67.67 0 0 1 .679.672v10.656a.67.67 0 0 1-.679.672H2.18a.67.67 0 0 
                                                                1-.679-.672V3.672c0-.375.3-.672.679-.672H15.82zm-.679 1.344H2.858v8.14L7.01 7.781c.094-.125.284-.125.394 
                                                                0l2.321 2.657c.048.046.063.109.048.156l-.3 1.375c-.016.11.11.172.173.094l2.369-2.579a.202.202 0 0 1 
                                                                .284 0l2.842 3.094V4.344zm-2.526 3.61a1.1 1.1 0 0 1-1.105-1.095
                                                                 1.1 1.1 0 0 1 1.105-1.093 1.1 1.1 0 0 1 1.105 1.093 1.1 1.1 0 0 1-1.105 1.094z">
                                                                </path>
                                                            </svg>
															사진리뷰
														</button>
														<div class="btn production-selling-section__right">
															<button type="button" data-toggle="modal"
																data-target="#writeReviewModal">리뷰쓰기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="comment-option">
											<div class="co-item row">

												<div class="col-lg-2 comment-user-info">
													<div class="at-rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o"></i>
													</div>
													<h5>허희원</h5>
													<span>2020/03/12</span>
												</div>
												<div class="avatar-text col-lg-8">
													<p class="at-reply">Lorem ipsum dolor sit amet
														consectetur!</p>
													<div class="production-review-item__help">
														<button type="button"
															class="production-review-item__help__btn btn btn-outline-success my-2 my-sm-0">
															도움이 돼요</button>
														<div class="production-review-item__help__text">
															<span class="production-review-item__help__text__number">64</span>명에게
															도움이 되었습니다.
														</div>
													</div>
												</div>
												<div class="review-img col-lg-2 mb-2">
													<a href="#"><img src="img/products/product-1.jpg"
														alt=""></a>
												</div>
											</div>
											<div class="co-item row ">
												<div class="col-lg-2 comment-user-info">
													<div class="at-rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o"></i>
														<h5>김유정</h5>
														<span>2020/03/11</span>
													</div>
												</div>
												<div class="avatar-text col-lg-8">
													<p class="at-reply">Lorem ipsum dolor sit amet
														consectetur adipisicing elit. Labore atque alias provident
														reprehenderit ullam, possimus autem non obcaecati totam
														similique, placeat accusantium! Quam itaque id nostrum?
														Velit alias unde quaerat!</p>
													<div class="production-review-item__help">
														<button type="button"
															class="production-review-item__help__btn btn btn-outline-success my-2 my-sm-0">
															도움이 돼요</button>
														<div class="production-review-item__help__text">
															<span class="production-review-item__help__text__number">64</span>명에게
															도움이 되었습니다.
														</div>
													</div>
												</div>
												<div class="review-img col-lg-2 mb-2">
													<a href="#"><img src="img/products/product-2.jpg"
														alt=""></a>
												</div>
											</div>
										</div>
										<div class="modal fade" id="exampleModal" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">New
															message</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form>
															<div class="form-group">
																<label for="recipient-name" class="col-form-label">Recipient:</label>
																<input type="text" class="form-control"
																	id="recipient-name">
															</div>
															<div class="form-group">
																<label for="message-text" class="col-form-label">Message:</label>
																<textarea class="form-control" id="message-text"></textarea>
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary">Send
															message</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-4" role="tabpanel">
									<div class="customer-review-option">
										<div class="row" style="margin-bottom: 40px;">
											<div class="col-lg-12">
												<h4>상품Q&A(0)</h4>
											</div>
										</div>
										<div class="row" style="margin-bottom: 20px;">
											<div class=" col-lg-12 production-selling-section__right">
												<button type="button" data-toggle="modal"
													data-target="#qNaModal">상품문의하기</button>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<table class="fold-table table table-sm">
													<thead>
														<tr>
															<th>번호</th>
															<th>답변상태</th>
															<th>제목</th>
															<th>문의자</th>
															<th>등록일</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr class="view">
															<td>2</td>
															<td>검토중</td>
															<td>상품 문의입니다.</td>
															<td>mel****</td>
															<td>2020.03.13</td>
															<td></td>
														</tr>
														<tr class="fold">
															<td colspan="6">
																<div class="fold-content">
																	<div class="qt">
																		<span class="ic_qt"><img
																			src="img/QnA/q-icon.png" alt=""></span>배송이 안되고 있어요 언제
																		올까요
																	</div>


																</div>
															</td>
														</tr>
														<tr class="view">
															<td>1</td>
															<td>답변완료</td>
															<td>언제 배송되나요~~?</td>
															<td>tes****</td>
															<td>2020.03.13</td>
															<td></td>
														</tr>
														<tr class="fold">
															<td colspan="6">
																<div class="fold-content">
																	<div class="qt">
																		<span class="ic_qt"><img
																			src="img/QnA/q-icon.png" alt=""></span>배송이 안되고 있어요 언제
																		올까요
																	</div>
																	<div class="as">
																		<span class="ic_as"><img
																			src="img/QnA/a-icon.png" alt=""></span>안녕하세요 고객님.
																		접수해주신 상품문의에 대한 답변드립니다. 주문하신 상품은 어제 출고되었으며, 배송은 1~2일 소요
																		예상됩니다. 감사합니다. 즐거운 하루 보내세요.
																	</div>
																	<p class="reginfo">
																		<span class="wh">판매자의 답변</span> <span class="date">등록일
																			: <em>2020-02-28 오후 4:32:44</em>
																		</span>
																	</p>
																</div>
															</td>
														</tr>
													</tbody>
												</table>

											</div>


										</div>


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->
	<!-- Related Products Section End -->
	<div class="related-products spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>추천 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="img/products/women-1.jpg" alt="">
							<div class="sale">Sale</div>
							<div class="icon">
								<i class="icon_heart_alt"></i>
							</div>
							<ul>
								<li class="w-icon active"><a href="#"><i
										class="icon_bag_alt"></i></a></li>
								<li class="quick-view"><a href="#">+ Quick View</a></li>
								<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="pi-text">
							<div class="catagory-name">Coat</div>
							<a href="#">
								<h5>Pure Pineapple</h5>
							</a>
							<div class="product-price">
								$14.00 <span>$35.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="img/products/women-2.jpg" alt="">
							<div class="icon">
							</div>
							<ul>
								<li class="w-icon active"><a href="#"><i
										class="icon_bag_alt"></i></a></li>
								<li class="quick-view"><a href="#">+ Quick View</a></li>
								<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="pi-text">
							<div class="catagory-name">Shoes</div>
							<a href="#">
								<h5>Guangzhou sweater</h5>
							</a>
							<div class="product-price">$13.00</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="img/products/women-3.jpg" alt="">
							<div class="icon">
								<i class="icon_heart_alt"></i>
							</div>
							<ul>
								<li class="w-icon active"><a href="#"><i
										class="icon_bag_alt"></i></a></li>
								<li class="quick-view"><a href="#">+ Quick View</a></li>
								<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="pi-text">
							<div class="catagory-name">Towel</div>
							<a href="#">
								<h5>Pure Pineapple</h5>
							</a>
							<div class="product-price">$34.00</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="img/products/women-4.jpg" alt="">
							<div class="icon">
								<i class="icon_heart_alt"></i>
							</div>
							<ul>
								<li class="w-icon active"><a href="#"><i
										class="icon_bag_alt"></i></a></li>
								<li class="quick-view"><a href="#">+ Quick View</a></li>
								<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="pi-text">
							<div class="catagory-name">Towel</div>
							<a href="#">
								<h5>Converse Shoes</h5>
							</a>
							<div class="product-price">$34.00</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 리뷰쓰기 modal -->

	<div class="modal fade" id="writeReviewModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">리뷰쓰기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group review-modal__form__product ">
							<img class="review-modal__form__product__image"
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1533198816209_Q.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1">
							<div class="review-modal__form__product__contents">
								<div class="review-modal__form__product__contents__brand">레드캣</div>
								<div class="review-modal__form__product__contents__name">분리가
									되는 모던 대용량 메이크업 박스</div>
								<div class="review-modal__form__product__contents__options">화이트</div>
							</div>
						</div>
						<div class="form-group">
							<label for="starting" class="col-form-label">별점 평가</label>
							<div class="at-rating" style="font-size: 30px; color: #FAC451;">
								<label class="rating-input__star " aria-label="별점 1점"> <input
									type="radio" value="1"> <i class="fa fa-star-o"></i>
								</label> <label class="rating-input__star" aria-label="별점 2점"> <input
									type="radio" value="2"> <i class="fa fa-star-o"></i>
								</label> <label class="rating-input__star" aria-label="별점 3점"> <input
									type="radio" value="3"> <i class="fa fa-star-o"></i>
								</label> <label class="rating-input__star" aria-label="별점 4점"> <input
									type="radio" value="4"> <i class="fa fa-star-o"></i>
								</label> <label class="rating-input__star" aria-label="별점 5점"> <input
									type="radio" value="5"> <i class="fa fa-star-o"></i>
								</label>

							</div>
						</div>
						<div class="form-group">
							<label for="add-pic" class="col-form-label">사진첨부(선택)</label>
							<div class="review-modal__section__explain">사진을 첨부해주세요. (최대
								1장)</div>
							<input type="file" name="file" id="file" class="inputfile"
								value="사진 첨부하기">
						</div>
						<div class="form-group">
							<label for="review-text" class="col-form-label">리뷰작성</label>
							<textarea class="form-control" id="review-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">완료</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 문의하기 modal -->

	<div class="modal fade" id="qNaModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상품 문의</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="QnA-title" class="col-form-label">제목</label> <input
								type="text" class="form-control" id="QnA-title">
						</div>
						<div class="form-group">
							<label for="QnA-text" class="col-form-label">문의 내용</label>
							<textarea class="form-control" id="QnA-text"
								placeholder="문의 내용을 입력하세요"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
</div>



<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />
