<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/councelorAdmin/common/header.jsp"%>

<!-- <style>
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
</style> -->


<!-- alert 메세지 띄우기! -->
<c:if test="${not empty msg }">
<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>



<!-- admin index 선언 -->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			상담사 관리자 <small>페이지</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/">
			<i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">메인</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Main row -->
		<div class="row">
			<section class="col-lg-6 connectedSortable">
			</section>
			<section class="col-lg-6 connectedSortable">
			</section>
		</div>
		<!-- /.row (main row) -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/councelorAdmin/common/footer.jsp"%>
