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
        <a href="${pageContext.request.contextPath}/shopadmin/admin.do" class="logo" style="background-repeat: no-repeat; background-image: url('${pageContext.request.contextPath}/resources/images/admin/logo.png'); background-size:contain" ></a>
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
                전체주문조회
                <small>주문목록</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상품관리</a></li>
                <li class="active">전체주문조회</li>
              </ol>
            </section>
    
            <div class="main-content">
              <h2 class="menu_sub_title">상품등록</h2>
              
              <form action="_proc.php" method="post" role="form" class="form-horizontal" name="regi_form" enctype="multipart/form-data">
                <input type="hidden" id="mode" name="mode" value="good_regist">
                <input type="hidden" name="short_url" id="short_url" value="http://me2.do/5tsIsZHF">
                <input type="hidden" name="short_qna" id="short_qna" value="http://me2.do/xqGMGWUn">
                <input type="hidden" name="short_deli" id="short_deli" value="http://me2.do/5wbBxs1B">
                <input type="hidden" name="short_shop" id="short_shop" value="http://me2.do/FZKRKOaQ">
            
                  <table class="table table-bordered">
                  <colgroup>
                    <col width="10%">
                    <col width="">
                  </colgroup>
                  <tbody><tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 결재수단</th>
                    <td>
                      <input type="checkbox" name="pay1" value="1"> 신용카드
                      <input type="checkbox" name="pay2" value="1" style="margin-left:10px;"> 휴대전화
                      <input type="checkbox" name="pay3" value="1" style="margin-left:10px;"> 무통장입금
                      <input type="checkbox" name="pay4" value="1" style="margin-left:10px;"> 가상계좌
                      <input type="checkbox" name="pay5" value="1" style="margin-left:10px;"> 실시간계좌이체
                    </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 제품번호</th>
                    <td> <input type="text" name="" id=""> </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 카테고리</th>
                    <td>
                      <select name="category1" class="form-control" id="category1" style="width:25%;display:inline-block;">
                        <option value="">설정안함</option>
                                    <option value="1000">브랜드.회사</option>
                                    <option value="2000">지역.쇼핑</option>
                                    <option value="3000">기관.학교.종교</option>
                                    <option value="5000">문화.엔터테인먼트</option>
                                    <option value="6000">생활.요리.건강</option>
                                    <option value="7000">취미.여행.스포츠</option>
                                    <option value="8000">교육. 정보. 시사</option>
                                  </select>
                      <select name="category2" class="form-control" id="category2" style="width:25%;display:inline-block;">
                        <option value="">설정안함</option>
                                    <option value="1010">가구</option>
                                    <option value="1020">가전</option>
                                    <option value="1030">건강.의약.미용</option>
                                    <option value="1040">건축</option>
                                    <option value="1060">미디어.뉴스.출판</option>
                                    <option value="1080">백화점.마트.대형쇼핑센터</option>
                                    <option value="1090">보석.시계</option>
                                    <option value="1100">사무용품</option>
                                    <option value="1110">생활용품</option>
                                    <option value="1120">신발.가방</option>
                                    <option value="1130">여행.스포츠</option>
                                    <option value="1140">유아.어린이용품</option>
                                    <option value="1150">음식.음료.주류</option>
                                    <option value="1160">의류</option>
                                    <option value="1170">자동차</option>
                                    <option value="1180">게임.장난감.문구</option>
                                    <option value="1190">전자제품</option>
                                    <option value="1200">IT</option>
                                    <option value="1210">기타</option>
                                  </select>
                    </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 상품명</th>
                    <td><input type="text" name="pname" class="form-control" style="width:100%;display:inline-block;" id="pname" value=""></td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 브랜드명</th>
                    <td><input type="text" name="price_supply" class="form-control number-coma" style="width:100px;display:inline-block;" id="price_supply" value=""> </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 판매가격</th>
                    <td><input type="text" name="price_supply" class="form-control number-coma" style="width:100px;display:inline-block;" id="price_supply" value=""> 원</td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 배송비</th>
                    <td><input type="text" name="price_supply" class="form-control number-coma" style="width:100px;display:inline-block;" id="price_supply" value=""> 원</td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;">포인트적립비율</th>
                    <td><input type="text" name="price_supply" class="form-control number-coma" style="width:100px;display:inline-block;" id="price_supply" value=""> %</td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 재고수량</th>
                    <td><input type="text" name="inventory" class="form-control number-coma" style="width:100px;display:inline-block;" id="inventory" value="999"></td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 원산지</th>
                    <td><input type="text" name="orign" class="form-control" style="width:100%;display:inline-block;" id="orign" value=""></td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 제조사</th>
                    <td><input type="text" name="brand" class="form-control" style="width:100%;display:inline-block;" id="brand" value=""></td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;" rowspan="2"> 배송비 설정</th>
                    <td>
                      <input type="hidden" name="delivery_pay_default" value="0">
                      <input type="hidden" name="delivery_pay_free" value="0">
                      <input type="radio" name="delivery_yn" value="1" checked=""> 기본 배송비 사용 <br>
                      ( 기본배송비 : 0원, 무료배송비 : 0원 이상 )
                    </td>
                  </tr>
                  <tr>
                    <td>	<input type="radio" name="delivery_yn" value="0"> 개별 배송비 설정<br><br>
                    기본 배송비 : <input type="text" name="delivery_default" class="form-control number-coma" style="width:100px;display:inline-block;" id="brand" value=""> 원 ( 무료배송 시 0 입력 )<br>
                    무료 배송비 : <input type="text" name="delivery_free" class="form-control number-coma" style="width:100px;display:inline-block;margin:5px 0;" id="brand" value=""> 원 이상시 무료배송
                    </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 상품노출</th>
                    <td>
                      <input type="checkbox" name="view_yn" value="1" checked=""> 상품을 노출합니다.
                    </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 메인노출</th>
                    <td>
                      <input type="checkbox" name="main_yn" value="1"> 쇼핑몰의 경우 상품을 메인 페이지에 노출합니다.
                    </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 상품대표이미지</th>
                    <td>
                      <input type="file" name="dFile">
                      <i class="fa fa-exclamation-triangle"></i> <span class="help-inline"> * 상품이미지는 가로 세로 동일한 사이즈로 등록해주세요.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 파일의 최대 크기는 1MB입니다.</span>
                    </td>
                  </tr>
                  <tr>
                    <th class="bg_mint text-center" style="vertical-align:middle;"> 상품설명</th>
                    <td><textarea name="" id="" cols="30" rows="10"style="width:100%"></textarea></td>
                    <!-- <td><textarea name="p_content" style="width: 100%; height: 100px; display: none;" class="se_editor" id="p_content"></textarea><iframe frameborder="0" scrolling="no" style="width: 100%; height: 254px;" src="/sales_manager/js/SmartEditor2Skin.html"></iframe></td> -->
                  </tr>
                </tbody></table>
            
        
            
                      </div>
                    </td>
                  </tr>
                  </tbody>
                </table>
            
            
              </form>
              <div class=" text-center"style="padding-bottom:50px">
                <button class="btn btn-primary btn-lg" id="registBtn"> 상품등록 </button>
              </div>

              <script>
                  $(".down-wrap").click(function(){
                    var testTalbe = $("#optionTr").dataTable();
                    var tr=te
                    console.log("찍히냐");
                     $("#optionTr").css('display','visible');
                    $("#optionTr").toggle();
                  });
                  </script>

          </div><!-- /.content-wrapper -->
        <!--푸터영역-->
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
  
<script type="text/javascript">
	$(document)
		.on('focusin','input:text.number-coma',function(e) {
			var tag = $(this).get(0);
			tag.value = tag.value.replace(/\,/g,'');
			$(this).css('text-align','right');
		})
		.on('focusout','input:text.number-coma',function() {
			$(this).val(numformat.format($(this).val().replace(/[^\d]/g,'')));
		})
		.on('mouseup','input:text.number-coma',function(e) {
			var tag = $(this).get(0);
			tag.select();
			e.preventDefault();
		});
	$('input:text.number-coma',$(document)).each(function() {
		$(this).val(numformat.format($(this).val().replace(/[^\d]/g,'')));
	});
    $(document).on('ready',function(){
                            
		var f = $(document.forms["regi_form"]);

		$('#registBtn').click(function (){
			$('#mode', f).val('good_regist');
			updateContentsEditor('p_content');


			// 상품명 체크
			if ($('#pname').val() == "")
			{
				alert('상품명을 입력해 주세요');
				$('#pname').focus();
				return false;
			}
			document.regi_form.submit();
		});

		//카테고리 선택시 서브카테고리 노출
		$("#category1").change(function(){ 
			$("#category1 option:selected").each(function(){ 
				$('#mode', f).val('category_change');
				$.ajax({
					type: 'POST',
					cache: false,
					dataType: 'json',
					url: '_proc_json.php',
					data: f.serialize(),
					success : function (data) {
							console.log(data);
						if (data.op) {
							$('#category2').html(data.op);
						} else {
							alert(data.message);
						}
					},
					error : function (data) {
							console.log(data);
					}
				});
			});  
		}); 
        
    });

	$(function(){
        $('.btnDownWrap').click(function() {
            var tr = $(this).attr('data-tr');
            var img = $(this).attr('data-img');
            var th = $(this).attr('data-th');
            if($('#'+tr).css('display') == 'none'){
                $('#' + th).attr('rowspan', 2);
                $('#' + tr).css('display', '');
                $('#' + img).attr('src', '/sales_manager/images/icon_glist_hide.png');
            }else {
                $('#' + th).attr('rowspan', 1);
                $('#' + tr).css('display', 'none');
                $('#' + img).attr('src', '/sales_manager/images/icon_glist_show.png');
            }
        });

        $("input:radio[name=useOption]").click(function(){
            if($(this).val() == 1){
                $('#optionBigDiv').show();
            }else{
                $('#optionBigDiv').hide();
                $('input[name="useNewOption"]').filter('[value=0]').click();
                $('input[name="useInputOption"]').filter('[value=0]').click();
                $('input[name="useAddNormalOption"]').filter('[value=0]').click();
                $('#sellNoInvenOption').show();
                $('#useSellInvenOption').val('');
                $('#useSellIaddNormalOption').val('');
            }
            optiionChange();
        });
    });

    function optiionChange(){
        var text = '';
        if($('input:radio[name=useOption]:checked').val() == 1){
            if($('input:radio[name=useNewOption]:checked').val() == 1){
                if($('input:radio[name=optionState]:checked').val() == 1){
                    text = text + '일반옵션';
                }else if($('input:radio[name=optionState]:checked').val() == 2){
                    text = text + '재고옵션';
                }
            }
            if($('input:radio[name=useInputOption]:checked').val() == 1){
                if(text != ''){
                    text = text + ' <span style="color:#b8b8b8">/</span> ';
                }
                text = text + '입력옵션';
            }
            if($('input:radio[name=useAddNormalOption]:checked').val() == 1){
                if(text != ''){
                    text = text + ' <span style="color:#b8b8b8">/</span> ';
                }
                text = text + '추가 상품';
            }
            text = text + ' 사용';
        }else{
            text = text + '설정안함';
        }
        if(text == '설정안함'){
            $('#optionH4').parent().removeClass('active');
        }else{
            $('#optionH4').parent().addClass('active');
        }
        $('#optionH4').html(text);
    }
</script>
  </body>
</html>