var map, marker;
			var markerArr = [], labelArr = [];
			
			function initTmap() {


                navigator.geolocation.getCurrentPosition(function(position){
				// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				var lat = position.coords.latitude;
				var lon = position.coords.longitude;
				var PR_3857 = new Tmap.Projection("EPSG:3857");  // Google Mercator 좌표계인 EPSG:3857
				var PR_4326 = new Tmap.Projection("EPSG:4326");  // WGS84 GEO 좌표계인 EPSG:4326        
				var lonlat = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);
				var size = new Tmap.Size(24, 38);
				var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
				var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',size, offset);
				// 1. 지도 띄우기
				map = new Tmapv2.Map("map_div", {
					center : new Tmapv2.LatLng(lat, lon),
					width : "70%",  
					height : "400px",
					zoom : 15,
					zoomControl : true,
					scrollwheel : true
				});

				var searchKeyword = "병원";
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
	
				     
			
                });
			
			}
			
			// 4. POI 상세 정보 API
			function poiDetail(poiId){
				$.ajax({
					method:"GET",
					url:"https://apis.openapi.sk.com/tmap/pois/"+poiId+"?version=1&resCoordType=EPSG3857&format=json&callback=result&appKey="+"l7xxfd41c38838d04a5ebdf59fe1a80ac9eb",
					async:false,
					success:function(response){
						console.log(response);
						var detailInfo = response.poiDetailInfo;
						var name = detailInfo.name;
						var address = detailInfo.address;
						var phone = detailInfo.tel;
						
						var noorLat = Number(detailInfo.frontLat);
						var noorLon = Number(detailInfo.frontLon);
						
						var pointCng = new Tmapv2.Point(noorLon, noorLat);
						var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(pointCng);
						
						var lat = projectionCng._lat;
						var lon = projectionCng._lng;
						
						var labelPosition = new Tmapv2.LatLng(lat, lon);
						console.log(phone);
						var content = "<div style=' border-radius:10px 10px 10px 10px;background-color:#2f4f4f; position: relative; width:max-content;"
						+ "line-height: 15px; padding: 5px 5px 2px 4px; right:65px;'>"
						+ "<div style='font-size: 11px; font-weight: bold ; line-height: 15px; color : white; width: max-content' >"
							+ "이름 : "
							+ name
							+ "</br>"
							+ "주소 : "
							+ address 
							+"</br>"
							+ "전화번호 : "
							+phone+ "</div>" + "</div>";
							
							console.log(phone);
						var labelInfo = new Tmapv2.Label({
							position : labelPosition,
							content : content,
							map:map
						});//popup 생성
						
						labelArr.push(labelInfo);
						
					},
					error:function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}

			//현 위치로 돌아오기
			function rebutton() {
				navigator.geolocation.getCurrentPosition(function(position){
				// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				var lat = position.coords.latitude;
				var lon = position.coords.longitude;
				
				var searchKeyword = "병원";
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
			});

			
				
			}