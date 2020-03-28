<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<style>
.reportDelete{
	float: right;
	margin-bottom: 5px;
}
	
#one2{
    margin-left: 40px;
}
</style>

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
          	<button class="reportDelete" type="submit" onclick="${pageContext.request.contextPath}/admin/reportDelete.do" >삭제</button>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">신고 게시물</h3>
                  <div class="box-tools">
                    <div class="input-group">
                      <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="검색"/>
                      <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                <!-- form 작성 -->
                <form action="${pageContext.request.contextPath}/admin/report.do" method="post">
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>선택&nbsp;&nbsp;&nbsp; <input type="checkbox" name="all" id="all2" class="form-check-input" value="A"/></th>
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
							<td colspan="7">신고된 게시글이 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${not empty list}">
						<c:forEach items="${list }" var="list" begin="0" varStatus="vs">
							<tr>
								<td><input type="checkbox" name="one" id="one2" class="form-check-input" value="A"/></td>
								<td>${vs.count}</td>
								<td>${list.reporterId }</td>
								<td>${list.boardName }</td>
								<td>${list.postNo }</td>
								<td>${list.reporteeId }</td>
								<td>${list.reportContent }</td>
								<td>${list.reportConf }</td>
							</tr>
						</c:forEach>
					</c:if>
                    
                  </table>
                </div><!-- /.box-body -->
                </form><!-- 게시판 폼 -->
              </div><!-- /.box -->
            </div>
          </div>
          <button class="reportDelete" type="button">삭제</button>
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">신고 댓글</h3>
                  <div class="box-tools">
                    <div class="input-group">
                      <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                      <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                    	<th>선택</th>
                        <th>신고번호</th>
                        <th>신고자</th>
                        <th>신고 게시판</th>
                        <th>신고 게시글 번호</th>
                        <th>신고 댓글 번호</th>
                        <th>댓글 작성자</th>
                        <th>신고 내용</th>
                        <th>신고 처리</th>
                    </tr>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
          </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>