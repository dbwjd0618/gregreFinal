<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/admin/common/header.jsp"/>

        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <h1>
                회원관리
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
                        <thead>
                          <tr>
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
                            <th>탈퇴일</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                          <tr>
                            <td>test</td>
                            <td>테스트</td>
                            <td>테스트이지롱~</td>
                            <td>1999.05.03</td>
                            <td>010-1234-1234</td>
                            <td>서울시 강남구 역삼동</td>
                            <td>test@naver.com</td>
                            <td>남</td>
                            <td>50</td>
                            <td>2020.03.01</td>
                            <td>2020.03.02</td>
                          </tr>
                        </tbody>
                        <tfoot>
                        </tfoot>
                      </table>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->
            </section><!-- /.content -->
          </div><!-- /.content-wrapper -->

          <footer class="main-footer">
            <p class="">서울특별시 그래구 그레로 123 </p>
            <p class="">TEL : 육아종합지원센터 02-123-1234 &nbsp;&nbsp;|&nbsp;&nbsp; FAX : 02-456-4567 &nbsp;&nbsp;|&nbsp;&nbsp;Mail : i_gre@gmail.com</p>
            <p>Copyright(c) 2020 아이그레. All rights reserved.</p>
          </footer>
        </div><!-- ./wrapper -->
        <!-- jQuery 2.1.3 -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/jQuery-2.1.3.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>  
        <!-- jQuery Knob Chart -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.knob.js" type="text/javascript"></script>
        <!-- Slimscroll -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- FastClick -->
        <script src='${pageContext.request.contextPath}/resources/js/admin/fastclick.min.js'></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/app.min.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/demo.js" type="text/javascript"></script>
   <!-- page script -->
   <script type="text/javascript">
    $(function () {
      $("#example1").dataTable();
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
  </body>
</html>