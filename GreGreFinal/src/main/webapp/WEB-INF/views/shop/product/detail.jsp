<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
 	
<!--product view js -->
<script src="${pageContext.request.contextPath }/resources/js/shop/productView.js"></script>
    <!--product view css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/productView.css" type="text/css"></link>
     <style>
    .dropdown-wrap.select .btn-sel-option {
    width: 100%;
    height: 38px;
    padding: 10px 15px 10px 15px;
    vertical-align: top;
    color: #000;
    background: #fff url(${pageContext.request.contextPath }/resources/images/ui/ui_select_arr.png) right center no-repeat;
    cursor: pointer;
    line-height: 16px;
    border: solid 1px #ddd;
    text-align: left;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.fa-star:before {
    content:"";
    background-image :url('${pageContext.request.contextPath }/resources/images/star/star.png');
    background-size:20px 20px;
    width: 20px;
    height: 20px;
    display:inline-block;
}

.fa-star-o:before {
    content:"";
    background-image :url('${pageContext.request.contextPath }/resources/images/star/star-o.png');
    background-size:18px 18px;
    width: 18px;
    height: 18px;
    display:inline-block;
    margin-bottom: 1px;
}
    
    </style>
    
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./home.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">Shop</a>
                        <span>Detail</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
	
    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product-pic-zoom">
                                <img class="product-big-img" src="${pageContext.request.contextPath }/resources/img/product-single/product-1.jpg" alt="">
                                <div class="zoom-icon">
                                    <i class="fa fa-search-plus"></i>
                                </div>
                            </div>
                            <div class="product-thumbs">
                                <div class="product-thumbs-track ps-slider owl-carousel">
                                    <div class="pt active" data-imgbigurl="${pageContext.request.contextPath }/resources/img/product-single/product-1.jpg"><img
                                            src="${pageContext.request.contextPath }/resources/img/product-single/product-1.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="${pageContext.request.contextPath }/resources/img/product-single/product-2.jpg"><img
                                            src="${pageContext.request.contextPath }/resources/img/product-single/product-2.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="${pageContext.request.contextPath }/resources/img/product-single/product-3.jpg"><img
                                            src="${pageContext.request.contextPath }/resources/img/product-single/product-3.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="${pageContext.request.contextPath }/resources/img/product-single/product-3.jpg"><img
                                            src="${pageContext.request.contextPath }/resources/img/product-single/product-3.jpg" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                                    <span>oranges</span>
                                    <h3>Pure Pineapple</h3>
                                    <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                                </div>
                                <div class="pd-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <span>(5)</span>
                                </div>
                                <div class="pd-desc">
                                    <h4>26,900원<span>69,900원</span></h4>
                                </div>
                                <hr>
                                <ul class="pd-tags">
                                    <li><span>배송비</span> 2,500원</li>
                                    <li><span>포인트</span> 최대 2.0% 적립</li>
                                </ul>
                                <hr>
                                <div class="prd-option">


                                    <div class="dropdown-wrap select fn-select" data-role="dropdown" data-effect="slide"
                                        style="z-index: 1;">
                                        <button type="button" class="btn-sel-option fn-btn">옵션을 선택하세요<span
                                                class="down-up-icon"></span></button>
                                        <div class="dropdown-cont fn-cont right share-cont" data-width="550"
                                            style="width: 550px;" id="dropdown-menu-3" aria-hidden="true"
                                            aria-owns="dropdown-btn-3">
                                            <ul class="option-list">
                                                <li class="item">
                                                    <!-- 가격 넘겨주기 addOption()  -->
                                                    <button class="btn-option"
                                                        onclick="addOption(this,33150);">핑크80</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick="addOption(this,36716);">핑크90</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick="addOption(this,39638);">핑크90</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick="addOption(this,43982);">핑크100</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick="addOption(this,39639);">핑크100</button>
                                                </li>
                                                <li class="item">

                                                    <button class="btn-option"
                                                        onclick="addOption(this,36717);">핑크100</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick="addOption(this,33151);">핑크90</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick="addOption(this,33152);">핑크100</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick=".addOption(this,36718);">핑크110</button>
                                                </li>
                                                <li class="item">
                                                    <button class="btn-option"
                                                        onclick="addOption(this,33153);">핑크110</button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <script id="itemTmplOption" type="text/x-jsrender" data-jsv-tmpl="jsvTmpl">

                                        <div class="option-box">
                                            <input type="hidden" class="optionId" value="{{:optId}}"> 
                                            <input type="hidden" class="optDftPrice priceChg" value="{{:optPrice}}">
                                            <div class="sel-title">
                                                선택 : {{:optNm}}
                                                <button type="button" class="btn-option-delete"><span class="" style="color:#979696; margin: 0 auto;"><strong>X</strong></span></button>
                                            </div>
                                            
                                            <div class="option-info">
                                                <div class="fleft">
                                                    <!--수량체크-->
                                                    <div class="number-count fn-count">
                                                            <div class="quantity">
                                                                <div class="pro-qty"><span class="dec qtybtn">-</span>
                                                                    <input type="text" value="1">
                                                                <span class="inc qtybtn">+</span></div>
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

                                    <!-- 선택정보영역 -->
                                    <div id="selected-option">

                                        <div class="option-box">
                                            <div class="sel-title">
                                                선택 : 핑크90
                                                <button type="button" class="btn-option-delete"><span class=""
                                                        style="color:#979696; margin: 0 auto;"><strong>X</strong></span></button>
                                            </div>
                                            <div class="option-info">
                                                <div class="fleft">
                                                    <!--수량체크-->
                                                    <div class="number-count fn-count">
                                                        <div class="quantity">
                                                            <div class="pro-qty">
                                                                <input type="text" value="1">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="fright">
                                                        <!--가격-->
                                                        <div class="price-select">
                                                            <span class="number optPrice"></span>
                                                            <span class="unit">원</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>



                                    </div>


                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="prd-price-total">
                                            <div class="fleft">
                                                <div class="tt-title">총 결제 예상 금액</div>
                                            </div>
                                            <div class="fright">
                                                <div class="price-total" style="overflow:inherit;">
                                                    <span class="number" id="totalPrice">0</span><span class="unit">원</span>
                                                </div>
                                                <div class="price-saving">
                                                    최대 예상적립P <span class="number pointAmt">0</span><span class="unit">P</span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row" >
                                    <div class="col-lg-6"style="padding:  0 5px 0 10px !important;">
                                        <a href="${pageContext.request.contextPath }/shop/cart.do" class="btn btn-outline-dark product-btn pd-cart">장바구니</a>
                                    </div>
                                    <div class="col-lg-6" style="padding: 0 5px 0 10px !important;">
                                        <a href="${pageContext.request.contextPath }/shop/checkOut.do" class="btn btn-outline-dark product-btn check-out">바로구매</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-tab">
                        <div class="row">
                            <div class="tab-item">
                                <ul class="nav" role="tablist">
                                    <li>
                                        <a class="active" data-toggle="tab" href="#tab-1" role="tab">상품상세</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#tab-2" role="tab">상품필수정보</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#tab-3" role="tab">상품리뷰(02)</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#tab-4" role="tab">상품Q&A(0)</a>
                                    </li>
                                </ul>
                            </div>
    
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <h5>Introduction</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                                <h5>Features</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                    <div class="specification-table">
                                        <table>
                                            <tr>
                                                <td class="p-catagory">영양성분(식품위생법에 따른 영양성분 표시대상 식품에 한함)</td>
                                                <td>
                                                    <div class="">제품상세정보 참조</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">유전자재조합식품에 해당하는 경우의 표시</td>
                                                <td>
                                                    <div class="">해당사항 없음</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">영유아식 또는 체중조절식품등에 해당하는 경우 표시광고 사전심의필 및 부작용 발생 가능성
                                                </td>
                                                <td>
                                                    <div class="">해당사항 없음</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">수입식품에 해당하는 경우 “식품위생법에 따른 수입신고를 필함”의 문구</td>
                                                <td>
                                                    <div class="">해당사항 없음</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">소비자상담 관련 전화번호</td>
                                                <td>
                                                    <div class="">고객센터 1522-0130 </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">식품의 유형</td>
                                                <td>
                                                    <div class="">조제분유</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">제조연월일, 유통기한 또는 품질유지기한</td>
                                                <td>
                                                    <div class="">제품표시 참조</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">포장단위별 용량(중량), 수량</td>
                                                <td>
                                                    <div class="">용량 : 800g 수량 3캔</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</td>
                                                <td>
                                                    <div class="">제품상세정보 참조</div>
                                                </td>
                                            </tr>
                                        </table>
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
                                                        <h5 style="text-align: center; margin-bottom:20px;">사용자 총 평점
                                                        </h5>
                                                    </div>
                                                    <div>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="total_stars"><strong>4</strong>/5</i>
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
                                                            <svg class="icon" width="18" height="18" viewBox="0 0 18 18"
                                                                preserveAspectRatio="xMidYMid meet">
                                                                <path fill="currentColor"
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
                                                            <button type="button" data-toggle="modal" data-target="#writeReviewModal">리뷰쓰기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-option">
                                            <div class="co-item row">

                                                <div class="col-lg-2 comment-user-info">
                                                    <div class="at-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <h5>허희원</h5>
                                                    <span>2020/03/12</span>
                                                </div>
                                                <div class="avatar-text col-lg-8">
                                                    <p class="at-reply">Lorem ipsum dolor sit amet consectetur!</p>
                                                    <div class="production-review-item__help">
                                                        <button type="button"
                                                            class="production-review-item__help__btn btn btn-outline-success my-2 my-sm-0">
                                                            도움이 돼요</button>
                                                        <div class="production-review-item__help__text">
                                                            <span
                                                                class="production-review-item__help__text__number">64</span>명에게
                                                            도움이 되었습니다.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-img col-lg-2 mb-2">
                                                    <a href="#"><img src="img/products/product-1.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="co-item row ">
                                                <div class="col-lg-2 comment-user-info">
                                                    <div class="at-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <h5>김유정 </h5>
                                                        <span>2020/03/11</span>
                                                    </div>
                                                </div>
                                                <div class="avatar-text col-lg-8">
                                                    <p class="at-reply">Lorem ipsum dolor sit amet consectetur
                                                        adipisicing elit. Labore atque alias provident reprehenderit
                                                        ullam, possimus autem non obcaecati totam similique, placeat
                                                        accusantium! Quam itaque id nostrum? Velit alias unde quaerat!
                                                    </p>
                                                    <div class="production-review-item__help">
                                                        <button type="button"
                                                            class="production-review-item__help__btn btn btn-outline-success my-2 my-sm-0">
                                                            도움이 돼요</button>
                                                        <div class="production-review-item__help__text">
                                                            <span
                                                                class="production-review-item__help__text__number">64</span>명에게
                                                            도움이 되었습니다.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-img col-lg-2 mb-2">
                                                    <a href="#"><img src="img/products/product-2.jpg" alt=""></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form>
                                                            <div class="form-group">
                                                                <label for="recipient-name"
                                                                    class="col-form-label">Recipient:</label>
                                                                <input type="text" class="form-control"
                                                                    id="recipient-name">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="message-text"
                                                                    class="col-form-label">Message:</label>
                                                                <textarea class="form-control"
                                                                    id="message-text"></textarea>
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
                                        <div class="row" style="margin-bottom:40px;">
                                            <div class="col-lg-12">
                                                <h4>상품Q&A(0)</h4>
                                            </div>
                                        </div>
                                        <div class="row" style="margin-bottom:20px;">
                                            <div class=" col-lg-12 production-selling-section__right">
                                                <button type="button" data-toggle="modal" data-target="#qNaModal">
                                                    상품문의하기
                                                </button>
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
                                                                                src="img/QnA/q-icon.png"
                                                                                alt=""></span>배송이 안되고 있어요 언제 올까요
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
                                                                                src="img/QnA/q-icon.png"
                                                                                alt=""></span>배송이 안되고 있어요 언제 올까요
                                                                    </div>
                                                                    <div class="as">
                                                                        <span class="ic_as"><img
                                                                                src="img/QnA/a-icon.png"
                                                                                alt=""></span>안녕하세요 고객님. 접수해주신 상품문의에 대한
                                                                        답변드립니다. 주문하신 상품은 어제 출고되었으며, 배송은 1~2일 소요 예상됩니다.
                                                                        감사합니다. 즐거운 하루 보내세요.
                                                                    </div>
                                                                    <p class="reginfo">
                                                                        <span class="wh">판매자의 답변</span>
                                                                        <span class="date">등록일 : <em>2020-02-28 오후
                                                                                4:32:44</em></span>
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
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
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
                                $14.00
                                <span>$35.00</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="img/products/women-2.jpg" alt="">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Shoes</div>
                            <a href="#">
                                <h5>Guangzhou sweater</h5>
                            </a>
                            <div class="product-price">
                                $13.00
                            </div>
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
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Pure Pineapple</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
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
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Converse Shoes</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 리뷰쓰기 modal -->

    <div class="modal fade" id="writeReviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">리뷰쓰기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="form-group review-modal__form__product ">
                        <img class="review-modal__form__product__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1533198816209_Q.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1" >
                        <div class="review-modal__form__product__contents">
                            <div class="review-modal__form__product__contents__brand">레드캣</div>
                        <div class="review-modal__form__product__contents__name">분리가 되는 모던 대용량 메이크업 박스</div>
                        <div class="review-modal__form__product__contents__options">화이트</div></div></div>
                    <div class="form-group">
                      <label for="starting" class="col-form-label">별점 평가</label>
                      <div class="at-rating" style="font-size:30px; color:#FAC451;">
                            <label class="rating-input__star " aria-label="별점 1점">
                                <input type="radio" value="1">
                                <i class="fa fa-star-o"></i>
                            </label>
                            <label class="rating-input__star" aria-label="별점 2점">
                                    <input type="radio" value="2">
                                    <i class="fa fa-star-o"></i>
                            </label>
                            <label class="rating-input__star" aria-label="별점 3점">
                                    <input type="radio" value="3">
                                    <i class="fa fa-star-o"></i>
                            </label>
                            <label class="rating-input__star" aria-label="별점 4점">
                                    <input type="radio" value="4">
                                    <i class="fa fa-star-o"></i>
                            </label>
                            <label class="rating-input__star" aria-label="별점 5점">
                                    <input type="radio" value="5">
                                    <i class="fa fa-star-o"></i>
                            </label>
                
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-pic" class="col-form-label">사진첨부(선택)</label>
                        <div class="review-modal__section__explain">사진을 첨부해주세요. (최대 1장)</div>
                        <input type="file" name="file"  id="file" class="inputfile" value="사진 첨부하기">
                    </div>
                    <div class="form-group">
                      <label for="review-text" class="col-form-label">리뷰작성</label>
                      <textarea class="form-control" id="review-text"></textarea>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary">완료</button>
                </div>
              </div>
            </div>
          </div>

    <!-- 문의하기 modal -->

    <div class="modal fade" id="qNaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">상품 문의</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="form-group">
                      <label for="QnA-title" class="col-form-label">제목</label>
                      <input type="text" class="form-control" id="QnA-title">
                    </div>
                    <div class="form-group">
                      <label for="QnA-text" class="col-form-label" >문의 내용</label>
                      <textarea class="form-control" id="QnA-text" placeholder="문의 내용을 입력하세요"></textarea>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">완료</button>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	