<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 아이콘 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Tmap js -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxfd41c38838d04a5ebdf59fe1a80ac9eb"></script>
<script
	src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=l7xxfd41c38838d04a5ebdf59fe1a80ac9eb"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/find/sojaeji.js"></script>
<!-- 현위치 검색 -->
<script
	src="${pageContext.request.contextPath}/resources/js/find/serviceCenterinit.js"></script>
<script>
	window.onload = initTmap();
</script>
<style>
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}

.row align-items-center {
	min-height: 28rem;
}

.custom-select {
	height: auto;
}

#searchResult {
	font-size: 10px;
	width: max-content;
}
.location-careCenter {
	margin: 20px 0px;
	border: 1px solid black;
	border-radius: 10px 10px 10px 10px;
}
.myLocation{
margin: 10px;
}
.custom-select{
width: max-content;
}
</style>
<!-- 헤더 소개 부분 -->
<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/find/service.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">시설 찾기</h1>
					<p>
						<a href="index.html" class="text-white">Home</a> <span
							class="mx-3">/</span> <strong>복지센터 찾기</strong>
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
				<h2>시설찾기</h2>
				<ul class="menu">
					<li class="list"><a href="${pageContext.request.contextPath }/find/careCenter.do">어린이집 찾기</a></li>
					<li class="list"><a href="${pageContext.request.contextPath }/find/serviceCenter.do">복지센터 찾기</a></li>
					<li class="list"><a href="${pageContext.request.contextPath }/find/hospital.do">병원 찾기</a></li>
					<li class="list"><a href="${pageContext.request.contextPath }/find/pharmacy.do">약국 찾기</a></li>
				</ul>
			</div>

			<!-- 중앙 영역 -->
			<div class="col-lg-9">
				<!-- contents start-->
				<div class="row">
					<div class="col-lg-8">
						<h5>
							<strong>복지센터 찾기 </strong>
						</h5>
					</div>
				</div>

				<div class="location-careCenter">
					<span>&nbsp;&nbsp;복지센터 지역별 검색</span>
					<div class="input-group col">
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">시/도</label>
						</div>
						<select class="custom-select" name="sido2" id="sido2">
						</select> &nbsp;&nbsp;
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">시/군/구</label>
						</div>
						<select class="custom-select" name="gugun2" id="gugun2">
						</select> &nbsp;&nbsp;
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">동</label>
						</div>
						<select class="custom-select" name="dong2" id="dong2">
						</select>
						<div class="col-md-auto">
							<button type="button" class="btn btn-primary btn-sm" id="juso">검색하기</button>
						</div>
					</div>
					<div class="myLocation">
						<!-- <input type="text" class="text_custom" id="searchKeyword" name="searchKeyword" value="편의점;한의원;">	 -->
						<span>현 위치로 검색</span>
						<button id="btn_select" onclick="rebutton();">
							<i class="fa fa-location-arrow" style="font-size: 24px"></i>
						</button>
					</div>

				</div>
				<div>
					<div style="width: 30%; float: left;">
						<div class="title">
							<strong>주민센터</strong> 검색결과
						</div>
						<div class="rst_wrap">
							<div class="rst mCustomScrollbar">
								<ul id="searchResult" name="searchResult">
									<li>검색결과</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="map_div" class="map_wrap" style="float: left"></div>
				</div>

				<!--contents end-->

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	new sojaeji('sido2', 'gugun2', 'dong2');
</script>

<!-- 위치 검색 -->
<script
	src="${pageContext.request.contextPath}/resources/js/find/serviceCentersearch.js"></script>


<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
