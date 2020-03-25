<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/common/header.jsp" />
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath }/resources/js/shop/jquery-3.3.1.min.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop/QnA.css" type="text/css">
    <!-- QnA table  -->
     <script>
 $(function () {
    $(".fold-table .fold-open").on("click", function () {
    	console.log("찍힙니까 this="+this);
        $(this).parent().toggleClass("open").next(".fold").toggleClass("open");
    });
});
</script>
<!--  myShopping QnA list -->
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="${pageContext.request.contextPath }/"><i
						class="fa fa-home"></i> Home</a> <a href="./shop.html">MY쇼핑</a> <span>주문확인/배송조회</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-4 pt-4">
				<h1 class="mb-3 font-weight-bold text-teal ">MY쇼핑</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar"
								src="${pageContext.request.contextPath }/resources/images/myPage/user.png" />
							<div class="profile__name">user123</div>
						</div>
					</div>
					<div class="sidebar__middle">
						<div class="profile side__profile _3fftNQzxHO">
							<ul>
								<li>주문·배송<a
									href="${pageContext.request.contextPath }/shop/myShopping/order/list.do"
									class="_2XiEZGqw1K"><em>0</em>건</a>
								</li>
								<li>보유 쿠폰<a
									href="${pageContext.request.contextPath }/shop/myShopping/coupon/list.do"
									class="_2XiEZGqw1K"><em>2</em>장</a>
								</li>
								<li>포인트<a href="#" class="_2XiEZGqw1K "><em>5000</em>p</a>
								</li>
							</ul>
						</div>

					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/order/list.do">
								<div class="menu__title">주문확인/배송조회</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/wish/list.do">
								<div class="menu__title">관심상품</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/event/list.do">
								<div class="menu__title">이벤트참여내역</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/review/list.do">
								<div class="menu__title">상품리뷰</div>
							</a> <a class="menu__item"
								href="${pageContext.request.contextPath }/shop/myShopping/QnA/list.do">
								<div class="menu__title">상품문의 내역</div>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!--상품문의내역 시작-->
			<div class="col-md-9">
				<div class="row">
					<h4 style="margin-bottom: 20px;">
						<strong>상품문의내역</strong>
					</h4>
				</div>
				<div class="row">

					<div class="col-lg-12">
						<table class="fold-table table table-sm">
							<thead>
								<tr>
									<th>번호</th>
									<th>답변상태</th>
									<th>제목</th>
									<th>등록일</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr class="view">
									<td class="fold-open">2</td>
									<td class="fold-open">검토중</td>
									<td class="fold-open">상품 문의입니다.</td>
									<td class="fold-open">2020.03.13</td>
									<td class="fold-open"></td>
									<td>
										<button class="btn btn-outline-secondary">수정</button>
										<button class="btn btn-outline-secondary">삭제</button>
									</td>
								</tr>
								<tr class="fold">
									<td colspan="6">
										<div class="fold-content">
											<div class="qt">
												<span class="ic_qt"><img src="${pageContext.request.contextPath }/images/shop/QnA/q-icon.png"
													alt=""></span>배송이 안되고 있어요 언제 올까요
											</div>


										</div>
									</td>
								</tr>
								<tr class="view">
									<td class="fold-open">1</td>
									<td class="fold-open">답변완료</td>
									<td class="fold-open">언제 배송되나요~~?</td>
									<td class="fold-open">2020.03.13</td>
									<td class="fold-open"></td>
									<td>
										<button class="btn btn-outline-secondary">수정</button>
										<button class="btn btn-outline-secondary">삭제</button>
									</td>
								</tr>
								<tr class="fold">
									<td colspan="6">
										<div class="fold-content">
											<div class="qt">
												<span class="ic_qt"><img src="${pageContext.request.contextPath }/images/shop/QnA/q-icon.png"
													alt=""></span>배송이 안되고 있어요 언제 올까요
											</div>
											<div class="as">
												<span class="ic_as"><img src="${pageContext.request.contextPath }/images/shop/QnA/a-icon.png"
													alt=""></span>안녕하세요 고객님. 접수해주신 상품문의에 대한 답변드립니다. 주문하신 상품은 어제
												출고되었으며, 배송은 1~2일 소요 예상됩니다. 감사합니다. 즐거운 하루 보내세요.
											</div>
											<p class="reginfo">
												<span class="wh">판매자의 답변</span> <span class="date">등록일
													: <em>2020-02-28 오후 4:32:44</em>
												</span>
											</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
				<!--상품문의내역 끝-->




		</div>
	</div>
</div>
	<!-- contents end-->

	<jsp:include page="/WEB-INF/views/shop/common/footer.jsp" />