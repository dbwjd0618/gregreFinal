<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                        <input type="text" class="form-control" id="memberid" value="test" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberpassword">비밀번호</label>
                                        <input type="password" class="form-control" id="memberpassword"
                                            placeholder="변경할 비밀번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="memberemail">이메일</label>
                                        <input type="email" class="form-control" id="memberemail" value="test@naver.com"
                                            disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="membernickname">닉네임</label>
                                        <input type="text" class="form-control" id="membernickname" value="테스트 이지롱~"
                                            placeholder="변경할 닉네임을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="memberbirthday">생년월일</label>
                                        <input type="date" class="form-control" id="memberbirthday" value="1999-05-03"
                                            disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="memberphone">전화번호</label>
                                        <input type="email" class="form-control" id="memberphone" value="010-1234-1234"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="memberaddress">주소</label>
                                        <input type="text" class="form-control" id="memberaddress" value="서울시 강남구 역삼동"
                                            placeholder="변경할 주소를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="membergender">성별</label>
                                        <div>
                                            <input type="radio" name="gender" value="M" checked>남
                                            <input type="radio" name="gender" value="F">여
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







