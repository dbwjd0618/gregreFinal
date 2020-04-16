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
<style>
sapn.pguide {display:none;font-size: 12px;position:absolute; top:12px; right:10px ; }
span.ok1{display:none;color:green;}
span.error2{display:none;color:red ;}
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}
</style>

   
   
   <script>
   var result = '${m.address}';
   var addArr = result.split('+');
   console.log(addArr);
   
   function updatePassword() {
		$("#updatePassword").modal();
	}
   
   </script>
 <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" 
      data-stellar-background-ratio="0.5"
      style="background-image: url('${pageContext.request.contextPath}/resources/images/counselling/cinfo.jpg')">
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
              <h1 class="mb-3 font-weight-bold text-teal">상담사 정보 페이지</h1>

              <p><a href="${pageContext.request.contextPath}/" class="text-white">Home</a> <span class="mx-3">/</span> <strong>상담사 정보 수정</strong></p>

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
							<img class="profile__avatar" src="${pageContext.request.contextPath}/resources/upload/member/${c.advisImg }"/>
							<div class="profile__name">${c.advisName}</div>
						</div>
					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/bizUpdate.do"> 
								<div class="menu__title">상담사 정보수정</div>
							</a>
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/bookingStatus.do"> 
								<div class="menu__title">진행중인 상담 보기</div>
							</a>   
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/bookingEndStatus.do">
								<div class="menu__title">종료된 상담 보기</div>
							</a>
							<%-- <a class="menu__item" href="${pageContext.request.contextPath}/myPage/deleteMember.do">
								<div class="menu__title">회원탈퇴</div>
							</a> --%>
						</div>
					</div>
				</div>
			</div>
			

			<div class="col-md-9">
						<div class="row mb-4">
                            <div class="col-md-12">
                                <h4 style="text-align: center;"><strong>상담사 정보 수정</strong></h4>
                            </div>
                        </div>
				<div class="card bg-light">
		<article class="card-body mx-auto" style="max-width: 635px;">
	<form class="card-body mx-auto" action="${pageContext.request.contextPath}/myPage/updateCounselor.do" id="memberFrm" method="post">


				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">아이디</span>
					</div>
					<input type="text" name="advisId" id="advisId_" class="form-control" value="${c.advisId}" readonly>
				</div>

				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">이름</span>
					</div>
					<input type="text"  name="advisName" id="advisName" class="form-control" value="${c.advisName }"><br>
				</div>
				<div class="form-group">
   					<label for="exampleFormControlInput1"><strong>한줄소개</strong></label>
    				<input type="text" class="form-control" name="advisLineIntro" value="${c.advisLineIntro }">
  				</div>
  				<div class="form-group">
    				<label for="exampleFormControlInput1"><strong>학력사항</strong></label>
    				<input type="text" class="form-control" name="advisCareer" value="${c.advisCareer }">
  				</div>
  				<div class="form-group">
    				<label for="exampleFormControlInput1"><strong>자격증</strong></label>
    				<input type="text" class="form-control" name="advisLicense" value="${c.advisLicense }">
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
              <form action="${pageContext.request.contextPath}/myPage/updatePassword.do" method="post">
                    <div class="form-group input-group">
                    <input type="hidden" name="memberId" id="memberId_" class="form-control" value="${m.memberId }" readonly>
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

$(function(){
	  $("#alert-success").hide(); 
	  $("#alert-danger").hide(); 
	  $("input").keyup(function(){
		  var pwd1=$("#memberPwd").val(); 
		  var pwd2=$("#memberPwd2").val(); 
		  if(pwd1 != "" || pwd2 != ""){ 
			  if(pwd1 == pwd2){ 
				  $("#alert-success").show(); 
				  $("#alert-danger").hide(); 
				  $("#submit").removeAttr("disabled"); 
				  }else{ 
					  $("#alert-success").hide(); 
					  $("#alert-danger").show(); 
					  $("#submit").attr("disabled", "disabled"); 
					  } 
			  } 
		  }); 
	  });


$("#addr1").val(addArr[0]);
$("#addr2").val(addArr[1]);
$("#addr3").val(addArr[2]);
</script>
<!-- contents end-->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />