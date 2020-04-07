<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="function"
	uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>




<style>
.list {
	position: relative;
	display: block;
	padding: 10px 40px;
	cursor: pointer;
}

.list : hover {
	text-decoration: none;
	background-color: #ffb71438;
}
</style>



<!-- alert 메세지 띄우기! -->
<c:if test="${not empty msg }">
	<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>
<%
	session.removeAttribute("msg");
%>

<script>
$(function(){
	$(".list").hide();
	$(".main").click(function(){
		 $(this).siblings(".list").slideUp(500);
		 $("."+$(this).attr("id")).slideDown(500);
	})
	
	$(".mlist").click(function(){
		let memail = $(this).text();
		$("input[name=emailto]").val(memail);
	})
	
	$(".alist").click(function(){
		let alist = $(this).text();
		$("input[name=emailto]").val(alist);
	})

	//실행과 무관한 오류입니다.
	let memberList = [
		<c:forEach items="${member}" var="m" varStatus="vs">
			"${m.email}"${not vs.last ? ", " : ""}
		</c:forEach>
	]
	$(".list.mlist.ALLM").click(()=>{
		$("input[name=emailto]").val(memberList.join(", "));
	})
	
	let adminList = [
		<c:forEach items="${admin}" var="a" varStatus="vs">
			"${a.email}"${not vs.last ? ", " : ""}
		</c:forEach>
	]
	$(".list.alist.ALLA").click(()=>{
		$("input[name=emailto]").val(adminList.join(", "));
	})
	
	$(".mphone").click(function(){
		let mphone = $(this).text();
		$("input[name=messageto]").val(mphone);
	});
	
	$(".aphone").click(function(){
		let aphone = $(this).text();
		$("input[name=messageto]").val(aphone);
	})
	
	let mphoneList = [
		<c:forEach items="${member}" var="mp" varStatus="vs">
			"${mp.phone}"${not vs.last ? ", " : ""}
		</c:forEach>
	]
	
	$(".list.mphone.ALLM").click(()=>{
		$("input[name=messageto]").val(mphoneList.join(", "));
	})
	
	let aphoneList = [
		<c:forEach items="${admin}" var="ap" varStatus="vs">
			"${ap.phone}"${not vs.last ? ", " : ""}
		</c:forEach>
	]
	
	$(".list.aphone.ALLA").click(()=>{
		$("input[name=messageto]").val(aphoneList.join(", "));
	})
	
});

</script>

<!-- admin index 선언 -->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			관리자 <small>페이지</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">메인</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>150</h3>
						<p>신규회원</p>
					</div>
					<div class="icon">
						<i class="ion ion-ios-people"></i>
					</div>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>
							53<sup style="font-size: 20px">명</sup>
						</h3>
						<p>오늘 접속자</p>
					</div>
					<div class="icon">
						<i class="ion ion-stats-bars"></i>
					</div>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>44</h3>
						<p>회원수</p>
					</div>
					<div class="icon">
						<i class="ion ion-person"></i>
					</div>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>665</h3>
						<p>총 접속자수</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->
		<!-- Main row -->
		<div class="row">
			<!-- Left col -->
			<section class="col-lg-6 connectedSortable">
				<!-- Custom tabs (Charts with tabs)-->

				<!-- quick email widget -->
				<div class="box box-info">
					<div class="box-header">
						<i class="fa fa-envelope"></i>
						<h3 class="box-title">단체 이메일</h3>
					</div>
					<div class="box-body">
						<form
							action="${pageContext.request.contextPath }/mail/mailSending"
							method="post" enctype="multipart/form-data">
							<div class="form-group">
								<input type="text" class="form-control" name="emailto"
									placeholder="받는 이:" />
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									placeholder="제목" />
							</div>
							<div class="form-group">
								<input type="file" class="form-control" name="file" />
							</div>
							<div>
								<textarea class="textarea" placeholder="내용" name="content"
									style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
							</div>
							<div>
								<input type="submit" class="pull-right btn btn-default"
									id="sendEmail" value="보내기" />
							</div>
							<br />
							<br />
						</form>
					</div>
				</div>

				<!-- message -->
				<div class="box box-success">

					<div class="box-header">
						<i class="fas fa-sms fa-2x"></i>
						<h3 class="box-title">단체 문자</h3>
					</div>

					<form action="#" method="post">
						<div class="box-body chat">
							<div class="form-group">
								<input type="text" class="form-control" name="messageto"
									placeholder="전화번호(문자받을 연락처를 입력하세요)" />
							</div>
						</div>

						<div>
							<div>
								<textarea class="message" placeholder="내용"
									style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
							</div>
						</div>
						<div class="box-footer clearfix">
							<input type="button" class="pull-right btn btn-default" id="sendEmail"
									onclick="sendSMS('sendSms')" value="보내기">
						</div>
					</form>
				</div>
				<!-- message end -->

			</section>
			<!-- /.Left col -->
			<!-- right col (We are only adding the ID to make the widgets sortable)-->
			<section class="col-lg-6 connectedSortable">
				<!-- 발송시 목록관리 -->
				<div class="box box-warning">
					<div class="box-header with-border">
						<i class="fas fa-user-tag fa-2x"></i>
						<h3 class="box-title">회원 목록(이메일)</h3>
					</div>
					<div class="box-body no-padding">
						<ul class="nav nav-pills nav-stacked">

							<li class="main" id="mlist"><a href="#"><i
									class="fa fa-users"></i>일반회원</a></li>
							<li class="list mlist ALLM">전체회원</li>
							<c:forEach items="${member}" var="member">
								<li class="list mlist">${member.email}</li>
							</c:forEach>

							<li class="main" id="alist"><a href="#"><i
									class="fa fa-user-secret"></i>관리자</a></li>
							<li class="list alist ALLA">전체회원</li>
							<c:forEach items="${admin}" var="admin">
								<li class="list alist">${admin.email}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 발송시 목록관리 끝!! -->
				<!-- 발송시 목록관리 -->
				<div class="box box-danger">
					<div class="box-header with-border">
						<i class="fas fa-user-tag fa-2x"></i>
						<h3 class="box-title">회원 목록(문자)</h3>
					</div>
					<div class="box-body no-padding">
						<ul class="nav nav-pills nav-stacked">

							<li class="main" id="mphone"><a href="#"><i
									class="fa fa-users"></i>일반회원</a></li>
							<li class="list mphone ALLM">전체회원</li>
							<c:forEach items="${member}" var="member">
								<li class="list mphone">${member.phone}</li>
							</c:forEach>

							<li class="main" id="aphone"><a href="#"><i
									class="fa fa-user-secret"></i>관리자</a></li>
							<li class="list aphone ALLA">전체회원</li>
							<c:forEach items="${admin}" var="admin">
								<li class="list aphone">${admin.phone}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 발송시 목록관리 끝!! -->
				<!-- Calendar -->
				<div class="box box-solid bg-green-gradient">
					<div class="box-header">
						<i class="fa fa-calendar"></i>
						<h3 class="box-title">달력</h3>
						<!-- tools box -->
						<div class="pull-right box-tools">
							<!-- button with a drop down -->
							<div class="btn-group">
								<button class="btn btn-success btn-sm dropdown-toggle"
									data-toggle="dropdown">
									<i class="fa fa-bars"></i>
								</button>
								<ul class="dropdown-menu pull-right" role="menu">
									<li><a href="#">Add new event</a></li>
									<li><a href="#">Clear events</a></li>
									<li class="divider"></li>
									<li><a href="#">View calendar</a></li>
								</ul>
							</div>
							<button class="btn btn-success btn-sm" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button class="btn btn-success btn-sm" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
						<!-- /. tools -->
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<!--The calendar -->
						<div id="calendar" style="width: 100%"></div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer text-black">
						<div class="row">
							<div class="col-sm-6">
								<!-- Progress bars -->
								<div class="clearfix">
									<span class="pull-left">Task #1</span> <small
										class="pull-right">90%</small>
								</div>
								<div class="progress xs">
									<div class="progress-bar progress-bar-green"
										style="width: 90%;"></div>
								</div>

								<div class="clearfix">
									<span class="pull-left">Task #2</span> <small
										class="pull-right">70%</small>
								</div>
								<div class="progress xs">
									<div class="progress-bar progress-bar-green"
										style="width: 70%;"></div>
								</div>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<div class="clearfix">
									<span class="pull-left">Task #3</span> <small
										class="pull-right">60%</small>
								</div>
								<div class="progress xs">
									<div class="progress-bar progress-bar-green"
										style="width: 60%;"></div>
								</div>

								<div class="clearfix">
									<span class="pull-left">Task #4</span> <small
										class="pull-right">40%</small>
								</div>
								<div class="progress xs">
									<div class="progress-bar progress-bar-green"
										style="width: 40%;"></div>
								</div>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
				</div>
				<!-- calendar 영역끝 -->
			</section>
			<!-- right col -->
		</div>
		<!-- /.row (main row) -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>
