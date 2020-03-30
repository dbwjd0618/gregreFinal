<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 아이콘 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">



<style>
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}
</style>


<!-- 헤더 소개 부분 -->
<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/child/schoolzone.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">육아</h1>
					<p>
						<a href="index.html" class="text-white">Home</a> <span
							class="mx-3">/</span> <strong>아이지킴이</strong>
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
					<li class="list"><a
						href="${pageContext.request.contextPath }/child/childInfo.do">육아정보</a></li>
					<li class="list"><a
						href="${pageContext.request.contextPath }/child/childCare.do">아이지킴이</a></li>
					<li class="list"><a href="#">육아상담</a></li>
				</ul>
			</div>

			<!-- 중앙 영역 -->
			<div class="col-lg-9">
				<!-- contents start-->
				<div class="row">
					<div class="col-lg-8">
						<h5>
							<strong>스쿨존내 어린이 사고다발 지역</strong>
						</h5>
					</div>
				</div>

				<div class="location-careCenter">
					<span>&nbsp;&nbsp;스쿨존 지역별 검색</span>
					<div class="input-group col">
						<form name="form1" id="form1">
							<select name="h_area1" onChange="cat1_change(this.value,h_area2)">
								<option>-선택-</option>
								<option value='11'>서울</option>
								<option value='26'>부산</option>
								<option value='27'>대구</option>
								<option value='28' selected>인천</option>
								<option value='29'>광주</option>
								<option value='30'>대전</option>
								<option value='31'>울산</option>
								<option value='42'>강원</option>
								<option value='41'>경기</option>
								<option value='48'>경남</option>
								<option value='47'>경북</option>
								<option value='46'>전남</option>
								<option value='45'>전북</option>
								<option value='50'>제주</option>
								<option value='44'>충남</option>
								<option value='43'>충북</option>
							</select> <select name="h_area2">
								<option>-선택-</option>
								<option value='710' selected>강화군</option>
								<option value='245' selected>계양구</option>
								<option value='170' selected>남구</option>
								<option value='200' selected>남동구</option>
								<option value='140' selected>동구</option>
								<option value='237' selected>부평구</option>
								<option value='260' selected>서구</option>
								<option value='185' selected>연수구</option>
								<option value='720' selected>옹진군</option>
								<option value='110' selected>중구</option>
							</select>
							<input type="button" class="btn btn-block btn-outline-success btn-send" value="검색" >
							</form>
					</div>
				</div>

				<!--contents end-->
			</div>
		</div>
	</div>
</div>

<script>
$(".btn-send").click(e=>{
	console.log("클릭 함");
	console.log($("#form1").serialize());


	$.ajax({
		url: "${pageContext.request.contextPath}/child/childCare",
		data: $("#form1").serialize(),
		type: "GET",
		dataType:"json",
		success: data =>{
			console.log(data)
			
			/* var obj = JSON.parse(data); */
			
			
		
		},
		error:(xhr,status, err) =>{
			console.log(xhr,status,err);
		}
	});
});
</script>
<script src="${pageContext.request.contextPath}/resources/js/child/childCare.js"></script>
<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

