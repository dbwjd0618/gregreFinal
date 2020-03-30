<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
  <title>IGRE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower" rel="stylesheet">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <!-- MAIN CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

  <!-- Index CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
  
  <!-- 서브메뉴 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subMenu/subMenu.css">
  
  <!--login css-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css"> 
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

	<c:if test="${not empty msg}">
	<script>
	$(function() {
		alert("${msg}");
	});
	</script>
	</c:if>
	<% session.removeAttribute("msg"); %>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


  <div class="site-wrap" id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>



    <header class="site-navbar site-navbar-target" role="banner">

      <div class="container mb-3">
        <div class="d-flex">
          <div class="site-logo mr-auto">
            <a href="${pageContext.request.contextPath}">
              <img  class="main-logo" src="${pageContext.request.contextPath}/resources/images/logo/igre_main_logo2.png" alt="">
            </a>
          </div>
          <div class="site-quick-contact d-none d-lg-flex ml-auto">
            <div class="d-flex site-info site-quick">
              <!--로그인 -->
              <c:if test="${memberLoggedIn == null }">
              	<div class="site-quick-text">
	                <a href="${pageContext.request.contextPath}/member/login.do">
	                  <span style="color: black !important; padding-right:20px;">log-in</span>
	                </a>
              	</div>
              </c:if>
              
              <c:if test="${bimemberLoggedIn != null }">
              	<div class="site-quick-text">
	            	<!--마이페이지 -->
	                <a href="${pageContext.request.contextPath}/WEB-INF/views/myPage/myPageMain.html">
	                  <span style="color: black !important; padding-right:20px;">마이페이지</span>
	                </a>
              	</div>
              	<div class="site-quick-text">
	                <a href="${pageContext.request.contextPath}/member/logout.do">
	                  <span style="color: black !important; padding-right:20px;">log-out</span>
	                </a>
              	</div>
              </c:if>
              
              
              <c:if test="${memberLoggedIn != null }">
              	<div class="site-quick-text">
	            	<!--마이페이지 -->
	                <a href="${pageContext.request.contextPath}/WEB-INF/views/myPage/myPageMain.html">
	                  <span style="color: black !important; padding-right:20px;">마이페이지</span>
	                </a>
              	</div>
              	<div class="site-quick-text">
	                <a href="${pageContext.request.contextPath}/member/logout.do">
	                  <span style="color: black !important; padding-right:20px;">log-out</span>
	                </a>
              	</div>
              </c:if>
              <div class="site-quick-text" style=" border-left: 1.4px solid rgba(136, 131, 131, 0.849)">
                <!--쇼핑몰 -->
                <a href="${pageContext.request.contextPath}/shop/shop.do"> 
                  <span style="color: black !important; padding-left: 20px; "> 아이그레몰
                    <img src="${pageContext.request.contextPath}/resources/images/index/circled-right-icoon.png" width="17px"  style="margin-bottom:3px;"alt="">
                  </span>
                </a>
              </div>
            </div>

          </div>
        </div>
      </div>


      <div class="container">
        <div class="menu-wrap d-flex align-items-center">
          <span class="d-inline-block d-lg-none"><a href="#"
              class="text-black site-menu-toggle js-menu-toggle py-5"><span
                class="icon-menu h3 text-black"></span></a></span>



          <nav id="colorNav" class="site-navigation text-left ml-auto d-none d-lg-block" role="navigation">
            <ul class="site-menu main-menu js-clone-nav mr-auto">
              <li id="sub-title-1"><a href="#none" class="nav-link">임신</a></li>
              <li id="sub-title-2"><a href="${pageContext.request.contextPath }/child/childInfo.do" class="nav-link">육아</a></li>
              <li id="sub-title-3"><a href="#none" class="nav-link">상담센터</a></li>
              <li id="sub-title-4"><a href="${pageContext.request.contextPath }/find/careCenter.do" class="nav-link">시설찾기</a></li>
              <li id="sub-title-5"><a href="#none" class="nav-link">커뮤니티</a></li>
            </ul>
          </nav>
        </div>
      </div>
      <div class="container sub-menu-inner" id="sub-1">
        <div class="inner_middle">
          <div class="sub-title ">
            <p class="li-title">임신</p>
          </div>
          <ul class="depth-2">
            <!-- 임신 여기서부터 링크 이동 -->
            <li><a href="${pageContext.request.contextPath }/pregnancy/prePregnancy.do">임신정보</a></li>
            <li><a href="${pageContext.request.contextPath }/pregnancy/calendar.do">월경캘린더</a></li>
            <li><a href="">임신상담</a></li>
          </ul>
        </div>
      </div>
      <div class="container sub-menu-inner" id="sub-2">
        <div class="inner_middle">
          <div class="sub-title ">
            <p class="li-title">육아</p>
          </div>
          <ul class="depth-2">
            <!-- 육아 여기서부터 링크 이동 -->
            <li><a href="${pageContext.request.contextPath }/child/childInfo.do">육아정보</a></li>
            <li><a href="${pageContext.request.contextPath }/child/childCare">아이지킴이</a></li>
            <li><a href="">육아상담</a></li>
          </ul>
        </div>
      </div>
      <div class="container sub-menu-inner" id="sub-3">
        <div class="inner_middle">
          <div class="sub-title ">
            <p class="li-title">상담센터</p>
          </div>
          <ul class="depth-2">
            <!-- 상담센터 여기서부터 링크 이동 -->
            <li><a href="${pageContext.request.contextPath }/counselling/counselorFind.do">상담사 찾기</a></li>
            <li><a href="offlineCounselling/offlineCounsellingView.html">상담하기</a></li>
          </ul>
        </div>
      </div>
      <div class="container sub-menu-inner" id="sub-4">
        <div class="inner_middle">
          <div class="sub-title ">
            <p class="li-title">시설찾기</p>
          </div>
          <ul class="depth-2">
            <!-- 시설찾기 여기서부터 링크 이동 -->
            <li><a href="${pageContext.request.contextPath }/find/careCenter.do">어린이집 찾기</a></li>
            <li><a href="${pageContext.request.contextPath }/find/serviceCenter.do">복지센터 찾기</a></li>
            <li><a href="${pageContext.request.contextPath }/find/hospital.do">병원 찾기</a></li>
            <li><a href="${pageContext.request.contextPath }/find/pharmacy.do">약국 찾기</a></li>
          </ul>
        </div>
      </div>
      <div class="container sub-menu-inner" id="sub-5">
        <div class="inner_middle">
          <div class="sub-title ">
            <p class="li-title">커뮤니티</p>
          </div>
          <ul class="depth-2">
            <!-- 게시판 여기서부터 링크 이동 -->
            <c:forEach items="${boardList}" var="board">
            	<li><a href="${pageContext.request.contextPath}/board/postList?boardCode=${board.boardCode}">${board.boardName}</a></li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </header>