<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/counselling/bookingMainStyle.css">
<script>
$(()=>{
	$("a[data-advis-id]").on("click", function(){
		let advisId = $(this).attr("data-advis-id");
		
		location.href = "${pageContext.request.contextPath}/counselling/bookingPage.do?advisId="+advisId;
	});
});
</script>
<style>
.star-icon{
	color: #e63535;
	}

.main-rating-wrapper{
        border: 1px solid rgba(229,229,229);
        min-width: 800px;
        max-width: 800px;
        min-height: 200px;
        margin: 10% auto;
        border-left: 0;
        border-right: 0;
        border-top: 0;
        border-bottom: 0;
        margin-bottom: -100px;

    }

    .star1-rating-main{
        border: 1px solid rgba(229,229,229);
        max-width: 400px;
        min-height: 100px;
        border-left: 0;
        border-top: 0;
        border-bottom: 0;
    }
    .main-star{
        font-size: 40px;
        color: red;
    }
    .rating-point{
        font-size: 40px;
    }
    .ratio-m{
        color: #999999;
    }
    
    
    .chart-graph{
        border: 1px solid rgba(229,229,229);
        max-width: 400px;
        min-height: 100px;
        margin-left: 500px;
        margin-top: -120px;
        border: 0;
    }

    .chart-rating {
        width: 100px;
    }
    .chart-rating,
    .chart-rating span {
        display: inline-block;
        height: 15px;
        overflow: hidden;
        background: url(${pageContext.request.contextPath}/resources/images/counselling/chartex.jpg)no-repeat;
    }
    .chart-rating span {
        background-position: left bottom;
        line-height: 0;
        vertical-align: top;
    }
    .chart-rating-wrapper{
        min-width: 150px;
        max-width: 150px;
    }
    
    
</style>


	<div class="ftco-blocks-cover-1">
		<div class="site-section-cover overlay"
			data-stellar-background-ratio="0.5"
			style="background-image: url('${pageContext.request.contextPath}/resources/images/counselling/counselling.jpg')">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-md-5 mt-5 pt-5">
						<h1 class="mb-3 font-weight-bold text-teal">상담 예약</h1>
						<p>
							<a href="index.html" class="text-white">Home</a> <span
								class="mx-3">/</span> <strong>상담센터</strong>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<style>
	.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
	}
	
	.align-self-center{
    	width: 200px;
        height: 200px;
    }
    
    .star-rating { 
    	width:205px; 
    }
    
	.star-rating,.star-rating span { 
		display:inline-block; 
		height:39px; 
		overflow:hidden; 
		background:url(${pageContext.request.contextPath}/resources/images/counselling/star.png)no-repeat;
	}
		
	.star-rating span{ 
		background-position:left bottom; 
		line-height:0; 
		vertical-align:top; 
	}
	.star-icon-fill{
		color: red;
	}
	.star-icon-empty{
		color: #EDEDED;
		margin-left: -4px;
	}
</style>
	<!-- contents begin-->
	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="media">
						<img src="${pageContext.request.contextPath}/resources/images/counselling/${counselor.advisImg}" class="align-self-center mr-3" alt="...">
						<div class="media-body">
							<h5 class="mt-0">
								${counselor.advisName }&nbsp;<strong>${counselor.advisGrade }</strong>&nbsp;상담사
							</h5>
							<p class="mb-0">
								${counselor.advisIntro }
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<a data-advis-id="${counselor.advisId}" class="btn btn-primary btn-lg" role="button">상담권 선택하기</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="main-rating-wrapper">
    					<div class="star1-rating-main">
        					<span class="main-star">
            					<span class='star-rating'>
    								<span style ="width:${reviewRating*20}%"></span>
								</span>
        					</span>
            				<span class="rating-point">
                				<strong>${reviewRating}</strong>
                				<span class="ratio-m">/5</span>
            				</span>
    					</div>
    					<div class="chart-graph">
                            <div class="chart-rating-wrapper">
                                5
                                <span class='chart-rating'>
                                    <span style="width:100%"></span>
                                </span>
                                ()
                                <br>
                                4
                                <span class='chart-rating'>
                                    <span style="width:80%"></span>
                                </span>
                                ()
                                <br>
                                3
                                <span class='chart-rating'>
                                    <span style="width:60%"></span>
                                </span>
                                ()
                                <br>
                                2
                                <span class='chart-rating'>
                                    <span style="width:40%"></span>
                                </span>
                                ()
                                <br>
                                1
                                <span class='chart-rating'>
                                    <span style="width:20%"></span>
                                </span>
                                ()
                            </div>
                        </div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					
					<!-- 댓글게시판 시작  -->
					<div class="review-list-wrapper">
					<c:forEach items="${list }" var="review">
    					<li class="review-list">
        					<div class="review-list-top">
            					<div class="star-score__wrap--small">
            						<c:if test="${review.starPoint eq 1 }">
            							<span class="star-icon-fill">★</span>
            							<span class="star-icon-empty">★★★★</span>
            						</c:if>
            						<c:if test="${review.starPoint eq 2 }">
            							<span class="star-icon-fill">★★</span>
            							<span class="star-icon-empty">★★★</span>
            						</c:if>
            						<c:if test="${review.starPoint eq 3 }">
            							<span class="star-icon-fill">★★★</span>
            							<span class="star-icon-empty">★★</span>
            						</c:if>
            						<c:if test="${review.starPoint eq 4 }">
            							<span class="star-icon-fill">★★★★</span>
            							<span class="star-icon-empty">★</span>
            						</c:if>
            						<c:if test="${review.starPoint eq 5 }">
            							<span class="star-icon-fill">★★★★★</span>
            						</c:if>
            						${review.starPoint}
            					</div>
            					<div class="review-list-user-info">
                					<span class="review-list__user--ellipsis">${review.reviewerId}</span> 님 / ${review.reviewDate}
            					</div>
        					</div>
        					<div class="review-list-review-contents">
            					${review.reviewContent}
        						<div class="review-list-category">
                					<ul class="review-list-category">
                    					<li>#카테고리1&nbsp;</li>
                    					<li>#카테고리2&nbsp;</li>
                					</ul>
            					</div>
        					</div>
    					</li>
					</c:forEach>
					</div>
				<!-- 끝 -->	
				</div>
			</div>
		</div>
	</div>

<!-- container 끝  -->
	<script src="../js/jquery-migrate-3.0.0.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.sticky.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/jquery.fancybox.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/bootstrap-datepicker.min.js"></script>
	<script src="../js/aos.js"></script>

	<script src="../js/main.js"></script>




	<!-- Js Plugins -->

	<script src="js/shop/jquery-ui.min.js"></script>
	<script src="js/shop/jquery.countdown.min.js"></script>
	<script src="js/shop/jquery.nice-select.min.js"></script>
	<script src="js/shop/jquery.zoom.min.js"></script>
	<script src="js/shop/jquery.dd.min.js"></script>
	<script src="js/shop/jquery.slicknav.js"></script>
	<!-- <script src="js/shop/owl.carousel.min.js"></script> -->
	<script src="js/shop/main.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
