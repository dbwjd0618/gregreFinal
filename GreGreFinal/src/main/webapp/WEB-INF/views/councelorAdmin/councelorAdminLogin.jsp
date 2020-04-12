<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
	<!-- Bootstrap 3.3.2 -->
	<link href="${pageContext.request.contextPath}/resources/css/councelorAdmin/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/css/councelorAdmin/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/resources/css/councelorAdmin/blue.css" rel="stylesheet" type="text/css" />
    
    <!-- jQuery 3.3.1  -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    
<c:if test="${not empty msg }">
<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>
<% session.removeAttribute("msg"); %>

</head>

<body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="${pageContext.request.contextPath}/councelorAdmin/login.do"><b>상담사 관리자&nbsp;</b>로그인</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg"><b>관리자</b>님 안녕하세요!</p>
        <p class="login-box-msg">로그인을 해주세요.</p>
        <form action="${pageContext.request.contextPath}/councelorAdmin/login.do" method="post">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" name="adminId" placeholder="아이디"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" name="adminPwd" placeholder="비밀번호"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">    
              <div class="checkbox icheck">
               &nbsp; &nbsp; &nbsp; &nbsp;
                <label>
                  <input type="checkbox"> 아이디 저장
                </label>
              </div>                        
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
            </div><!-- /.col -->
          </div>
        </form>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/icheck.min.js" type="text/javascript"></script>
    
  </body>


</html>