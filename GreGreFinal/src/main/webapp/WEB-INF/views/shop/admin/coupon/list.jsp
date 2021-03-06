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
                이벤트 게시판
                <small>이벤트 목록</small>
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
                
            <!-- contents begin-->
<div class="site-section" style="padding:0px;">
	<div class="container" style="margin-top:0px; max-width: 1440px;">
		<div class="row">
			<div class="col-lg-2" style="padding-left:0px;">
			<div class="col-lg-10">
				<!-- contents begin-->
				<div class="site-section" style="padding-top: 10px;">
					<div class="container" style="margin-top:0px;">
						<div class="row">
							<div class="col-md-6">
							</div>
							<div class="col-md-6" style="text-align: right; padding-right: 3px;">
								<i class="fas fa-pencil-alt" style="color:blue; cursor:pointer;"></i>
							</div>
						</div>
						<div class="row" style="display: grid; margin-bottom: 20px;">
							<table>
								<tr>
									<th>번호</th>
									<th>쿠폰이름</th>
									<th>할인가격/율</th>
									<th>할인금액</th>
									<th>최대할인가능금액</th>
									<th>쿠폰등록일자</th>
									<th>기한</th>
								</tr>
								<c:if test="${empty list}">
								<tr>
									<td colspan="5">등록된 쿠폰이 없습니다.</td>
								</tr>
								</c:if>
								<c:if test="${not empty list}">
									<c:forEach items="${list}" var="c">
									<tr onclick="location.href='${pageContext.request.contextPath}/shop/admin/coupon/update.do?couponId='+${c.couponId}">
										<td>${c.couponId}</td>
										<td>${c.couponName}</td>
										<td>${c.discountType }</td>
										<td>${c.discountValue }</td>
										<td>${c.maxValue }</td>
										<td>${c.couponEnrollDate}</td>
										<td>${c.couponDuration}</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<div class="row">
							<!-- 페이징바 영역 -->
						</div>
						<!-- <div class="row">
							<div class="col-md-2">
								<select>
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select>
							</div>
							<div class="col-md-7">
								<input type="text" style="width: 500px;" />
							</div>
							<div class="col-md-2">
								<button style="width: 80px;">검색</button>
							</div>
						</div> -->
					</div>
				</div>
				<!-- contents end-->
			</div>
		</div>
	</div>
</div>    
                
                
   
          </div><!-- /.content-wrapper -->
       

      
         <!-- jQuery 2.1.3 -->
        <script src="${pageContext.request.contextPath}/resources/js/admin/jQuery-2.1.3.min.js"></script>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>  
        
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
