<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/counselorAdmin/common/header.jsp"%>

<script>
function athorityUpdate(){
	return confirm("권한을 부여하시겠습니까?");
}

</script>

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			관리자 관리 <small>관리자 권한</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">관리자 권한</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-6" style="margin: 0 auto; float: none">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">관리자 권한</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form action="${pageContext.request.contextPath}/counselorAdmin/athorityUpdate.do" method="POST" onsubmit="return athorityUpdate();">
						<div class="box-body">
							<div class="form-group">
								<label for="memberid">아이디</label> <input type="text"
									class="form-control" id="memberid" name="memberId" value="${member.memberId }" readonly>
							</div>
							<div class="form-group">
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control" id="memberNickname" name="nickname" value="${member.nickname }" readonly>
							</div>
							<div class="form-group">
								<label for="memberemail">이메일</label> <input type="email"
									class="form-control" id="memberemail" name="email" value="${member.email }" readonly>
							</div>
							<div class="form-group">
								<label for="memberAuthor">회원 권한</label>
								<div>
									<input type="radio" name="grade" value="A" ${member.grade eq 'A'?"checked":"" }>관리자 
									<input type="radio" name="grade" value="M" ${member.grade eq 'M'?"checked":"" }>일반 유저
								</div>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">권한 부여</button>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/counselorAdmin/common/footer.jsp"%>