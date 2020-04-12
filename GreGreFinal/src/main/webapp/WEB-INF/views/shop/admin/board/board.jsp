<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->
<!--  -->
<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/admin/common/header.jsp"/>


        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <h1>
                게시판
                <small>게시판 목록</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">게시판 관리</a></li>
                <li class="active">게시판 목록</li>
              </ol>
            </section>
    
            <!-- Main content -->
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">게시판 목록</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='${pageContext.request.contextPath}/shop/admin/review/list.do'">리뷰목록</button>
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='${pageContext.request.contextPath}/shop/admin/question/list.do'">문의게시판</button>
                         <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='${pageContext.request.contextPath}/shop/admin/event/event.do'">이벤트게시판</button>
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
    $("#add").click(function(){
      var div = $("<div style='margin: 20px 0; text-align:center;' ></div>");
      var form = $("<form action='' method='POST' class='form-inline'></form>");
      form.append("<div class='form-group'><label for='boardCode'>게시판 코드</label><input type='text' class='form-control' style='margin: 0 10px;'  id='boardCode' placeholder='게시판 코드'></div>")
      form.append("<div class='form-group'><label for='boardName'>게시판 이름</label><input type='text' class='form-control' style='margin: 0 10px;'  id='boardName' placeholder='게시판 이름'></div>");
      form.append("<button type='submit' class='btn btn-default'>생성</button>");
      div.html(form);

      div.insertAfter($(this).slideDown(5000).off('click'));
      console.log(div);

    })
  </script>
  </body>
</html>