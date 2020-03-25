<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
</head>

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
                                <a href="login/login.html">
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
                    <div class="col-md-12 text-center login-text">
                    <p>가입하신 아이디와 비밀번호를 입력하세요</p>
                    <p>아직 아이그레 회원이 아니신가요? 회원가입 후 다양한 서비스를 이용해보세요</p>
                    </div>
                </div>
               <div class="row">
                 <div class="col-md-12">
                   <!-- 로그인 시작 -->
                       <div class="card-body mx-auto" id='login-container' style="max-width: 800px;">   
                        <article class="card-body">
                               <h3 class="card-title text-center mb-5 mt-1">로그인</h3>
                               <form>
                                   <div class="row">
                                        <div class="col-lg-9">

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"> <i class="fa fa-user"></i>
                                                        </span>
                                                    </div>
                                                    <input name="" class="form-control" placeholder="아이디를 입력해주세요." type="email">
                                                </div>
                                                <!-- input-group.// -->
                                            </div>
                                            <!-- form-group// -->
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"> <i class="fa fa-lock"></i>
                                                        </span>
                                                    </div>
                                                    <input class="form-control" placeholder="비밀번호를 입력해주세요."
                                                        type="password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary btn-block">
                                                    로그인</button>
                                            </div>

                                        </div>
                                   </div>
                                   <!-- form-group// -->
                                   <p class="text-center">
                                       <a href="${pageContext.request.contextPath}/login/passwordChoiceView.do" class="btn">아이디·비밀번호찾기</a>
                                       <a href="${pageContext.request.contextPath}/login/enrollChoiceView.do" class="btn">회원가입</a>
                                   </p>                      
                               </form>
                           
                           </article>
                       </div>
                       <!-- 로그인 끝 -->
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