<%@page import="kh.mclass.IgreMall.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/admin/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--
        <link rel='stylesheet' href='/sales_manager/css/plugins/fullcalendar.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/datatables/datatables.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/datatables/bootstrap.datatables.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/chosen.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/jquery.timepicker.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/daterangepicker-bs3.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/colpick.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/dropzone.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/jquery.handsontable.full.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/jscrollpane.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/jquery.pnotify.default.css'>
        <link rel='stylesheet' href='/sales_manager/css/plugins/jquery.pnotify.default.icons.css'>
        -->
<link rel="stylesheet" href="/sales_manager/css/app.css?v=0.4">
<link href="/favicon.ico" rel="shortcut icon">
<link href="/apple-touch-icon.png" rel="apple-touch-icon">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
            @javascript html5shiv respond.min
        <![endif]-->
<title>E-smart장터 판매관리자</title>
<style>
tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.col-sm-12 {
	width: 100%;
}

.pagination {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
}

.pagination>li>a, .pagination>li>span {
	position: relative;
	float: left;
	padding: 8px 20px;
	line-height: 1.428571429;
	text-decoration: none;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	margin-left: -1px;
}

.pagination-sm>li>a, .pagination-sm>li>span {
	padding: 5px 10px;
	font-size: 12px;
}

.pagination>li:first-child>a, .pagination>li:first-child>span {
	margin-left: 0;
	border-bottom-left-radius: 4px;
	border-top-left-radius: 4px;
}

.pagination-sm>li:first-child>a, .pagination-sm>li:first-child>span {
	border-bottom-left-radius: 2px;
	border-top-left-radius: 2px;
}

body {
	font-family: "NanumGothic", "Roboto", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
	font-size: 12px;
	line-height: 1.428571429;
	color: #4b5159;
	background-color: #fff;
	background-image: none;
	background-repeat: repeat;
	background-position: top left;
}

.pagination-sm>li>a, .pagination-sm>li>span {
	padding: 5px 10px;
	font-size: 12px;
}

.datepicker table {
	width: 100%;
	margin: 0;
}

.datepicker table {
	width: 100%;
	margin: 0;
}

table {
	max-width: 100%;
	background-color: transparent;
}

.pagination>li>a, .pagination>li>span {
	position: relative;
	float: left;
	padding: 8px 20px;
	line-height: 1.428571429;
	text-decoration: none;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	margin-left: -1px;
}

.text-center {
	text-align: center;
}

a {
	color: #2980b9;
	text-decoration: none;
}

.btn-primary {
	color: #fff !important;
	background-color: #4266a8;
	border-color: #245580;
}

.col-md-6 {
	width: 50%;
}

.col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6,
	.col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11 {
	float: left;
}

.table-bordered {
	border: 1px solid #dddddd;
}

form {
	display: block;
	margin-top: 0em;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active,
	.btn-primary.active, .open .dropdown-toggle .btn-primary {
	color: #fff;
	background-color: #36548c;
}

.text-right {
	text-align: right;
}

.pagination>li {
	display: inline;
}
/* .col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12, .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12, .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12, .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
    position: relative;
    min-height: 1px;
    padding-left: 15px;
    padding-right: 15px;
} */
button, input, select[multiple], textarea {
	background-image: none;
}

.btn {
	display: inline-block;
	padding: 8px 20px;
	margin-bottom: 0;
	font-size: 12px;
	font-weight: normal;
	line-height: 1.428571429;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid transparent;
	border-radius: 4px;
	white-space: nowrap;
	-o-user-select: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.btn-sm, .btn-xs {
	padding: 5px 10px;
	font-size: 12px;
	line-height: 1.5;
	border-radius: 2px;
}

.btn-lg {
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.33;
	border-radius: 6px;
}

.btn-danger {
	color: #fff;
	background-color: #df4848;
	border: 1px solid #d43f3a;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td,
	.table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
	border: 1px solid #dddddd;
}

.table>thead>tr>td.active, .table>tbody>tr>td.active, .table>tfoot>tr>td.active,
	.table>thead>tr>th.active, .table>tbody>tr>th.active, .table>tfoot>tr>th.active,
	.table>thead>tr.active>td, .table>tbody>tr.active>td, .table>tfoot>tr.active>td,
	.table>thead>tr.active>th, .table>tbody>tr.active>th, .table>tfoot>tr.active>th
	{
	background-color: #f9f8ef;
}
</style>

<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}
</style>
</head>
<div class="content-wrapper">
	<div class="main-content">
		<h2 class="menu_sub_title">상품관리</h2>

		<div class="row text-center">
			<div class="col-md-12">
				<form
					action="${pageContext.request.contextPath }/shop/admin/product/search.do"
					method="get" role="form" class="form-horizontal" name="seach_form">
					<table class="table table-bordered">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 30%;">
							<col style="width: 10%;">
							<col style="width: 30%;">
							<col style="width: 10%;">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center active" style="vertical-align: middle;">등록날짜</th>
								<td class="text-left"
									style="background-color: #fff; vertical-align: middle;">
									<input
									type="text" name="startDate" class="form-control"
									style="width: 100px; display: inline-block;" id="sdate"
									value="" data-date="2020-03-19" data-date-format="yyyy-mm-dd">
									~ <input type="text" name="endDate" class="form-control"
									style="width: 100px; display: inline-block;" id="edate"
									value="" data-date="2020-03-26" data-date-format="yyyy-mm-dd">
									<button class="btn btn-default btn-xs sel_today" type="button">오늘</button>
									<button class="btn btn-default btn-xs sel_week" type="button">일주일</button>
									<button class="btn btn-default btn-xs sel_month" type="button">한달</button></td>
								<th class="text-center active" style="vertical-align: middle;">노출여부</th>
								<td class="text-center" style="background-color: #fff;"><select
									name="productState" class="form-control" id="view_yn"
									style="width: 200px;">
										<option value="">-- 선택 --</option>
										<option value="Y">노출</option>
										<option value="D">미노출</option>
								</select></td>
								<td style="display: none">
								<input type="hidden" name="sellerId" class="form-control"id="sdate" value="ekfcjd2">
								</td>
								<td class="text-center" rowspan="2"
									style="background-color: #fff; vertical-align: middle;">
									<button type="submit" class="btn btn-primary btn-lg" id="service_pay"> 검 색1 </button>
								<button type="button" class="btn btn-primary btn-lg" onclick="javascript:search();">검 색</button>
								</td>
							</tr>
							<tr>
								<th class="text-center active" style="vertical-align: middle;">상품명</th>
								<td class="text-center" style="background-color: #fff;"><input
									type="text" name="productName" class="form-control"
									style="display: inline-block;" id="pname" value=""></td>
								<th class="text-center active">&nbsp;<!--카테고리--></th>
								<td class="text-center" style="background-color: #fff;">&nbsp;
								<!--검색폼--></td>
							</tr>
						</tbody>
					</table>
				</form>

				<form action="_proc.php" method="post" role="form"
					class="form-horizontal" name="regi_form">
					<input type="hidden" name="pname" value=""> <input
						type="hidden" name="sdate" value=""> <input type="hidden"
						name="edate" value=""> <input type="hidden" name="view_yn"
						value=""> <input type="hidden" name="page" value="">
					<input type="hidden" name="gid" value=""> <input
						type="hidden" name="mode" value="">

					<div class="col-md-12"
						style="padding-left: 0px; padding-right: 0px;">
						<span class="col-md-6 text-left b"
							style="padding-left: 0px; margin-bottom: 5px; font-size: 1.3em; margin-bottom: 15px;">총
							상품수 : <strong class="text-danger">${totalProducts }</strong>개
						</span> <span class="col-md-6 text-right"
							style="padding-right: 0px; margin-bottom: 5px; margin-bottom: 15px;">
							<button class="btn btn-default btn-sm" type="button"
								onclick="xlsdown();return false;">등록상품 엑셀다운</button>
							<button class="btn btn-primary btn-sm" type="button"
								onclick="CheckGroup(1);return false;">선택상품 일괄 수정</button>
							<button class="btn btn-danger btn-sm" type="button"
								onclick="CheckGroup(2);return false;">선택상품 일괄 삭제</button>
						</span>
					</div>
					<table class="table table-bordered">
						<colgroup>
							<col style="width: 2%;">
							<col style="width: 4%;">
							<col style="width: 6%;">
							<col style="">
							<col style="width: 5%;">
							<col style="width: 5%;">
							<col style="width: 3%;">
							<col style="width: 3%;">
							<col style="width: 3%;">
							<col style="width: 5%;">
							<col style="width: 18%;">
							<col style="width: 15%;">
							<col style="width: 5%;">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center active vertical-middle"><input
									type="checkbox" name="chkall" value="1"
									onclick="javascript:selall(this,document.regi_form.chkDel);"></th>
								<th class="text-center active vertical-middle">제품번호</th>
								<th class="text-center active vertical-middle">제품명</th>
								<th class="text-center active vertical-middle">이미지</th>
								<th class="text-center active vertical-middle">카테고리</th>
								<th class="text-center active vertical-middle">판매가격</th>
								<th class="text-center active vertical-middle">할인가격</th>
								<th class="text-center active vertical-middle">배송비</th>
								<th class="text-center active vertical-middle">등록일</th>
								<th class="text-center active vertical-middle">제품링크</th>
								<th class="text-center active vertical-middle">재고</th>
								<th class="text-center active vertical-middle" >노출</th>
								<th class="text-center active vertical-middle">품절</th>
								<th class="text-center active vertical-middle">관리</th>
							</tr>

							<c:forEach items="${list}" var="p" varStatus="vs">
								<tr style="background-color: #ffffff;">
									<td class="text-center vertical-middle"><input
										type="checkbox" name="chkDel" value="${p.productId }"></td>
									<td class="text-center vertical-middle">${p.productId }</td>
									<td class="text-left vertical-middle"><a
										href="javascript:void(0)"
										onclick="javascript:location.href='./detail.php?c=${p.productId}';">${p.productName }</a></td>
									<td class="text-center vertical-middle"><img
										src="/sales_manager/data/22/0" border="0" alt=""
										style="max-width: 80px; margin-bottom: 10px;"></td>
									<td class="text-left vertical-middle">${p.categoryId }</td>
									<td class="text-center vertical-middle">${p.price }</td>
									<td class="text-center vertical-middle"><input type="text"
										class="form-control" id="discount_${vs.index }" name="inventory1_${p.productId}"
										value="${p.discountPrice }" style="width: 75px"></td>
									<td class="text-center vertical-middle">${p.deliveryFee }</td>
									<td class="text-center vertical-middle">${p.enrollDate }</td>
									<td class="text-center vertical-middle"><a href="http://localhost:9090/Igre/shop/product/detail.do?productId=${p.productId }">상세페이지..</a></td>
									<td class="text-center vertical-middle"><input type="text"
										class="form-control" id="stock_${vs.index }" name="inventory1_${product_id }"
										value="${p.productStock }" style="width: 100px"></td>
									
										<td class="text-left vertical-middle" style="text-align:center">
							<input type="radio" id="state_${vs.index }"  name="state_${vs.index }"  value="Y" ${p.productState eq'Y'?'checked':''}> 노출
							<input type="radio" id="state_${vs.index }" name="state_${vs.index }"  value="D" ${p.productState eq'D'?'checked':''} style="margin-left:10px;"> 미노출
													</td>
													<td class="text-center vertical-middle"><input
										type="checkbox" name="soldout_yn_${p.productId }" ${p.productStock<=0?'checked':'' }></td>
									<td class="text-center vertical-middle">
										<%-- <button class="btn btn-detail btn-noradpdd" type="button"
											onclick="javascript:selUp( ${p.productId} , 1 );">변경</button> --%>
											<button type="button" class="btn btn-detail btn-noradpdd" 
											onclick="javascript:edit( ${vs.index},${p.productId});">수정</button> 
										<button class="btn btn-info btn-noradpdd" type="button"
											onclick="javascript:location.href='./detail.php?c=${p.productId}';">수정</button>
										<button class="btn btn-danger btn-noradpdd" type="button"
											onclick="javascript:deleteProduct(${p.productId});">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-sm-12">
				<ul class="pagination pagination-sm">
					<li class="prev"><a href="#"
						onclick="javascript:return false;"> &lt; &lt; </a></li>
					<li class="prev"><a href="#"
						onclick="${pageContext.request.contextPath}/shop/admin/product/search.do">
							&lt;</a></li>
					<li class="active">
						<a href="/sales_manager/goods/index.php?sellerId=&amp;page=1&amp;sdate=&amp;edate=&amp;view_yn=&amp;pname=">1</a></li>
					<li class="next"><a href="#"
						onclick="javascript:return false;"> &gt; </a></li>
					<li class="next"><a href="#"
						onclick="javascript:return false;"> &gt; &gt; </a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>
 	<form action="xlsdown.php" method="post" name="xlsform">
		<input type="hidden" name="pname" value=""> <input
			type="hidden" name="sdate" value=""> <input type="hidden"
			name="edate" value=""> <input type="hidden" name="view_yn"
			value="">
	</form>

</div>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<!-- <script src="/sales_manager/js/plugins/jquery.pnotify.js"></script>
<script src="/sales_manager/js/plugins/jquery.sparkline.min.js"></script>
<script src="/sales_manager/js/plugins/mwheelIntent.js"></script>
<script src="/sales_manager/js/plugins/mousewheel.js"></script>
<script src="/sales_manager/js/bootstrap/tab.js"></script>
<script src="/sales_manager/js/bootstrap/dropdown.js"></script>
<script src="/sales_manager/js/bootstrap/tooltip.js"></script>
<script src="/sales_manager/js/bootstrap/collapse.js"></script>
<script src="/sales_manager/js/bootstrap/scrollspy.js"></script>
<script src="/sales_manager/js/plugins/bootstrap-datepicker.js"></script>
<script src="/sales_manager/js/bootstrap/transition.js"></script>
<script src="/sales_manager/js/plugins/jquery.knob.js"></script>
<script src="/sales_manager/js/plugins/jquery.flot.min.js"></script>
<script src="/sales_manager/js/plugins/fullcalendar.js"></script>
<script src="/sales_manager/js/plugins/datatables/datatables.min.js"></script>
<script src="/sales_manager/js/plugins/chosen.jquery.min.js"></script>
<script src="/sales_manager/js/plugins/jquery.timepicker.min.js"></script>
<script src="/sales_manager/js/plugins/daterangepicker.js"></script>
<script src="/sales_manager/js/plugins/colpick.js"></script>
<script src="/sales_manager/js/plugins/moment.min.js"></script> -->
<script
	src="/sales_manager/js/plugins/datatables/bootstrap.datatables.js"></script>
<!-- <script src="/sales_manager/js/bootstrap/modal.js"></script>
<script src="/sales_manager/js/plugins/raphael-min.js"></script>
<script src="/sales_manager/js/plugins/morris-0.4.3.min.js"></script>
<script src="/sales_manager/js/plugins/jquery.maskedinput.min.js"></script>
<script src="/sales_manager/js/plugins/jquery.maskmoney.js"></script>
<script src="/sales_manager/js/plugins/summernote.js"></script>
<script src="/sales_manager/js/plugins/dropzone-amd-module.js"></script>
<script src="/sales_manager/js/plugins/jquery.validate.min.js"></script>
<script src="/sales_manager/js/plugins/jquery.bootstrap.wizard.min.js"></script>
<script src="/sales_manager/js/plugins/jscrollpane.min.js"></script>
<script src="/sales_manager/js/application.js"></script> -->


<div class="col-md-4">
					<a data-advis-id="${counselor.advisId}" class="btn btn-primary btn-lg" role="button">상담권 선택하기</a>
				</div>

<script type="text/javascript">

function edit11(){
if (m == "1" ) {
        document.regi_form.mode.value =  "update_list";		
    }else {
        var con = confirm("삭제하시겠습니까? \n 삭제하시면 복구 할 수 없습니다.");
        if (con) {
            document.regi_form.mode.value =  "delete_list";
        }else {
            return false;
        }
    }
    document.regi_form.gid.value = val;
    document.regi_form.submit();
	
	
	/* var inven1 = "inventory1_"+vs; */
	/* $.trim(inven1); */
	/* console.log(dis);	 */
	/* console.log(inven1);//inventory1_1234가 나오게 된다 */
	/* let discount = $("#inven1").val(); */
/* 	var nChk = document.getElementsByName("\""+inven1+"\""); 
	console.log(nChk);
	console.log($(inven1));
	console.log(discount); */
	    /* location.href = "${pageContext.request.contextPath }/shop/admin/product/search.do?productId="+vs+"&discount="+${p.productId}; */ 
	  
}
$(()=>{
    $("btn-noradpdd").on("click", function(){
	    let advisId = $(this).attr("data-advis-id");
	    console.log(advisId);
	    location.href = "${pageContext.request.contextPath }/shop/admin/product/search.do?advisId="+advisId;
    });
});
</script>

<script type="text/javascript">
    <!--
      $(document).ready(function () {  
        $("#main_page").click(function(){
            location.href="/sales_manager/main/main.php";
        });
      });
      //-->
    </script>

<script src="./js/clipboard.min.js"></script>

<script type="text/javascript">

function deleteProduct(val){
	
	var productId = val;
	console.log(productId)
	        var con = confirm("삭제하시겠습니까? \n 삭제하시면 복구 할 수 없습니다.");
	        if (con) {
			   location.href="${pageContext.request.contextPath }/shop/admin/product/delete.do?productId="+productId;
	        }else {
	            return false;
	        }

}

function edit(val,m) {

	//할인가격 받아오는곳.
	var vs = val;
	var discountPrice = "discount_"+vs;
	var discount1 = discountPrice;	
	var resDiscount=document.getElementById(discount1);
	var discountPrice=resDiscount.value
	console.log(resDiscount.value);
	
	//재고 수량 변경
	var stockvalue = "stock_"+vs;
	var stock =stockvalue; 
	var resStock=document.getElementById(stock);
	console.log(resStock.value);
	var productStock=resStock.value
	
	//프로덕트아이디 
	var productId=m;
	
	//프로덕트 상태
	var state = "state_"+vs;
	var state1= state
	var resState = document.getElementById(state1);
	/* var productState = resState.value */
	console.log(state1);
	var size = document.getElementsByName(state1).length;
    for(var i = 0; i < size; i++){
        if(document.getElementsByName(state1)[i].checked == true){
            productState=document.getElementsByName(state1)[i].value;
        }
    }
    console.log(productState);
	//호출문
	   location.href="${pageContext.request.contextPath }/shop/admin/product/update.do?productId="+productId+"&discountPrice="+discountPrice+"&productStock="+productStock+"&productState="+productState; 
	
    
}
        function selall(chekboxall,checkboxsub){
           var ischeck="";
            if (chekboxall.checked) {
                 ischeck="checked";
            }
           if (checkboxsub.name !=undefined){
              checkboxsub.checked=ischeck;
           }else {
                for (i=0; i<checkboxsub.length; i++) {
                checkboxsub[i].checked =ischeck;
                }
           }
        }
        //xlsdown
        function xlsdown(){
            var form=document.xlsform;
            form.submit();
        }
    
        function CheckGroup(val){
            var form=document.regi_form;
            var i; 
            var nChk = document.getElementsByName("chkDel");     //체크되어있는 박스 value값
            form.gid.value ='';
            if(nChk){
            for(i=0;i<nChk.length;i++) { 
                if(nChk[i].checked){                                                            //체크되어 있을경우 
                    if(form.gid.value ==''){
                        form.gid.value = nChk[i].value; 
                    }else{
                        form.gid.value =  form.gid.value+ ',' +nChk[i].value;   //구분자로 +=
                    }
                } 
            }
            if(form.gid.value ==''){                                                 //선택이 하나도 안되어있을 경우
                alert("1건 이상 선택해 주세요.");       
                return false; 
            }
            if ( val == "1" ) { // 일괄수정
                form.mode.value =  "update_list";
            }else if ( val == "2" ) { // 일괄삭제
                form.mode.value =  "delete_list";
            } 
                document.regi_form.submit();
            } 
        }
      
        function selUp(val , m) {
            
            //alert(document.regi_form.gid.value);
            if (m == "1" ) {
                document.regi_form.mode.value =  "update_list";		
            }else {
                var con = confirm("삭제하시겠습니까? \n 삭제하시면 복구 할 수 없습니다.");
                if (con) {
                    document.regi_form.mode.value =  "delete_list";
                }else {
                    return false;
                }
            }
            document.regi_form.gid.value = val;
            document.regi_form.submit();
        }
        
        $(document).ready(function(){
            $('#sdate').datepicker().on('changeDate', function(e) {
                $("#sdate").datepicker('hide');
            });
            $('#edate').datepicker().on('changeDate', function(e) {
                $("#edate").datepicker('hide');
            });
            
            var date = new Date(); //현재 날짜. 
            var year = date.getFullYear();//년도 빼오기 
            var month = new String(date.getMonth()+1);
            var monthone = new String(date.getMonth());
            var day = new String(date.getDate()); 
            var alterday = new String(date.getDate()-7); 

            // 한자리수일 경우 0을 채워준다. 
            if(month.length == 1){ 
              month = "0" + month; 
            }
            if(monthone.length == 1){ 
                monthone = "0" + monthone; 
              } 
            if(day.length == 1){ 
              day = "0" + day; 
            }
            if(alterday.length == 1){ 
            	alterday = "0" + alterday; 
            }  

            /* $("#sdate").val(year + "-" + month + "-" + day); */
            var today= year + "-" + month + "-" + day
            var tomonth= year + "-" + monthone + "-" + day
            var weekday=year + "-" + month + "-" + alterday 
            
            console.log(weekday)
            
            //현재 년월일 뽑아내는것.
            var today_val = new Date().toISOString().substring(0, 10);
            console.log(today_val)
            
            
            /* var today = new Date(); */
            console.log("today"+today)
            /* var week_val  = today_val; */
            /* week_val.setMonth(today_val.getMonth() - 1); */
            
            
            /* var week_val= today.getMonth(); //현재 기준에서 -한달 한것. */
            
            /* console.log(week_val) */
            
            
            /* var today_val = "2020-03-29"; */
            /*  var week_val = "2020-03-19"; */  
            var mon_val = "2020-02-26";
    
            //오늘 날짜 버튼 클릭시
            $(".sel_today").on("click",function(){
                $("#sdate").val(today);
                $("#edate").val(today);
            });
            
            //일주일 관련 눌리기
            $(".sel_week").click(function(){
                $("#sdate").val(weekday);
                $("#edate").val(today);
            });
            //한달 날짜 눌리기
            $(".sel_month").click(function(){
                $("#sdate").val(tomonth);
                $("#edate").val(today_val);
            });
        });
    
    </script>
<!-- <div class="datepicker dropdown-menu"><div class="datepicker-days" style="display: block;"><table class=" table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">3월 2020</th><th class="next">›</th></tr><tr><th class="dow">일</th><th class="dow">월</th><th class="dow">화</th><th class="dow">수</th><th class="dow">목</th><th class="dow">금</th><th class="dow">토</th></tr></thead><tbody><tr><td class="day  old">23</td><td class="day  old">24</td><td class="day  old">25</td><td class="day  old">26</td><td class="day  old">27</td><td class="day  old">28</td><td class="day  old">29</td></tr><tr><td class="day ">1</td><td class="day ">2</td><td class="day ">3</td><td class="day ">4</td><td class="day ">5</td><td class="day ">6</td><td class="day ">7</td></tr><tr><td class="day ">8</td><td class="day ">9</td><td class="day ">10</td><td class="day ">11</td><td class="day ">12</td><td class="day ">13</td><td class="day ">14</td></tr><tr><td class="day ">15</td><td class="day ">16</td><td class="day ">17</td><td class="day ">18</td><td class="day ">19</td><td class="day ">20</td><td class="day ">21</td></tr><tr><td class="day ">22</td><td class="day ">23</td><td class="day ">24</td><td class="day ">25</td><td class="day  active">26</td><td class="day ">27</td><td class="day ">28</td></tr><tr><td class="day ">29</td><td class="day ">30</td><td class="day ">31</td><td class="day  new">1</td><td class="day  new">2</td><td class="day  new">3</td><td class="day  new">4</td></tr></tbody></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="month">1</span><span class="month">2</span><span class="month active">3</span><span class="month">4</span><span class="month">5</span><span class="month">6</span><span class="month">7</span><span class="month">8</span><span class="month">9</span><span class="month">10</span><span class="month">11</span><span class="month">12</span></td></tr></tbody></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020-2029</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="year old">2019</span><span class="year active">2020</span><span class="year">2021</span><span class="year">2022</span><span class="year">2023</span><span class="year">2024</span><span class="year">2025</span><span class="year">2026</span><span class="year">2027</span><span class="year">2028</span><span class="year">2029</span><span class="year old">2030</span></td></tr></tbody></table></div></div><div class="datepicker dropdown-menu"><div class="datepicker-days" style="display: block;"><table class=" table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">3월 2020</th><th class="next">›</th></tr><tr><th class="dow">일</th><th class="dow">월</th><th class="dow">화</th><th class="dow">수</th><th class="dow">목</th><th class="dow">금</th><th class="dow">토</th></tr></thead><tbody><tr><td class="day  old">23</td><td class="day  old">24</td><td class="day  old">25</td><td class="day  old">26</td><td class="day  old">27</td><td class="day  old">28</td><td class="day  old">29</td></tr><tr><td class="day ">1</td><td class="day ">2</td><td class="day ">3</td><td class="day ">4</td><td class="day ">5</td><td class="day ">6</td><td class="day ">7</td></tr><tr><td class="day ">8</td><td class="day ">9</td><td class="day ">10</td><td class="day ">11</td><td class="day ">12</td><td class="day ">13</td><td class="day ">14</td></tr><tr><td class="day ">15</td><td class="day ">16</td><td class="day ">17</td><td class="day ">18</td><td class="day ">19</td><td class="day ">20</td><td class="day ">21</td></tr><tr><td class="day ">22</td><td class="day ">23</td><td class="day ">24</td><td class="day ">25</td><td class="day  active">26</td><td class="day ">27</td><td class="day ">28</td></tr><tr><td class="day ">29</td><td class="day ">30</td><td class="day ">31</td><td class="day  new">1</td><td class="day  new">2</td><td class="day  new">3</td><td class="day  new">4</td></tr></tbody></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="month">1</span><span class="month">2</span><span class="month active">3</span><span class="month">4</span><span class="month">5</span><span class="month">6</span><span class="month">7</span><span class="month">8</span><span class="month">9</span><span class="month">10</span><span class="month">11</span><span class="month">12</span></td></tr></tbody></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020-2029</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="year old">2019</span><span class="year active">2020</span><span class="year">2021</span><span class="year">2022</span><span class="year">2023</span><span class="year">2024</span><span class="year">2025</span><span class="year">2026</span><span class="year">2027</span><span class="year">2028</span><span class="year">2029</span><span class="year old">2030</span></td></tr></tbody></table></div></div> -->
</body>
</html>




