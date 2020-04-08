 //주소 검색
     $("#juso").click(function(){

                var sido1 =$("#sido2").val();

    
                var gugun1 =$("#gugun2").val();
                var dong1 =$("#dong2").val();
                

                var sido = encodeURI($("#sido2").val());
                console.log(sido);
    
                var gugun = encodeURI($("#gugun2").val());
                var dong =encodeURI($("#dong2").val());
    
                var appKey='l7xxfd41c38838d04a5ebdf59fe1a80ac9eb';
                var url = 'https://apis.openapi.sk.com/tmap/geo/postcode';
            
                var params = {
                        "coordType" : "WGS84GEO",
                        "addressFlag" : "F00",
                        "format" : "json",
                        "page" : 1,
                        "count" : 1,
                        "addr" : sido+gugun+dong,
                        "appKey" : appKey
                };
                $.get(url, params, success)
                 .fail(fail);
    
                });
                // let userAgain = JSON.parse(localStorage.getItem("user"));
                function success( data ) {
                var lat = data.coordinateInfo.coordinate[0].lat;
                var lon = data.coordinateInfo.coordinate[0].lon;
                console.log(lat);

                var searchKeyword ="주민센터";
					$.ajax({
						method:"GET", // 요청 방식
						url:"https://apis.openapi.sk.com/tmap/pois/search/around?version=1&format=json&callback=result", // url 주소
						data:{
							"categories" : searchKeyword,
							"resCoordType" : "EPSG3857",
							"searchType" : "name",
							"searchtypCd" : "A",
							"radius" : 1,
							"reqCoordType" : "WGS84GEO",
							"centerLon" : lon,
							"centerLat" : lat,
							"appKey" : "l7xxfd41c38838d04a5ebdf59fe1a80ac9eb",
							"count" : 10
						},
						success:function(response){
							console.log(response);
							
							if(response == undefined){
								alert("해당 검색이 없습니다.");
							}
							var resultpoisData = response.searchPoiInfo.pois.poi;
							
							// 2. 기존 마커, 팝업 제거
							if(markerArr.length > 0){
								for(var i in markerArr){
									markerArr[i].setMap(null);
								}
								markerArr = [];
							}
		
							if(labelArr.length > 0){
								for(var i in labelArr){
									labelArr[i].setMap(null);
								}
								labelArr = [];
							}
							
							var innerHtml = ""; // Search Reulsts 결과값 노출 위한 변수
							var positionBounds = new Tmapv2.LatLngBounds(); //맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
							
							// 3. POI 마커 표시
							for(var k in resultpoisData){
								




								// POI 마커 정보 저장
								var noorLat = Number(resultpoisData[k].noorLat);
								var noorLon = Number(resultpoisData[k].noorLon);
								var name = resultpoisData[k].name;
								
								// POI 정보의 ID
								var id = resultpoisData[k].id;
								
								// 좌표 객체 생성
								var pointCng = new Tmapv2.Point(noorLon, noorLat);
								
								// EPSG3857좌표계를 WGS84GEO좌표계로 변환
								var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(pointCng);
								
								var lat = projectionCng._lat;
								var lon = projectionCng._lng;

								
								// 좌표 설정
								var markerPosition = new Tmapv2.LatLng(lat, lon);
								
								// Marker 설정
								marker = new Tmapv2.Marker({
							 		position : markerPosition,
							 		//icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
							 		icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png",
									iconSize : new Tmapv2.Size(24, 38),
									title : name,
									map:map
								 });

								// 결과창에 나타날 검색 결과 html
								innerHtml += "<li><div><img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_" 
								+ k + ".png' style='vertical-align:middle;'/><span>"+name+"</span>  "
								+"<button type='button' name='sendBtn' onClick='poiDetail("+id+");'>상세보기</button></div></li>";
								
								// 마커들을 담을 배열에 마커 저장
								markerArr.push(marker);
								positionBounds.extend(markerPosition);	// LatLngBounds의 객체 확장
							}
							
							$("#searchResult").html(innerHtml);	//searchResult 결과값 노출
							map.panToBounds(positionBounds);	// 확장된 bounds의 중심으로 이동시키기
							map.zoomOut();
						},
						error:function(request,status,error){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});


                }
                function fail(){
		
		        }