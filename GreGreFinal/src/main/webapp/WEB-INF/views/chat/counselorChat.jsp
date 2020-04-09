<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle}</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- 
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" /> --%>

<!-- WebSocket:sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>

<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<!-- 0408 채팅 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- 채팅 폼 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chat/chat.css" /> 
<style>
.img{
margin:0 auto;
 background-image: url('${pageContext.request.contextPath }/resources/upload/member/${info.advisImg }');
 width: 150px;
 height: 150px;
 border-radius: 50%;
  background-position: center;
  background-size: 150px auto;
  background-repeat: no-repeat;
}
.messages .message.left .avatar {
  float: left;
  background-image: url('${pageContext.request.contextPath }/resources/upload/member/${info.advisImg }');
	border-radius: 50%;
  background-position: center;
  background-size: 73px auto;
  background-repeat: no-repeat;
}

.messages .message.right .avatar {
  background-image: url('${pageContext.request.contextPath }/resources/images/chat/my.jpg');
	border-radius: 50%;
  background-position: center;
  background-size: 73px auto;
  background-repeat: no-repeat;
  float: right;
}

.top_menu .buttons .button.info {
  background-image: url("${pageContext.request.contextPath }/resources/images/chat/infoIcon.png");
 background-position: center;
  background-size: 40px auto;
  background-repeat: no-repeat;
}
.top_menu .buttons .button.close {
  background-image: url("${pageContext.request.contextPath }/resources/images/chat/close.png");
 background-position: center;
  background-size: 40px auto;
  background-repeat: no-repeat;
  float: left;
}
</style>

</head>
<body>
<div class="chat_window">
    <div class="top_menu">
        <div class="buttons">
            <div class="button close" onclick="location.href='${pageContext.request.contextPath }/chat/counsellingStart.do'"></div>
        	<div class="button info" data-toggle="modal" data-target="#myModal"></div>
        </div>
        <div class="title">아이그레 상담</div>
    </div>
    <ul class="messages">
    <c:forEach items="${chatList}" var="m">
    	<c:if test="${m.memberId ne counselorId}">
	    		<li class="message right appeared">
		        	<div class="avatar"></div>
			        <div class="text_wrapper">
			            <div class="text">${m.msg }</div>
			        </div>
			    </li>
    	</c:if>
    	<c:if test="${m.memberId eq counselorId}">
	    		<li class="message left appeared">
		        	<div class="avatar"></div>
			        <div class="text_wrapper">
			            <div class="text">${m.msg }</div>
			        </div>
			    </li>
    	</c:if>
		</c:forEach>  
    </ul>
    <div class="bottom_wrapper clearfix">
        <div class="message_input_wrapper"><input class="message_input" id="message" placeholder="메세지를 입력하세요" /></div>
        <div class="send_message">
            <div class="icon"></div>
            <div class="text" id="sendBtn">전송</div>
        </div>
    </div>
</div>
<div class="message_template">
    <li class="message">
        <div class="avatar"></div>
        <div class="text_wrapper">
            <div class="text"></div>
        </div>
    </li>
</div>

<!-- Modal -->
  <div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상담 정보</h4>
        </div>
        <div class="modal-body">
          <div class="row" style="text-align: center; margin: 0 auto;">
            <div class="col-lg-6">
            	  사용자 정보
              <hr>
              <table class="tabTable">
                <tbody>
                  <tr>
                    <td colspan="2"><br></td>
                  </tr>
                  <tr>
                    <td colspan="2"><br></td>
                  </tr>
                  <tr>
                    <td class="left">아이디:</td>
                    <td class="right">${info.memberId }</td>
                  </tr>

                  <tr>
                    <td class="left">상담시작 날짜: </td>
                    <td class="right">${info.startDay }</td>
                  </tr>
                  <tr>
                    <td class="left">상담 종료날짜: </td>
                    <td class="right">${info.endDay }</td>
                  </tr>
                  <tr>
                    <td class="right" colspan="2">
                      <span> - </span>
                    </td>
                  </tr>
                  <tr>
                    <td class="left">실시간 상담<br>잔여 횟수: </td>
                    <td class="right">${info.coin }</td>
                  </tr>
                  <tr>
                    <td colspan="2"><br></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="col-lg-6">
              상담사 정보
              <hr>
              <table class="tabTable">
                  <tbody>
                     <tr>
                      <td colspan="2"><div class="img"></div></td>
                    </tr>
                    <tr>
                      <td class="left">상담사 이름:</td>
                      <td class="right">${info.advisName }</td>
                    </tr>
  
                    <tr>
                      <td class="left">경력: </td>
                      <td class="right">${info.advisCareer }</td>
                    </tr>
                    <tr>
                      <td class="left">자격증: </td>
                      <td class="right">${info.advisLicense }</td>
                    </tr>
                    <tr>
                      <td class="left">등급: </td>
                      <td class="right">${info.advisGrade }</td>
                    </tr>
                    <tr>
                      <td class="left">분야: </td>
                      <td class="right">${info.advisKeyword }</td>
                    </tr>

                    <tr>
                      <td colspan="2"><br></td>
                    </tr>
                  </tbody>
                </table>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div>



<!-- 사용자 chat관련 script -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/chat/chat.js"></script> --%>

<script>
///////////////////////////// ONLOAD START///////////////////////////// 
$(function() {
	
	var result = '${checkToday}';
	if(result == 0){
		alert("이미 상담을 진행 하셨습니다");
		$('#sendBtn').attr('id', 'sendBtnn');
		$('.message_input').attr('value','상담을 진행 할 수 없습니다.').attr('readOnly', true);
		
	}
	
	//chat관련 구독신청 : /chat/chatId
	chatSubscribe();
	
	//메세지 전송 관련
	$("#sendBtn").click(function() {
		sendMessage();
	});
	
	$("#message").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			sendMessage();
		}
	});
	
	//채팅로그 최하단 보기
	scrollTop();
	
	$(window).on("focus", function() {
		lastCheck();
	});
	
});
///////////////////////////// ONLOAD END/////////////////////////////

///////////////////////////// FUNCTION START/////////////////////////////

/**
 * 지정한 url로 stomp 메세지 전송
 * @returns
 */
function sendMessage() {

	let data = {
		chatId : chatId,
		memberId : memberId,
		msg : $("#message").val(),
		time : Date.now(),
		type: "MESSAGE"
	}
	
	//전역변수 stompClient를 통해 메세지 전송 
	stompClient.send(`/Igre/chattt/counselor/${chatId}/${counselorId}`, {}, JSON.stringify(data));

	//message창 초기화
	$('#message').val('');
	//스크롤바 이동
	$('.messages').animate({ scrollTop: $('.messages').prop('scrollHeight') }, 300);
}

/**
 * 스크롤 처리
 */
function scrollTop(){
	//스크롤처리
	$('.messages').animate({ scrollTop: $('.messages').prop('scrollHeight') }, 300);
}
///////////////////////////// FUNCTION END/////////////////////////////

/**
 *
 * 윈도우가 활성화 되었을때, chatroom테이블의 lastcheck(number)컬럼을 갱신한다.
 * 안읽은 메세지 읽음 처리
 * 
 */
function lastCheck() {
	
	let data = {
		chatId : chatId,
		memberId : counselorId,
		time : Date.now(),
		type: "LASTCHECK"
	}
	
	//전역변수 stompClient를 통해 lastCheck 메세지 전송
	stompClient.send('/Igre/lastCheck/counselor/'+counselorId, {}, JSON.stringify(data));
}

const memberId = '${memberId}';
const chatId = '${chatId}';
const counselorId = '${counselorId}';

//웹소켓 선언 및 연결
//1.최초 웹소켓 생성 url: /stomp
let socket = new SockJS('<c:url value="/stomp"/>');
let stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame) {
	console.log('connected stomp over sockjs');
	//사용자 확인
	lastCheck(chatId, memberId);
	
});

/**
 * 각 페이지에서 작성하면, chat.js의 onload함수에서 호출함.
* chat페이지에서 추가적으로 subscripe 한다.
* 웹소켓 connection이 맺어지기 전 요청을 방지하기 위해 stompClient.connected를 체크한다.
* conntionDone 으로 구독요청 완료를 체크해서 1초마다 반복적으로 구독요청한다.
*/
function chatSubscribe(){
	//페이지별로 구독신청 처리
	let conntionDone = false;
	let intervalId = setInterval(()=>{
		if(conntionDone == true)
			clearInterval(intervalId);
		
		if(conntionDone==false && stompClient.connected){
			
			//stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상응한다.
			stompClient.subscribe('/chat/counselor/'+chatId, function(message) {
				//보낸 내용
				let messsageBody = JSON.parse(message.body);
				
				console.log("receive from subscribe /chat/counselor/"+chatId+":", message);
				start();
				 function start(){					
					//구독에 내용이 올 경우!
					var $message;
				    $message = $($('.message_template').clone().html());
				    //_this.message_side -> left, right
				    console.log(memberId);
				    console.log(messsageBody.memberId);
				    
				    if(memberId == messsageBody.memberId){
				    	$message.addClass('right').find('.text').html(messsageBody.msg);				    	
				    }else{
				    	$message.addClass('left').find('.text').html(messsageBody.msg);
				    }
				    $('.messages').append($message);
				    return setTimeout(function () {
				        return $message.addClass('appeared');
				    }, 0);
				};
				
				scrollTop();
			});
			conntionDone = true;
		}	
	},1000);
}
</script>


</body>
</html>