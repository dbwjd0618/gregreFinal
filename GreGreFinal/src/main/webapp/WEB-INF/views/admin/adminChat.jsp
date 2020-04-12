<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
<!-- WebSocket:sock.js CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<!-- WebSocket: stomp.js CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<!-- adminchat.css -->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/adminchat.css"
	rel="stylesheet" type="text/css" />
<!-- adminchat.js  -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/admin/adminchat.js"></script> --%>
<!-- 사용자 chat관련 script -->
<script
	src="${pageContext.request.contextPath }/resources/js/admin/chat.js"></script>

<style>
.chatMid {
	margin: 7px 0px 0px 6px;
}

.right>.chatMid {
	margin: 60px 0px 0px 740px;
}

.btn-outline-secondary {
	background-color: #a3d063;
}
</style>

<script>

const memberId = '${adminId}';
const adminId = '${adminId}'
const chatId = '${chatId}';

//웹소켓 선언 및 연결
//1. 최초 웹소켓 생성 url : /stomp
let socket = new SockJS('<c:url value="/stomp"/>');
let stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame){
	console.log('connected stomp over sockjs');
	//사용자 확인
	lastCheck(chatId, memberId);
});

/**
 * 각 페이지에서 작성하면 chat.js의 onload함수에서 호출한다.
 * chat 페이지에서 추가적으로 subscripe 한다.
 * 웹소켓 connection이 맺어지기 전 요청을 방지하기 위해 stompClient.connected를 체크한다.
 * conntionDone으로 구독요청 완료를 체크해서 1초마다 반복적으로 구독요청한다.
 */
 
 function chatSubscribe(){
	//페이지별 구독신청 처리
	let conntionDone = false;
	let intervalId = setInterval(()=>{
		if(conntionDone == true)
			clearInterval(intervalId);
		
		if(conntionDone==false && stompClient.connected){
			
			//stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상영한다.
			stompClient.subscribe('/admin/chat/'+chatId, function(message) {
				console.log("receive from subscribe /admin/chat/"+chatId+":", message);
				let messageBody = JSON.parse(message.body);
				$(".messages").append("<li class=\"message right appeared\">"+
						"<div class=\"avatar\"></div>"+
						"<div class=\"text_wrapper\">"+
						"<div class=\"text\">"+messageBody.msg+"</div>"+
						"</div>"+
						"<div class=\"chatMid\">"+messageBody.memberId+"</div></li>");
				scrollTop();
			});
			conntionDone = true;
		}
	},1000);		
}
</script>


<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>1:1 채팅</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">1:1채팅</a></li>
			<li class="active">채팅하기</li>
		</ol>
	</section>
	<div class="chat_window">
		<div class="top_menu">
			<div class="buttons">
				<div class="button close"></div>
				<div class="button minimize"></div>
				<div class="button maximize"></div>
			</div>
			<div class="title">Chat</div>
		</div>
		<!-- 메시지 출력 영역 -->
		<div id="msg-container">
			<ul class="messages">
				<c:forEach items="${chatList}" var="chat">
					<li
						class="message appeared ${chat.MEMBER_ID == adminId ? 'right' : 'left'}">
						<div class="avatar"></div>
						<div class="text_wrapper">
							<div class="text">${chat.MSG }</div>
						</div>
						<div class="chatMid">${chat.MEMBER_ID }</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 메시지 입력 영역  -->
		<div class="bottom_wrapper clearfix">
			<div class="message_input_wrapper">
				<input class="message_input" id="message"
					placeholder="Type your message here..." autofocus />
			</div>
			<div class="send_message">
				<button class="btn btn-outline-secondary" type="button" id="sendBtn"
					style="font-size: 20px;">Send</button>
			</div>
		</div>
	</div>
</div>

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>