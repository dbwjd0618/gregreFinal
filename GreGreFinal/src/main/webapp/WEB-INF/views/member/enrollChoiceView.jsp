<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
	</jsp:include>

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
                               <h4 class="card-title text-center mb-4 mt-1">개인회원</h4>
                               <p class="mb-5">개인 회원 가입을 원하시면 선택해주세요</p>                      
                                <div class="form-group">
                                    <button type="button"  onclick="location.href = '${pageContext.request.contextPath}/member/memberEnroll.do'" class="btn btn-primary btn-block enroll-btn">
                                        가입하기
                                    </button>
                                </div>

                           </article>
                       </div>
                    </div>
                    <!-- 개인회원 끝 -->
                    <!-- 기업회원 시작 -->
                    <div class="col-md-6">
                        <div class="card-body mx-auto" id='login-container' style="max-width: 800px;">   
                            <article class="card-body text-center">
                                <h4 class="card-title text-center mb-4 mt-1">기업 회원</h4>
                                <p class="mb-5">기업 회원 가입을 원하시면 선택해주세요</p>                      
                                <div class="form-group">
                                    <button type="button"  onclick="location.href = '${pageContext.request.contextPath}/member/enrollChoiceView2.do'" class="btn btn-primary btn-block enroll-btn">
                                    가입하기
                                    </button>
                                </div>
                            </article>
                        </div>                                 
                    </div>
                    <!-- 기업회원 끝 -->
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

<jsp:include page="/WEB-INF/views/common/footer.jsp" />