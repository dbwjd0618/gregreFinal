<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<!-- board.css -->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/board.css"
	rel="stylesheet" type="text/css" />

<style>
.clickable:hover {
	color: red;
}

.clickable, .rclick {
	cursor: pointer;
}

.thumbs {
	display: inline-block;
	height: 30px;
	margin: 2px;
	padding: 0px;
	padding-top: 6px;
	border-radius: 10px;
	text-align: center;
}

#reply .inline {
	display: inline-block;
	padding: 0 10px;
}

.recom {
	color: green;
	border: 1px solid green;
}

.decom {
	color: blue;
	border: 1px solid blue;
}
</style>

<!-- body begin-->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			게시판 <small>게시판 목록</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">게시판</a></li>
			<li class="active">게시판 목록</li>
		</ol>
	</section>

	<!-- Main Content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">게시글 보기</h3>
					</div>
					<!--커뮤니티 서브메뉴-->
					<div class="box-body" style="width:1000px; margin: 0 auto;">
						<div class="col-md-6">
							<span style="font-size: x-large">${post.title }</span>
							<form action="" id="postForm" method="POST">
								<input type="hidden" name="boardCode" value="${post.boardCode}" />
								<input type="hidden" name="postNo" value="${post.postNo}" /> <input
									type="hidden" name="writer" value="${memberLoggedIn.memberId}" />
								<input type="hidden" id="delRpl" name="replyNo" />
							</form>
						</div>
						<table id="content" style="width: 100%;">
							<tr>
								<td>NO.${post.postNo }</td>
								<td style="width: 85%; text-align: left;">글 작성자 : ${post.writer}</td>
								<td style="width: 60px;"><i title="댓글수" class="far fa-comment-dots"></i> ${replyCount}</td>
								<td style="width: 60px;"><i title="선호수" class="fas fa-heart"></i> ${prefCount}</td>
								<td style="width: 60px;"><i title="조회수" class="far fa-eye"></i> ${post.readCount}</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left; height: 300px;">${post.content }</td>
							</tr>
						</table>
						<br /> <br />
						<table id="reply" style="width: 100%; text-align: left;">
							<c:if test="${empty reply}">
								<tr>
									<td>작성된 댓글이 없습니다. 첫 댓글을 작성해주세요!</td>
								</tr>
							</c:if>
							<c:if test="${not empty reply}">
								<c:forEach items="${reply}" var="reply">
									<tr>
										<td>
											<div class="inline" style="font-size: 12px;">${reply.replyWriter}
												/ ${reply.replyWriteTime}</div>
											<div class="inline">
												<c:if test="${memberLoggedIn.memberId == reply.replyWriter}">
													<i class="far fa-thumbs-up"> ${reply.recommenCount}</i>&nbsp;&nbsp;
													<i class="far fa-thumbs-down"> ${reply.decommenCount}</i>&nbsp;&nbsp;
													<i title="신고" class="fas fa-exclamation-triangle"></i>
												</c:if>
												<c:if
													test="${memberLoggedIn.memberId != reply.replyWriter }">
													<i class="far fa-thumbs-up rclick"
														onclick="recom('${reply.replyNo}');">${reply.recommenCount}</i>&nbsp;&nbsp;
													<i class="far fa-thumbs-down rclick"
														onclick="decom('${reply.replyNo}');">${reply.decommenCount}</i>&nbsp;&nbsp;
													<i title="신고" class="fas fa-exclamation-triangle rclick"
														onclick="reportShow(${reply.replyNo}, ${reply.replyWriter})"></i>
												</c:if>
											</div> 
											<c:if test="${memberLoggedIn.memberId == reply.replyWriter}">
												<div class="inline">
													<i title="수정" class="far fa-edit rclick"></i> <i title="삭제"
														class="fas fa-eraser rclick"
														onclick="deleteReply(${reply.replyNo})"></i>
												</div>
											</c:if> <br />
											<div style="font-size: 18px;">
												<strong>${reply.replyContent}</strong>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
						<br /><br /><br />
					</div>
				</div>
				<!-- contents end-->
			</div>
		</div>
	</section>
</div>
<!-- body end-->

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>

