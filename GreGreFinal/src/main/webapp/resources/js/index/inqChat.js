$(function() {
	chatSubscribe();
	
	$(".send_message").click(function() {
		sendMessage();
	});
	
	$(".message_input").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			sendMessage();
		}
	});
	
	scrollTop();
});

function sendMessage() {
	let data = {
			chatId : chatId,
			memberId : memberId,
			msg : $(".message_input").val(),
			time : Date.now(),
			type : "Message"
	}
	
	stompClient.send('/inq/chat/${chatId}', {}, JSON.stringfy(data));
	
	$(".message_input").val('');
	
	stompClient.send()
}

function scrollTop() {
	$(".messages").scrollTop(".messages").prop('scrollHeight');
}

$(function() {
	window.setInterval(function() {
		var time = new Date();
		var ss = time.getSeconds();
		if(ss%2 == 0) {
			$(".rtnMsg").css("color", "red");
		} else {
			$(".rtnMsg").css("color", "#4e4ecf54");
		}
	}, 500);
});
function inqShow() {
	$('#modalBox').modal('show');
}

function chatSubscribe(){
	//페이지별로 구독신청 처리
	let conntionDone = false;
	let intervalId = setInterval(function() {
		if(conntionDone == true)
			clearInterval(intervalId);
		
		if(conntionDone==false && stompClient.connected){
			
			//stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상응한다.
			stompClient.subscribe('/inq/chat/'+chatId, function(message) {
				console.log("receive from subscribe /chat/"+chatId+":", message);
				let messsageBody = JSON.parse(message.body);
				$("#messages").append("<li class=\"list-group-item\">"+messsageBody.memberId+" : "+messsageBody.msg+ "</li>");
				scrollTop();
			});
			conntionDone = true;
		}	
	},1000);
}