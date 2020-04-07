<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<!-- board.css -->
<link href="${pageContext.request.contextPath}/resources/css/admin/board.css" rel="stylesheet" type="text/css" />

<style>
.searchvar{
	margin-left : 575px;
}
	
#postDelete, #noticeSave{
	margin: 0px 5px 4px 0px;
}

.choose2{
	margin-left : 32px !important;
}

</style>

//선택 게시글 삭제 script
<script>
$(function(){
	//전체선택 체크박스
	$("#all2").click(function(){
		if($("#all2").prop("checked")){
			$("input[name=choose]").prop("checked", true);
		}
		else {
			$("input[name=choose]").prop("checked", false);
		}
	});
	
	//전체체크에서 한개라도 빠지면 전체체크 해제
	$(".choose2").click(function(){
		let $choose2 = $(".choose2");
		let choolen = $choose2.length;
		let choolenChecked = $choose2.filter(":checked").length;
		
		$("#all2").prop("checked", choolen == choolenChecked);
	});
	
	$("#postDelete").click(function(){
		let boardConfirm = confirm("선택된 게시글을 삭제하시겠습니까?");
		
		if(boardConfirm) {
			let boardCodeArr = new Array(); //boardCode를 받을 컬렉션
			let postNoArr = new Array(); //postNo 받을 컬렉션
			
			$("input[class=choose2]:checked").each(function(){
				boardCodeArr.push($(this).attr("data-board"));
				postNoArr.push($(this).attr("data-post"));
			});
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/boardPostDelete.do",
				type : "post",
				data : { arr1 : boardCodeArr,
						 arr2 : postNoArr},
						
				success : function(data) {
					console.log(data);
					
					if(data.result < postNoArr.length){
						alert("게시글 삭제에 실패하였습니다.");
					}
					else
						location.reload();
				},
				error : function(x,s,e) {
					console.log(x,s,e);
				}
			})
		}
	})
});

//공지설정 script
$(function(){
	$("#noticeSave").click(function(){
		let nconfirm = confirm("선택건을 공지글로 설정하시겠습니까?");
		
		if(nconfirm) {
			let nboardCodeArr = new Array();
			let npostNoArr = new Array();
			
			$("input[class=choose2]:checked").each(function(){
				nboardCodeArr.push($(this).attr("data-board"));
				npostNoArr.push($(this).attr("data-post"));
			});
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/noticeUpdate.do",
				type : "post",
				data : { narr1 : nboardCodeArr,
						 narr2 : npostNoArr},
				
				success : function(data){
					if(data.result < npostNoArr.length){
						alert("공지설정에 실패하였습니다.");
					}
					else
						location.reload();
					},
				error : function(x,s,e) {
					console.log(x,s,e);
				}				
			})
			
		}
	});
	
});


</script>

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
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">${board.boardName }</h3>
					</div>
					<!-- /.box-header -->

					<div class="box-body">
						<div class="row">
							<div class="col-md-6">
								<span>총 ${postCount} 개</span>
							</div>
						<div class="col-md-6" style="text-align: right; padding-right: 3px;">
							<button id="postDelete" type="button">삭제</button>
							<button id="noticeSave" type="button">공지설정</button>
						</div>
					</div>
						<div class="row" style="display: grid; margin-bottom: 20px;">
							<table>
								<tr>
									<th style="width:110px;">선택&nbsp;&nbsp;<input type="checkbox" name="all" id="all2"/></th>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>공지여부</th>
								</tr>

								<c:if test="${empty list }">
									<tr>
										<td colspan="6">등록된 게시글이 없습니다.</td>
									</tr>
								</c:if>

								<c:if test="${not empty list }">
									<c:forEach items="${list }" var="list" begin="0" varStatus="vs">
										<tr>
											<td><input type="checkbox" name="choose" class="choose2" data-board="${list.boardCode }" data-post="${list.postNo }"/></td>
											<td>${vs.count }</td>
											<td><a href="${pageContext.request.contextPath}/admin/postView.do?boardCode=${list.boardCode}&postNo=${list.postNo}">${list.title }</a></td>
											<td>${list.writer }</td>
											<td>${list.postWriteTime }</td>
											<td>${list.readCount }</td>
											<td>${list.notice }</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						
						<!-- 페이징바 영역 -->
						<div class="searchvar">
							<form action="${pageContext.request.contextPath}/admin/boardList.do" method="GET">
								<input type="hidden" name="boardCode" value="${board.boardCode }" />
								<input type="text" name="search" style="width: 400px;" />&nbsp;
								<button type="submit" id="searchAll" style="width: 80px;">검색</button>
							</form>
						</div>
						<br />
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>
