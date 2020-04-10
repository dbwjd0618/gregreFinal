<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<!-- WebSocket:sock.js CDN -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<!-- adminchat.css -->
<link href="${pageContext.request.contextPath}/resources/css/admin/adminchat.css" rel="stylesheet" type="text/css" />
<!-- adminchat.js  -->
<script src="${pageContext.request.contextPath}/resources/js/admin/adminchat.js"></script>



<div class="content-wrapper">
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		1:1 채팅
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">1:1채팅</a></li>
		<li class="active">채팅하기</li>
	</ol>
</section>

<!------ Include the above in your HEAD tag ---------->
	<div class="chat_window">
	    <div class="top_menu">
	        <div class="buttons">
	            <div class="button close"></div>
	            <div class="button minimize"></div>
	            <div class="button maximize"></div>
	        </div>
	        <div class="title">Chat</div>
	    </div>
	    <ul class="messages"></ul>
	    <div class="bottom_wrapper clearfix">
	        <div class="message_input_wrapper"><input class="message_input" placeholder="Type your message here..." />
	        </div>
	        <div class="send_message">
	            <div class="icon"></div>
	            <div class="text">Send</div>
	        </div>
	    </div>
	</div>
	
	<div class="message_template">
		<ul>
		    <li class="message">
		        <div class="avatar"></div>
		        <div class="text_wrapper">
		            <div class="text"></div>
		        </div>
		    </li>
		</ul>
	</div>
</div>

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp" %>