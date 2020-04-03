<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<style>
#board-cancel {
	border-style: none;
	background-color: white;
}
</style>

<script>
	$(document).ready(function() {

		$("#boardCodeCreate").hide();
		/* '+'버튼을 누르면 게시판생성 폼이 나옴 */
		$("#add").click(function() {

			$("#boardCodeCreate").show();
		});

		/* 'x'아이콘을 누르면 숨김 */
		$("#board-cancel").click(function() {
			$("#boardCodeCreate").hide();
			$("[name=boardCode]").val("");
			$("[name=boardName]").val("");

		});
		
		$("#boardDelete").click(function(e){
			let confrim = confirm("삭제하시겠습니까?");
			
			if(confirm){
				location.href="${pageContext.request.contextPath}/admin/deleteBoard?boardCode="+boardCode;
			}
			else{
				e.stopPropagatioin();
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
			<li><a href="#">게시판 관리</a></li>
			<li class="active">게시판 목록</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">게시판 목록</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">

						<c:if test="${empty list }">
						<table>
							<tr>
								<td>생성된 게시물이 없습니다.</td>
							</tr>
						</table>
						</c:if>

						<c:if test="${not empty list }">
							<c:forEach items="${list }" var="list">
								<button type="button" class="btn btn-primary btn-lg btn-block"
									onclick="location.href='${pageContext.request.contextPath}/admin/boardList.do?boardCode=${list.boardCode}'">
									<i class='far fa-times-circle fa-lg' id="boardDelete"></i>&nbsp;&nbsp;${list.boardName}</button>
							</c:forEach>
						</c:if>

						<button type="button" class="btn btn-primary btn-lg btn-block" id="add">
							<i class="fa fa-plus"></i>
						</button>

						<div style='margin: 20px 0; text-align: center;'
							id='boardCodeCreate'>
							<form
								action='${pageContext.request.contextPath}/admin/insertBoard.do'
								method='POST' class='form-inline'>
								<button type='button' id='board-cancel' value='boardCodeCreate'>
									<i class='far fa-times-circle fa-lg'></i>
								</button>
								<div class='form-group'>
									<label for='boardCode'>게시판 코드</label><input type='text'
										class='form-control' style='margin: 0 10px;' name='boardCode'
										placeholder='게시판 코드' required>
								</div>
								<div class='form-group'>
									<label for='boardName'>게시판 이름</label><input type='text'
										class='form-control' style='margin: 0 10px;' name='boardName'
										placeholder='게시판 이름' required>
								</div>
								<button type='submit' class='btn btn-default'
									onclick="location.href='${pageContext.request.contextPath}/admin/board.do'">생성</button>
							</form>
						</div>


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

