<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}

.row {
	margin-bottom: 30px;
}
</style>
<!-- 아이콘 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 캘린더 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pregnancy/basic.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pregnancy/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pregnancy/layout_sub.css">

<script
	src="${pageContext.request.contextPath}/resources/js/pregnancy/common.js"></script>
<!-- 헤더 소개 부분 -->
<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/child/child.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">육아</h1>
					<p>
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a> <span
							class="mx-3">/</span> <strong>육아정보</strong>
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
			<div class="col-lg-3">
				<!--시설찾기 서브메뉴-->
				<h2>육아</h2>
				<ul class="menu">
					<li class="list active"><a href="">육아정보</a>
					 <ul class="items">
				         <li><a href="${pageContext.request.contextPath }/child/childInfo.do">예방접종</a></li>
				         <li><a href="${pageContext.request.contextPath }/child/childWeekInfo.do">임신주기별 정보</a></li>
				      </ul>
					</li>
					<li class="list"><a href="${pageContext.request.contextPath }/child/childCare.do">아이지킴이</a></li>
					<li class="list"><a href="${pageContext.request.contextPath }/counselling/counselorFind.do">육아상담</a></li>
				</ul>
			</div>

			<!-- 중앙 영역 -->
			<div class="col-lg-9">
				<!-- contents start-->
				<div class="row">
					<div class="col-lg-8">
						<h5>
							<strong>육아정보(예방접종) </strong>
						</h5>
					</div>
				</div>
				<!-- 탭 -->
				<div class="com_tab_box">
					<div class="com_tab">
						<ul>
							<!-- ok_01 w33  추가하기-->
							<li class='<c:if test="${url eq '030102010000'}">ok_03 w33</c:if>'><a
								href="${pageContext.request.contextPath }/child/childInfo.do?value=030102010000"
								id="link_dep4_p1_030102010000"> <span>접종시 유의사항</span>
							</a></li>
							<li class='<c:if test="${url eq '030102020000'}">ok_03 w33</c:if>'><a href="${pageContext.request.contextPath }/child/childInfo.do?value=030102020000"
								id="link_dep4_p1_030101020000"> <span>예방접종표</span>
							</a></li>
							<li class='<c:if test="${url eq '030102030000'}">ok_03 w33</c:if>'><a href="${pageContext.request.contextPath }/child/childInfo.do?value=030102030000"
								id="link_dep4_p1_030102030000"> <span>예방접종분류</span>
							</a></li>
							<li class='<c:if test="${url eq '030102040000'}">ok_03 w33</c:if>'><a href="${pageContext.request.contextPath }/child/childInfo.do?value=030102040000"
								id="link_dep4_p1_030102040000"> <span>예방접종별 이상반응</span>
							</a></li>
						</ul>
						<div class="clear_b"></div>
					</div>



				</div>
				<!-- //탭 -->
				<div class="container">
					<!-- 컨텐츠 끝 -->
						${element }
					<!-- 컨텐츠 끝 -->
				</div>
				<!--contents end-->
			</div>
		</div>
	</div>
</div>


<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>