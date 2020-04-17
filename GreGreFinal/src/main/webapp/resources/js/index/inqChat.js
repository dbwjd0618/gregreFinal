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
	
//	$(window).on("focus", function() {
//		lastCheck();
//	});
	
});

function sendMessage() {
	let data = {
			chatId : chatId,
			memberId : memberId,
			msg : $(".message_input").val(),
			time : Date.now(),
			type : "MESSAGE"
	}
	
	stompClient.send('/Igre/inq/chat/'+chatId, {}, JSON.stringify(data));
	
	$(".message_input").val('');
	
}

function scrollTop() {
	$(".messages").scrollTop($(".messages").prop('scrollHeight'));
	$('.messages').animate({ scrollTop: $('.messages').prop('scrollHeight') }, 300);

}

function lastCheck(chatId, memberId) {
	let data = {
			chatId : chatId,
			memberId : memberId,
			time : Date.now(),
			type: "LASTCHECK"
	}
	
	stompClient.send('/Igre/inq/lastCheck/'+chatId, {}, JSON.stringify(data));
}

function inqShow() {
	$('#modalBox').modal('show');
	$(".rtnMsg").attr("style", "color: #4e4ecf54").removeClass("rtnMsg");
}
$(document).on("click", ".close", function() {
	$("#modalBox").modal('hide');
});

