<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<style>
#postDelete, #replyDelete{
	float: right;
	margin-bottom: 5px;
}
	
.one2{
    margin-left: 40px !important;
}

.reone2{
    margin-left: 40px !important;
}
</style>

//신고 게시글 script
<script>
//$(document).ready(function())
$(function(){
	
	$("#all2").click(function(){
		if($("#all2").prop("checked")){
			$("input[name=one]").prop("checked", true);
		}
		else {
			$("input[name=one]").prop("checked", false);
		}
	});
	
	$(".one2").click(function(){
		let $one2 = $(".one2");
		let len = $one2.length;
		let lenChecked = $one2.filter(":checked").length;
		
		$("#all2").prop("checked", len == lenChecked);
	})
	
	$("#postDelete").click(function(){
		let rconfirm = confirm("신고건을 처리하시겠습니까?");
		
		if(rconfirm) {
			let boardArr = new Array(); //boardCode 받을 컬렉션 
			let postArr = new Array(); //postNo 받을 컬렉션
			
			//여기서 this는 function을 발동시키는 (class='one2':checked) 객체를 뜻한다. 
			$("input[class='one2']:checked").each(function(){
				boardArr.push($(this).attr("data-board"));
				postArr.push($(this).attr("data-post"));
			});
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/postDelete.do",
				type : "post",
				data : { arr1 : boardArr,
						 arr2 : postArr},
					
				success : function(data){
					console.log(data);
					
					if(data.result < postArr.length){
						alert("신고처리에 실패하였습니다.");
					}
					else
						//새로고침
						location.reload();
				},
				error : function(x,s,e) {
					console.log(x,s,e);
				}
			});
		}
	});
});


//신고 댓글 script
$(function(){
	
	$("#reall2").click(function(){
		if($("#reall2").prop("checked")){
			$("input[name=reone]").prop("checked", true);
		}
		else{
			$("input[name=reone]").prop("checked", false);
		}
	});
	
	$(".reone2").click(function(){
		let $reone2 = $(".reone2");
		let relen = $reone2.length;
		let relenChecked = $reone2.filter(":checked").length;
		
		$("#reall2").prop("checked", relen == relenChecked);
	});
	
	$("#replyDelete").click(function(){
		let reconfirm = confirm("신고건을 처리하시겠습니까?");
		
		if(reconfirm) {
			let reboardArr = new Array(); //게시판 코드를 받을 컬렉션
			let repostArr = new Array(); //게시판 번호를 받을 컬렉션
			let replyArr = new Array(); //댓글 번호를 받을 컬렉션
			
			$("input[class='reone2']:checked").each(function(){
				reboardArr.push($(this).attr("data-reboard"));
				repostArr.push($(this).attr("data-repost"));
				replyArr.push($(this).attr("data-reply"));
			});
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/replyDelete.do",	
				type : "post",
				data : { rearr1 : reboardArr, 
						 rearr2 : repostArr, 
						 rearr3 : replyArr},
						 
				success : function(data){
					console.log(data);
					
					if(data.result < repostArr.length){
						alert("신고처리에 실패하였습니다.");
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




</script>

<!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>신고 내역</h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">신고</a></li>
            <li class="active">신고 내역</li>
          </ol>
          	<br />
          	<button id="postDelete" type="button">처리</button>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">신고 게시물</h3>
                </div><!-- /.box-header -->
                <!-- form 작성 -->
                <form action="${pageContext.request.contextPath}/admin/report.do" method="post">
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>선택&nbsp;&nbsp;&nbsp; <input type="checkbox" name="all" id="all2" class="form-check-input" /></th>
                      <th>신고번호</th>
                      <th>신고자</th>
                      <th>신고 게시판</th>
                      <th>신고 게시글 번호</th>
                      <th>게시글 작성자</th>
                      <th>신고 내용</th>
                      <th>신고 처리</th>
                    </tr>
                    
                    <c:if test="${empty list }">
						<tr>
							<td colspan="8">신고된 게시글이 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${not empty list}">
						<% int i = 0; %>
						<c:forEach items="${list }" var="list" begin="0" varStatus="vs">
							<c:if test="${list.reportReplyNo == 0 && list.reportConf=='N'}">
							<tr>
								<td><input type="checkbox" name="one" class="one2" data-board="${list.boardCode }" data-post="${list.reportPostNo }"/></td>
								<td><%= ++i %></td>
								<td>${list.reporterId }</td>
								<td>${list.boardName }</td>
								<td>${list.reportPostNo } </td>
								<td>${list.reporteeId }</td>
								<td>${list.reportContent }</td>
								<td>${list.reportConf }</td>
							</tr>
							</c:if>
						</c:forEach>
							<%if(i==0) { %>
								<tr>
									<td colspan="8"> 처리할 신고건이 없습니다.</td>
								</tr>
							<%} %>
					</c:if>
                    
                  </table>
                </div><!-- /.box-body -->
                </form><!-- 게시판 폼 -->
              </div><!-- /.box -->
            </div>
          </div>
          <button id="replyDelete" type="button">처리</button>
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">신고 댓글</h3>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                    	<th>선택&nbsp;&nbsp;&nbsp; <input type="checkbox" name="reall" id="reall2" class="form-check-input" /></th>
                        <th>신고번호</th>
                        <th>신고자</th>
                        <th>신고 게시판</th>
                        <th>신고 게시글 번호</th>
                        <th>신고 댓글 번호</th>
                        <th>댓글 작성자</th>
                        <th>신고 내용</th>
                        <th>신고 처리</th>
                    </tr>
                    
                    <c:if test="${empty list }">
						<tr>
							<td colspan="9">신고된 댓글이 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${not empty list}">
					<% int j = 0; %>
						<c:forEach items="${list }" var="list" begin="0" varStatus="vs">
							<c:if test="${list.reportReplyNo != 0 && list.reportConf=='N'}">
							<tr>
								<td><input type="checkbox" name="reone" class="reone2" data-reboard="${list.boardCode }" 
									       data-repost="${list.reportPostNo }" data-reply="${list.reportReplyNo}"/></td>
								<td><%= ++j %></td>
								<td>${list.reporterId }</td>
								<td>${list.boardName }</td>
								<td>${list.reportPostNo }</td>
								<td>${list.reportReplyNo }</td>
								<td>${list.reporteeId }</td>
								<td>${list.reportContent }</td>
								<td>${list.reportConf }</td>
							</tr>
							</c:if>
						</c:forEach>
							<%if(j==0) { %>
								<tr>
									<td colspan="9"> 처리할 신고건이 없습니다.</td>
								</tr>
							<%} %>
					</c:if>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
          </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>