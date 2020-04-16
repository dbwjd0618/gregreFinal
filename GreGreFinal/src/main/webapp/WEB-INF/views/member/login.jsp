<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<c:if test="${not empty memberLoggedIn }">
<script>
	$(function() {
		location.href='${pageContext.request.contextPath}';
	});
</script>
</c:if>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css"> 
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center login-text">
				<p>가입하신 아이디와 비밀번호를 입력하세요</p>
				<p>아직 아이그레 회원이 아니신가요? 회원가입 후 다양한 서비스를 이용해보세요!</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- 로그인 시작 -->
				<div class="card-body mx-auto 1" id='login-container' style="max-width: 800px;">


					<label class="switch"> <input type="checkbox" name="biztoggle"> <span
						class="slider round"></span>
					</label>
					<p class="biztoggle">기업회원 로그인</p>
					<p class="biztoggle" style="display: none;">일반회원 로그인</p>

					<article class="card-body" id="loginen">
						<h3 class="card-title text-center mb-5 mt-1">로그인</h3>
						<form action="${pageContext.request.contextPath}/member/login.do" method="POST">
							<div class="row">
								<div class="col-lg-9">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa fa-user"></i>
												</span>
											</div>
											<input type="text" name="memberId" class="form-control" placeholder="아이디를 입력해주세요."/>
										</div>
									</div>
									<!-- form-group// -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa fa-lock"></i>
												</span>
											</div>
											<input type="password" name="memberPwd" class="form-control" placeholder="비밀번호를 입력해주세요."/>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<button type="submit" class="btn btn-primary btn-block">로그인</button>
									</div>
								</div>
							</div>
							<!-- form-group// -->
							<p class="text-center">
								<a href="${pageContext.request.contextPath}/member/passwordChoiceView.do" class="btn">아이디·비밀번호찾기</a>
								<a href="${pageContext.request.contextPath}/member/enrollChoiceView.do" class="btn">회원가입</a>
								

							</p>
						</form>

					</article>
				</div>
				<!-- 로그인 끝 -->
				
				<div class="card-body mx-auto 1" id='login-container2' style="max-width: 800px;">
					<article class="card-body" id="loginbz" style="display:none;">					

						<h3 class="card-title text-center mb-5 mt-1">기업회원 로그인</h3>
						<form action="${pageContext.request.contextPath}/member/bizlogin.do" method="POST">
							<div class="row">
								<div class="col-lg-9">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa fa-user"></i>
												</span>
											</div>
											<input type="text" name="cmemberId" class="form-control" placeholder="아이디를 입력해주세요."/>
										</div>
									</div>
									<!-- form-group// -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa fa-lock"></i>
												</span>
											</div>
											<input type="password" name="memberPwd" class="form-control" placeholder="비밀번호를 입력해주세요."/>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<button type="submit" class="btn btn-primary btn-block">로그인</button>
									</div>
								</div>
							</div>
							<!-- form-group// -->
							<p class="text-center">
								<a href="${pageContext.request.contextPath}/member/passwordChoiceView.do" class="btn">아이디·비밀번호찾기</a>
								<a href="${pageContext.request.contextPath}/member/enrollChoiceView.do" class="btn">회원가입</a>
								

							</p>
						</form>

					</article>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!-- contents end-->
<script>

 
 $("input[name='biztoggle']").click(function () {
	 if(this.checked) {
		 $("#loginen").hide();
		 $("#loginbz").show();
	 }
	 else {
		 $("#loginen").show();
		 $("#loginbz").hide();
		 
	 }
});

var check = $("input[type='checkbox']");
check.click(function(){
	$(".biztoggle").toggle();
});



</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />