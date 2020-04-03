<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 아이콘 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 네이버 지도 API -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=v5p2mqo6ba"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=v5p2mqo6ba&submodules=geocoder"></script>

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
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a> <span
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
							</select> <input type="button"
								class="btn btn-block btn-outline-success btn-send" value="검색">
						</form>
					</div>
				</div>
				
				<div id="map" style="width:100%;height:400px;"></div>
				 <div id="result"></div>
				<!--contents end-->
				 <div id="selectP"></div> 
			</div>
		</div>
	</div>
</div>

<script>
// 네이버 map 생성
$(window).on("load", function() {
    if (navigator.geolocation) {
        /**
         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
         */
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
        infowindow.open(map, center);
    }
});

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.5666805, 126.9784147),
    zoom: 10,
    mapTypeId: naver.maps.MapTypeId.NORMAL
});

var infowindow = new naver.maps.InfoWindow();

function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(15); // 지도의 줌 레벨을 변경합니다.

    infowindow.setContent('<div style="padding:10px;">' + '현 위치' + '</div>');

    infowindow.open(map, location);
    console.log('Coordinates: ' + location.toString());
}

function onErrorGeolocation() {
    var center = map.getCenter();

    infowindow.setContent('<div style="padding:20px;">' +
        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

    infowindow.open(map, center);
}


$(".btn-send").click(e=>{
	
	$("#selectP").html("");
	
	//주소 불러오기
	
	var si = $("[name=h_area1] option:selected").text();
	var dong = $("[name=h_area2] option:selected").text();
	
	naver.maps.Service.geocode({
        query: si+dong
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }

        var result = response.v2, // 검색 결과의 컨테이너
            items = result.addresses; // 검색 결과의 배열
            
        console.log(items[0].x);
            
        var x = items[0].x;
        var y = items[0].y;
        
        var point = new naver.maps.Point(x, y);

        map.setCenter(point);
        
        // do Something
    });
	

	$.ajax({
		url: "${pageContext.request.contextPath}/child/childCare",
		data: $("#form1").serialize(),
		type: "POST",
		dataType: "XML",
		success: function(data){
			/* console.log(data); */
			
			console.log(data);
			
			if($(data).find("resultCode").text() == '03'){
				alert("해당 지역에는 사고내역이 없습니다.")
				
			}else{
			let $item = $(data).find("item");
			
			
				$(data).find("item").each(function(i,e){
					
					var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng($($item[i]).find("la_crd").text(), $($item[i]).find("lo_crd").text()),
				    map: map
					});
					
					$("#selectP").append("<button style='width:50%;' onclick='go("+$($item[i]).find("la_crd").text()+", "+$($item[i]).find("lo_crd").text()+")'>"+$($item[i]).find("spot_nm").text()+"</button>");
				});			
			}
			

		},
		error:(xhr,status, err) =>{
			console.log(xhr,status,err);
		}
	});
	
});
function go(a,b){
	
	map.setCenter(new naver.maps.LatLng(a,b));
}
</script>
<script
	src="${pageContext.request.contextPath}/resources/js/child/childCare.js"></script>
<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

