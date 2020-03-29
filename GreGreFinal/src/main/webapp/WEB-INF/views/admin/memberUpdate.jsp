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
                	 회원관리
                    <small>회원정보수정</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">회원관리</a></li>
                    <li class="active">회원정보수정</li>
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
                            <form action="${pageContext.request.contextPath}/admin/memberUpdate.do" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="memberid">아이디</label>
                                        <input type="text" class="form-control" name="memberId" id="memberid" value="${amember.memberId }" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberpassword">비밀번호</label>
                                        <input type="password" class="form-control" name="memberPwd" id="memberpassword" value="${amember.memberPwd }"
                                            placeholder="변경할 비밀번호를 입력하세요" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="membername">이름</label>
                                        <input type="text" class="form-control" name="memberName" id="memberName" value="${amember.memberName }" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberemail">이메일</label>
                                        <input type="email" class="form-control" name="email" id="memberemail" value="${amember.email }"
                                        	placeholder="변경할 이메일을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="membernickname">닉네임</label>
                                        <input type="text" class="form-control" name="nickname" id="membernickname" value="${amember.nickname }"
                                            placeholder="변경할 닉네임을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="memberbirthday">생년월일</label>
                                        <input type="date" class="form-control" name="birthday" id="memberbirthday" value="1999-05-03" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberphone">전화번호</label>
                                        <input type="text" class="form-control" name="phone" id="memberphone" value="${amember.phone }"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="memberaddress">주소</label>
                                        <input type="text" class="form-control" name="address" id="memberaddress" value="${amember.address }"
                                            placeholder="변경할 주소를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="membergender">성별</label>
                                        <div>
                                            <input type="radio" name="gender" value="M" ${amember.gender eq 'M'?'checked':'' }>남
                                            <input type="radio" name="gender" value="F" ${amember.gender eq 'F'?'checked':'' }>여
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







