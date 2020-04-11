<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css">
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
                <li><a href="#">게시판</a></li>
                <li class="active">게시판 목록</li>
              </ol>
            </section>
    
            <!-- Main content -->
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">리뷰게시판</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            
                            <div class="col-md-6" style="text-align: right; padding-right:3px;">
                                <button onclick="location.href='postWrite.html'">게시글삭제</button>
                            </div>
                        </div>
                        
                        <div class="row" style="display:grid; margin-bottom: 20px;">
                            <table>
                                <tr>
                                    <th>번호</th>
                                    <th>제품번호</th>
                                    <th>내용</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                                
                                <tr>
                                    <td>6</td>
                                    <td><a href="../productView.html">P_01</a></td>
                                    <td>admin000</td>
                                    <td>2020-03-07</td>
                                    <td><input type='checkbox' name='notice' value='ok' /></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td><a href="../productView.html">P_01</a></td>
                                    <td>admin000</td>
                                    <td>2020-03-06</td>
                                    <td><input type='checkbox' name='notice' value='ok' /></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><a href="../productView.html">P_01</a></td>
                                    <td>admin000</td>
                                    <td>2020-03-05</td>
                                    <td><input type='checkbox' name='notice' value='ok' /></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><a href="${pageContext.request.contextPath }/board/noticeView.do">P_04</a></td>
                                    <td>admin000</td>
                                    <td>2020-03-04</td>
                                    <td><input type='checkbox' name='notice' value='ok' /></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="${pageContext.request.contextPath }/board/noticeView.do">P_05</a></td>
                                    <td>admin000</td>
                                    <td>2020-03-03</td>
                                    <td><input type='checkbox' name='notice' value='ok' /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="row">
                        <!-- 페이징바 영역 -->
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <select>
                                    <option value="content">내용</option>
                                    <option value="writer">작성자</option>
                                </select>
                            </div>
                            <div class="col-md-7">
                                <input type="text" style="width: 500px;"/>
                            </div>
                            <div class="col-md-2">
                                <button style="width:80px;">검색</button>
                            </div>
                        </div>
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