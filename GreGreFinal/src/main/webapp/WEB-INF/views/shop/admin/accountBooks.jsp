<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>아이그레</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <!-- FontAwesome 4.3.0 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />    
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/blue.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/37.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script>

</script>

  </head>
  <body class="skin-blue">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="index2.html" class="logo" style="background-repeat: no-repeat; background-image: url('../images/admin/logo.png'); background-size:contain" ></a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
            
             
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <span class="hidden-xs">쇼핑몰관리자님 안녕하세요</span>
                </a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left info">
              <p>판매관리자</p>

              <a href="#"><i class="fa fa-circle text-success"></i> 로그인</a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">메뉴</li>
            <li class="treeview">
                <a href="#">
                  <i class="fa fa-user"></i>
                  <span>주문관리</span>
                  <i class="fa fa-angle-left pull-right"></i>	
                  <!-- <span class="label label-primary pull-right">4</span> -->
                </a>
                <ul class="treeview-menu">
                  <li><a href="${pageContext.request.contextPath}/shopadmin/admin.do"><i class="fa fa-circle-o"></i>상품 등록/삭제</a></li>
                  <li><a href="orderList.html"><i class="fa fa-circle-o"></i> 주문 현황</a></li>
                  
                </ul>
              </li>
            <li class="treeview">
                <a href="#">
                  <i class="fa fa-user"></i>
                  <span>매출</span>
                  <i class="fa fa-angle-left pull-right"></i>
                  <!-- <span class="label label-primary pull-right">4</span> -->
                </a>
                <ul class="treeview-menu">
                  <li><a href="${pageContext.request.contextPath}/shopadmin/account.do"><i class="fa fa-circle-o"></i>매출조회</a></li>
                </ul>
              </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-user"></i>
                <span>회원관리</span>
                <i class="fa fa-angle-left pull-right"></i>
                <!-- <span class="label label-primary pull-right">4</span> -->
              </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath}/shopadmin/list.do"><i class="fa fa-circle-o"></i> 회원 목록</a></li>
                <li><a href="${pageContext.request.contextPath}/shopadmin/ban.do"><i class="fa fa-circle-o"></i> 회원 탈퇴</a></li>
                <li><a href="${pageContext.request.contextPath}/shopadmin/withdrawll.do"><i class="fa fa-circle-o"></i> 탈퇴 회원 관리</a></li>
              </ul>
            </li>
            <li>
              <a href="">
                <i class="fa fa-bell"></i> <span>신고</span> 
                <i class="fa fa-angle-left pull-right"></i>
                <!-- <small class="label pull-right bg-green">new</small> -->
              </a>
              <ul class="treeview-menu">
                <li><a href="declaration.html"><i class="fa fa-circle-o"></i> 신고 내역</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>게시판</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/shopadmin/board.do"><i class="fa fa-circle-o"></i> 게시판 목록</a></li>
              </ul>
            </li>
            </li>
             <li class="treeview">
              <a href="#">
                <i class="fa fa-share"></i> <span>단체안내</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="mailbox.html"><i class="fa fa-circle-o"></i>단체 이메일</a></li>
                <li><a href="message.html"><i class="fa fa-circle-o"></i> 단체 문자</a></li>
              </ul>
            </li>
        </section>
        <!-- /.sidebar -->
      </aside>


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
            <p>Copyright(c) 2020 아이그레. All rights reserved.</a> </p>
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