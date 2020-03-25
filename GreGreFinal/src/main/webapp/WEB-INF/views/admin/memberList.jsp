<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

   <script type="text/javascript">
    $(function () {
      $('#example2').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false
      });
    });
  </script>


    <div class="wrapper">
        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <h1> 회원관리
                <small>회원목록</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">회원관리</a></li>
                <li class="active">회원목록</li>
              </ol>
            </section>
    
            <!-- Main content -->
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">회원 목록</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                      <table id="example2" class="table table-bordered table-hover">
                          <tr>
                          	<th>NO.</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>생년월일</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>이메일</th>
                            <th>성별</th>
                            <th>나이</th>
                            <th>가입일</th>
                            <th>수정</th>
                          </tr>
                          
                          <c:if test="${empty list }">
                          <tr>
                          	<td colspan="12"> 등록되어 있는 회원정보가 없습니다. </td>
                          </tr>
                          </c:if>
                          
                          <c:if test="${not empty list}">
                          <c:forEach items="${list }" var="list" begin="0" varStatus="vs">
                          <tr>
                            <td>${vs.count}</td>
                            <td>${list.memberId }</td>
                            <td>${list.memberName }~</td>
                            <td>${list.nickname }</td>
                            <td>${list.birthday }</td>
                            <td>${list.phone }</td>
                            <td>${list.address }</td>
                            <td>${list.email }</td>
                            <td>${list.gender=="M"?"남":"여" }</td>
                            <td>${list.age }</td>
                            <td>${list.enrollDate }</td>
                            <td><input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/admin/memberUpdate.do'"></td>
                          </tr>
                          </c:forEach>
                          </c:if>
                      </table>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->
            </section><!-- /.content -->
          </div><!-- /.content-wrapper -->

        </div><!-- ./wrapper -->


<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>