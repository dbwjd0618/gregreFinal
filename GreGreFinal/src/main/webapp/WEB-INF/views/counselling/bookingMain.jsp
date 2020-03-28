<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
$(()=>{
	$("a[data-advis-id]").on("click", function(){
		let advisId = $(this).attr("data-advis-id");
		console.log(advisId);
		
		location.href = "${pageContext.request.contextPath}/counselling/bookingPage.do?advisId="+advisId;
	});
});
</script>


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
								${counselor.advisName } <strong>${counselor.advisGrade }</strong> 상담사
							</h5>
							<p class="mb-0">
								${counselor.advisIntro }
								${counselor.advisPrice }
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<%-- <form action="${pageContext.request.contextPath}/counselling/bookingPage.do">
						<input type="hidden" name="advisId" value="${counselor.advisId }"/>
					</form> --%>
					<a data-advis-id="${counselor.advisId}" class="btn btn-primary btn-lg" role="button">상담권 선택하기</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">상담사 평점</div>
			</div>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">상담사 후기게시판</div>
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
