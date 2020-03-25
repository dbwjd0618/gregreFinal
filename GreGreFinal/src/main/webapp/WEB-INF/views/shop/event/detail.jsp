<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/event.css" type="text/css">
     <style>
     input#psnlInfoUtilAgrYn {
    width: 15px !important;
    height: 14px !important;
    position: relative;
    margin-right: 5px !important;
	}
     </style>
 <!-- Breadcrumb Section Begin -->
 <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./home.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">이벤트</a>
                        <span>Detail</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
        <!--event view begin-->
        <div class=" board-detail event">
                <div class="board-header row">
                    <div class="bh-left col-md-8">
                        <h3 class="title">[광고1]새로운 이유식 케어비 사전예약 공유이벤트</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="date">기한 2020.03.02 ~ 2020.03.24</div>
                            </div>
                        </div>
                    </div>
                    <div class="bh-right col-md-4">
                        <div class="social">
                            <div class="dropdown-wrap fn-share" data-role="dropdown" style="z-index: 1;">
                                <button type="button" class="ico bic-share fn-btn" id="dropdown-btn-0" aria-haspopup="true" aria-controls="dropdown-menu-0" aria-expanded="false"><span>공유하기</span></button>
                                <div class="dropdown-cont fn-cont right share-cont" data-width="226" style="width: 226px; display: none;" id="dropdown-menu-0" aria-hidden="true" aria-owns="dropdown-btn-0">
                                    <ul class="share-list" data-title="" data-description="[케어비몰]새로운 이유식 케어비 사전예약 공유이벤트" data-target-url="/event/detail/20" data-image-url="https://shoppingcdn.namyangi.com/attach/item/2020/202002/21520ab5-fa54-417a-a174-d5f64f5d805b.png">
                                        <li><button type="button" id="facebookShare" class="ico bic-share-facebook"><span>페이스북</span></button></li>
                                        <li><button type="button" id="twitterShare" class="ico bic-share-twitter"><span>트위터</span></button></li>
                                        <li><button type="button" id="kakaoShare" class="ico bic-share-kakao"><span>카카오톡</span></button></li>
                                        <li><button type="button" id="urlShare" class="ico bic-share-url"><span>url 복사</span></button></li>
                                    </ul>
                                    <button type="button" class="btn-close">닫기</button>
                                    <input id="clipboard-textbox-url">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- s: 진행중인 이벤트 상세 내용 -->
                <div class="board-content row">
                    <div class="board-content-inner">
                        <p><img src="https://shoppingcdn.namyangi.com/attach/editor/2020/202003/3f65ec49-81cd-4a60-9527-34037958fc63.png" title="3f65ec49-81cd-4a60-9527-34037958fc63.png" style="max-width: 100%;"><br style="clear:both;"><a href="https://shopping.namyangi.com/event/detail/19"><img src="https://shoppingcdn.namyangi.com/attach/editor/2020/202002/c9811c76-569c-4dce-b364-899e56d9961c.png" title="c9811c76-569c-4dce-b364-899e56d9961c.png" style="max-width: 100%;"></a><br style="clear:both;"><img src="https://shoppingcdn.namyangi.com/attach/editor/2020/202003/74b6f09f-1d5b-48da-a549-0be35ef3375b.png" title="74b6f09f-1d5b-48da-a549-0be35ef3375b.png" style="max-width: 100%;"><br style="clear:both;">&nbsp;</p>
                    </div>
                </div>
                <!-- e: 진행중인 이벤트 상세 내용 -->
                
                    
                        <!-- 개인정보 활용 체크 박스 -->
                        <div class="note-box">
                            <div class="ntitle-check">
                                <span class="radio-check-item">
                                    <input id="psnlInfoUtilAgrYn" type="checkbox" name="psnlInfoUtilAgrYn">
                                    <label for="psnlInfoUtilAgrYn">개인정보 활용에 동의합니다</label>
                                </span>
                            </div>
                            <div class="note-cont">
                                <ul class="dot-list">
                                    <li>내용: 이벤트 참여 시 물품 배송 또는 연락을 위한 개인정보 활용</li>
                                    <li>정보: 이름, 전화번호, 아이디</li>
                                    <li>기간: 이벤트 종료 후 1개월 이내 파기</li>
                                    <li class="fc-444">개인정보 활용 동의를 거부할 권리가 있습니다.  단, 동의하지 않을 시 이벤트 참여에 제한됩니다. </li>
                                </ul>
                            </div>
                        </div>
                    
                    
                <!-- 댓글 container 시작 -->
                <div id="row">
                    <h2 class="ctitle">댓글 129</h2>
                    <div class="reply-wrap">   
                        <!-- 댓글달기 폼 -->
                        <div class="reply-write-box">
                        <textarea title="댓글 입력" name="cont" placeholder="댓글을 작성하시면 이벤트에 참여됩니다."></textarea>
                            <div class="reply-write-bottom">
                                <div class="btn-wrap">
                                    <button type="submit" class="btn btn-danger">등록</button>
                                </div>
                            </div>
                        </div>
                        <!-- 댓글달기 폼 끝 -->
                    <!--회원댓글 리스트-->
                    <div class="reply-list">
                            <div class="comment-option">
                                    <div class="co-item row">

                                        <div class="col-lg-2 comment-user-info">
                                            <h5>test1***</h5>
                                            <span>2020/03/12</span>
                                        </div>
                                        <div class="avatar-text col-lg-8">
                                            <p class="at-reply">Lorem ipsum dolor sit amet consectetur!</p>
                                        </div>
                                    </div>
                                    <div class="co-item row ">
                                        <div class="col-lg-2 comment-user-info">
                                                <h5>test3*** </h5>
                                                <span>2020/03/11</span>
                                        </div>
                                        <div class="avatar-text col-lg-8">
                                            <p class="at-reply">Lorem ipsum dolor sit amet consectetur
                                                adipisicing elit. Labore atque alias provident reprehenderit
                                                ullam, possimus autem non obcaecati totam similique, placeat
                                                accusantium! Quam itaque id nostrum? Velit alias unde quaerat!
                                            </p>
                                        </div>
                                    </div>
                                </div>
                    </div>
                    <!--회원댓글 리스트 끝-->
                    <div class="row" >
                        <div class="col-md-12">
                                <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                          <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                              <span aria-hidden="true">«</span>
                                              <span class="sr-only">Previous</span>
                                            </a>
                                          </li>
                                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                                          <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                              <span aria-hidden="true">»</span>
                                              <span class="sr-only">Next</span>
                                            </a>
                                          </li>
                                        </ul>
                                      </nav>
                        </div>
                    </div>
                    <!--목록버튼시작-->
                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-outline-dark back-to-list">목록</button>
                        </div>
                    </div>
                    <!--목록버튼끝-->
                </div>
            </div>
            <!-- 댓글 container 끝 -->
        </div>
    </div>

<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	