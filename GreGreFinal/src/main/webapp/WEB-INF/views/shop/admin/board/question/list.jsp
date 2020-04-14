<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8"/>
<%@ include file="/WEB-INF/views/shop/admin/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css">
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
            <!-- <style>
                .infostatus{
                  border: 1px solid gray;
                  width: 800px;
                  margin-left:64px;
                  height: 150px;
                }
                </style> -->
            <!-- Main content -->
           
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">문의게시판</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">

                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4"  style="text-align: center;"><img src="${pageContext.request.contextPath }/resources/images/shop/QnA/alram.png" style="width: 120px;"><br><strong>총 문의 수:${totalQ }건</strong></div>
                                <div class="col-sm-4" style="text-align: center;"><img src="${pageContext.request.contextPath }/resources/images/shop/QnA/question.png" style="width: 120px;"><br><strong>접수: ${ntotalQ }건</strong></div>
                                <div class="col-sm-4"style="text-align: center;"><img src="${pageContext.request.contextPath }/resources/images/shop/QnA/solustion.png" style="width: 120px;"><br><strong>해결:${ytotalQ }건</strong></div>
                            </div>
                            <br />
                        <div class="row" style="display:grid; margin-bottom: 20px;">
                            <table>
                                <tr>
                                    <th>번호</th>
                                    <th>제품이름</th>
                                    <th>제목</th>
                                    <th>이름</th>
                                    <th>날짜</th>
                                    <th>상태</th>
                                </tr>
                              <c:forEach items="${list }" var="qa">
                                <tr>
                                    <td>${qa.qaId }</td>
                                    <td>${qa.productName }</td>
                                    <td><a href="${pageContext.request.contextPath }/shop/admin/question/viewQnA.do?qaId=${qa.qaId}">${qa.qtnTitle }</a></td>
                                    <td>${qa.qtnerId }</td>
                                    <td>${qa.qtnDate }</td>
                                    <td>${qa.qaState }</td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="row">
                        <!-- 페이징바 영역 -->
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <select>
                                    <option value="title">제목</option>
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
                      </div>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->

              <div class="row" style="margin-bottom:20px;">
                <div class=" col-lg-12 production-selling-section__right" style="float: right;">
                    <button type="button" data-toggle="modal" data-target="#qNaModal">
                        상품문의하기
                    </button>
                </div>
            </div>
 
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

               <!-- 문의하기 modal -->
    
               <div class="modal fade" id="qNaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">상품 문의</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <form>
                        <div class="form-group">
                          <label for="QnA-title" class="col-form-label">제목</label>
                          <input type="text" class="form-control" id="QnA-title">
                        </div>
                        <div class="form-group">
                          <label for="QnA-text" class="col-form-label" >문의 내용</label>
                          <textarea class="form-control" id="QnA-text" placeholder="문의 내용을 입력하세요"></textarea>
                        </div>
                      </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary">완료</button>
                    </div>
                  </div>
                </div>
              </div>
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
