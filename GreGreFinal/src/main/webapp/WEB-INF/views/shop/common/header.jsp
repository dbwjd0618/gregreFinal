<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>igre mall</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/bootstrap.min.css" type="text/css">
   <%--  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/font-awesome.min.css" type="text/css"> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/shopStyle.css" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--myPage-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPage/myPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/orderList.css">
    
      <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath }/resources/js/shop/jquery-3.3.1.min.js"></script>
</head>

<body>
 <!-- 아이그레몰 header -->
     <!-- Header Section Begin -->
     <header class="header-section">
        <div class="header-top">
                <div class="container">
                    <div class="ht-left">
                        <div class="mail-service">
                           
                        </div>
                    </div>
                    <div class="ht-right">
                         <a href="${pageContext.request.contextPath }/" class="login-panel">아이그레</a>
                        <a href="${pageContext.request.contextPath }/shop/myShopping/order/list.do" class="login-panel">MY쇼핑</a>
                        <a href="${pageContext.request.contextPath }/" class="login-panel">로그인</a>                   
                    </div>
                </div>
            </div>
    <div class="container">
        <div class="inner-header">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="logo">
                        <a href="${pageContext.request.contextPath }/shop/shop.do">
                           <img src="${pageContext.request.contextPath }/resources/images/logo/igre_mall_logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-7 col-md-7" style="padding-top: 5px;">
                    <div class="advanced-search">
                   
                        <div class="input-group">
                            <input type="text" placeholder="What do you need?">
                            <button type="button">
                              <svg style="padding-bottom:4px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                              width="20" height="20"
                              viewBox="0 0 172 172"
                              style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M72.24,10.32c-32.33062,0 -58.48,26.14938 -58.48,58.48c0,32.33063 26.14938,58.48 58.48,58.48c11.54281,0 22.22563,-3.38625 31.2825,-9.1375l42.2475,42.2475l14.62,-14.62l-41.71,-41.6025c7.49813,-9.83625 12.04,-22.02406 12.04,-35.3675c0,-32.33062 -26.14937,-58.48 -58.48,-58.48zM72.24,24.08c24.76531,0 44.72,19.95469 44.72,44.72c0,24.76531 -19.95469,44.72 -44.72,44.72c-24.76531,0 -44.72,-19.95469 -44.72,-44.72c0,-24.76531 19.95469,-44.72 44.72,-44.72z"></path></g></g></svg></button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 text-right col-md-2">
                    <ul class="nav-right">
                       
                            <li class="heart-icon">
                                <a href="memberWishList.html">
                                    <img src="https://img.icons8.com/ios/50/000000/hearts.png" width="25px">
                                    <span>1</span>
                                </a>
                            </li>
                            <li class="cart-icon">
                                <a href="shoppingCart.html">
                                    <img src="https://img.icons8.com/ios/50/000000/shopping-bag.png" width="20px">
                                    <span>3</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="si-pic"><img src="img/select-product-1.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="si-pic"><img src="img/select-product-2.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>total:</span>
                                        <h5>$120.00</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="checkOut.html" class="primary-btn view-card">구매하기</a>
                                    </div>
                                </div>  
                            </li>    
                            
                    </ul>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="nav-item main-nav">
        <div class="container" style="text-align: center;">
            
            <nav class="nav-menu mobile-menu">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath }/shop/category.do">분유/이유식</a></li>
                    <li><a href="${pageContext.request.contextPath }/shop/category.do">기저귀/물티슈</a></li>
                    <li><a href="${pageContext.request.contextPath }/shop/category.do">수유/이유용품</a></li>
                    <li><a href="${pageContext.request.contextPath }/shop/category.do">화장품/목욕</a></li>
                    <li><a href="${pageContext.request.contextPath }/shop/category.do">장난감/완구</a></li>
                    <li><a href="${pageContext.request.contextPath }/shop/event/list.do">이벤트</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
        </div>
    </div> 


</header>
<!-- Header End -->