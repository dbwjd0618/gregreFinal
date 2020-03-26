<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <title>Kiddy &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower" rel="stylesheet">


  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <!-- MAIN CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

  <!-- Index CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">

<!--login css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css"> 
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
  <style>
.enroll-btn{
    padding: 12px 0 !important;
}
</style>


<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

        <header class="site-navbar site-navbar-target" role="banner">
            <div class="container mb-3">
                <div class="row" >
                    <div class="col-md-12" style="padding:0 70px;">
                        <div class="d-flex">
                          <div class="site-logo mr-auto">
                            <a href="/imdex.html">
                              <img  class="main-logo" src="${pageContext.request.contextPath}/resources/images/logo/igre_main_logo2.png" alt="">
                            </a>
                          </div>
                          <div class="site-quick-contact d-none d-lg-flex ml-auto ">
                                <div class="d-flex site-info site-quick">
                                        <div class="site-quick-text">
                                          <!--home -->
                                          <a href="../index.html">
                                            <span style="color: black !important;">HOME</span>
                                          </a>
                                        </div>
                                </div>
                            <div class="d-flex site-info site-quick">
                              <div class="site-quick-text">
                                <!--로그인 -->
                                <a href="../login/login.html">
                                  <span style="color: black !important;">로그인</span>
                                </a>
                              </div>
                            </div>
                
                          </div>
                        </div>

                    </div>
                </div>
            </div>
        </header>

 <!-- contents begin-->
 <div class="site-section">
        <div class="container">
          <div class="row">
            <div class="col">
                  <div class="card-body mx-auto" style="max-width:800px;">
                      <article class="card-body">
                          <h4 class="card-title text-center mb-4 mt-1">개인회원 가입</h4>
                          <form name="memberEnrollFrm" action="memberEnroll.do" method="post" onsubmit="return enrollValidate();">
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">아이디</span>
                                  </div>
								<input name="memberId" class="form-control" id="memberId"
                                      placeholder="4글자 이상" type="text" required> &nbsp;
                              </div>
                                <span class="guide ok">이 아이디는 사용 가능합니다</span>
								<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
								
								<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/> 
                              

                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">패스워드 </span>
                                  </div>
                                  <input name="memberPwd" class="form-control" id="memberPwd"
                                      placeholder="" type="password" required>
                              </div>
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">패스확인</span>
                                  </div>
                                  <input name="memberPwd2"class="form-control" placeholder="" id="memberPwd2"
                                      type="password" required>
                              </div>
  
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 이름</span>
                                  </div>
                                  <input name="memberName" class="form-control" id="memberName"
                                      type="text">
                              </div>
  
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 닉네임</span>
                                  </div>
                                  <input name="nickname" class="form-control" id="nickname"
                                      type="text">
                              </div>
  
  
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">생년월일 </span>
                                  </div>
                                  <input name="birthday" class="form-control" id="birthday"
                                      placeholder="생년월일" type="date">
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
                                      <span class="input-group-text">비밀번호 찾기 힌트</span>
                                  </div>
                                  <select name="pwdHintCode" id="pwdHintCode" class="custom-select">
                                      <option disabled selected value>목록</option>
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
                              
                              <input type="hidden" id="grade" name="grade"/>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> 주소</span>
									</div>
									<input class="form-control"
										style="width: 40%; display: inline;" placeholder="우편번호"
										name="addr1" id="addr1" type="text" readonly="readonly">
									<button type="button" class="btn btn-default"
										onclick="execPostCode();">
										<i class="fa fa-search"></i> 우편번호 찾기
									</button>

								</div>
								<div class="form-group">
									<input class="form-control" style="top: 5px;"
										placeholder="도로명 주소" name="addr2" id="addr2" type="text"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="상세주소" name="addr3"
										id="addr3" type="text" />
								</div>



								<div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">이메일 </span>
                                  </div>
                                  <input name="email" class="form-control" id="email"
                                      placeholder="abc@xyz.com" type="email">
                              </div>
  
                              <!-- 							notnull이라 가입할때 기본값으로 -->
                              <input type="hidden" value="1" />
  
  
  
  
                              <div class="form-group input-group">
                                  <div class="input-group-prepend" id="gender">
                                      <span class="input-group-text"> 성별 </span>&nbsp;&nbsp;&nbsp;
  
                                      <div id="gender1">
                                          <input type="radio" name="gender" id="gender0" value="M"checked> 
                                          <label for="gender0"> 남자</label> 
                                          
                                          <input type="radio" name="gender" id="gender1" value="F"> 
                                          <label for="gender1">여자</label>
                                      </div>
                                  </div>
                              </div>
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">회원 나이 </span>
                                  </div>
                                  <input name="age" class="form-control" id="age" type="number">
                              </div>
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">배우자 아이디 </span>
                                  </div>
                                  <input name="mateId" class="form-control" id="mateId" type="text">
                              </div>
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">자녀여부 </span>
                                  </div>
                                  <input name="childNumber" class="form-control" id="childNumber" type="number" placeholder="자녀수(숫자)">
                              </div>  
                              
                              <input type="hidden" name="enroll_date" id="enroll_date" />                            
  
  
                              <div class="form-group">
                                  <button class="btn btn-primary btn-block enroll-btn">가입완료</button>
                              </div>
                          </form>
                      </article>
                  </div>
              </div>
        </div>
      </div>
      </div>
     <!-- contents end-->


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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/member/member.js"></script>
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

