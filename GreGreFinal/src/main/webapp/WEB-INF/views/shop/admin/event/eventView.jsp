<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/admin/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<!-- 게시판 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board/board.css">
<style>
.clickable:hover {color: red;}
.clickable, .rclick {cursor: pointer;}
.thumbs {
	display: inline-block;
	height: 30px;
	margin: 2px;
	padding: 0px;
	padding-top: 6px;
	border-radius: 10px;
	text-align: center;
}
#reply .inline {display: inline-block; padding: 0 10px;}
.recom {color: green; border: 1px solid green; min-width: 100px;}
.decom {color: blue; border: 1px solid blue; min-width: 100px;}
#modalBox {padding-right: 0px !important;}
body {padding-right: 0px !important;}
.page_wrap {text-align:center;}
.pg{display:inline-block; border:1px solid #ccc; min-width:30px;}
.page_nation a{
	display:block;
	margin:0 3px;
	float:left;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation span {
	display:block;
	margin:0 3px;
	float:left;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
.FDbtn {
	background: white;
	border: unset;
}
</style>

<!-- body begin-->
<div class="content-wrapper">
<div class="site-section" style="padding: 0px;">
	<div class="container" style="margin-top: 0px; max-width: 1440px;">
		<div class="row">
			<div class="col-lg-10">
				<!-- contents begin-->
				<div class="site-section" style="padding-top: 10px;">
					<div class="container" style="padding: 0px;">
						<div class="row">
							<div class="col-md-6">
								<span style="font-size: x-large">${e.eventTitle }</span>
								<form action="" id="postForm" method="POST">
									<input type="hidden" name="boardCode" value="${e.eventTitle}" />
									<input type="hidden" name="postNo" value="${e.eventTitle}" />
									<%-- <input type="hidden" name="writer" value="${memberLoggedIn.memberId}" /> --%>
									<input type="hidden" id="delRpl" name="replyNo" />
								</form>
							</div>
						</div>
						<table id="content" style="width: 100%;">
							<tr>
								<td style="width: 80%; text-align: left;">글 작성자 : 아이그레 ${e.eventNo }</td>
							</tr>
							<tr style="border-bottom : unset;">
								<td colspan="4" style="text-align: left; height: 300px;">${e.eventContent }</td>
							</tr>
							<%-- <c:if test="${post.originFilename != null}">
							<tr style="border-top: unset;">
								<td colspan="4" style="text-align: left;">
									<i class="fas fa-paperclip"></i>
									<button type="button" class="FDbtn" onclick="fileDownload('${post.originFilename}','${post.renameFilename}');"> ${post.originFilename}</button>
								</td>
							</tr>
							</c:if> --%>
							<tr>
								<td colspan="2" style="text-align: left;">
									<i title="목록으로" class="fas fa-clipboard-list clickable" onclick="location.href='${pageContext.request.contextPath}/shop/admin/event/event.do'"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
						<br /> <br />
						<table id="reply" style="width: 100%; text-align: left;">
							<c:if test="${replyCount == 0}">
								<tr><td>작성된 댓글이 없습니다. 첫 댓글을 작성해주세요!</td></tr>
							</c:if>
							<c:if test="${replyCount ge 1}">
							<input type="hidden" id="cPage" value="${cPage}" />
								<c:forEach items="${replyList}" var="reply">
									<tr>
										<td>
											<div class="inline" style="font-size: 12px;">${reply.replyWriter} / ${reply.replyWriteTime}</div>
											<div class="inline">
												<c:if test="${memberLoggedIn.memberId == reply.replyWriter}">
													<i class="far fa-thumbs-up"> ${reply.recommenCount}</i>&nbsp;&nbsp;
													<i class="far fa-thumbs-down"> ${reply.decommenCount}</i>&nbsp;&nbsp;
													<i title="신고" class="fas fa-exclamation-triangle"></i>
												</c:if>
												<c:if test="${memberLoggedIn.memberId != reply.replyWriter }">
													<i class="far fa-thumbs-up rclick" onclick="recom('${reply.replyNo}');">${reply.recommenCount}</i>&nbsp;&nbsp;
													<i class="far fa-thumbs-down rclick" onclick="decom('${reply.replyNo}');">${reply.decommenCount}</i>&nbsp;&nbsp;
													<i title="신고" class="fas fa-exclamation-triangle rclick" onclick="reportShow(${reply.replyNo}, ${reply.replyWriter})"></i>
												</c:if>
											</div>
											<c:if test="${memberLoggedIn.memberId == reply.replyWriter}">
												<div class="inline">
													<i title="수정" class="far fa-edit rclick Rmod" id="${reply.replyNo}"></i>
													<i title="삭제" class="fas fa-eraser rclick" onclick="deleteReply('${reply.replyNo}', '${reply.replyWriter}')"></i>
												</div>
											</c:if> <br />
											<div class="rplCon" style="font-size: 18px;"> <strong>${reply.replyContent}</strong></div>
											<div class="rplConM" style="display:none;"><input type="text" value="${reply.replyContent }" style="width:85%;"/><button class="rplModC">취소</button><button onclick="rplModify('${post.boardCode}','${post.postNo}', '${reply.replyNo}', this)">수정</button></div>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<tr style="border-bottom:unset;">
								<td>
									<input type="text" id="ReplyWrite" placeholder="댓글을 입력하세요." style="width: 88%;" />&nbsp;
									<button onclick="writeReply();">댓글 작성</button>
								</td>
							</tr>
						</table>
						<!-- 댓글 페이징 -->
						<div class="row page_wrap">
							<div class="col-md-12 page_nation">
								<!-- cPage -->
								<c:if test="${3 ge cPage}">
									<div class="Pg"><span>&lt;&lt;</span></div>
									<div class="Pg"><span>&lt;</span></div>
								</c:if>
								<c:if test="${3 lt cPage }">
									<div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=1">&lt;&lt;</a></div>
									<div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=${cPage-3}">&lt;</a></div>
								</c:if>
								
								<!-- endPage가 5 이하일때 -->
								<c:if test="${endPage le 5 }">
									<c:forEach begin="1" end="${endPage}" var="pNo">
										<c:if test="${pNo != cPage}"><div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=${pNo}">${pNo}</a></div></c:if>
										<c:if test="${pNo == cPage}"><div class="Pg active"><span>${pNo}</span></div></c:if>
									</c:forEach>
								</c:if>
								
								<!-- endPage가 5 초과일때 -->
								<c:if test="${endPage gt 5 }">
									<!-- cPage가 3 이하일때 -->
									<c:if test="${cPage le 3}">
										<c:forEach begin="1" end="5" var="pNo">
											<c:if test="${pNo != cPage}"><div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=${pNo}">${pNo}</a></div></c:if>
											<c:if test="${pNo == cPage}"><div class="Pg active"><span>${pNo}</span></div></c:if>
										</c:forEach>
									</c:if>
									<!--cPage가 endPage-2 이상일때 -->
									<c:if test="${cPage ge (endPage-2)}">
										<c:forEach begin="${endPage-4 }" end="${endPage }" var="pNo">
											<c:if test="${pNo != cPage}"><div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=${pNo}">${pNo}</a></div></c:if>
											<c:if test="${pNo == cPage}"><div class="Pg active"><span>${pNo}</span></div></c:if>
										</c:forEach>
									</c:if>
									<!--cPage가 3 초과 endPage-2 미만일때 -->
									<c:if test="${cPage gt 3 && cPage lt (endPage-2)}">
										<c:forEach begin="${cPage-2}" end="${cPage+2}" var="pNo">
											<c:if test="${pNo != cPage}"><div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=${pNo}">${pNo}</a></div></c:if>
											<c:if test="${pNo == cPage}"><div class="Pg active"><span>${pNo}</span></div></c:if>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${cPage ge endPage-2}">
									<div class="Pg"><span>&gt;</span></div>
									<div class="Pg"><span>&gt;&gt;</span></div>
								</c:if>
								<c:if test="${cPage lt endPage-2}">
									<div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=${cPage+3}">&gt;</a></div>
									<div class="Pg"><a href="${pageContext.request.contextPath}/board/postView?boardCode=${post.boardCode}&postNo=${post.postNo}&cPage=${endPage}">&gt;&gt;</a></div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- contents end-->
			</div>
		</div>
	</div>
</div>
<!-- body end-->


<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 170px;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<span style="font-size: 28px;"><strong>신고하기</strong></span>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" style="color: lightGray;">X</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="report" style="margin: 0px;">
					<input type="radio" name="reportContent" id="sub1" value="음란/성적인 내용" /><label for="sub1">&nbsp;음란/성적인 내용</label><br />
					<input type="radio" name="reportContent" id="sub2" value="폭력적/혐오스런 내용" /><label for="sub2">&nbsp;폭력적/혐오스런 내용</label><br />
					<input type="radio" name="reportContent" id="sub3" value="증오/악의적인 내용" /><label for="sub3">&nbsp;증오/악의적인 내용</label><br />
					<input type="radio" name="reportContent" id="sub4" value="정치적인 내용" /><label for="sub4">&nbsp;정치적인 내용</label><br />
					<input type="radio" name="reportContent" id="sub5" value="반사회적인 내용" /><label for="sub5">&nbsp;반사회적인 내용</label><br />
					<input type="radio" name="reportContent" id="sub6" value="아동학대" /><label for="sub6">&nbsp;아동학대</label><br />
					<input type="radio" name="reportContent" id="sub7" value="스팸/도배" /><label for="sub7">&nbsp;스팸/도배</label>
					<input type="hidden" name="reporterId" value="${memberLoggedIn.memberId }" />
					<input type="hidden" name="boardCode" value="${post.boardCode}" />
					<input type="hidden" name="postNo" value="${post.postNo}" />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="reportSubmit();">확인</button>
				<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
			</div>
		</div>
	</div>
</div>
</div>
         <!-- jQuery 2.1.3 -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/jQuery-2.1.3.min.js"></script>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>  
        
        <!-- Slimscroll -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- FastClick -->
        <script src='${pageContext.request.contextPath}/resources/js/admin/fastclick.min.js'></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/app.min.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/demo.js" type="text/javascript"></script>

<script>	
	function reportShow(replyNo, reporteeId) {
		if($("[name=reporterId]").val() == "") {
			alert("로그인 먼저 진행해주세요.");
			return;
		}
		let report = {
			boardCode : $("[name=boardCode]").val(),
			postNo : $("[name=postNo]").val(),
			replyNo : replyNo,
			reporterId : $("[name=reporterId]").val()
 		}
		$.ajax({
	 		url: "${pageContext.request.contextPath}/board/checkReport.ajax",
			data : report,
			type : "POST",
			success: function(data){
				if(data > 1) {
					$('#modalBox').modal('hide');
					alert("이미 신고하셨습니다.");
					return;
		  		}
	  		},
	  		error: function(x,s,e) {
				console.log(x,s,e);
				$('#modalBox').modal('hide');
				return;
			}
		});
		$('#modalBox').modal('show');
	}
	
	$('#closeModalBtn').on('click', function(){	
	  $('#modalBox').modal('hide');	
	});
	
	function reportSubmit() {
		  let report = {
				boardCode : $("[name=boardCode]").val(),
				postNo : $("[name=postNo]").val(),
				replyNo : replyNo,
				reporterId : $("[name=reporterId]").val(),
				reporteeId : reporteeId,
				reportContent : $("[name=reportContent]:checked").val()
		  }
		  $.ajax({
			  url: "${pageContext.request.contextPath}/board/submitReport.ajax",
				data : report,
				type : "POST",
				success: function(data){
					if(data>0) {
						alert("신고가 완료되었습니다.");
					}
					$('#modalBox').modal('hide');
				},
				error : function(x,s,e) {
					console.log(x,s,e);
				}
		  });
		  $("[name=reportContent]:checked").checked(false);
		  $('#modalBox').modal('hide');
	}
</script>

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
			eventNo : "${e.eventNo }",
			postNo : "${e.eventNo }",
			replyWriter : "${memberLoggedIn.memberId}",
			replyContent : $("#ReplyWrite").val()
	}
	$.ajax({
			url: "${pageContext.request.contextPath}/shop/admin/event/replyWrite.ajax",
			data: reply,
			type: "POST",
			success: function(data) {
				if(data>0)
					location.reload();
				else alert("댓글 작성에 실패했습니다.");
			},
			error : function(x,s,e) {
				alert("댓글 작성에 실패했습니다.");
				console.log(x,s,e);
			}
	});
}
function recom(replyNo) {
	if(!confirm("추천하시겠습니까?")) {
		return;
	}
	let recom = {
			memberId : "${memberLoggedIn.memberId}",
			boardCode : "${post.boardCode}",
			postNo : "${post.postNo}",
			replyNo : replyNo
	}
	$.ajax({
		url: "${pageContext.request.contextPath}/board/recom.ajax",
		data: recom,
		type: "POST",
		success: function(data) {
			if(data>0)
				location.reload();
			else alert("이미 추천/비추천한 상태입니다.");
		},
		error: function(x,s,e) {
			console.log(x,s,e);
		}
	});
}
function decom(replyNo) {
	if(!confirm("비추천하시겠습니까?")) {
		return;
	}
	let decom = {
			memberId : "${memberLoggedIn.memberId}",
			boardCode : "${post.boardCode}",
			postNo : "${post.postNo}",
			replyNo : replyNo
	}
	$.ajax({
		url: "${pageContext.request.contextPath}/board/decom.ajax",
		data: decom,
		type: "POST",
		success: function(data) {
			if(data>0)
				location.reload();
			else alert("이미 추천/비추천한 상태입니다.");
		},
		error: function(x,s,e) {
			console.log(x,s,e);
		}
	});
}
</script>
</c:if>

<script>
function deletePost() {
	if(!confirm("게시글을 삭제하시겠습니까?"))
		return;
	var pwd = prompt("게시글 암호를 입력하세요.");
	if(pwd != $("#postPwd").val()) {
		alert("암호가 잘못되었습니다.");
		return;
	}
	
	$("#postForm").attr("action", "deletePost.do")
				  .submit();
}
function deleteReply(replyNo, replyWriter) {
	if(!confirm("댓글을 삭제하시겠습니까?"))
		return;
	$("#delRpl").val(replyNo);
	$("#writer").val(replyWriter);
	$("#postForm").attr("action","deleteReply.do")
				.submit();
}
$(function() {
	$(".Rmod").click(function() {
		$(".rplConM").hide();
		$(".rplCon").show();
		$(this).parent().parent().children(".rplCon").hide();
		$(this).parent().parent().children(".rplConM").show();
	});
	$(".rplModC").click(function() {
		$(this).parent().hide();
		$(this).parent().parent().children(".rplCon").show();
	})
});
$(function() {
	var cPage = $("#cPage").val();
	console.log("cPage=", cPage);
	if(cPage != undefined && cPage > 1) {
		var offset = $("#reply").offset();
		console.log(offset);
		document.getElementById('reply').scrollIntoView();
	}
});
function fileDownload(oName, rName){
	oName = encodeURIComponent(oName);
	location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
}
function rplModify(boardCode, postNo, replyNo, e){
	var reply = {
			boardCode : boardCode,
			postNo : postNo,
			replyNo : replyNo,
			replyContent : $(e).parent().children("input").val()
	}
	$.ajax({
		url: "${pageContext.request.contextPath}/board/rplModify.ajax",
		data: reply,
		type: "POST",
		success: function() {
			location.reload();
		},
		error: function(x,s,e) {
			alert("댓글 수정 중 오류가 발생했습니다.");
			console.log(x,s,e);
		}
	});
}
function modPost() {
	if(!confirm("게시글을 수정하시겠습니까?"))
		return;
	var pwd = prompt("게시글 암호를 입력하세요.");
	if(pwd != $("#postPwd").val()) {
		alert("암호가 잘못되었습니다.");
		return;
	}
	$("#postForm").attr("action", "modifyPost.do").submit();
}
</script>

