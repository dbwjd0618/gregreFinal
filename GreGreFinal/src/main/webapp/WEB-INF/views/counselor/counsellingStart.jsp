<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- WebSocket:sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>

<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<!-- 상담 페이지 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/counselling/counseling.css">
<script>

const memberId = '${memberId}';


//웹소켓 선언 및 연결
//1.최초 웹소켓 생성 url: /stomp
let socket = new SockJS('/Igre/stomp');
let stompClient = Stomp.over(socket);

let sessionId;
stompClient.connect({}, function(frame) {
	console.log('connected stomp over sockjs');
	console.log(frame);

	//(미사용)websocket sessionId 값 추출하기
	let url = stompClient.ws._transport.url;
	url = url.replace("ws://"+location.host+"/spring-ws/stomp/","");
	url = url.replace(/^\d+\//,"");
	url = url.replace("/websocket","");
	sessionId = url;

});

</script>
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
							class="mx-3">/</span> <strong>상담관리</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<%-- 
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
						
						</c:if>
					</div>
					<div class='eachCounseling H_N'>
						<h3>종료된 상담</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> --%>

<style>
table.table th, table.table td {text-align: center;}
</style>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">회원아이디</th>
      <th scope="col">메세지</th>
      <th scope="col">안읽은 메세지수</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${recentList }" var="m" varStatus="vs">
    <tr chatNo='<c:out value="${m.CHAT_ID}.${m.MEMBER_ID}"/>' /><%-- el의 문자열 더하기 연산대신 jstl out태그 사용 --%>
      <th scope="row">${vs.count}</th>
      <td><a href="javascript:goChat('${m.CHAT_ID}')">${m.MEMBER_ID }</a></td>
      <td>${m.MSG }</td>
      <td><span class="badge badge-light">${m.CNT }</span></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<script>
$(()=>{
	subscribeByPage();
});


/**
 * 페이지별 구독신청 내역을 처리한다.
 * 사용자가 새 메세지를 작성하거나, 관리자가 메세지를 확인한 경우, 알림을 받는다.
 * 
 */
function subscribeByPage(){
	
	
	
	//페이지별로 구독신청 처리
	let counselorId = '${counselorId}';
	let conntionDone = false;
	let intervalId = setInterval(()=>{
		if(conntionDone == true)
			clearInterval(intervalId);
		
		if(conntionDone==false && stompClient.connected){
			// subscribe message
	        stompClient.subscribe('/chat/counselor/'+counselorId+'/push', function(message) {
	            console.log("receive from /chat/counselor/"+counselorId+"/push :", message);
	            //새로운 메세지가 있을때 목록 갱신을 위해서 reload함.
	            location.reload();

	        });
			conntionDone = true;
		}	
	},1000);
}

function goChat(chatId){
	location.href="${pageContext.request.contextPath}/counselor/chat/"+chatId;
}

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />