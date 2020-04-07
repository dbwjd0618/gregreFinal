<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}
.row{
margin-bottom: 30px; 
}
</style>
<!-- 아이콘 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 캘린더 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pregnancy/basic.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pregnancy/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pregnancy/layout_sub.css">


<!-- calendar js -->
<script
	src="${pageContext.request.contextPath}/resources/js/pregnancy/calendar.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/pregnancy/common.js"></script>
<!-- 헤더 소개 부분 -->
<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/pregnancy/calendar2.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">임신</h1>
					<p>
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a> <span
							class="mx-3">/</span> <strong>월경캘린더</strong>
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
				<h2>임신</h2>
				<ul class="menu">
					<li class="list"><a href="${pageContext.request.contextPath }/pregnancy/prePregnancy.do">임신정보</a></li>
					<li class="list"><a href="${pageContext.request.contextPath }/pregnancy/calendar.do">월경캘린더</a></li>
					<li class="list"><a href="#">임신상담</a></li>
				</ul>
			</div>

			<!-- 중앙 영역 -->
			<div class="col-lg-9">
				<!-- contents start-->
				<div class="row">
					<div class="col-lg-8">
						<h5>
							<strong>월경 캘린더 </strong>
						</h5>
					</div>
				</div>
				<div class="container">
					<!-- 컨텐츠 시작 -->
					<!-- 임신-가임기체크 -->
					<form name="sfrm" method="post">
						<div class="check_box1">
							<div class="check_box_bg2" style="background:url('${pageContext.request.contextPath}/resources/images/pregnancy/heart.jpg');
							 background-size:contain;
							 background-repeat: no-repeat;
							     margin-left: 50px;">
								<em>가임기란?</em><br> 임신 가능한 시기를 말합니다. 다른 말로는 수태기라고도 합니다.<br>
								여성들을 위해 다음 생리일 및 가임기간을 미리 예측해 알려드리는 서비스 입니다.
							</div>
						</div>

						<div class="phys mar_b20">
							<ul>
								<li>
									<dl>
										<dt>최근 생리 시작일</dt>
										<dd class="mar_t20">
											<label for="s_year" class="hidden">년도선택</label> <select
												id="s_year">
											</select> <em>년</em> <label for="s_month" class="hidden">월선택</label> <select
												id="s_month">
											</select> <em>월</em> <label for="s_day" class="hidden">일선택</label> <select
												id="s_day">
											</select> <em>일</em>

											<p class="com3 mar_l15 mar_t10 text_l">
												<span class="orange3">최근 생리 시작일을 입력하세요.</span>
											</p>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>생리 주기</dt>
										<dd class="mar_t30">
											<input type="radio" class="radio" id="yes" name="s_type"
												value="A" checked> <label for="yes">규칙적</label> <input
												type="radio" class="radio" id="no" name="s_type" value="B">
											<label for="no">불규칙적</label>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>주기 일자</dt>
										<dd class="mar_t25">
											<span id="jugi_info"> <label for="s_day1"
												class="hidden">주기일자</label><input name='s_day1' id='s_day1'
												type='text' class='input' style='width: 50px;'
												onkeydown='fnOnlyNumber();'> 일
											</span>
										</dd>
									</dl>
								</li>
							</ul>
							<div class="img1"></div>
							<div class="img2"></div>
							<div class="clear_b"></div>
						</div>

						<div class="text_c mar_b40">
						<c:choose>
							<c:when test="${!empty memberLoggedIn }">
							<a href="javascript:;" class="sub003_001"><img src="${pageContext.request.contextPath }/resources/images/pregnancy/btn_member.gif" alt="캘린더 저장 버튼"></a>
							</c:when>
							<c:when test="${empty memberLoggedIn }">
							<a href="javascript:;"  class="sub003_001"><img src="${pageContext.request.contextPath }/resources/images/pregnancy/btn_cal.gif" alt="캘린더 만들기 버튼"></a>
							</c:when>
						</c:choose>
						
						</div>
					</form>


					<div class="com_box8 mar_b40">
						<ul class="com_ul4">
							<li><em>1</em>배란일은 다음번 생리 예정일 기준으로 합니다.</li>
							<li><em>2</em>스트레스 및 성 호르몬의 불균형으로 인하여 생리 예정일이 달라 질 수 있으므로
								배란일, 임신가능일이 실제와 다를수 있습니다.</li>
							<li><em>3</em>피임법 중 배란일 측정법으로 피임을 사용하시려면 피임 실패율이 높기 때문에 다른
								피임방법과 함께 사용하셔야 합니다.</li>
							<li><em>4</em>임신을 목적으로 사용하시려면 정확한 배란일을 병원에서 체크 하셔야 합니다.</li>
							<li><em>5</em>생리가 불순한 경우 결과치가 틀릴 수 있습니다.</li>
						</ul>
					</div>
					<div id="div_result" style="display: block;">
						<iframe title="생리캘린더" id="i_result_area"
							style="width: 770px; height: 700px; border: none;"></iframe>
					</div>



					<!-- 컨텐츠 끝 -->


					<!-- 컨텐츠 끝 -->

				</div>

				<!--contents end-->

			</div>
		</div>
	</div>
</div>
<script>


</script>

<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
