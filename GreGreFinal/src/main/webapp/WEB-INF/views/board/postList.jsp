<%@page import="java.util.ArrayList"%>
<%@page import="kh.mclass.Igre.member.model.vo.Member"%>
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
<style>
.Pg {
	display: inline-block;
	background: lightgray;
	min-width:30px;
	width: auto;
	text-align: center;
	border : 3px solid gray;
}
.CPg:hover {cursor: pointer; background: aqua;}
</style>
<%
	Member m = (Member)session.getAttribute("memberLoggedIn");
	if(m != null) {
		String boardCode = (String)request.getAttribute("boardCode");
		if(m.getPrefList().containsKey(boardCode)) {
			ArrayList<Integer> prefer = m.getPrefList().get(boardCode);
			pageContext.setAttribute("prefList", prefer);
		}
	}
%>
<script>
function preferSwitch(it, mi, bc, pn) {
	let prefer = {
			memberId : mi,
			boardCode : bc,
			postNo : pn
	}
	if($(it).attr('class') == 'Gray') {
		$.ajax({
			url:"${pageContext.request.contextPath}/board/preferIn.ajax",
			data: prefer,
			type:"POST",
			success : function(){
				$(it).attr('src',"${pageContext.request.contextPath}/resources/img/board/StarYellow.png")
					 .attr('class', 'Yellow');
			},
			error: function(x,s,e){
				alert("오류가 발생했습니다. 새로고침 후 다시 실행해 주십시오.");
			}
		});
	}
	else {
		$.ajax({
			url:"${pageContext.request.contextPath}/board/preferOut.ajax",
			data: prefer,
			type:"POST",
			success : function(){
				$(it).attr('src',"${pageContext.request.contextPath}/resources/img/board/StarGray.png")
			 	 .attr('class', 'Gray');
			},
			error: function(){
				alert("오류가 발생했습니다. 새로고침 후 다시 실행해 주십시오.");
			}
		});
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
								<i class="fas fa-pencil-alt" style="color:blue; cursor:pointer;" onclick="location.href='postWrite.do?boardCode=${boardCode}'"></i>
							</div>
						</div>
						<div class="row" style="display: grid; margin-bottom: 20px;">
							<table>
								<tr>
									<th style="width:5%;">번호</th>
									<th>제목</th>
									<th style="width:10%;">작성자</th>
									<th style="width:15%;">작성날짜</th>
									<th style="width:10%;">조회수</th>
									<th style="width:5%;"></th>
								</tr>
								<c:if test="${empty postList}">
								<tr>
									<td colspan="5">게시글이 존재하지 않습니다.</td>
								</tr>
								</c:if>
								<c:if test="${not empty postList}">
									<c:forEach items="${postList}" var="post">
										<tr>
											<td>${post.postNo}</td>
											<td><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}">${post.title}</a>
												<c:if test="${post.originFilename != null}"><i class="fas fa-paperclip"></i></c:if>
											</td>
											<td>${post.writer}</td>
											<td>${post.postWriteTime}</td>
											<td>${post.readCount}</td>
											<td>
												<c:if test="${memberLoggedIn == null }">
													<img src="${pageContext.request.contextPath}/resources/img/board/StarGray.png" class="Gray" style="width:21px;"/>
												</c:if>
												<c:if test="${memberLoggedIn != null }">
													<img src="${pageContext.request.contextPath}/resources/img/board/Star${prefList.contains(post.postNo)?'Yellow':'Gray'}.png" class="${prefList.contains(post.postNo)?'Yellow':'Gray'}" style="width:21px;" onclick="preferSwitch(this,'${memberLoggedIn.memberId}', '${post.boardCode}', '${post.postNo}');"/>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<!-- 게시글 페이징 -->
						<div class="row">
							<div class="col-md-12" style="text-align:center;">
								<!-- cPage -->
								<c:if test="${3 ge cPage}">
									<div class="Pg"><span>&lt;&lt;</span></div>
									<div class="Pg"><span>&lt;</span></div>
								</c:if>
								<c:if test="${3 lt cPage }">
									<div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=1">&lt;&lt;</a></div>
									<div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=${cPage-3}">&lt;</a></div>
								</c:if>
								
								<!-- endPage가 5 이하일때 -->
								<c:if test="${endPage le 5 }">
									<c:forEach begin="1" end="${endPage}" var="pNo">
										<c:if test="${pNo != cPage}"><div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=${pNo}">${pNo}</a></div></c:if>
										<c:if test="${pNo == cPage}"><div class="Pg"><span>[${pNo}]</span></div></c:if>
									</c:forEach>
								</c:if>
								
								<!-- endPage가 5 초과일때 -->
								<c:if test="${endPage gt 5 }">
									<!-- cPage가 3 이하일때 -->
									<c:if test="${cPage le 3}">
										<c:forEach begin="1" end="5" var="pNo">
											<c:if test="${pNo != cPage}"><div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=${pNo}">${pNo}</a></div></c:if>
											<c:if test="${pNo == cPage}"><div class="Pg"><span>[${pNo}]</span></div></c:if>
										</c:forEach>
									</c:if>
									<!--cPage가 endPage-2 이상일때 -->
									<c:if test="${cPage ge (endPage-2)}">
										<c:forEach begin="${endPage-4 }" end="${endPage }" var="pNo">
											<c:if test="${pNo != cPage}"><div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=${pNo}">${pNo}</a></div></c:if>
											<c:if test="${pNo == cPage}"><div class="Pg"><span>[${pNo}]</span></div></c:if>
										</c:forEach>
									</c:if>
									<!--cPage가 3 초과 endPage-2 미만일때 -->
									<c:if test="${cPage gt 3 && cPage lt (endPage-2)}">
										<c:forEach begin="${cPage-2}" end="${cPage+2}" var="pNo">
											<c:if test="${pNo != cPage}"><div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=${pNo}">${pNo}</a></div></c:if>
											<c:if test="${pNo == cPage}"><div class="Pg"><span>[${pNo}]</span></div></c:if>
										</c:forEach>
									</c:if>
								</c:if>
								
								<c:if test="${cPage ge endPage-2}">
									<div class="Pg"><span>&gt;</span></div>
									<div class="Pg"><span>&gt;&gt;</span></div>
								</c:if>
								<c:if test="${cPage lt endPage-2}">
									<div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=${cPage+3}">&gt;</a></div>
									<div class="Pg CPg"><a href="${pageContext.request.contextPath}/board/postList?boardCode=${boardCode}&cPage=${endPage}">&gt;&gt;</a></div>
								</c:if>
							</div>
						</div>
						<br /><br />
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