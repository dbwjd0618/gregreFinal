<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/shop/admin/common/header.jsp"%>

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
                             
                            </div><!-- /.box-header -->
                            <!-- form start -->
                            <form action="${pageContext.request.contextPath}/shop/admin/update.do" method="get">
                              <h3 class="box-title">기업정보</h3>
                                <div class="box-body">
                                <div class="form-group">
                                        <label for="compName">상호명</label>
                                        <input type="text" class="form-control" name="compName" id="compName" value="${s.compName }"readOnly/>
                                    </div>
                                    <div class="form-group">
                                        <label for="compId">사업자 번호</label>
                                        <input type="text" class="form-control" name="compId" id="compId" value="${s.compId }"readOnly
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="compNum">전화번호</label>
                                        <input type="text" class="form-control" name="compNum" id="compNum" value="${s.compNum }"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="compFax">팩스번호</label>
                                        <input type="text" class="form-control" name="compFax" id="compFax" value="${s.compFax }"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    	
                                    <div class="form-group">
                                        <label for="compAddress">주소</label>
                                        <input type="text" class="form-control" name="compAddress" id="compAddress" value="${s.compAddress }"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="bankName">은행</label>
                                        <input type="text" class="form-control" name="bankName" id="bankName" value="${s.bankName }"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="accountHolder">예금주</label>
                                        <input type="text" class="form-control" name="accountHolder" id="accountHolder" value="${s.accountHolder }"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="accountNo">계좌번호</label>
                                        <input type="text" class="form-control" name="accountNo" id="accountNo" value="${s.accountNo }"
                                            placeholder="변경할 전화번호를 입력하세요">
                                    </div>
                                    <br />
                                    <hr />
                                <h3 class="box-title">정보수정</h3>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="sellerId">아이디</label>
                                        <input type="text" class="form-control" name="sellerId" id="sellerId" value="${s.sellerId}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="sellerPwd">비밀번호</label>
                                        <input type="password" class="form-control" name="sellerPwd" id="sellerPwd" value="${s.sellerPwd }"
                                            placeholder="변경할 비밀번호를 입력하세요" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="sellerName">이름</label>
                                        <input type="text" class="form-control" name="sellerName" id="sellerName" value="${s.sellerName }" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="sellerEmail">이메일</label>
                                        <input type="email" class="form-control" name="sellerEmail" id="sellerEmail" value="${s.sellerEmail }"
                                        	placeholder="변경할 이메일을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="sellerPhone">전화번호</label>
                                        <input type="text" class="form-control" name="sellerPhone" id="sellerPhone" value="${s.sellerPhone }"
                                            placeholder="변경할 전화번호를 입력하세요">
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







