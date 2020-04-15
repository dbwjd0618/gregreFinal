<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>


<!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <h1>관리자 관리
                <small>관리자 권한 수정</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">관리자 권한 관리</a></li>
                <li class="active">관리자 권한 수정</li>
              </ol>
            </section>
    
            <!-- Main content -->
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">관리자 목록</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                      <table id="example2" class="table table-bordered table-hover">
                          <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>생년월일</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>이메일</th>
                            <th>등급</th>
                            <th>성별</th>
                            <th>가입일</th>
                            <th>권한 부여</th>
                          </tr>
                          
                          <c:if test="${empty member }">
                          	<tr >
                          		<td colspan="11">조회된 관리자 목록이 없습니다.</td>
                          	</tr>
                          </c:if>
                          
                          <c:if test="${not empty member }">
                          	<c:forEach items="${member }" var="member">
                          		<c:if test="${member.grade eq 'A'}">
		                          <tr>
		                            <td>${member.memberId }</td>
		                            <td>${member.memberName }</td>
		                            <td>${member.nickname }</td>
		                            <td>${member.birthday }</td>
		                            <td>${member.phone }</td>
		                            <td>${member.address }</td>
		                            <td>${member.email }</td>
		                            <td>${member.grade }</td>
		                            <td>${member.gender }</td>
		                            <td>${member.enrollDate }</td>
		                            <td><input type="button" value="수정"
		                            	 onclick="location.href='${pageContext.request.contextPath}/admin/athorityView.do?memberId='+'${member.memberId}'"></td>
		                          </tr>
                          		</c:if>
                          	</c:forEach>
                          </c:if>
                      </table>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->
              
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">회원 목록</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                      <table id="example2" class="table table-bordered table-hover">
                          <tr>
                           	<th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>생년월일</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>이메일</th>
                            <th>등급</th>
                            <th>성별</th>
                            <th>가입일</th>
                            <th>권한 부여</th>
                          </tr>
                          
                          <c:if test="${empty member }">
                          	<tr>
                          		<td colspan="11">조회된 회원 목록이 없습니다.</td>
                          	</tr>
                          </c:if>
                          <c:if test="${not empty member }">
                          	<c:forEach items="${member }" var="member">
                          		<c:if test="${member.grade eq 'M' }">
		                          <tr>
		                            <td>${member.memberId }</td>
		                            <td>${member.memberName }</td>
		                            <td>${member.nickname }</td>
		                            <td>${member.birthday }</td>
		                            <td>${member.phone }</td>
		                            <td>${member.address }</td>
		                            <td>${member.email }</td>
		                            <td>${member.grade }</td>
		                            <td>${member.gender }</td>
		                            <td>${member.enrollDate }</td>
		                            <td><input type="button" value="수정" 
		                            onclick="location.href='${pageContext.request.contextPath}/admin/athorityView.do?memberId='+'${member.memberId}'"></td>
		                          </tr>
                          		</c:if>
                          	</c:forEach>
                          </c:if>
                      </table>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->
            </section><!-- /.content -->
          </div><!-- /.content-wrapper -->

<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>