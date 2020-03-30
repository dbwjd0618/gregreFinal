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

<!-- body begin-->
<div class="site-section" style="padding:0px;">
	<div class="container" style="margin-top:0px; max-width: 1440px;">
		<div class="row">
			<div class="col-lg-2" style="padding-left:0px;">
				<!--커뮤니티 서브메뉴-->
				<ul class="menu" style="margin-top : 150px;">
					<c:forEach items="${boardList}" var="board">
						<li class="list"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${board.boardCode}">${board.boardName}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-lg-10">
				<!-- contents begin-->
				<div class="site-section" style="padding-top: 10px;">
					<div class="container" style="padding: 0px;">
						<div class="row">
							<div class="col-md-6">
								<span style="font-size: x-large">${post.title }</span>
							</div>
						</div>
						<table id="content" style="width: 100%;">
							<tr>
								<td style="width: 70%; text-align: left;">${post.writer }</td>
								<td>(댓글)${replyCount}개</td>
								<td>(선호)${prefCount}개</td>
								<td>(조회수)${post.readCount }</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left; height: 300px;">게시글 내용</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="col-md-1" style="display: inline-block; margin: 2px; padding: 0px; border: 1px solid green; color: green; border-radius: 10px; text-align: center;">추천 0</div>
									<div class="col-md-1" style="display: inline-block; margin: 2px; padding: 0px; border: 1px solid blue; color: blue; border-radius: 10px; text-align: center;">비추천 0</div>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="text-align: left;">
									<button onclick="location.href='notice.do'">목록</button>&nbsp;
									<button>신고</button>
								</td>
								<td>
									<button>수정</button>&nbsp;
									<button>삭제</button>
								</td>
							</tr>
						</table>
						<br />
						<br />
						<table id="reply" style="width: 100%; text-align: left;">
							<tr>
								<td>댓글 작성자 / 작성 시간</td>
							</tr>
							<tr>
								<td>댓글내용</td>
							</tr>
							<tr>
								<td>댓글 작성자 / 작성 시간</td>
							</tr>
							<tr>
								<td>댓글내용</td>
							</tr>
							<tr>
								<td>댓글 작성자 / 작성 시간</td>
							</tr>
							<tr>
								<td>댓글내용</td>
							</tr>
							<tr>
								<td>
									<input type="text" placeholder="댓글을 입력하세요." style="width: 90%;" />&nbsp;
									<button>댓글 작성</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- contents end-->
			</div>
		</div>
	</div>
</div>
<!-- body end-->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />