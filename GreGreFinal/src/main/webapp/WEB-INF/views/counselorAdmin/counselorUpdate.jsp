<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/counselorAdmin/common/header.jsp"%>

<!-- alert 메세지 띄우기! -->
<c:if test="${not empty msg }">
<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>


<div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                	 상담사 관리
                    <small>상담사정보수정</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">상담 사 관리</a></li>
                    <li class="active">상담사정보수정</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6" style="margin: 0 auto; float:none">
                        <!-- general form elements -->
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">정보수정</h3>
                            </div><!-- /.box-header -->
                            <!-- form start -->
                            <form action="${pageContext.request.contextPath}/counselorAdmin/counselorUpdate.do" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="advisId">아이디</label>
                                        <input type="text" class="form-control" name="advisId" id="counselorId" value="${counselor.advisId }" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="advisName">이름</label>
                                        <input type="text" class="form-control" name="advisName" id="counselorName" value="${counselor.advisName }">
                                    </div>
                                    <div class="form-group">
                                        <label for="advisCareer">경력</label>
                                        <input type="text" class="form-control" name="advisCareer" id="counselorCareer" value="${counselor.advisCareer }"
                                            placeholder="변경된 경력사항을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="advisLicense">자격증</label>
                                        <input type="text" class="form-control" name="advisLicense" id="counselorLisense" value="${counselor.advisLicense }" 
                                        	placeholder="변경된 자격사항을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="advisPrice">상담가격</label>
                                        <input type="number" class="form-control" name="advisPrice" id="counselorPrice" value="${counselor.advisPrice }"
                                            placeholder="변경할 상담금액을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="membergender">성별</label>
                                        <div>
                                            <input type="radio" name="advisGender" value="M" ${counselor.advisGender eq 'M'?'checked':'' }>남
                                            <input type="radio" name="advisGender" value="F" ${counselor.advisGender eq 'F'?'checked':'' }>여
                                        </div>
                                    </div>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary">수정</button>
                                </div>
                            </form>
                        </div><!-- /.box -->
                    </div>
                    <!--/.col (left) -->
                </div> <!-- /.row -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/counselorAdmin/common/footer.jsp"%>







