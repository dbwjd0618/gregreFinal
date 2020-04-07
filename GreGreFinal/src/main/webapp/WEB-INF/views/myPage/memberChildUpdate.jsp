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
   var cnumber ='${m.childNumber}'
   console.log(cnumber);
   
/*    $(function(){
	   location.href = "${pageContext.request.contextPath}/myPage/selectChild.do";
   }); */
   </script>
 <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" >
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
              <h1 class="mb-3 font-weight-bold text-teal">마이페이지</h1>
              <p><a href="index.html" class="text-white">Home</a> <span class="mx-3">/</span> <strong>자녀정보</strong></p>
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
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/deleteMember.do">
								<div class="menu__title">회원탈퇴</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 메인 -->
			<div class="col-md-9">
                <div class="row mb-4">
                    <div class="col-md-12">
                        <h4 style="text-align: center;"><strong>자녀정보</strong></h4>
                    </div>
                </div>
                
                
                <c:if test="${m.childNumber !=0 }">
                <c:forEach items="${list }" var="c">
                <div class="row mb-3">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                       <img src="../images/myPage/pic2.PNG" class="imgmini">
                                    </div>
                                    <div class="col-md-7"> 
                                        <p>자녀이름 : ${c.childName }</p>
                                        <p>자녀생일 : ${c.birthday }</p>
                                        <p>성별 : ${c.gender eq 'M'? '남':'여'}</p>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-outline bg-gray" >추가입력</button>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>	
                </c:forEach>
                </c:if>
     

                 <div class="row mb-3">
                    <div class="col-md-12">
                        <button class="btn btn-primary" style="margin: 0 auto; display:block;"  data-toggle="modal" data-target="#myChildAddModal">
                            자녀 추가하기
                        </button>
                    </div>
                </div> 
                    
            </div>
            <!--contents-end-->
		</div>
	</div>
</div>
<!-- contents end-->

<!--자녀추가히가 modal 폼-->
<div class="modal fade" id="myChildAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="myChildAddModalLabel">자녀 정보 입력</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="${pageContext.request.contextPath}/myPage/memberChildUpdate.do" method="post">
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> 부모 아이디</span>
                        </div>
                        <input name="parentsId" class="form-control" id="parentsId" value="${m.memberId }" readonly="readonly"
                            type="text">
                    </div>
                    <input name="childId" class="form-control" id="childId"
                            type="hidden">
                    
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">자녀 이름</span>
                        </div>
                        <input name="childName" class="form-control" id="childName"
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
                        <div class="input-group-prepend" id="gender">
                            <span class="input-group-text"> 성별 </span>
                        </div>
                            <div id="gender1">
                                    <label for="gender0">&nbsp;&nbsp; 남</label>
                                <input type="radio" name="gender" id="gender0" value="M" checked>
                            </div>
                            
                            <div id="gender2">
                                    <label for="gender1">&nbsp;&nbsp;여</label>
                                <input type="radio" name="gender" id="gender1" value="F">
                            </div>
                    </div>
                    
                    <div class="form-group input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">자녀 연락처 </span>
								</div>
								<input name="phone" class="form-control" id="phone"
									type="text">
							</div>
					<input type="hidden" name="childNumber" value="1"/>
                    
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

</script>
<!-- contents end-->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />