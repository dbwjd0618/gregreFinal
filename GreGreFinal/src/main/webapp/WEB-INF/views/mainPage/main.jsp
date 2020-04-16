<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- WebSocket:sock.js CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<!-- WebSocket: stomp.js CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/index/inqChat.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/index/inqChat.js"></script>
<style>
#inqToAdmin {
	position: fixed;
	bottom: 30px;
	right: 30px;
	color: #4e4ecf54;
	font-size: 60px;
}

.owl-item active {
	margin-right: 40px;
}

#inqToAdmin:hover {
	color: #4e4ecf;
	cursor: pointer;
}

.owl-stage-outer {
	padding-top: 0px;
}

.testimonial-3 {
	min-height: 300px;
}

body {
	padding-right: 0px !important;
}

.site-section-cover.overlay:before {
	height: 389px !important;
}
</style>
<c:if test="${not empty memberLoggedIn && memberLoggedIn.grade != 'A'}">
	<script>
		const memberId = '${memberId}';
		const chatId = '${chatId}';

		let socket = new SockJS('<c:url value="/stomp"/>');
		let stompClient = Stomp.over(socket);

		stompClient.connect({}, function(frame) {
			console.log('connected stomp over sockjs');
			// 	lastCheck(chatId);
		});

		function chatSubscribe() {
			//페이지별로 구독신청 처리
			let conntionDone = false;
			let intervalId = setInterval(
					function() {
						if (conntionDone == true)
							clearInterval(intervalId);

						if (conntionDone == false && stompClient.connected) {

							//stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상응한다.
							stompClient
									.subscribe(
											'/inq/chat/' + chatId,
											function(message) {
												console.log(
														"receive from subscribe /inq/chat/"
																+ chatId + ":",
														message);
												let messsageBody = JSON
														.parse(message.body);
												if (messsageBody.memberId == memberId) {
													$(".messages")
															.append(
																	"<li class='message right appeared'><div class='avatar'></div><div class='text_wrapper'><div class='text'>"
																			+ messsageBody.msg
																			+ "</div></div></li>");
												} else {
													$(".messages")
															.append(
																	"<li class='message left appeared'><div class='avatar'></div><div class='text_wrapper'><div class='text'>"
																			+ messsageBody.msg
																			+ "</div></div></li>");
												}
												scrollTop();
											});
							conntionDone = true;
						}
					}, 1000);
		}
	</script>
</c:if>

<div class="ftco-blocks-cover-1">

	<div class="site-section-cover overlay">
		<div class="container">
			<div class="row main-visual">
				<div class="col-md-7 mt-5 " style="padding: 0 !important;">
					<div class="testimonial-3-wrap"
						style="margin-top: 20px; margin-bottom: 40px;">

						<div class="owl-carousel nonloop-block-13">
							<div class="testimonial-3 d-flex"
								style="background: url('${pageContext.request.contextPath}/resources/images/mainSlide/slide-img1.png') no-repeat;     background-size: 105% 320px; height: 320px;;">
							</div>
							<a href="http://bokjiro.go.kr/plaza/noticeView.do?no=661">
								<div class="testimonial-3 d-flex"
									style="background: url('${pageContext.request.contextPath}/resources/images/mainSlide/slide-img2.png') no-repeat;     background-size: 105% 320px; height: 320px;;">
								</div>
							</a>
							<div class="testimonial-3 d-flex"
								style="background: url('${pageContext.request.contextPath}/resources/images/mainSlide/slide-img4.png') no-repeat;     background-size: 105% 320px; height: 320px;;">
							</div>

							<%-- <div class="testimonial-3 d-flex" style="background: url('${pageContext.request.contextPath}/resources/images/index/idx_fam.png') no-repeat"></div>

							<div class="testimonial-3 d-flex" onclick="location.href='${pageContext.request.contextPath }/find/pharmacy.do';" style="cursor:pointer; background: url('${pageContext.request.contextPath}/resources/images/index/idx_mask.png') no-repeat"></div>

							<div class="testimonial-3 d-flex" onclick="location.href='http://www.childcare.go.kr/web/board/BD_board.list.do?bbsCd=9091';" style="cursor: pointer; background: url('${pageContext.request.contextPath}/resources/images/index/idx_sup.jpg') no-repeat"></div> --%>
						</div>
					</div>
				</div>
				<div class="col-md-5 top-links"
					style="padding: 0 !important; margin-top: 68px;">
					<ul>
						<li class="link1">
							<a href="${pageContext.request.contextPath }/pregnancy/prePregnancy.do">
								<img src="${pageContext.request.contextPath}/resources/images/index/pregnant-icon.png" alt=""> <br> 임신
							</a>
						</li>
						<li class="link2">
							<a href="${pageContext.request.contextPath }/child/childInfo.do">
								<img src="${pageContext.request.contextPath}/resources/images/index/child-icon.png" alt=""> <br> 육아
							</a>
						</li>
						<li class="link3">
							<a href="${pageContext.request.contextPath }/find/pharmacy.do">
								<img src="${pageContext.request.contextPath}/resources/images/index/reserve_hospital-icon.png" alt=""> <br> 마스크현황
							</a>
						</li>
						<li class="link4">
							<a href="${pageContext.request.contextPath }/counselling/counselorFind.do">
								<img src="${pageContext.request.contextPath}/resources/images/index/counseling-icon.png" alt=""> <br> 온라인상담
							</a>
						</li>

					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- index contents begin -->
<div class="site-section site-section-pd"
	style="margin-top: 0px; padding-top: 0px;">
	<div class="container" style="margin-top: 0px;">
		<div class="row">
			<div class="main-row2">
				<div class="notice-list">
					<h2>공지사항</h2>
					<a
						href="${pageContext.request.contextPath}/board/postList?boardCode=B1">
						<img
						src="${pageContext.request.contextPath}/resources/images/index/more.png"
						class="more" alt="">
					</a>
					<ul>
						<c:forEach items="${idxNotice}" var="post">
							<li><a
								href="${pageContext.request.contextPath}/board/postView?boardCode=B1&postNo=${post.postNo}">${post.title}</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="notice-list">
					<h2>인기글</h2>
					
					<ul>
						<c:forEach items="${favList}" var="post">
							<li><a
								href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}">${post.title}</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="photo-list" style="float: left; width: 46.5%">
					<h2>오늘의 예보</h2>
					<div style="width: 100%;">
						<div id="div-weather" style="width: 45%; display: inline-block;">
							<span>오늘의 날씨 : </span><img src="" id="weatherImg" alt=""
								style="width: 50px;" /> <br />
							<br /> <span>강수확률 : </span><span id="pop"></span><span> %</span>
							<br />
							<br /> <span id="tmn" style="color: blue;">최저온도</span> <span>/</span>
							<span id="tmx" style="color: red;">최고온도</span>
						</div>
						<div id="div-dust" style="width: 45%; display: inline-block;">
							<span>오늘의 미세먼지 상태는 </span> <br /> <strong><span
								id="dust10"></span></strong> <br /> <span>입니다.</span> <br />
							<br /> <span>오늘의 초미세먼지 상태는 </span> <br /> <strong><span
								id="dust25"></span></strong> <br /> <span>입니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--main-row2 끝-->

		<div class="row">
			<div class="main-row3">
				<div class="toy-link" style="background-image: url('${pageContext.request.contextPath}/resources/images/index/igre.png'); background-size:400px;">
					<h2>아이그레몰 바로가기</h2>
					<div style="text-align: center;">
						<a href="${pageContext.request.contextPath }/shop/shop.do"> <img 
							src="${pageContext.request.contextPath}/resources/images/logo/igre_mall_logo.png"
							style="width: 200px; padding-top: 25px; margin-left: 56px;">
						</a>
					</div>
				</div>
				<div class="quick-service">
					<h2>찾아보기</h2>
					<ul>
						<li class="link1"><a
							href="${pageContext.request.contextPath }/find/careCenter.do">
								<img
								src="${pageContext.request.contextPath}/resources/images/index/daycare_icon.png"
								alt=""> <br> 어린이집
						</a></li>
						<li class="link2"><a
							href="${pageContext.request.contextPath }/find/serviceCenter.do">
								<img
								src="${pageContext.request.contextPath}/resources/images/index/welfare_icon.png"
								alt=""> <br> 복지센터
						</a></li>
						<li class="link3"><a
							href="${pageContext.request.contextPath }/find/hospital.do">
								<img
								src="${pageContext.request.contextPath}/resources/images/index/pharmacy_icon.png"
								alt=""> <br> 병원
						</a></li>
						<li class="link4"><a
							href="${pageContext.request.contextPath }/child/childCare"> <img
								src="${pageContext.request.contextPath}/resources/images/index/schoolzone_icon.png"
								alt=""> <br> 어린이보호구역
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!--index contents end -->

<c:if test="${not empty memberLoggedIn && memberLoggedIn.grade != 'A'}">
	<i id="inqToAdmin"
		class="far fa-comments ${chatList != null ? 'rtnMsg' : ''}"
		title="관리자에게 문의하기" onclick="inqShow();"></i>
	<input type="hidden" id="loginId" value="${memberLoggedIn.memberId}" />
</c:if>

<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" style="margin-top: 170px;">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="border: unset;">
			<div class="chat_window">
				<div class="top_menu">
					<div class="buttons">
						<div class="button close"></div>
						<div class="button minimize"></div>
						<div class="button maximize"></div>
					</div>
					<div class="title">Chat</div>
				</div>
				<ul class="messages">
					<c:forEach items="${chatList}" var="msg">
						<li
							class="message appeared ${msg.memberId == memberId ? 'right' : 'left'}">
							<div class="avatar"></div>
							<div class="text_wrapper">
								<div class="text">${msg.msg }</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="bottom_wrapper clearfix">
					<div class="message_input_wrapper">
						<input type="text" class="message_input" placeholder="메세지를 입력하세요." />
					</div>
					<div class="send_message">
						<div class="icon"></div>
						<div class="text">Send</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/api/weather.api",
					dataType : "XML",
					method : "GET",
					success : function(data) {
						console.log(data);
						let $item = $(data).find("item");
						console.log($item);
						let pop = null;
						let sky = null;
						let tmn = null;
						let tmx = null;
						$.each($item, function(i, it) {
							if (pop == null
									&& $(it).find("category").text() == "POP") {
								pop = $(it).find("fcstValue").text();
							}
							if (sky == null
									&& $(it).find("category").text() == "SKY") {
								sky = $(it).find("fcstValue").text();
							}
							if (tmn == null
									&& $(it).find("category").text() == "TMN") {
								tmn = $(it).find("fcstValue").text();
							}
							if (tmx == null
									&& $(it).find("category").text() == "TMX") {
								tmx = $(it).find("fcstValue").text();
							}
							if (pop != null && sky != null && tmn != null
									&& tmx != null) {
								return false;
							}
						});
						$("#pop").text(pop);
						$("#tmn").text(tmn + "°C");
						$("#tmx").text(tmx + "°C");
						if (sky == 1) {
							$("#weatherImg")
									.attr('src',
											"${pageContext.request.contextPath}/resources/images/index/맑음.png");
						} else if (sky == 3) {
							$("#weatherImg")
									.attr('src',
											"${pageContext.request.contextPath}/resources/images/index/구름.png");
						} else {
							$("#weatherImg")
									.attr('src',
											"${pageContext.request.contextPath}/resources/images/index/흐림.png");
						}
						console.log("AAAA", pop, sky, tmn, tmx);
					},
					error : function(x, s, e) {
						console.log(x, s, e);
					}
				});

		$.ajax({
			url : "${pageContext.request.contextPath}/api/dust.api",
			dataType : "XML",
			method : "GET",
			success : function(data) {
				console.log(data);
				let pm10 = $(data).find("pm10Grade1h").text();
				let pm25 = $(data).find("pm25Grade1h").text();

				if (pm10 == 1) {
					$("#dust10").text("좋음").attr("style", "color:green");
				} else if (pm10 == 2) {
					$("#dust10").text("보통").attr("style", "color:yellowgreen");
				} else if (pm10 == 3) {
					$("#dust10").text("나쁨").attr("style", "color:orange");
				} else {
					$("#dust10").text("매우나쁨").attr("style", "color:red");
				}
				if (pm25 == 1) {
					$("#dust25").text("좋음").attr("style", "color:green");
				} else if (pm25 == 2) {
					$("#dust25").text("보통").attr("style", "color:yellowgreen");
				} else if (pm25 == 3) {
					$("#dust25").text("나쁨").attr("style", "color:orange");
				} else {
					$("#dust25").text("매우나쁨").attr("style", "color:red");
				}
			},
			error : function(x, s, e) {
				console.log(x, s, e);
			}
		});
	});
</script>

