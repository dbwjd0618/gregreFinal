<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<!-- 게시판 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css">

<!--서브메뉴 js-->
<script src="${pageContext.request.contextPath}/resources/js/subMenu/subMenu.js"></script>

<script>
function preferSwitch(it) {
	if($(it).attr('class') == 'gray') {
		$(it).attr('src',"${pageContext.request.contextPath}/resources/img/board/StarYellow.png")
			 .attr('class', 'yellow');
	}
	else {
		$(it).attr('src',"${pageContext.request.contextPath}/resources/img/board/StarGray.png")
		 	 .attr('class', 'gray');
	}
}
</script>

<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('images/hero_1.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">${boardName}</h1>
					<p>
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a>
						<span class="mx-3">/</span>
						<strong>커뮤니티</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- contents begin-->
<div class="site-section" style="padding:0px;">
	<div class="container" style="margin-top:0px; max-width: 1440px;">
		<div class="row">
			<div class="col-lg-2" style="padding-left:0px;">
				<!--커뮤니티 서브메뉴-->
				<ul class="menu">
					<c:forEach items="${boardList}" var="board">
						<li class="list"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${board.boardCode}">${board.boardName}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-lg-10">
				<!-- contents begin-->
				<div class="site-section" style="padding-top: 10px;">
					<div class="container" style="margin-top:0px;">
						<div class="row">
							<div class="col-md-6">
								<span>총 ${postCount}건</span>
							</div>
							<div class="col-md-6" style="text-align: right; padding-right: 3px;">
								<button style="width: 80px" onclick="location.href='postWrite.html'">글쓰기</button>
							</div>
						</div>
						<div class="row" style="display: grid; margin-bottom: 20px;">
							<table>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>이름</th>
									<th>날짜</th>
									<th>조회수</th>
									<th></th>
								</tr>
								<c:if test="${empty postList}">
								<tr>
									<td colspan="5">게시글이 존재하지 않습니다.</td>
								</tr>
								</c:if>
								<c:if test="${not empty postList}">
									<c:forEach items="${postList}" var="post">
										<td>${post.postNo}</td>
										<td><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}">${post.title}</a></td>
										<td>${post.writer}</td>
										<td>${post.postWriteTime}</td>
										<td>${post.readCount}</td>
										<td><img src="${pageContext.request.contextPath}/resources/img/board/StarGray.png" class="gray" style="width:21px;" onclick="preferSwitch(this);"/></td>
									</c:forEach>
								</c:if>
								<tr>
									<td>6</td>
									<td><a href="../board/noticeView.html">일반 게시판 입니다.</a></td>
									<td>admin000</td>
									<td>2020-03-07</td>
									<td>11</td>
								</tr>
								<tr>
									<td>5</td>
									<td><a href="${pageContext.request.contextPath }/board/noticeView.do">일반 게시판 입니다.</a></td>
									<td>admin000</td>
									<td>2020-03-06</td>
									<td>131</td>
								</tr>
								<tr>
									<td>4</td>
									<td><a href="${pageContext.request.contextPath }/board/noticeView.do">일반 게시판 입니다.</a></td>
									<td>admin000</td>
									<td>2020-03-05</td>
									<td>13</td>
								</tr>
								<tr>
									<td>3</td>
									<td><a href="${pageContext.request.contextPath }/board/noticeView.do">일반 게시판 입니다.</a></td>
									<td>admin000</td>
									<td>2020-03-04</td>
									<td>123</td>
								</tr>
								<tr>
									<td>2</td>
									<td><a href="${pageContext.request.contextPath }/board/noticeView.do">일반 게시판 입니다.</a></td>
									<td>admin000</td>
									<td>2020-03-03</td>
									<td>134</td>
								</tr>
								<tr>
									<td>1</td>
									<td><a href="${pageContext.request.contextPath }/board/noticeView.do">일반 게시판 입니다.</a></td>
									<td>admin000</td>
									<td>2020-03-02</td>
									<td>131</td>
								</tr>
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
								<input type="text" style="width: 500px;" />
							</div>
							<div class="col-md-2">
								<button style="width: 80px;">검색</button>
							</div>
						</div>
					</div>
				</div>
				<!-- contents end-->
			</div>
		</div>
	</div>
</div>
<!-- contents end-->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />