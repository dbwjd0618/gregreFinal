<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/admin/common/header.jsp"/>
<!--myReview-->
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/App-ba29e8bb.css">
<link rel="stylesheet" type="text/css"
	href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/templates-Review-MyHome-MyReviewList-fe78dbee.chunk.css">

<!--product view css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/shop/productView.css"
	type="text/css"></link>
<style>
.fa-star:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/star.png');
	background-size: 20px 20px;
	width: 20px;
	height: 20px;
	display: inline-block;
}

.fa-star-o:before {
	content: "";
	background-image:
		url('${pageContext.request.contextPath }/resources/images/star/star-o.png');
	background-size: 18px 18px;
	width: 18px;
	height: 18px;
	display: inline-block;
	margin-bottom: 1px;
}
.my-review-list__list__item__product.col-lg-9 {
    padding-left: 25px;
}
.my-review-list__list__item.col-lg-2 {
    padding-right: 40px;
}
button.btn.btn-outline-secondary.review-btn {
    margin-bottom: 10px;
}
</style>
<script>
//리뷰작성하기
 function goReview(){


		 	document.reviewFrm.action='${pageContext.request.contextPath }/shop/review/reviewUpdate.do';
			document.reviewFrm.submit(); 
			 
			alert('리뷰가 수정되었습니다');
}
//옵션삭제하기
 function reviewDelete(){
	 
 	 if (confirm("리뷰를 삭제하시겠습니까?")) {
 		document.deleteFrm.action='${pageContext.request.contextPath }/shop/review/reviewDelete.do';
		document.deleteFrm.submit(); 
		alert('리뷰가 삭제되었습니다');
 	 }
}
//리뷰수정 모달 
$(function(){
    $(".review-btn").click(function(){
    	$('.review-modal__form__product__contents .opt-n').remove();
    	var optName = $(this).parent().prev().find('.optName');
    	var optId = $(this).parent().prev().find('input[name=opt-id]');
        var t = $(this);
        
        var optIdArr = new Array();
        $(optId).each(function (index, item) {
         optIdArr[index] = $(item).val();
        });
    	$(optName).each(function (index, item) { 	
    		 var addOpt = '<div class="review-modal__form__product__contents__options opt-n" id="opt-name">'+$(item).text()+'</div>';	
    		  addOpt += '<input type="hidden" name="optionId" value="'+optIdArr[index]+'" >'; 
    		 $('.review-modal__form__product__contents').append(addOpt); 
    	});
    	
    	var imgName = $(this).parent().find('input[name=imgName]').val();
    	var brandName = $(this).parent().find('input[name=brandName]').val();
    	var prodName = $(this).parent().find('input[name=prodName]').val();
    	var prodId = $(this).parent().find('input[name=prodId]').val();
    	var reviewId = $(this).parent().find('input[name=reviewId]').val();
    	var prodContent = $(this).parent().find('input[name=prod-content]').val();
        var imgSrc = "${pageContext.request.contextPath}/resources/upload/shop/productMainImg/"+imgName;
    	$('#prod-id').val(prodId);
    	$('#review-id').val(reviewId);
    	$('#brand-name').text(brandName);
    	$('#prod-name').text(prodName);
    	$('[name=reviewContent]').val(prodContent);
    	$("#rv-img").attr("src",imgSrc);
    	
 
  		$('#writeReviewModal').modal();

 
    })
})

</script>
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
</script>
<!-- review list -->
<!-- Breadcrumb Section Begin -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css">
  <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <h1>
                리뷰목록
                <small>리뷰 목록</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">게시판</a></li>
                <li class="active">리뷰 목록</li>
              </ol>
            </section>
            <!-- <style>
                .infostatus{
                  border: 1px solid gray;
                  width: 800px;
                  margin-left:64px;
                  height: 150px;
                }
                </style> -->
            <!-- Main content -->
           
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">리뷰 관리</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">

                       
                        <div class="row" style="display:grid; margin-bottom: 20px;">
                            <table>
                                <tr>
                                     <th>리뷰번호</th> 
                                    <th>제품이름</th>
                                    <th>내용</th>
                                    <th>사진</th>
                                    <th>옵션</th>
                                    <th>작성자</th>
                                    <th>추천수</th>
                                    <th>삭제</th>
                                </tr>
                              <!-- 여기에 리스트 출력하기. -->
                             <c:forEach items="${reviewList }" var="r">
                                <tr>
                                	 <td>${r.reviewId }</td> 
                                	<td>${r.productName }</td>
                                	<td>${r.reviewContent }</td>
                                	<td>${r.renamedImg }</td>
                                	<c:forEach items="${r.optionId }" var="op" varStatus="ovs">
                                	<td>${op }${!ovs.last?",":"" }</td>
                                	</c:forEach>
                                	<td>${r.reviewerId }</td>
                                	<td>${r.reviewRecommen }</td>
                                	<td><button onclick="location.href='${pageContext.request.contextPath}/shop/admin/review/delete.do?reviewId=${r.reviewId }'">삭제</button> </td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="row">
                        <!-- 페이징바 영역 -->
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <select>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                    <option value="writer">작성자</option>
                                </select>
                            </div>
                            <div class="col-md-7">
                                <input type="text" style="width: 500px;"/>
                            </div>
                            <div class="col-md-2">
                                <button style="width:80px;">검색</button>
                            </div>
                        </div>
                      </div>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
                </section>
              </div><!-- /.row -->

              <div class="row" style="margin-bottom:20px;">
                <div class=" col-lg-12 production-selling-section__right" style="float: right;">
                    <button type="button" data-toggle="modal" data-target="#qNaModal">
                        상품문의하기
                    </button>
                    
                </div>
 
          </div><!-- /.content-wrapper -->


			<!-- review List 끝 -->
		
