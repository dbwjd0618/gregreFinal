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
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}
</style>

  
   <script>
   var cnumber ='${m.childNumber}'
   console.log(cnumber);
   
/*    $(function(){
	   location.href = "${pageContext.request.contextPath}/myPage/selectChild.do";
   }); */
   </script>
 <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5"
      style="background-image: url('${pageContext.request.contextPath}/resources/images/counselling/cinfo.jpg')">
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
              <h1 class="mb-3 font-weight-bold text-teal">상담사 정보 페이지</h1>
              <p><a href="index.html" class="text-white">Home</a> <span class="mx-3">/</span> <strong>종료된 상담목록</strong></p>
            </div> 
          </div>
        </div>
      </div>
    </div>

<!-- contents begin-->
<style>
/* 별점  */
.fa-star:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/red-star.png');
	background-size: 20px 20px;
	width: 20px;
	height: 20px;
	display: inline-block;
}
.fa-star-o:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/red-star-o.png');
	background-size: 18px 18px;
	width: 18px;
	height: 18px;
	display: inline-block;
	margin-bottom: 1px;
}

.reviewPoint{
    position: absolute;
    opacity: 0;
    z-index: -10000;
    font-size: inherit;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/shop/productView.js"></script>
<!--product view css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/productView.css"
	type="text/css"></link>
	

<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar" src="${pageContext.request.contextPath}/resources/images/counselling/${c.advisImg }"/>
							<div class="profile__name">${m.memberId }</div>
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
			
			<!-- 메인 -->
			<div class="col-md-9">
                <div class="row mb-4">
                    <div class="col-md-12">
                        <h4 style="text-align: center;"><strong>종료된 상담 조회</strong></h4>
                    </div>
                </div>
                    
                <c:forEach items="${list }" var="c">
                <div class="row mb-3">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                       <img src="${pageContext.request.contextPath}/resources/images/counselling/usericon.png" class="imgmini">
                                    </div>
                                    <div class="col-md-7">
                                        <p>회원아이디 : ${c.memberId} </p>
                                        <p>상담 시작일 : ${c.startDay} </p>
                                        <p>상담 종료일 : ${c.endDay} </p>
                                    </div>
                                    <%-- <div class="col-md-2">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="innerModal('${c.advisImg}','${c.advisName}','${c.appointNo}','${c.startDay }','${c.advisId }','${memberLoggedIn.memberId }');">작성</button>
                                    </div> --%>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>	
                </c:forEach>
    
                 <div class="row mb-3">
                    <div class="col-md-12">
                        
                    </div>
                </div> 
                 
            </div>
            <!--main-contents-end-->
		</div>
	</div>
</div>
<!--all contents end-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />