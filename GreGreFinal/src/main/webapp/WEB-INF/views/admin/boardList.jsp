<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<!-- board.css -->
<link href="${pageContext.request.contextPath}/resources/css/admin/board.css" rel="stylesheet" type="text/css" />


<style>
.searchvar{
	margin-left : 465px;
}

</style>



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
								<span>총 6건</span>
							</div>
						<div class="col-md-6"
							style="text-align: right; padding-right: 3px;">
							<button style="width: 100px"
								onclick="location.href='postWrite.html'">게시글 삭제</button>
						</div>
					</div>
						<br />


						<div class="row" style="display: grid; margin-bottom: 20px;">
							<table>
								<tr>
									<th>선택</th>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>공지 설정</th>
								</tr>

								<c:if test="${empty list }">
									<tr>
										<td colspan="6">등록된 게시글이 없습니다.</td>
									</tr>
								</c:if>

								<c:if test="${not empty list }">
									<c:forEach items="${list }" var="list" begin="0" varStatus="vs">
										<tr>
											<td><input type="checkbox" name="choose" /></td>
											<td>${vs.count }</td>
											<td><a href="#">${list.title }</a></td>
											<td>${list.writer }</td>
											<td>${list.postWriteTime }</td>
											<td>${list.readCount }</td>
											<td><input type='checkbox' name='notice' value='ok' /></td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						
						<!-- 페이징바 영역 -->
						<div class="searchvar">
							<div class="col-md-12">
								<select>
									<option value="title" >제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select>
								&nbsp;
									<input type="text" style="width: 500px;" />&nbsp;
									<button style="width: 80px;">검색</button>
							</div>
							<div class="col-md-12">
							</div>
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
