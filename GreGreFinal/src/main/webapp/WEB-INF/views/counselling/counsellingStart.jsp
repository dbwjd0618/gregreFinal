<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<!-- 상담 페이지 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/counselling/counseling.css">

<style>
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}

.row {
	margin-bottom: 30px;
}
</style>

<!-- 헤더 소개 부분 -->
<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/child/child.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">상담센터</h1>
					<p>
						<a href="index.html" class="text-white">Home</a> <span
							class="mx-3">/</span> <strong>상담하기</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 서브 메뉴 -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class='wrapper' id='status'>
				<div id='counseling_list_menu' style="margin-top: 50px;">
					<p
						style="text-align: center; font-weight: bold; margin-bottom: 24px">진행
						중인 상담 확인이 가능합니다.</p>
					<h1>상담 목록</h1>
				</div>
				<div id='counseling_list'>
					<div class='eachCounseling H_Y'>
						<h3>현재 진행 중인 상담</h3>
						<c:if test="${recentList != null}">
						
						 <c:forEach items="${recentList }" var="m" varStatus="vs">
							<a target="_self" href="${pageContext.request.contextPath}/chat/counselorChat">
								<ul id="511841" class="eachintro">
									<li>
										<img src="https://trost-asset-images.s3-accelerate.amazonaws.com/partner/15551464323_.png" alt="상담사 프로필 이미지">
										<p>${m.MSG }<br><br>
											<span class="recently_message">${m.MEMBER_ID }</span><br>
											<span class="recently_time">안 읽은 글 :  ${m.CNT }</span>
										</p>
									</li>
								</ul>
							</a>
						    
						  </c:forEach>
						</c:if>
					</div>
					<div class='eachCounseling H_N'>
						<h3>종료된 상담</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />