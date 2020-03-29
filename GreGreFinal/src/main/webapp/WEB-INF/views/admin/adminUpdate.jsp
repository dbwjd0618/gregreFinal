<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                	 관리자관리
                    <small>관리자 정보수정</small>
                </h1>
                <ol class="breadcrumb">
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
                                <h3 class="box-title">관리자 정보수정</h3>
                            </div><!-- /.box-header -->
                            <!-- form start -->
                            <form action="${pageContext.request.contextPath}/admin/adminUpdate.do" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="memberid">아이디</label>
                                        <input type="text" class="form-control" name="memberId" id="memberid" value="${adminLoggedIn.adminId }" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberpassword">비밀번호</label>
                                        <input type="password" class="form-control" name="memberPwd" id="memberpassword" value="${adminLoggedIn.adminPwd }"
                                            placeholder="변경할 비밀번호를 입력하세요" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="membername">이름</label>
                                        <input type="text" class="form-control" name="memberName" id="memberName" value="${adminLoggedIn.adminName }" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberemail">이메일</label>
                                        <input type="email" class="form-control" name="email" id="memberemail" value="${adminLoggedIn.email }"
                                        	placeholder="변경할 이메일을 입력하세요" >
                                    </div>
                                    <div class="form-group">
                                        <label for="membernickname">닉네임</label>
                                        <input type="text" class="form-control" name="nickname" id="membernickname" value="${adminLoggedIn.nickname }"
                                            placeholder="변경할 닉네임을 입력하세요" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberbirthday">생년월일</label>
                                        <input type="date" class="form-control" name="birthday" id="memberbirthday" value="1999-05-03" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberphone">전화번호</label>
                                        <input type="text" class="form-control" name="phone" id="memberphone" value="${adminLoggedIn.phone }"
                                            placeholder="변경할 전화번호를 입력하세요" >
                                    </div>
                                    <div class="form-group">
                                        <label for="memberaddress">주소</label>
                                        <input type="text" class="form-control" name="address" id="memberaddress" value="${adminLoggedIn.address }"
                                            placeholder="변경할 주소를 입력하세요" >
                                    </div>
                                    <div class="form-group">
                                        <label for="membergender">성별</label>
                                        <div>
                                            <input type="radio" name="gender" value="M" ${adminLoggedIn.gender eq 'M'?'checked':'' }>남
                                            <input type="radio" name="gender" value="F" ${adminLoggedIn.gender eq 'F'?'checked':'' }>여
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
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>







