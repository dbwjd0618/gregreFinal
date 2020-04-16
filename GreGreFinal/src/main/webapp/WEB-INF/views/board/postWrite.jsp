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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/board.css">

<!--서브메뉴 js-->
<script src="${pageContext.request.contextPath }/resources/js/subMenu/subMenu.js"></script>

<script>
$(function() {
	$("#originFilename").on("change", function() {
		$("#UFlabel").hide();
	});
});
</script>

<style>
.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
}
</style>

<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('${pageContext.request.contextPath}/resources/images/board/board.png');">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">커뮤니티</h1>
					<p>
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a>
						<span class="mx-3">/</span>
						<strong>게시판</strong>
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
					<div class="container" style="margin-top: 0px;">
						<div class="row">
							<div class="col-md-6">
								<span style="font-size: x-large">게시글 작성</span>
							</div>
						</div>
						<form action="postWrite.do" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="boardCode" value="${boardCode}"/>
							<input type="hidden" name="postNo" value="0" />
							<input type="hidden" name="writer" value="${memberLoggedIn.memberId}" />
							<table id="content" style="width: 100%;">
								<tr>
									<td style="text-align:left;">
										<input type="text" name="title" placeholder="제목을 입력하세요." style="width: 80%;" />
										<input type="text" name="postPwd" placeholder="게시글 암호" style="width:19%;" maxlength="4"/>
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" name="content" style="width: 100%; min-height: 300px;" placeholder="내용을 입력하세요." />
									</td>
								</tr>
								<tr>
									<td style="text-align:left;">
										<input type="file" name="upFile" id="originFilename"/>
										<label for="originFilename" id="UFlabel" style="left: -241px; position: relative; background: white;">파일을 선택하세요.</label>
									</td>
								</tr>
								<tr style="border-bottom: unset;">
									<td>
										<button>글쓰기</button>&nbsp;
										<button type="button" onclick="location.href='postList?boardCode=${boardCode}'">취소</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<!-- contents end-->
			</div>
		</div>
	</div>
</div>
<!-- contents end-->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />