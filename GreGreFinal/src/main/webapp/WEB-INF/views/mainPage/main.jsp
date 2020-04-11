<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!-- WebSocket:sock.js CDN -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
​
<link href="${pageContext.request.contextPath}/resources/css/index/inqChat.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/index/inqChat.js"></script>
​
<style>
#inqToAdmin{
	position : fixed;
	bottom : 30px;
	right : 30px;
	color: #4e4ecf54;
	font-size: 60px;
}
#inqToAdmin:hover {color: #4e4ecf; cursor: pointer;}
body {padding-right: 0px !important;}
</style>
<c:if test="${not empty memberLoggedIn}">
<script>
const memberId = '${memberId}';
const chatId = '${chatId}';

let socket = new SockJS('<c:url value="/stomp"/>');
let stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame) {
	console.log('connected stomp over sockjs');
	
// 	lastCheck(chatId);
});

function chatSubscribe(){
	//페이지별로 구독신청 처리
	let conntionDone = false;
	let intervalId = setInterval(function() {
		if(conntionDone == true)
			clearInterval(intervalId);
		
		if(conntionDone==false && stompClient.connected){
			
			//stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상응한다.
			stompClient.subscribe('/inq/chat/'+chatId, function(message) {
				console.log("receive from subscribe /inq/chat/"+chatId +":", message);
				let messsageBody = JSON.parse(message.body);
				$(".messages").append("<li class='message right appeared'><div class='avatar'></div><div class='text_wrapper'><div class='text'>"+messsageBody.msg+"</div></div></li>");
				scrollTop();
			});
			conntionDone = true;
		}	
	},1000);
}
</script>
</c:if>

    <div class="ftco-blocks-cover-1">

      <div class="site-section-cover overlay">
        <div class="container">
          <div class="row main-visual">
            <div class="col-md-7 mt-5 " style=" padding: 0 !important;">
              <div class="testimonial-3-wrap">


                <div class="owl-carousel nonloop-block-13">
                  <div class="testimonial-3 d-flex">
                    <div class="text">
                      <h3>광고1</h3>
                      <p class="position">Partner</p>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum libero rem maxime
                        magnam. Similique esse ab earum, autem consectetur.</p>
                    </div>
                  </div>

                  <div class="testimonial-3 d-flex">
                    <div class="text">
                      <h3>광고2</h3>
                      <p class="position">Partner</p>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum libero rem maxime
                        magnam. Similique esse ab earum, autem consectetur.</p>
                    </div>
                  </div>

                  <div class="testimonial-3 d-flex">
                    <div class="text">
                      <h3>광고3</h3>
                      <p class="position">Partner</p>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum libero rem maxime
                        magnam. Similique esse ab earum, autem consectetur.</p>
                    </div>
                  </div>
                </div>

              </div>
            </div>
            <div class="col-md-5 top-links" style="padding:0 !important">
              <ul>
                <li class="link1">
                  <a href="${pageContext.request.contextPath }/pregnancy/prePregnancy.do">
                    <img src="${pageContext.request.contextPath}/resources/images/index/pregnant-icon.png" alt="">
                    <br>
                    임신
                  </a>
                </li>
                <li class="link2">
                  <a href="${pageContext.request.contextPath }/child/childInfo.do">
                    <img src="${pageContext.request.contextPath}/resources/images/index/child-icon.png" alt="">
                    <br>
                    육아
                  </a>
                </li>
                <li class="link3">
                  <a href="${pageContext.request.contextPath }/find/pharmacy.do">
                    <img src="${pageContext.request.contextPath}/resources/images/index/reserve_hospital-icon.png" alt="">
                    <br>
                    마스크구매
                  </a>
                </li>
                <li class="link4">
                  <a href="${pageContext.request.contextPath }/counselling/counselorFind.do">
                    <img src="${pageContext.request.contextPath}/resources/images/index/counseling-icon.png" alt="">
                    <br>
                    온라인상담
                  </a>
                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>

    </div>
 
  <!-- index contents begin --> 
  <div class="site-section site-section-pd" >
    <div class="container">
      <div class="row">
        <div class="main-row2">
          <div class="notice-list">
            <h2>공지사항</h2>
            <a href="" ><img src="${pageContext.request.contextPath}/resources/images/index/more.png" class="more" alt=""></a>
            <ul>

              <li>
                <a href="/site/educare/ex/bbs/View.do?cbIdx=263&amp;bcIdx=110157">
                  영유아 부모를 위한 자녀와 함께 즐기..
                </a>
              </li>
              <li>
                <a href="/site/educare/ex/bbs/View.do?cbIdx=263&amp;bcIdx=110123">
                  관악구 대체조리원 최종합격자 명단
                </a>
              </li>

              <li>
                <a href="/site/educare/ex/bbs/View.do?cbIdx=263&amp;bcIdx=110079">
                  대체조리원 1차 합격자 명단입니다.
                </a>
              </li>

              <li>
                <a href="/site/educare/ex/bbs/View.do?cbIdx=263&amp;bcIdx=110078">
                  서울관악구 대체교사 모집합니다
                </a>
              </li>
              <li>
                <a href="/site/educare/ex/bbs/View.do?cbIdx=263&amp;bcIdx=109871">
                  「관악구육아종합지원센터」 2020년 ..
                </a>
              </li>

            </ul>
          </div>

          <form name="calForm" id="calForm" action="/site/educare/main.do" method="post">
            <input type="hidden" name="year" value="2020">
            <input type="hidden" name="month" value="3">
            <input type="hidden" name="day">



            <div class="calendar-list">
              <h2>교육/행사</h2>
              <div class="calendar-wrap">
 
              </div>
            </div>


          </form>

          <div class="photo-list">
            <h2>시기별 맞춤정보</h2>
            <a href="" ><img src="${pageContext.request.contextPath}/resources/images/index/more.png" class="more" alt=""></a>
            <div class="photo-visual">
            </div>
          </div>
        </div>
      </div>
      <!--main-row2 끝-->
      <div class="row">
        <div class="main-row3">
          <div class="toy-link">
            <h2>아이지킴이 바로가기</h2>
            
          </div>
          <div class="quick-service">
            <h2>찾아보기</h2>
            <ul>
              <li class="link1">
                <a href="" >
                <img src="${pageContext.request.contextPath}/resources/images/index/welfare_icon.png"   alt="">
                <br>
                복지센터</a>
              </li>
              <li class="link2">
                <a href="" >
                  <img src="${pageContext.request.contextPath}/resources/images/index/daycare_icon.png"   alt="">
                  <br>
                  어린이집
                </a>
              </li>
              <li class="link3">
                <a href="" >
                  <img src="${pageContext.request.contextPath}/resources/images/index/pharmacy_icon.png"   alt="">
                  <br>
                  약국
                </a>
              </li>
                <li class="link4">
                  <a href="http://cafe.daum.net/gwanak-dreampartner/" >
                    <img src="${pageContext.request.contextPath}/resources/images/index/schoolzone_icon.png"   alt="">
                    <br>
                    어린이보호구역
                  </a>
                  </li>
              
            </ul>
          </div>
        </div>

      </div>
    </div>
  </div>
  <!--index contents end -->
  
  <c:if test="${not empty memberLoggedIn}">
  <i id="inqToAdmin" class="far fa-comments ${chatList != null ? 'rtnMsg' : ''}" title="관리자에게 문의하기" onclick="inqShow();"></i>
  <input type="hidden" id="loginId" value="${memberLoggedIn.memberId}" />
  </c:if>
  
   <!-- 추천상품 Section Begin -->
   <div class="">
    <section class="women-banner spad" >
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg">
                        <h2>아이그레몰<br> 추천상품</h2>
                        <p>더 다양한 상품도 둘러보세요!</p>
                        <a href="#">아이그레몰 바로가기</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="product-slider owl-carousel">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${pageContext.request.contextPath}/resources/img/products/women-1.jpg" alt="">
                                <div class="sale">Sale</div>
                                <div class="icon">
                                    <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                                </div>
                                <ul>
                                    <li class="w-icon active">
                                    	<a href="#">
                                    		<svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="50" height="50" viewBox="0 0 172 172" style="fill:#000000;">
                                    			<g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal">
                                    				<path d="M0,172v-172h172v172z" fill="none"/>
                                    				<g fill="#ffffff">
                                    					<path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"/>
                                    				</g>
                                    			</g>
                                    		</svg>
                                    	</a>
                                    </li>
                                    <li class="quick-view"><a href="#">자세히보기</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Coat</div>
                                <h5><a href="#">Pure Pineapple</a></h5>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${pageContext.request.contextPath}/resources/img/products/women-2.jpg" alt="">
                                <div class="icon">
                                    <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                      width="50" height="50"
                                      viewBox="0 0 172 172"
                                      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
                                    <li class="quick-view"><a href="#">자세히보기</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Shoes</div>
                                <a href="#">
                                    <h5>Guangzhou sweater</h5>
                                </a>
          
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${pageContext.request.contextPath}/resources/img/products/women-3.jpg" alt="">
                                <div class="icon">
                                    <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                      width="50" height="50"
                                      viewBox="0 0 172 172"
                                      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
                                    <li class="quick-view"><a href="#">자세히보기</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Towel</div>
                                <a href="#">
                                    <h5>Pure Pineapple</h5>
                                </a>
                          
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${pageContext.request.contextPath}/resources/img/products/women-4.jpg" alt="">
                                <div class="icon">
                                    <img src="https://img.icons8.com/ios/50/000000/hearts.png" style="width:25px;">
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><svg style="width:18px; height:16px; margin-bottom:3px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                      width="50" height="50"
                                      viewBox="0 0 172 172"
                                      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,3.44c-19.04094,0 -34.4,15.35906 -34.4,34.4v6.88h-27.1975l-0.3225,3.01l-13.76,120.4l-0.43,3.87h152.22l-0.43,-3.87l-13.76,-120.4l-0.3225,-3.01h-27.1975v-6.88c0,-19.04094 -15.35906,-34.4 -34.4,-34.4zM86,10.32c15.35906,0 27.52,12.16094 27.52,27.52v6.88h-55.04v-6.88c0,-15.35906 12.16094,-27.52 27.52,-27.52zM30.6375,51.6h20.9625v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h55.04v7.8475c-2.05594,1.19594 -3.44,3.37281 -3.44,5.9125c0,3.80281 3.07719,6.88 6.88,6.88c3.80281,0 6.88,-3.07719 6.88,-6.88c0,-2.53969 -1.38406,-4.71656 -3.44,-5.9125v-7.8475h20.9625l13.0075,113.52h-136.74z"></path></g></g></svg></a></li>
                                    <li class="quick-view"><a href="#">자세히보기</a></li> 
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Towel</div>
                                <a href="#">
                                    <h5>Converse Shoes</h5>
                                </a>
                          
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  </div>
    <!--추천상품 Section End -->

<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 170px;">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="border:unset;">
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
			    	<li class="message appeared ${msg.memberId == memberId ? 'right' : 'left'}">
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
  
  

    

   