<%@page import="kh.mclass.Igre.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
  
  <%@ include file="/WEB-INF/views/common/header.jsp"%>
  
   <!-- 마이페이지 서브메뉴 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css">
    <!--서브메뉴 js-->
    <script src="${pageContext.request.contextPath}/resources/js/subMenu/subMenu.js"></script>


   
   
   <script>
   var result = '${m.address}';
   var addArr = result.split('+');
   console.log(addArr);
   
   function updatePassword() {
		$("#updatePassword").modal();
	}
   
   </script>
 <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" >
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
              <h1 class="mb-3 font-weight-bold text-teal">마이페이지</h1>

              <p><a href="${pageContext.request.contextPath}/" class="text-white">Home</a> <span class="mx-3">/</span> <strong>MyPage</strong></p>

            </div> 
          </div>
        </div>
      </div>
    </div>

<!-- contents begin-->
<style>
</style>

<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar" src="${pageContext.request.contextPath}/resources/images/myPage/user.png" />
							<div class="profile__name">${m.memberId }</div>
						</div>
					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/memberUpdate.do"> 
								<div class="menu__title">개인정보</div>
							</a>
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/memberChildUpdate.do"> 
								<div class="menu__title">자녀정보</div>
							</a>   
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/myPeriodCalculatorView.do">
								<div class="menu__title">월경캘린더</div>
							</a> 
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/counsellingInfo.do">
								<div class="menu__title">상담정보/리뷰</div>
							</a> 
							<a class="menu__item" href="#">
								<div class="menu__title">회원탈퇴</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			

			<div class="col-md-9">

						<div class="row mb-4">
                            <div class="col-md-12">
                                <h4 style="text-align: center;"><strong>개인정보 수정</strong></h4>
                            </div>
                        </div>

				<div class="card bg-light">
		<article class="card-body mx-auto" style="max-width: 635px;">
	<form class="card-body mx-auto" action="${pageContext.request.contextPath}/myPage/updateMember.do" id="memberFrm" method="post">


				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">아이디</span>
					</div>
					<input type="text" name="memberId" id="memberId_" class="form-control" value="${m.memberId }" readonly>
				</div>

				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">이름</span>
					</div>
					<input type="text"  name="memberName" id="memberName" class="form-control" value="${m.memberName }"  readonly><br>
				</div>
				
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">닉네임</span>
					</div>
					<input type="text"  name="nickname" id="nickname" class="form-control" value="${m.nickname }" ><br>
				</div>				
				
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">생년월일</span>
					</div>
					<input type="date" name="birthDay" id="birthDay" value="${m.birthday }" class="form-control" readonly>
				</div>				


							<div class="form-group input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">연락처 </span>
								</div>
								<input name="phone" class="form-control" id="phone"
									value="${m.phone }" type="text">
							</div>

							<div class="form-group input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">비밀번호 찾기 힌트</span>
								</div>
								
								   <select name="pwdHintCode" id="pwdHintCode" class="custom-select">
                                      <%-- <option disabled selected value="">${m.pwdHintCode }</option> --%> 
                                      <option disabled>----------</option>
                                      <option value="H1"${m.pwdHintCode eq 'H1'? 'selected':''}>당신의 첫 사랑 이름은?</option>
                                      <option value="H2"${m.pwdHintCode eq 'H2'? 'selected':''}>당신이 좋아하는 색은?</option>
                                      <option value="H3"${m.pwdHintCode eq 'H3'? 'selected':''}>첫번째 선생님의 성함은?</option>
                                      <option value="H4"${m.pwdHintCode eq 'H4'? 'selected':''}>당신의 부모님 결혼기념일은?</option>
                                      <option value="H5"${m.pwdHintCode eq 'H5'? 'selected':''}>당신이 좋아하는 음식은?</option>
                                      <option value="H6"${m.pwdHintCode eq 'H6'? 'selected':''}>당신에게 가장 소중한 물건은?</option>
                                      <option value="H7"${m.pwdHintCode eq 'H7'? 'selected':''}>당신이 가장 인상깊게 본 영화는?</option>
                                      <option value="H8"${m.pwdHintCode eq 'H8'? 'selected':''}>당신의 기억 속에 남는 도시는?</option>
                                      <option value="H9"${m.pwdHintCode eq 'H9'? 'selected':''}>당신이 졸업한 초등학교 이름은?</option>
                                  </select>

							</div>

							<div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 힌트 정답</span>
                                  </div>
                                  <input name="pwdAns" class="form-control" id="pwdAns" type="text" value="${m.pwdAns }">
                              </div>
                              
                              

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

								<input type="hidden" id="address" name="address"/>


								<div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">이메일 </span>
                                  </div>
                                  <input name="email" class="form-control" id="email"
                                      placeholder="abc@xyz.com" type="email" value="${m.email }">
                              </div>
  	

				
				<div class="form-group">
					<input type="submit" class="btn btn-primary btn-block" value="정보수정">
				</div>	
							
				<div class="form-group">
					<input  type="button" data-toggle="modal" data-target="#updatePassword" class="btn btn-primary btn-block" value="비밀번호 변경" >
				</div>
									
				</form>
			</article>
		</div>
		
            


            </div>



		</div>
	</div>
</div>



<div class="modal fade" id="updatePassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="updatePassword">비밀번호 변경</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="${pageContext.request.contextPath}/myPage/memberChildUpdate.do" method="post">
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
                              
                              <span class="pguide ok1" id="alert-success">비밀번호가 일치합니다.</span> 
                              <span class="pguide error2" id="alert-danger">비밀번호가 일치하지 않습니다.</span>
                    
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">확인</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
                </form>
            </div>
          </div>
        </div>
      </div>



<script src="${pageContext.request.contextPath}/resources/js/mypage/mypage.js"></script>
<script>

$("#addr1").val(addArr[0]);
$("#addr2").val(addArr[1]);
$("#addr3").val(addArr[2]);
</script>
<!-- contents end-->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />