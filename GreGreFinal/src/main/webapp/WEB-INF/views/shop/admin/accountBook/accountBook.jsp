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
                수익
                <small>판매현황</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">판매현황</a></li>
                <li class="active">수익</li>
              </ol>
            </section>
    
          
                <!-- .content-wrapper -->

                <div class="row text-center">
                    <div class="col-md-12">		  
                      <form action="/sales_manager/stats/index.php" method="get" role="form" class="form-horizontal" name="seach_form">
                        
                        <table class="table table-bordered">
                          <colgroup>
                            <col style="width:15%;">
                            <col style="width:30%;">
                            <col style="width:15%;">
                            <col style="width:30%;">
                            <col style="width:10%;">
                          </colgroup>
                          <tbody><tr>
                            <th class="text-center active" style="vertical-align:middle;">주문일</th>
                            <td class="text-left" style="background-color:#fff;vertical-align:middle;">
                              <input type="text" name="sdate" class="form-control" style="width:100px;display:inline-block;" id="sdate" value="2020-03-13" data-date="2020-03-13" data-date-format="yyyy-mm-dd"> ~ 
                              <input type="text" name="edate" class="form-control" style="width:100px;display:inline-block;" id="edate" value="2020-03-20" data-date="2020-03-20" data-date-format="yyyy-mm-dd">
                              <button class="btn btn-default btn-xs sel_today" type="button">오늘</button> 
                              <button class="btn btn-default btn-xs sel_week" type="button">일주일</button> 
                              <button class="btn btn-default btn-xs sel_month" type="button">한달</button></td>
                            <th class="text-center active" style="vertical-align:middle;">회원타입</th>
                            <td class="text-center" style="background-color:#fff;">
                              <select name="mem_type" class="form-control" id="mem_type" style="width:200px;">
                                <option value=""> -- 선택 -- </option>
                                <option value="1"> 회원 </option>
                                <option value="0"> 비회원 </option>
                              </select>
                            </td>
                            <td class="text-center" rowspan="2" style="background-color:#fff;vertical-align:middle;"><button type="submit" class="btn btn-primary btn-lg" id="service_pay"> 검 색 </button></td>
                          </tr>
                          <tr>
                            <th class="text-center active" style="vertical-align:middle;">결재방식</th>
                            <td class="text-center" style="background-color:#fff;">
                              <select name="stat_pay" class="form-control" id="stat_pay" style="width:200px;">
                                <option value=""> -- 선택 -- </option>
                                <option value="1"> 신용카드 </option>
                                <option value="2"> 휴대전화 </option>
                                <option value="3"> 무통장입금 </option>
                                <option value="4"> 가상계좌 </option>
                                <option value="5"> 실시간계좌이체 </option>
                              </select>
                            </td>
                            <th class="text-center active" style="vertical-align:middle;">결재상태</th>
                            <td class="text-center" style="background-color:#fff;">
                              <select name="stat_pay_rst" class="form-control" id="stat_pay_rst" style="width:200px;">
                                <option value=""> -- 선택 -- </option>
                                <option value="1"> 입금완료 </option>
                                <option value="2"> 미입금 </option>
                              </select>
                            </td>
                          </tr>						
                        </tbody></table>
                      </form>
                      <table class="table table-bordered">
                        <tbody><tr>
                          <th class="text-center active vertical-middle">분류</th>
                          <th class="text-center active vertical-middle">건수</th>
                          <th class="text-center active vertical-middle">금액</th>
                        </tr>
                   
                        <tr style="background-color:#ffffff;">
                          <td class="text-center vertical-middle">신용카드</td>
                          <td class="text-right vertical-middle">0 건</td>
                          <td class="text-right vertical-middle">0 원</td>
                        </tr>
                        <tr style="background-color:#ffffff;">
                          <td class="text-center vertical-middle">휴대전화</td>
                          <td class="text-right vertical-middle">0 건</td>
                          <td class="text-right vertical-middle">0 원</td>
                        </tr>
                        <tr style="background-color:#ffffff;">
                          <td class="text-center vertical-middle">계좌이체</td>
                          <td class="text-right vertical-middle">0 건</td>
                          <td class="text-right vertical-middle">0 원</td>
                        </tr>
                        <tr style="background-color:#ffffff;">
                          <td class="text-center vertical-middle">가상계좌</td>
                          <td class="text-right vertical-middle">0 건</td>
                          <td class="text-right vertical-middle">0 원</td>
                        </tr>
                        <tr style="background-color:#ffffff;">
                          <td class="text-center vertical-middle">무통장</td>
                          <td class="text-right vertical-middle">0 건</td>
                          <td class="text-right vertical-middle">0 원</td>
                        </tr>
                        <tr style="background-color:#ffffff;">
                          <td class="text-center vertical-middle">합계</td>
                          <td class="text-right vertical-middle">0 건</td>
                          <td class="text-right vertical-middle">0 원</td>
                        </tr>
                  
                      </tbody></table>
                  
                      <table class="table table-bordered">		  
                        <tbody><tr>
                          <td>			  
                            <div class="widget-content text-conter">
                              <div class="row">
                               <div class="col-lg-3 bordered " style="width:23%;">
                                <div class="value-block text-center">
                                  <div class="value-sub"><strong class="text-danger">총 결재 금액</strong></div>
                                  <div class="value-self"> 0 원</div>
                                </div>
                               </div>
                              <div class="row">
                               <div class="col-lg-3 bordered  " style="width:23%;">
                                <div class="value-block text-center">
                                  <div class="value-sub"><strong class="text-danger">총 판매 이익</strong></div>
                                  <div class="value-self"> 0 원</div>
                                </div>
                               </div>
                               <div class="col-lg-3 bordered " style="width:23%;">
                                <div class="value-block text-center">
                                  <div class="value-sub"><strong class="text-danger">총 구매건수</strong></div>
                                  <div class="value-self">0 건</div>
                                </div>
                               </div>
                               <div class="col-lg-3 " style="width:23%;">
                                <div class="value-block text-center">
                                  <div class="value-sub"><strong class="text-danger">선택날짜</strong></div>
                                  <div class="value-self">2020-03-13 ~ 2020-03-20</div>
                                </div>
                               </div>
                              </div>
                              <div id="areachart" style="height: 250px; position: relative;"><svg height="250" version="1.1" width="1013" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.0</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs></svg><div class="morris-hover morris-default-style" style="display: none;"></div></div>
                            </div>
                          </div></td>
                        </tr>
                      </tbody></table>
                      <table class="table table-bordered">
                        <colgroup>
                          <col style=""><col style=""><col style=""><col style=""><col style=""><col style=""><col style="">
                        </colgroup>
                        <tbody><tr>
                          <th class="text-center active vertical-middle">주문일</th>
                          <th class="text-center active vertical-middle">결재건수</th>
                          <th class="text-center active vertical-middle">실결재금액</th>
                          <th class="text-center active vertical-middle">판매금액</th>
                          <th class="text-center active vertical-middle">공급가액</th>
                          <th class="text-center active vertical-middle">판매이익</th>
                          <th class="text-center active vertical-middle">배송액</th>
                        </tr>
                              <tr style="background-color:#ffffff;">
                          <th class="text-center active vertical-middle">합계</th>
                          <th class="text-center active vertical-middle">0</th>
                          <th class="text-center active vertical-middle">0</th>
                          <th class="text-center active vertical-middle">0</th>
                          <th class="text-center active vertical-middle">0</th>
                          <th class="text-center active vertical-middle">0</th>
                          <th class="text-center active vertical-middle">0</th>
                        </tr>			

                      </tbody></table>
                    </div>
                    </div>



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