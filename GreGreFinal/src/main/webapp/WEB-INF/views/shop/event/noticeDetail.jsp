<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/common/header.jsp"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/event.css" type="text/css">
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
            <!--담청자 발표 -->
            <div class="board-detail event">
                <div class="board-header row">
                <c:forEach items="${wl}" var="w">
                    <h3 class="title">[Igre-Mall] ${w.eventTitle }</h3>
				</c:forEach>
                    <div class="date">2020.02.19</div>
                </div>
                <!-- s: 당첨자발표 상세 내용 -->
                <div class="board-content row">
                    <div class="board-content-inner col-lg-12">
                        <div class="row">
                            <div class="col-lg-12">
                            <c:forEach items="${wl}" var="w">
                            <p>${w.eventPartContent }</p>
							
							</c:forEach>
                            </div>

                        </div>
                        <!-- 당첨자 내역 -->

                        <div class="tbl-board-top row">
                            <div class="col-lg-8">
                                <p class="tt-info">
                                    이벤트 당첨 공지합니다.<br>
                                    아래 당첨자 리스트 또는 마이페이지의 이벤트 당첨 여부를 확인해주세요.
                                </p>
                            </div>
                            <div class="col-lg-4">
                                <div class="fright">
                                    <a href="${pageContext.request.contextPath }/shop/myShopping/event/list.do" class="tico bic-b-arrow popFamilyLoginMenu">나의 당첨내역 확인<span
                                        class="ic"></span></a>
                                </div>

                            </div>
                        </div>
                        <!-- 당첨자 테이블 -->
                        <div class="row">
                            <div class="col-lg-12">
                                <table class="tbl-col" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">번호</th>
                                            <th scope="col">아이디</th>
                                            <th scope="col">당첨경품</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach items="${wl }" var="w" varStatus="num" begin="0">
	                                        <tr>
	                                            <td>${num.index+1 }</td>
	                                            <td>${w.eventPartId }</td>
	                                            <td>${w.couponName }</td>
	                                        </tr>
										</c:forEach>
                                       
                                    </tbody>
                                </table>


                            </div>
                        </div>
                        <!--테이블 끝-->

                    </div>
                </div>
                <!-- e: 당첨자발표 상세 내용 -->
                <!--목록버튼시작-->
                <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-outline-dark back-to-list">목록</button>
                        </div>
                </div>
            </div>
        </div>
    </div>


<jsp:include page="/WEB-INF/views/shop/common/footer.jsp"/>	