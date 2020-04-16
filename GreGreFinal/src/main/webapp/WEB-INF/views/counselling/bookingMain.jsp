<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%
	String pageBar = (String) request.getAttribute("pageBar");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/counselling/bookingMainStyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/counselling/bookingInfo.css">
<script>
$(()=>{
	$("a[data-advis-id]").on("click", function(){
		let advisId = $(this).attr("data-advis-id")
		
		location.href = "${pageContext.request.contextPath}/counselling/bookingPage.do?advisId="+advisId;
		
	});
});

</script>
<style>
.star-icon {
	color: #e63535;
}

.main-rating-wrapper {
	border: 1px solid rgba(229, 229, 229);
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

.star1-rating-main {
	border: 1px solid rgba(229, 229, 229);
	max-width: 400px;
	min-height: 100px;
	border-left: 0;
	border-top: 0;
	border-bottom: 0;
	border-right: 0;
}

.main-star {
	font-size: 40px;
	color: red;
}

.rating-point {
	font-size: 40px;
}

.ratio-m {
	color: #999999;
}

.chart-graph {
	border: 1px solid rgba(229, 229, 229);
	max-width: 400px;
	min-height: 100px;
	margin-left: 500px;
	margin-top: -120px;
	border: 0;
}

.chart-rating {
	width: 100px;
}

.chart-rating, .chart-rating span {
	display: inline-block;
	height: 15px;
	overflow: hidden;
	background:
		url(${pageContext.request.contextPath}/resources/images/counselling/chartex.jpg)
		no-repeat;
}

.chart-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}

.chart-rating-wrapper {
	min-width: 150px;
}

.c-grade {
	color: #48DA91;
}

/*페이지바*/
div#pageBar {
	margin-top: 10px;
	text-align: center;
}

div#pageBar span.cPage {
	color: #0066ff;
	margin-right: 5px;
}

div#pageBar a {
	margin-right: 5px;
}
textarea.reviewContent{
width: 100%;
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
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a>
						<span class="mx-3">/</span> <strong>상담센터</strong>
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

.align-self-center {
	width: 200px;
	height: 200px;
}

.star-rating {
	width: 205px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 39px;
	overflow: hidden;
	background:
		url(${pageContext.request.contextPath}/resources/images/counselling/star.png)
		no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}

.star-icon-fill {
	color: red;
}

.star-icon-empty {
	color: #EDEDED;
	margin-left: -4px;
}
</style>
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class="row">

			<div class="partnerSearch-container partnerSearch-container--profile">
				<div class="partnerSearch-container__top-lnb"></div>
				<div class="partnerProfile-right-fixed_program-info-wrap">
					<div class="profile-right-fixed__program-notice"
						id="topStickyProgramBox">
						<strong>알려드립니다!</strong>
						<div id="topStickyProgramBoxContents"
							class="profile-right-fixed-program-notice-txt">
							<ul class="profile-right-fixed-program-notice-txt__list">
								<li>아이그레 상담은 상담권 결제 후 상담이 진행됩니다.</li>
								<li>반드시 로그인 후 이용하여 주세요.</li>
							</ul>
						</div>
						<a id="topStickyProgramBtnSubmit"
							data-advis-id="${counselor.advisId}"
							class="btn btn-primary btn-lg" role="button">상담 신청하기</a>
					</div>

					<div id="programRightFixedVT"
						class="profile-right-fixed__program-vt"></div>


					<div id="programListFixedBox"></div>
				</div>
				<div class="partnerProfile-main-container">
					<div class="partnerProfile__partner-top-info">
						<article class="partner-list-box partner-list-box--profile">
							<div class="partner-profile__info">
								<h3 class="partner-list-box__head">
									<span id="partnerNameEl">${counselor.advisName } </span> <span
										id="partnerRecently" class="partner-list-box__ico-new">${counselor.advisGrade }
										상담사</span>
								</h3>
								<div class="partner-list-box__review-preview">
									<div class="star1-rating-main">
										<span class="main-star"> <span class='star-rating'>
												<span style="width:${reviewRating*20}%"></span>
										</span>
										</span> <span class="rating-point"> <strong>${reviewRating}</strong>
											<span class="ratio-m">/5</span>
										</span>
									</div>

									<p class="partner-list-box__history-trost">
										아이그래 상담 <em id="counselingCountEl">선생님</em> 입니다.
									</p>
								</div>
							</div>
							<div class="partner-list-box__img" id="partnerProfileImgEl">
								<img
									src="${pageContext.request.contextPath}/resources/images/counselling/${counselor.advisImg}"
									alt="상담사 프로필 이미지">
							</div>
							<div class="partner-list-box__info-bottom">
								<div></div>
							</div>
						</article>
					</div>
					<div class="main-contents">
						<ul class="main-contents__tab is-right-tab" id="tabContents">
							<li class="js-contents-tab" id="tabBtnContentsInfo">상담사 정보</li>
							<li class="js-contents-tab is-active" id="tabBtnContentsReview">상담
								후기</li>
						</ul>
						<div
							class="main-contents__counselling-info js-contents-tab is-hide"
							id="contentsInfo">
							<h2 class="hide-text">상담사 정보</h2>

							<div id="youtubeVideoEl"></div>


							<article
								class="profile-content-box content-box content-box-counselling-info">
								<h3 class="hide-text">상담사가 건내는 말</h3>
								<div class="content-text">
									<strong
										class="profile-content-box__head--quote content-text__strong"
										id="headIntroduceEl">${counselor.advisLineIntro }</strong>
									<p class="profile-content-box__txt" id="introduceEl">${counselor.advisIntro }</p>
								</div>
							</article>
							<article
								class="profile-content-box content-box content-box--counselling-history">
								<h3 class="profile-content-box__head">주요 자격 및 경력</h3>
								<ul class="counselling-history-list">
									<li class="counselling-history-list__qualification">
										<h4 class="hide-text">자격증 리스트</h4>
										<ul id="partnerCertificationEl">

											<li>${counselor.advisLicense }</li>
										</ul>
									</li>
									<li class="counselling-history-list__education">
										<h4 class="hide-text">학력 리스트</h4>
										<ul id="partnerEducationEl">
											<!--                                <li><strong>중앙대 심리학과 발달심리학 전공 박사 졸업</strong></li>-->
											<!--                                <li>중앙대 심리학과 석사 졸업</li>-->
											<!--                                <li>중앙대 심리학과 학사 졸업</li>-->
											<li>${counselor.advisCareer }</li>
										</ul>
									</li>

								</ul>

							</article>
						</div>
						<div class="main-contents__review js-contents-tab"
							id="contentsReview">
							<h2 class="review-container_head">상담 후기</h2>

							<div class="review-contents__tab-field" style="display: none;">
								<div class="review__tab-btn review-online">
									<div class="online-review__tab is-select-category">텍스트 /
										전화</div>
								</div>
								<div class="review__tab-btn review-offline">
									<div class="offline-review__tab">대면상담</div>
								</div>
							</div>

							<section id="contentsReviewBox" class="profile-content-box"
								style="border-top: none;">
								<article class="review-top-info review-top-info--star-score">
									<h3 class="profile-content-box__head">
										상담 만족도 평균
										<div class="review-top-info-num">
											<span class="review-top-info-num__average"
												id="reviewAverageNum"><strong>${reviewRating}</strong></span>
										</div>
									</h3>
									<div class="review-box__content">
										<div class="star-score__wrap--center">
											<span class="main-star"> <span class='star-rating'>
													<span style="width:${reviewRating*20}%"></span>
											</span>
											</span>
										</div>
									</div>
								</article>
								<article class="review-top-info review-top-info--graph">
									<h3 class="profile-content-box__head">상담 만족도 비율</h3>
									<div class="review-box__content">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>

										<div class="chart-rating-wrapper">
											5 <span class='chart-rating'> <span
												style="width:${list1.get(0).getReviewCount()*100/
                                    totalReviewContents}%"></span>
											</span> ${list1.get(0).getReviewCount()}명<br> 4 <span
												class='chart-rating'> <span
												style="width:${list1.get(1).getReviewCount()*100/totalReviewContents}%"></span>
											</span> ${list1.get(1).getReviewCount()}명<br> 3 <span
												class='chart-rating'> <span
												style="width:${list1.get(2).getReviewCount()*100/totalReviewContents}%"></span>
											</span> ${list1.get(2).getReviewCount()}명<br> 2 <span
												class='chart-rating'> <span
												style="width:${list1.get(3).getReviewCount()*100/totalReviewContents}%"></span>
											</span> ${list1.get(3).getReviewCount()}명<br> 1 <span
												class='chart-rating'> <span
												style="width:${list1.get(4).getReviewCount()*100/totalReviewContents}%"></span>
											</span> ${list1.get(4).getReviewCount()}명
										</div>
									</div>
								</article>
							</section>
							<article class="review-box review-box-list-wrap">
								<h3 class="hide-text">상담후기</h3>
								<div class="review-list__wrap">
									<!-- 댓글게시판 시작  -->
									<div class="review-list-wrapper">
										<c:forEach items="${list }" var="review">
											<li class="review-list">
												<div class="review-list-top">
													<!-- 별점  -->
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
														<c:if test="${review.reviewerId eq member.memberId}">
														<i class="far fa-trash-alt" onclick="deleteReview('${review.advisReviewNo}','${review.advisId}');"></i>&nbsp;&nbsp;
														<i class="far fa-edit" data-toggle="modal" data-target="#exampleModal" onClick="modal('${review.reviewContent}','${review.reviewerId}','${review.advisReviewNo}','${review.advisId}');"></i> 
														</c:if>
														<span class="review-list__user--ellipsis">${review.reviewerId}</span>
														님 / ${review.reviewDate}
													</div>
												</div>
												<div class="review-list-review-contents">
													${review.reviewContent}
													<div class="review-list-category">
														<ul class="review-list-category">
															<li>카테고리 : ${review.advisKeyword }</li>
														</ul>
													</div>
												</div>
											</li>
										</c:forEach>
									</div>
									<!-- 페이지바  -->
									<div id='pageBar'><%=pageBar%></div>
								</div>
							</article>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      	<form action="${pageContext.request.contextPath}/counselling/editReview" method="POST">
      <div class="modal-body">
      		<input type="hidden" name="advisReviewNo" class='reviewNo' value='' />
      		<input type="hidden" name="advisId" class='advisId' value='' />
      		<input type="hidden" name="reviewerId" class='reviewerId' value='' />
      		<span class='memberId'></span>
      		<br />
      		<hr />
      		<label for="reviewContent" class="col-form-label">리뷰작성(500자 이내)</label>
      		<br />
      		<textarea class="reviewContent" maxlength="1500" name="reviewContent"></textarea>      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">수정</button>
      </div>
      	</form>
    </div>
  </div>
</div>
<script>
	function deleteReview(reviewNo, advisId){
		location.href = "${pageContext.request.contextPath}/counselling/deleteReview.do?advisReviewNo="+reviewNo+"&advisId="+advisId;
	};

	function modal(content, reviewerId, reviewNo, advisId){
		console.log("실행");
		$('.reviewNo').val(reviewNo);
		$('.reviewerId').val(reviewerId);
		$('.reviewContent').val(content);
		$('.advisId').val(advisId);
		$('.memberId').text(reviewerId);
	};

	
	$('.js-contents-tab').click(function(e){
	    $('.js-contents-tab').removeClass('is-active');
	    $(this).addClass("is-active");
	    if($(this).hasClass('is-active')){
	        if( $(".js-contents-tab").index(this) == 0){
	            $('#contentsInfo').removeClass('is-hide');
	            $('#contentsReview').addClass('is-hide');
	        }else{
	            $('#contentsInfo').addClass('is-hide');
	            $('#contentsReview').removeClass('is-hide');
	        }
	    }

	});

	</script>

<!-- container 끝  -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
