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
<style>
.clickable:hover {color:red;}
.clickable {cursor:pointer;}
.thumbs {display: inline-block; height:30px; margin: 2px; padding: 0px; padding-top: 6px; border-radius: 10px; text-align: center;}
</style>

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
								<td style="width: 85%; text-align: left;">글 작성자 : ${post.writer }</td>
								<td style="width:60px;"><i title="댓글수" class="far fa-comment-dots"></i> ${replyCount}</td>
								<td style="width:60px;"><i title="선호수" class="fas fa-heart"></i> ${prefCount}</td>
								<td style="width:60px;"><i title="조회수" class="far fa-eye"></i> ${post.readCount}</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left; height: 300px;">${post.content }</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="col-md-1 thumbs" style="color:green; border:1px solid green;"><i class="far fa-thumbs-up"></i>추천 0</div>
									<div class="col-md-1 thumbs" style="color:blue; border:1px solid blue;"><i class="far fa-thumbs-down"></i>비추천 0</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left;">
									<i title="목록으로" class="fas fa-clipboard-list clickable" onclick="location.href='${pageContext.request.contextPath}/board/postList?boardCode=${post.boardCode }'"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<i title="신고하기" class="fas fa-exclamation-triangle clickable"></i>
								</td>
								<td><i title="수정하기" class="far fa-edit clickable"></i></td>
								<td><i title="삭제하기" class="fas fa-eraser clickable"></i></td>
							</tr>
						</table>
						<br />
						<br />
						<table id="reply" style="width: 100%; text-align: left;">
						<c:if test="${empty replyList}">
							<tr><td>작성된 댓글이 없습니다. 첫 댓글을 작성해주세요!</td></tr>
						</c:if>
						<c:if test="${not empty replyList}">
							<c:forEach items="${replyList}" var="reply">
							<tr>
								<td>
									<div>${reply.replyWriter} / ${reply.replyWritetime}</div>
									<div><i class="far fa-thumbs-up">${reply.recommenCount}</i><i class="far fa-thumbs-down">${reply.decommenCount}</i><i title="신고" class="fas fa-exclamation-triangle"></i></div>
									<div><i title="수정" class="far fa-edit"></i><i title="삭제" class="fas fa-eraser"></i></div>
									<br />
									<div>${reply.replyContent}</div>
								</td>
							</tr>
							</c:forEach>
						</c:if>
							<tr>
								<td>
									<input type="text" id="ReplyWrite" placeholder="댓글을 입력하세요." style="width: 90%;" />&nbsp;
									<button onclick="writeReply();">댓글 작성</button>
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
<c:if test="${empty memberLoggedIn }">
<script>
function writeReply() {
	alert("로그인 이후에 사용 가능한 기능입니다.");
}
</script>
</c:if>

<c:if test="${not empty memberLoggedIn}">
<script>
function writeReply() {
	
	if(!confirm("댓글을 작성하시겠습니까?")) {
		return;
	}
	
	let reply = {
			boardCode : ${post.boardCode},
			postNo : ${post.postNo},
			replyWriter : ${memberLoggedIn.memberId},
			replyContent : $("#ReplyWrite").val()
	}
	$.ajax({
			url: "${pageContext.request.contextPath}/board/replyWrite",
			data: reply,
			type: "POST",
			success: function() {
				location.reload();
			},
			error : function(x,s,e) {
				alert("댓글 작성에 실패했습니다.");
				console.log(x,s,e);
			}
	});
}
</script>
</c:if>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />