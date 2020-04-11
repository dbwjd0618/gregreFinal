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
			
			<div class="col-md-9">


            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                   <img src="../images/myPage/pic2.PNG" class="imgmini">
                                </div>
                                <div class="col-md-7">
                                    <h5>자녀정보</h5>
                                    <p>자녀이름 : CSS킹</p>
                                    <p>생후 15개월</p>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-outline bg-gray" >자녀 추가하기</button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>			



            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                   <img src="../images/myPage/pic1.PNG" class="imgmini">
                                </div>
                                <div class="col-md-7">
                                    <h5>현재 당신의 가임기 현황 입니다</h5>
                                    <mark>현재 상태는 : 주의</mark>
                                    <p>예정된 관계인지 고려하세요</p>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-outline bg-gray" onclick="location.href='${pageContext.request.contextPath}/member/myPage/periodCalculator.do'">캘린더보기</button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>

                        <div class="row mb-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                   <img src="../images/myPage/pic3.PNG" class="imgmini">
                                </div>
                                <div class="col-md-7">
                                    <h5>예약 및 일정</h5>
                                    <p>2020년05월05일 일정이 있습니다</p>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-outline bg-gray">예약일정 확인하기</button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>


			</div>
		</div>
	</div>
</div>

<!-- contents end-->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />