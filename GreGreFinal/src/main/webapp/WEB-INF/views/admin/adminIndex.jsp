<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

  <!-- alert 메세지 띄우기! -->
<c:if test="${not empty msg }">
<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>
<% session.removeAttribute("msg"); %>


<!-- admin index 선언 -->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			관리자 <small>페이지</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="./index.html"><i class="fa fa-dashboard"></i>
					Home</a></li>
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
			<section class="col-lg-7 connectedSortable">
				<!-- Custom tabs (Charts with tabs)-->

				<!-- Chat box -->
				<div class="box box-success">
					<div class="box-header">
						<i class="fa fa-comments-o"></i>
						<h3 class="box-title">1:1 문의</h3>
						<div class="box-tools pull-right" data-toggle="tooltip"
							title="Status">
							<div class="btn-group" data-toggle="btn-toggle">
								<button type="button" class="btn btn-default btn-sm active">
									<i class="fa fa-square text-green"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-square text-red"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="box-body chat" id="chat-box">
						<!-- chat item -->

						<!-- chat item -->

					</div>
					<!-- /.chat -->
					<div class="box-footer">
						<div class="input-group">
							<input class="form-control" placeholder="내용을 입력하세요..." />
							<div class="input-group-btn">
								<button class="btn btn-success">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box (chat box) -->

				<!-- quick email widget -->
				<div class="box box-info">
					<div class="box-header">
						<i class="fa fa-envelope"></i>
						<h3 class="box-title">단체 이메일</h3>
						<!-- tools box -->
						<div class="pull-right box-tools">
							<button class="btn btn-info btn-sm" data-widget="remove"
								data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
						<!-- /. tools -->
					</div>
					<div class="box-body">
						<form action="#" method="post">
							<div class="form-group">
								<input type="email" class="form-control" name="emailto"
									placeholder="받는 이:" />
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									placeholder="제목" />
							</div>
							<div>
								<textarea class="textarea" placeholder="내용"
									style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
							</div>
						</form>
					</div>
					<div class="box-footer clearfix">
						<button class="pull-right btn btn-default" id="sendEmail">
							보내기 <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
				</div>

			</section>
			<!-- /.Left col -->
			<!-- right col (We are only adding the ID to make the widgets sortable)-->
			<section class="col-lg-5 connectedSortable">

				<!-- Calendar -->
				<div class="box box-solid bg-green-gradient">
					<div class="box-header">
						<i class="fa fa-calendar"></i>
						<h3 class="box-title">달력</h3>
						<!-- tools box -->
						<div class="pull-right box-tools">
							<!-- button with a dropdown -->
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
				<!-- /.box -->

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
