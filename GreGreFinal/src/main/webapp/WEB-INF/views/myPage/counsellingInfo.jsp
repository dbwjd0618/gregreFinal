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
							<a class="menu__item" href="#">
								<div class="menu__title">예약현황 조회/취소</div>
							</a> 
							<a class="menu__item" href="#">
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
                        <h4 style="text-align: center;"><strong>상담정보/리뷰쓰기</strong></h4>
                    </div>
                </div>
                
                
                
                <c:forEach items="${list }" var="c">
                <div class="row mb-3">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                       <img src="${pageContext.request.contextPath}/resources/images/counselling/" class="imgmini">
                                    </div>
                                    <div class="col-md-7">
                                        <p>예약한 상담사명 : ${c.advisId} </p>
                                        <p>결제정보 : ${c.payInfo } </p>
                                        <p>결제일 : ${c.startDay} </p>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="innerModal('${c.appointNo}','${c.advisId }','${memberLoggedIn.memberId }');">작성</button>
                                    </div>
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
            <!--contents-end-->
		</div>
	</div>
</div>
<!-- contents end-->

<!-- modal 폼-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">리뷰 등록하기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
<form action="${pageContext.request.contextPath}/myPage/counsellingInfo.do" method="post">
        <div class="modal-body">
                <div class="form-group">
                  <label for="recipient-name" class="col-form-label">평점 선택(1~5)</label>
                  <input type="number" class="form-control" id="recipient-name" min="1" max="5" name="starPoint">
                </div>
                <div class="form-group">
                  <label for="message-text" class="col-form-label">리뷰(500자 이내)</label>
                  <textarea class="form-control" id="message-text" maxlength="500" name="reviewContent"></textarea>
                </div>
                <input type="hidden" name="reviewerId">
                <input type="hidden" name="advisId">
                <input type="hidden" name="appointNo"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary">등록</button>
      	</div>
</form>
<!-- contents end-->

<script>
function innerModal(appointNo, advisId, reviewerId) {
	$("[name=appointNo]").val(appointNo);
	$("[name=advisId]").val(advisId);
	$("[name=reviewerId]").val(reviewerId);
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />