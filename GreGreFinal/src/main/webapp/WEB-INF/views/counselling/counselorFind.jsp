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
	$("article[data-advis-id]").on("click", function(){
		let advisId = $(this).attr("data-advis-id");
		console.log(advisId);
		
		location.href = "${pageContext.request.contextPath}/counselling/bookingMain.do?advisId="+advisId;
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
					<h1 class="mb-3 font-weight-bold text-teal">상담사 찾기</h1>
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

.counselor-search-input-box button {
	width: 48px;
	height: 56px;
	position: absolute;
	left: 0;
	top: 0;
	background:
		url('${pageContext.request.contextPath}/resources/images/counselling/search.png')
		no-repeat 16px center;
	background-size: 24px auto;
	text-indent: -9999px;
}

a{
	text-decoration: none;
}
</style>


<!-- 여기부터 container -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/counselling/counselorFindStyle.css">

<div class="site-section">
	<div class="counselor-search-container">
		<div class="search-top-menu">홈 > 상담사 찾기</div>
		<!-- 상담사 검색필터 시작  -->
		<div class="counselor-filter">
			<!-- 상담사 검색창 시작-->
			<article class="counselor-filter-search">
				<h3 class="search-title">상담사 이름 검색</h3>
				<div class="counselor-search-input-box">
					<input type="search" id="counselor-search-input"
						placeholder="상담사 이름 검색">
					<button type="button">찾기</button>
				</div>
			</article>
			<!-- 상담사 검색창 끝 -->
			
			<!-- 고민 키워드 시작 -->
			<article class="counselor-filter-search-keyword">
				<h3 class="keyword-title">나의 고민키워드</h3>
				<div class="problem-checkbox-wrapper">
					<label for="category-check1" class="level-checkbox0"> 
						<input type="checkbox" name="" id="category-check1"> 임신
					</label> 
					<label for="category-check2" class="level-checkbox0"> 
						<input type="checkbox" name="" id="category-check2"> 육아
					</label>
				</div>
			</article>
			<!-- 고민 키워드 끝 -->

			<!-- 상담사 레벨, 성별 요일 선택 시작  -->
			<section class="counselor-detail-select">
				<h3 class="detail-select-title">상세조건</h3>
				<div class="counselor-detail-checkbox-wrapper">
					<h4>상담사 레벨</h4>
					<label for="type-level1" class="level-checkbox1">
					<input type="checkbox" name="" id="type-level1"/>마스터 상담사
					<div class="counselor-pay-level">50,000원 ~</div></label>
					 <label for="type-level2" class="level-checkbox1"> 
						<input type="checkbox" name="" id="type-level2">전문 상담사
						<div class="counselor-pay-level">30,000원 ~</div>
					</label> <label for="type-level3" class="level-checkbox1"> 
						<input type="checkbox" name="" id="type-level3">일반 상담사
						<div class="counselor-pay-level">15,000원 ~</div>
					</label>
				</div>
				<div class="counselor-detail-checkbox-wrapper">
					<h4>상담사 성별</h4>
					<label for="type-radio1" class="level-checkbox2"> <input
						type="radio" name="gender-check" id="type-radio1" checked>무관
					</label> <label for="type-radio2" class="level-checkbox2"> <input
						type="radio" name="gender-check" id="type-radio2">남자
					</label> <label for="type-radio3" class="level-checkbox2"> <input
						type="radio" name="gender-check" id="type-radio3">여자
					</label>
				</div>
				<div class="counselor-detail-checkbox-wrapper">
					<h4>상담 가능요일</h4>
					<label for="type-day1" class="level-checkbox3"> 
						<input type="radio" name="day-check" id="type-day1" checked>무관
					</label> <label for="type-day2" class="level-checkbox3"> 
						<input type="radio" name="day-check" id="type-day2">평일
					</label> <label for="type-day3" class="level-checkbox3"> 
						<input type="radio" name="day-check" id="type-day3">주말
					</label>
				</div>
			</section>
		</div>
			<!-- 상담사 레벨, 성별 요일 선택 시작 -->
		<!-- 상담사 검색필터 끝 -->

		<!-- 상담사 목록정렬 & 상담사 전체 개수 카운터 시작 -->
		<div class="counselor-list">
			<div class="list-filter-wrapper">
				<span class="counselor-search-list-num" id="">검색 결과 <em
					id="search-result-count">${totalContents}</em>건
				</span>
			</div>
		</div>
		<!-- 상담사 목록정렬 & 상담사 전체 개수 카운터 끝  -->
		
		<!-- 상담사 view 영역 시작 -->
		<div class="counselor-list-wrapper">
			<div class="counselor-info-list">
                <c:forEach items="${list }" var="counselor">
				    <article data-advis-id="${counselor.advisId}" class="counselor-info">
						    <div class="counselor-info-name">
						    	<h3 class="counselor-name">${counselor.advisName} <span style="color: #48DA91;">${counselor.advisGrade} 상담사</span>
						    	</h3>
						    	<p class="counselor-simple-greetings">${counselor.advisLineIntro}</p>
						    	<!-- 평점 -->
						    	<div class="counselor-list-preview">
						    		<div class="star-score__wrap--middle">
						    			<ol>
						    				<li class="star-score__ico is-all"></li>
						    				<li class="star-score__ico is-all"></li>
						    				<li class="star-score__ico is-all"></li>
						    				<li class="star-score__ico is-all"></li>
						    				<li class="star-score__ico is-half"></li>
						    			</ol>
						    		</div>
						    		<div class="partner-list-box__review-score js-review-star-num">(21)</div>
						    	</div>
						    	<!-- 평점 끝 -->
						    </div> 
						    <!-- 상담사 이미지 -->
						    <div class="counselor-img">
						    	<img src="${pageContext.request.contextPath}/resources/images/counselling/${counselor.advisImg}" alt="상담사 사진">
						    </div> 
						    <!-- 상담 유형 -->
						    <div class="counselor-type">
							    <div>
								    <ul class="counselor-type">
                                        <c:forEach items="${counselor.advisKeyword}" var="keyword" varStatus="vs">
                                            <li class="counselling-type">${keyword}${!vs.last?",":""}</li>
                                        </c:forEach>        
								    </ul>
							    </div>
							    <div>
								    <p class="counselor-price">${counselor.advisPrice}원~</p>
							    </div>
						    </div>
					    <button class="counselor-selectOne">상담사 찜하기</button>
                    </article>
                </c:forEach>
			</div>
			<!-- 상담사 리스트 끝 -->
			<!-- 페이징 시작 -->
			<div class="paging-wrapper">
				<ul class="paging">
					<li class="paging-num active">
						<a href="#">1</a>
					</li>
				</ul>
			</div>
			<!-- 페이징 끝 -->
		</div>
	</div>
</div>
<!-- contents end  -->


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