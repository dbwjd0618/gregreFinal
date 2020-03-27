<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>


	<div class="ftco-blocks-cover-1">
		<div class="site-section-cover overlay"
			data-stellar-background-ratio="0.5"
			style="background-image: url('${pageContext.request.contextPath}/resources/images/counselling/counselling.jpg')">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-md-5 mt-5 pt-5">
						<h1 class="mb-3 font-weight-bold text-teal">오프라인상담 예약</h1>
						<p>
							<a href="index.html" class="text-white">Home</a> <span
								class="mx-3">/</span> <strong>상담센터</strong>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 여기부터 container -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/counselling/counselorFindStyle.css">


	<!-- contents begin-->
	<div class="site-section">
		<div class="counselor-search-container">
			<div class="search-top-menu">홈 > 상담사 찾기</div>
			<!-- 상담사 검색조건 시작  -->
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
				<!-- 상담사 검색 끝 -->

				<!-- 고민 키워드 시작 -->
				<article class="counselor-filter-search-keyword">
					<h3 class="keyword-title">나의 고민키워드</h3>
					<div class="problem-checkbox-wrapper">
						<input type="checkbox" name="" id=""> 임신 <input
							type="checkbox" name="" id=""> 육아
					</div>
				</article>
				<!-- 고민 키워드 끝 -->

				<!-- 상담사 상세정보 선택 시작  -->
				<section class="counselor-detail-select">
					<h3 class="detail-select-title">상세조건</h3>
					<div class="counselor-detail-checkbox-wrapper">
						<h4>상담사 레벨</h4>
						<label for="" class="level-checkbox1">
							<input type="checkbox" name="" id="">마스터 상담사
						</label>
						<div class="counselor-pay-level">50,000원 ~</div>
						<label for="" class="level-checkbox1">
							<input type="checkbox" name="" id="">전문 상담사
						</label>
						<div class="counselor-pay-level">30,000원 ~</div>
						<label for="" class="level-checkbox1">
							<input type="checkbox" name="" id="">일반 상담사
						</label>
						<div class="counselor-pay-level">15,000원 ~</div>
					</div>
					<div class="counselor-detail-checkbox-wrapper">
						<h4>상담사 성별</h4>
						<label for="" class="level-checkbox2"> <input type="radio"
							name="" id="" checked="">무관
						</label> <label for="" class="level-checkbox2"> <input
							type="radio" name="" id="">남자
						</label> <label for="" class="level-checkbox2"> <input
							type="radio" name="" id="">여자
						</label>
					</div>
					<div class="counselor-detail-checkbox-wrapper">
						<h4>상담 가능요일</h4>
						<label for="" class="level-checkbox3"> <input type="radio"
							name="" id="" checked="">무관
						</label> <label for="" class="level-checkbox3"> <input
							type="radio" name="" id="">평일
						</label> <label for="" class="level-checkbox3"> <input
							type="radio" name="" id="">주말
						</label>
					</div>
				</section>
				<!-- 상담사 상세정보 선택 끝 -->
			</div>
			<!-- 상담사 검색조건 끝 -->

			<!-- 상담사 목록 시작 -->
			<div class="counselor-list">
				<!-- 검색필터 & 상담사 리스트 개수 카운터 시작 -->
				<div class="list-filter-wrapper">
					<span class="counselor-search-list-num" id="">검색 결과 <em
						id="search-result-count">5</em>건
					</span>
				</div>
				<!-- 끝 -->
			</div>
			<!-- 상담사 리스트 시작 -->
			<div class="counselor-list-wrapper">
				<div class="counselor-info-list">
					<article name="이루다 전문" class="counselor-info">
						<a href="bookingMain.html" class="goto-booking-main">
							<div class="counselor-info-name">
								<h3 class="counselor-name">
									이루다 <span style="color: #48DA91;">전문 상담사</span>
								</h3>
								<p class="counselor-simple-greetings">진정한 위로로 함께하고 싶어요.</p>
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
							</div> <!-- 상담사 이미지 -->
							<div class="counselor-img">
								<img src="${pageContext.request.contextPath}/resources/images/이루다.jpg" alt="">
							</div> <!-- 상담 유형 -->
							<div class="counselor-type">
								<div>
									<ul class="counselor-type">
										<li class="counselling-type">육아상담</li>
									</ul>
								</div>
								<div>
									<p class="counselor-price">35,000원 ~</p>
								</div>
							</div>
							<button class="counselor-selectOne">상담사 찜하기</button>
						</a>
					</article>
				</div>
				<!-- 상담사 리스트 끝 -->
				<div class="counselor-list-wrapper">
					<div class="counselor-info-list">
						<article name="이루다 전문" class="counselor-info">
							<div class="counselor-info-name">
								<h3 class="counselor-name">
									이루다 <span style="color: #48DA91;">전문 상담사</span>
								</h3>
								<p class="counselor-simple-greetings">진정한 위로로 함께하고 싶어요.</p>
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
								<img
									src="${pageContext.request.contextPath}/resources/images/이루다.jpg"
									alt="">
							</div>

							<!-- 상담 유형 -->
							<div class="counselor-type">
								<div>
									<ul class="counselor-type">
										<li class="counselling-type">육아상담</li>
									</ul>
								</div>
								<div>
									<p class="counselor-price">35,000원 ~</p>
								</div>
							</div>
							<button class="counselor-selectOne">상담사 찜하기</button>
						</article>
					</div>
					<div class="counselor-list-wrapper">
						<div class="counselor-info-list">
							<article name="이루다 전문" class="counselor-info">
								<div class="counselor-info-name">
									<h3 class="counselor-name">
										이루다 <span style="color: #48DA91;">전문 상담사</span>
									</h3>
									<p class="counselor-simple-greetings">진정한 위로로 함께하고 싶어요.</p>
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
									<img
										src="${pageContext.request.contextPath}/resources/images/이루다.jpg"
										alt="">
								</div>

								<!-- 상담 유형 -->
								<div class="counselor-type">
									<div>
										<ul class="counselor-type">
											<li class="counselling-type">육아상담</li>
										</ul>
									</div>
									<div>
										<p class="counselor-price">35,000원 ~</p>
									</div>
								</div>
								<button class="counselor-selectOne">상담사 찜하기</button>
							</article>
						</div>
						<div class="counselor-list-wrapper">
							<div class="counselor-info-list">
								<article name="이루다 전문" class="counselor-info">
									<div class="counselor-info-name">
										<h3 class="counselor-name">
											이루다 <span style="color: #48DA91;">전문 상담사</span>
										</h3>
										<p class="counselor-simple-greetings">진정한 위로로 함께하고 싶어요.</p>
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
											<div
												class="partner-list-box__review-score js-review-star-num">(21)</div>
										</div>
										<!-- 평점 끝 -->
									</div>
									<!-- 상담사 이미지 -->
									<div class="counselor-img">
										<img
											src="${pageContext.request.contextPath}/resources/images/이루다.jpg"
											alt="">
									</div>

									<!-- 상담 유형 -->
									<div class="counselor-type">
										<div>
											<ul class="counselor-type">
												<li class="counselling-type">육아상담</li>
											</ul>
										</div>
										<div>
											<p class="counselor-price">35,000원 ~</p>
										</div>
									</div>
									<button class="counselor-selectOne">상담사 찜하기</button>
								</article>
							</div>
							<div class="counselor-list-wrapper">
								<div class="counselor-info-list">
									<article name="이루다 전문" class="counselor-info">
										<div class="counselor-info-name">
											<h3 class="counselor-name">
												이루다 <span style="color: #48DA91;">전문 상담사</span>
											</h3>
											<p class="counselor-simple-greetings">진정한 위로로 함께하고 싶어요.</p>
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
												<div
													class="partner-list-box__review-score js-review-star-num">(21)</div>
											</div>
											<!-- 평점 끝 -->
										</div>
										<!-- 상담사 이미지 -->
										<div class="counselor-img">
											<img
												src="${pageContext.request.contextPath}/resources/images/이루다.jpg"
												alt="">
										</div>

										<!-- 상담 유형 -->
										<div class="counselor-type">
											<div>
												<ul class="counselor-type">
													<li class="counselling-type">육아상담</li>
												</ul>
											</div>
											<div>
												<p class="counselor-price">35,000원 ~</p>
											</div>
										</div>
										<button class="counselor-selectOne">상담사 찜하기</button>
									</article>
								</div>


								<!-- 페이징 시작 -->
								<div class="paging-wrapper">
									<ul class="paging">
										<li class="paging-num active"><a href="#">1</a></li>
									</ul>
								</div>
								<!-- 페이징 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>









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
