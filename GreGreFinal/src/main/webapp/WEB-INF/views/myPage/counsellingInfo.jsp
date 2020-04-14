<%@page import="kh.mclass.Igre.counselling.model.vo.BookingInfo"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="kh.mclass.Igre.counselling.model.vo.Counselor"%>
<%@page import="kh.mclass.Igre.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	BookingInfo bookingInfo  = (BookingInfo)request.getAttribute("bookingInfo");
	List<BookingInfo> list = (List<BookingInfo>)request.getAttribute("list");
	
	

	System.out.println("bookingInfo@@@@@@@@@@@@+"+bookingInfo);
	List<String> keywordList = null;
	if(bookingInfo.getAdvisKeyword() != null)
		keywordList = Arrays.asList(bookingInfo.getAdvisKeyword());
	
	pageContext.setAttribute("keywordList", keywordList);
%>
  
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
      style="background-image: url('${pageContext.request.contextPath}/resources/images/myPage/mypagebg.jpg')">
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
              <h1 class="mb-3 font-weight-bold text-teal">마이페이지</h1>
              <p><a href="index.html" class="text-white">Home</a> <span class="mx-3">/</span> <strong>상담정보</strong></p>
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
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/myPeriod.do">
								<div class="menu__title">월경캘린더</div>
							</a> 
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/">
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
                        <h4 style="text-align: center;"><strong>상담정보/리뷰쓰기</strong></h4>
                    </div>
                </div>
                
                
                
                <c:forEach items="${list }" var="c" varStatus="vs">
                <div class="row mb-3">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                       <img src="${pageContext.request.contextPath}/resources/images/counselling/${c.advisImg }" class="imgmini">
                                    </div>
                                    <div class="col-md-7">
                                        <p>예약한 상담사명 : ${c.advisName} </p>
                                        <p>결제정보 : ${c.payInfo } </p>
                                        <p>결제일 : ${c.startDay} </p>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="innerModal('${c.advisImg}','${c.advisName}','${c.appointNo}','${c.startDay }','${c.advisId }','${memberLoggedIn.memberId }','${c.advisKeyList}');">작성</button>
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
<!-- 리뷰쓰기 modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form action="${pageContext.request.contextPath}/myPage/reviewWrite.do" method="post">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">리뷰작성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div class="modal-body">
						<div class="form-group review-modal__form__product ">
							<img class="review-modal__form__product__image" id="c-img"
								src="">
							<div class="review-modal__form__product__contents">
								<div class="review-modal__form__product__contents__name" id="name"></div>
								<div class="review-modal__form__product__contents__payinfo" id="payinfo"></div>
								<div class="review-modal__form__product__contents__payday" id="payday"></div>
							</div>
						</div>
						<div class="form-group">
            			<label for="recipient-name" class="col-form-label">상담 유형 선택<br/>
            			
            				<input type="checkbox" aria-label="Checkbox for following text input" name="advisKeyword" id="modalIm" value="임신"> 임신
            				&nbsp;&nbsp;
            				<input type="checkbox" aria-label="Checkbox for following text input" name="advisKeyword" id="modal6" value="육아"> 육아
            			 
            			</label>
            			</div>
						<div class="form-group">
							<label for="starting" class="col-form-label">별점 평가</label>
							<div class="at-rating" style="font-size: 30px; color: #FAC451;">
								<label class="rating-input__star"  aria-label="별점 1점"> 
									<input type="radio" value="1" name="starPoint" class="reviewPoint"> 
									<i class="fa fa-star-o"></i>
								</label> 
								<label class="rating-input__star" aria-label="별점 2점"> 
									<input type="radio" value="2" name="starPoint" class="reviewPoint"> 
									<i class="fa fa-star-o"></i>
								</label> 
								<label class="rating-input__star" aria-label="별점 3점"> 
									<input type="radio" value="3" name="starPoint" class="reviewPoint"> 
									<i class="fa fa-star-o"></i>
								</label> 
								<label class="rating-input__star" aria-label="별점 4점"> 
									<input type="radio" value="4" name="starPoint" class="reviewPoint"> 
									<i class="fa fa-star-o"></i>
								</label> 
								<label class="rating-input__star" aria-label="별점 5점"> 
									<input type="radio" value="5" name="starPoint" class="reviewPoint"> 
									<i class="fa fa-star-o"></i>
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="review-text" class="col-form-label">리뷰작성(500자 이내)</label>
							<textarea class="form-control" id="review-text" maxlength="500" name="reviewContent"></textarea>
						</div>
					</div>
        			<div class="modal-footer">
          				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          				<button type="submit" class="btn btn-primary">등록</button>
      				</div>
      				</div>
                		<input type="hidden" name="reviewerId" value="">
                		<input type="hidden" name="advisId" value="">
                		<input type="hidden" name="appointNo" value=""/>
                		<input type="hidden" name="advisReviewNo" value="0"/>
        			</div>
				</form>
		</div>
	</div>
</div>
<!-- contents end-->

<script>
$(function(){
    $("label.rating-input__star").on("click",function(){
        $(this).parent().children("label").removeClass("selected").children('i').addClass("fa-star-o");
        $(this).addClass("selected").prevAll("label").addClass("selected").children('i').removeClass("fa-star-o").addClass("fa-star");
        $(this).children("i").removeClass("fa-star-o").addClass("fa-star");
        $(this).children("input:radio[name='starPoint']").prop('checked', true);
        return false;
    })
})

function innerModal(advisImg, advisName, appointNo, startDay, advisId, reviewerId, adviskeyList) {
	
	var name = advisName;
	var no = appointNo;
	var id = advisId;
	var reid = reviewerId;
	var sday = startDay;
	var imgg = advisImg;
	var keyword = adviskeyList;
	
	var imgSrc ="${pageContext.request.contextPath}/resources/images/counselling/"+imgg;
	console.log("name="+name);
	console.log("no="+no);
	console.log("sday="+sday);
	console.log("id="+id);
	console.log("reid="+reid);
	console.log("img="+imgg);
	console.log("keyword="+keyword);
	if(keyword.indexOf("임신") != -1){
	$("#modalIm").prop("checked", true);
		
	} else {
	$("#modalIm").prop("checked", false);
		
	}
	if(keyword.indexOf('육아') != -1){
		$('#modal6').prop("checked", true);
	}else {
		$('#modal6').prop("checked", false);
		
	}
	
	$("[name=appointNo]").val(appointNo);
	$("[name=advisId]").val(advisId);
	$("[name=reviewerId]").val(reviewerId);
	$("#name").text(name);
	
	$(".review-modal__form__product__contents__name").text("상담사명 : "+advisName);
	$(".review-modal__form__product__contents__payinfo").text("예약번호 : "+appointNo);
	$(".review-modal__form__product__contents__payday").text("결제일 : "+sday );
	
	$('#c-img').attr('src', imgSrc);
}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />