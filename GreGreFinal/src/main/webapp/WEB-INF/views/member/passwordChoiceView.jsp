<%@page import="kh.mclass.Igre.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
  
  <%@ include file="/WEB-INF/views/common/header.jsp"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<!--login css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css"> 
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<style>
.enroll-btn{
    padding: 12px 0 !important;
}
</style>
<c:if test="${not empty memberLoggedIn }">
<script>
	$(function() {
		location.href='${pageContext.request.contextPath}';
	});
</script>
</c:if>
    
           <!-- contents begin-->
           <div class="site-section">
             <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-5 text-center">
                    <h3>회원가입</h3>
                    </div>
                </div>
               <div class="row">
                   <!-- 개인회원 시작 -->
                 <div class="col-md-6">
                       <div class="card-body mx-auto" id='login-container' style="max-width: 800px;">   
                        <article class="card-body text-center">
                               <h4 class="card-title text-center mb-4 mt-1">아이디 찾기</h4>
                               <p class="mb-5">아이디 찾기를 원하시면 선택해주세요</p>                      
                                <div class="form-group">
                                    <input  type="button" data-toggle="modal" data-target="#findId" class="btn btn-primary btn-block" value="아이디찾기">
                                </div>

                           </article>
                       </div>
                    </div>
                    <!-- 개인회원 끝 -->
                    <!-- 기업회원 시작 -->
                    <div class="col-md-6">
                        <div class="card-body mx-auto" id='login-container' style="max-width: 800px;">   
                            <article class="card-body text-center">
                                <h4 class="card-title text-center mb-4 mt-1">비밀번호 찾기</h4>
                                <p class="mb-5">비밀번호 찾기를 원하시면 선택해주세요</p>                      
                                <div class="form-group">
                                    <input  type="button" data-toggle="modal" data-target="#findPassword" class="btn btn-primary btn-block" value="비밀번호 찾기" >
                                </div>
                            </article>
                        </div>                                 
                    </div>
                    <!-- 기업회원 끝 -->
             </div>
           </div>
          </div>
          
          <div class="modal fade" id="findId" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="findId">아이디 찾기</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="${pageContext.request.contextPath}/myPage/findId.do" method="post">
                    		<br /><br /><br /><h3>아이디 찾기</h3>
                    <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 이름</span>
                                  </div>
                                  <input name="memberName" class="form-control" id="memberName"
                                      type="text">
                              </div>
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">연락처 </span>
                                  </div>
                                  <input name="phone" class="form-control" id="phone"
                                      placeholder="(-없이)01012345678" type="text">
                              </div>
				
				<div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">아이디/비밀번호 찾기 힌트</span>
                                  </div>
                                  <select name="pwdHintCode" id="pwdHintCode" class="custom-select">
                                      <option disabled selected value="">목록</option>
                                      <option disabled>----------</option>
                                      <option value="H1">당신의 첫 사랑 이름은?</option>
                                      <option value="H2">당신이 좋아하는 색은?</option>
                                      <option value="H3">첫번째 선생님의 성함은?</option>
                                      <option value="H4">당신의 부모님 결혼기념일은?</option>
                                      <option value="H5">당신이 좋아하는 음식은?</option>
                                      <option value="H6">당신에게 가장 소중한 물건은?</option>
                                      <option value="H7">당신이 가장 인상깊게 본 영화는?</option>
                                      <option value="H8">당신의 기억 속에 남는 도시는?</option>
                                      <option value="H9">당신이 졸업한 초등학교 이름은?</option>
                                  </select>
                              </div>
				
                              
                               <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 힌트 정답</span>
                                  </div>
                                  <input name="pwdAns" class="form-control" id="pwdAns" type="text">
                              </div>
                              <input type="hidden" id="memberPwd" name="memberPwd" value="0000" />

                              
                    
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">확인</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
                </form>
            </div>
          </div>
        </div>
      </div>
          
          
          
          <div class="modal fade" id="findPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="findPassword">비밀번호 변경</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="${pageContext.request.contextPath}/myPage/findPassword.do" method="post">
                    		<br /><br /><br /><h3>비밀번호 찾기</h3>
                    		<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">아이디</span>
					</div>
					<input type="text" name="memberId" id="memberId_" class="form-control">
				</div>
				
				<div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">아이디/비밀번호 찾기 힌트</span>
                                  </div>
                                  <select name="pwdHintCode" id="pwdHintCode" class="custom-select">
                                      <option disabled selected value="">목록</option>
                                      <option disabled>----------</option>
                                      <option value="H1">당신의 첫 사랑 이름은?</option>
                                      <option value="H2">당신이 좋아하는 색은?</option>
                                      <option value="H3">첫번째 선생님의 성함은?</option>
                                      <option value="H4">당신의 부모님 결혼기념일은?</option>
                                      <option value="H5">당신이 좋아하는 음식은?</option>
                                      <option value="H6">당신에게 가장 소중한 물건은?</option>
                                      <option value="H7">당신이 가장 인상깊게 본 영화는?</option>
                                      <option value="H8">당신의 기억 속에 남는 도시는?</option>
                                      <option value="H9">당신이 졸업한 초등학교 이름은?</option>
                                  </select>
                              </div>
                              
                               <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 힌트 정답</span>
                                  </div>
                                  <input name="pwdAns" class="form-control" id="pwdAns" type="text">
                              </div>
                              <input type="password" id="memberPwd" name="memberPwd" value="0000" style="display:none;"/>
                              
                              
                              
                    
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">확인</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
                </form>
            </div>
          </div>
        </div>
      </div>
          
          
          
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>

  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>




    <!-- Js Plugins -->

    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.slicknav.js"></script>
    <!-- <script src="js/shop/owl.carousel.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/shop/main.js"></script>

</body>

</html>