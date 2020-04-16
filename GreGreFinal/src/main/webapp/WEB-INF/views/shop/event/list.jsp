<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/event.css" type="text/css">
 <!-- Breadcrumb Section Begin -->
  <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./home.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">Shop</a>
                        <span>event</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
        <!--event begin-->
        <!-- 이벤트 공지 -->
        <div class="row">
            <div class="col mb-5" style=" margin-top: 50px;">
                    <h2 class="sub-title">이벤트</h2>
            </div>

        </div>
        <div class="row">

            <div class="evt-grid-wrap">
                
                    <div class="gcol">
                        <div class="evt-sm-banner">
                            <ul class="fn-evt-banner-2 slick-initialized slick-slider">
                                    <div aria-live="polite" class="slick-list">
                                    	<div class="slick-track" style="opacity: 1; width: 550px; transform: translate3d(0px, 0px, 0px);" role="listbox"><li class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 550px;" tabindex="-1" role="option" aria-describedby="slick-slide10">
                                        <a href="/exhibition/form/7" tabindex="0"><img src="https://shoppingcdn.namyangi.com/attach/site/2020/202001/f30dde76-0fbc-4df5-9f10-e0f204011017.png" alt="남양분유 인기상품 모음전"></a>
                                    </li></div></div>
                            </ul>
                        </div>
                    </div>
                    <div class="gcol">
                        <div class="evt-notice-box">
                            <div class="fleft">
                                <h3 class="ctitle">이벤트 결과</h3>
                            </div>
                            <div class="fright">
                                <div class="notice-list">
                                        <c:forEach items="${wlist}" var="l">
                                        <ul style="margin-top:5px">
                                             <li>
                                                <a href="${pageContext.request.contextPath }/shop/event/noticeDetail.do?eventNo=${l.eventNo}" class="item">
                                                    <span class="ntit">${l.eventTitle }</span>
                                                    <span class="ndate">20.02.19</span>
                                                </a>
                                            </li>
                                        </ul>	
                                        </c:forEach>
                                        				
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <!--이벤트공지 끝-->
        </div>
        <div class="row">
                <div class="col mb-3" style=" margin-top: 90px;">
                        <h2 class="sub-title">진행중인 이벤트</h2>
                </div>
    
            </div>
        <div class="row">
            <!--이벤트 리스트-->
            <div class="event-list">
                	
                            <ul>
                            <c:forEach items="${list }" var="l">
                                    <li class="item">
                                        <a href="${pageContext.request.contextPath }/shop/event/detail.do?eventNo=${l.eventNo}" class="evt">
                                            <span class="evt-img">
                                                <img src="${pageContext.request.contextPath }/resources/upload/shop/eventImg/${l.thumReImg }" >
                                            </span>
                                            <span class="evt-info">
                                                <span class="evt-title">[Igre-Mall] ${l.eventTitle }</span>
                                                <span class="evt-list">
                                                    <span class="evt-li">
                                                        <span class="el-title">기간</span>
                                                        <span class="el-cont">${l.eventStart } ~ ${l.eventEnd }</span>
                                                    </span>
                                                </span>
                                                <span class="evt-sticky">
                                                    
                                                        <span class="sticky black">댓글</span>
                                                    
                                                    <span class="sticky red">D-3</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    </c:forEach>
                            </ul>
        		</div>
			</div>
        <!--event end-->
    	</div>
	</div>
</div>

<script>
$(function(){
	<c:forEach items="${list}" var="l">
	alert(${l.eventStart });
	</c:forEach>
	
	
});

</script>


<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	