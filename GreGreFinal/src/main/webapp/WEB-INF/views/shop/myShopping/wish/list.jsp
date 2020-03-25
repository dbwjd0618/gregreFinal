<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/whishList.css" type="text/css">
<!-- wishlist -->
<!-- Breadcrumb Section Begin -->
   <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="${pageContext.request.contextPath }/"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">MY쇼핑</a>
                        <span>주문확인/배송조회</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class ="row">
			<div class="col-md-12 mt-4 pt-4">
				<h1 class="mb-3 font-weight-bold text-teal ">MY쇼핑</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar" src="${pageContext.request.contextPath }/resources/images/myPage/user.png" />
							<div class="profile__name">user123</div>
						</div>
					</div>
					<div class="sidebar__middle">
						<div class="profile side__profile _3fftNQzxHO">
							<ul>
								<li>
									주문·배송<a href="${pageContext.request.contextPath }/shop/myShopping/order/list.do" class="_2XiEZGqw1K" ><em>0</em>건</a>
								</li>
								<li>
									보유 쿠폰<a href="${pageContext.request.contextPath }/shop/myShopping/coupon/list.do" class="_2XiEZGqw1K" ><em>2</em>장</a>
								</li>
								<li>
									포인트<a href="#" class="_2XiEZGqw1K " ><em>5000</em>p</a>
								</li>
							</ul>
						</div>
					
					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/order/list.do">
							<div class="menu__title">주문확인/배송조회</div>
                            </a> 
                            <a class="menu__item" href="${pageContext.request.contextPath }/shop/myShopping/wish/list.do">
                            <div class="menu__title">관심상품</div>
                            </a> 
                            <a class="menu__item"href="${pageContext.request.contextPath }/shop/myShopping/event/list.do">
                            <div class="menu__title">이벤트참여내역</div>
                            </a>
                            <a class="menu__item" href="${pageContext.request.contextPath }/shop/myShopping/review/list.do">
								<div class="menu__title">상품리뷰</div>
                            </a> 
                            <a class="menu__item" href="${pageContext.request.contextPath }/shop/myShopping/QnA/list.do">
								<div class="menu__title">상품문의 내역</div>
                            </a>
						</div>
					</div>
				</div>
			</div>
			        <!-- Whish List Begin -->
                <div class="col-md-9">
                        <div class="row">
                            <div class="col-lg-11">
                                <div class="cart-table">
                                    <h4 style="margin-bottom: 20px;">
                                        <strong>관심상품</strong>
                                    </h4>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="title-col" colspan="5"><input type="checkbox"
                                                    id=""
                                                    style="float: left; margin-right: 5px; margin-top: 4px;" />
                                                <button  class="btn"
                                                    style="float: left; border: 0px;"  >선택상품 삭제</button>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="chk-col"><input type="checkbox" id="" /></td>
                                                <td class="cart-pic first-row"><img
                                                    src="img/cart-page/product-1.jpg" alt=""></td>
                                                <td class="cart-title first-row">
                                                    <h5>Pure Pineapple</h5>
                                                </td>
                                                <td class="p-price first-row">$60.00</td>
                                                <td class="close-td first-row"><img
                                                    src="https://img.icons8.com/material-sharp/24/000000/multiply.png"></td>
                                            </tr>
                                            <tr>
                                                <td class="chk-col"><input type="checkbox" id="" /></td>
                                                <td class="cart-pic"><img
                                                    src="img/cart-page/product-2.jpg" alt=""></td>
                                                <td class="cart-title">
                                                    <h5>American lobster</h5>
                                                </td>
                                                <td class="p-price">$60.00</td>
                                                <td class="close-td"><img
                                                    src="https://img.icons8.com/material-sharp/24/000000/multiply.png"></td>
                                            </tr>
                                            <tr>
                                                <td class="chk-col"><input type="checkbox" id="" /></td>
                                                <td class="cart-pic"><img
                                                    src="img/cart-page/product-3.jpg" alt=""></td>
                                                <td class="cart-title">
                                                    <h5>Guangzhou sweater</h5>
                                                </td>
                                                <td class="p-price">$60.00</td>
                                                <td class="close-td"><img
                                                    src="https://img.icons8.com/material-sharp/24/000000/multiply.png"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                        <!-- Whish List End -->
        	</div>      
    	</div>
    </div>
    <!-- contens End -->
    

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	
