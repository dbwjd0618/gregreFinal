<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<!-- WebSocket:sock.js CDN -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- adminchat.css -->
<%-- <link href="${pageContext.request.contextPath}/resources/css/admin/adminchat.css" rel="stylesheet" type="text/css" /> --%>
<!-- adminchat.js  -->
<script src="${pageContext.request.contextPath}/resources/js/admin/chat.js"></script>

<!-- table css -->
<style>
table.table th, table.table td {
	text-align: center;
	font-size : 16px;
}

.table{
    background-color: white;
}

.fa-comments{
	 color: lightgray; 
	 margin-left: 83px;
}


</style>

<!-- list에서 클릭시 chat으로 이동하는 script -->
<script>
function goChat(chatId){
	location.href = "${pageContext.request.contextPath}/admin/chat/"+chatId;
}

$(function(){
	$("table td").mouseover(function(){
		$(this).parents("table tr").css("backgroundColor", "#f3f3f3");
	});
	$("table td").mouseout(function(){
		$(this).parents("table tr").css("backgroundColor", "white");
	});
})
</script>

<!-- lastCheck script -->
<script>

//웹소켓 선언 및 연결
//1. 최초 웹소켓 생성 url : /stomp
let socket = new SockJS('<c:url value="/stomp"/>');
let stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame){
	console.log('connected stomp over sockjs');
	//사용자 확인
	lastCheck(chatId, memberId);
});

$(()=>{
	subscribeByPage();
});

/**
 * 페이지별 구독신청 내역을 처리한다.
 * 사용자가 새 메세지를 작성하거나, 관리자가 메세지를 확인한 경우 알림을 받는다.
 */
 
 function subscribeByPage(){
	//페이지별로 구독신청 처리
	let conntionDone = false;
	let intervalId = setInterval(()=>{
		if(conntionDone==true)
			clearInterval(intervalId);
		
		if(conntionDone==false && stompClient.connected){
			
			//subscribe message
				stompClient.subscribe('/inq/chat/{chatId}', function(message){
				console.log("receive from /inq/chat/{chatId} :", message);
				//새로운 메세지가 있을때 목록 갱신을 위해서 reload함.
				location.reload();
			});
			conntionDone = true;
		}
	}, 1000);
}
</script>


<div class="content-wrapper">
	<section class="content-header">
		<h1> 채팅목록 </h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">1:1채팅</a></li>
			<li class="active">채팅리스트</li>
		</ol>
	</section>
	<div class="chat-table">
		<table class="table">
		    <tr>
		      <th style="width:50px">NO.</th>
		      <th style="width:50px">회원아이디</th>
		      <th style="width:100px">메세지</th>
		    </tr>
		  <c:forEach items="${recentList }" var="map" varStatus="vs">
		    <tr chatNo='<c:out value="${map.CHAT_ID}.${map.MEMBER_ID}"/>' /><%-- el의 문자열 더하기 연산대신 jstl out태그 사용 --%>
		      <th class="row">${vs.count}</th>
		      <td class="row"><a href="javascript:goChat('${map.CHAT_ID}')">${map.MEMBER_ID }</a></td>
		      <td class="row">${map.MSG }</td>
		    </tr>
		  </c:forEach>
		</table>
		<div style="font-size: 60px; display: inline-block;">
		<i class="far fa-comments fa-10x" ></i>
		</div>
	</div>
</div>

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp" %>