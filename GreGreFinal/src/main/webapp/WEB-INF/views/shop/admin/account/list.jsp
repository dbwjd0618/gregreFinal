  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/shop/admin/common/header.jsp" />
<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			수익 <small>판매현황</small>
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
			<form action="${pageContext.request.contextPath }/shop/admin/account/search.do" method="get"
				role="form" class="form-horizontal" name="seach_form">

				<table class="table table-bordered">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 30%;">
						<col style="width: 15%;">
						<col style="width: 30%;">
						<col style="width: 10%;">
					</colgroup>
					<tbody>
					
						<tr>
							<th class="text-center active" style="vertical-align: middle;">주문일</th>
							<td class="text-left"
								style="background-color: #fff; vertical-align: middle;"><input
								type="text" name="startDate" class="form-control"
								style="width: 100px; display: inline-block;" id="sdate" value=""
								data-date="2020-03-13" data-date-format="yyyy-mm-dd"> ~
								<input type="text" name="endDate" class="form-control"
								style="width: 100px; display: inline-block;" id="edate" value=""
								data-date="2020-03-20" data-date-format="yyyy-mm-dd">
								<button class="btn btn-default btn-xs sel_today" type="button">오늘</button>
								<button class="btn btn-default btn-xs sel_week" type="button">일주일</button>
								<button class="btn btn-default btn-xs sel_month" type="button">한달</button></td>
							<th class="text-center active" style="vertical-align: middle;">결재상태</th>
							<td class="text-center" style="background-color: #fff;"><select
								name="payState" class="form-control" id="stat_pay_rst"
								style="width: 200px;">
									<option value="">-- 선택 --</option>
									<option value="Y">입금완료</option>
									<option value="N">미입금</option>
							</select></td>

							<td class="text-center" rowspan="2"
								style="background-color: #fff; vertical-align: middle;"><button
									type="submit" class="btn btn-primary btn-lg" id="service_pay">
									검 색</button></td>
						</tr>
						<tr>
							<th class="text-center active" style="vertical-align: middle;">결재방식</th>
							<td class="text-center" style="background-color: #fff;"><select
								name="payMethod" class="form-control" id="stat_pay"
								style="width: 200px;">
									<option value="">-- 선택 --</option>
									<option value="cr">신용카드</option>
									<option value="ph">휴대전화</option>
									<option value="ac">무통장입금</option>
									<option value="ka">카카오페이</option>
									<option value="to">토스</option>
									<option value="na">네이버페이</option>
									<option value="ra">실시간계좌이체</option>
							</select></td>
							<th class="text-center active" style="vertical-align: middle;">?</th>
							<td class="text-center" style="background-color: #fff;">?</td>
						</tr>
					</tbody>
				</table>
			</form>
			<!-- 카운트 및 가격에 대한 값 정의 -->

			<c:set var="totalCount" value="0" />

			<c:set var="totalPrice" value="0" />
			<c:set var="totalSupPrice" value="0" />

			<c:set var="crCount" value="0" />
			<c:set var="crPrice" value="0" />
			<c:set var="acCount" value="0" />
			<c:set var="acPrice" value="0" />
			<c:set var="phCount" value="0" />
			<c:set var="phPrice" value="0" />
			<c:set var="kaCount" value="0" />
			<c:set var="kaPrice" value="0" />
			<c:set var="toCount" value="0" />
			<c:set var="toPrice" value="0" />
			<c:set var="naCount" value="0" />
			<c:set var="naPrice" value="0" />
			<c:set var="raCount" value="0" />
			<c:set var="raPrice" value="0" />
			
			
			
			
			
			<c:forEach items="${plist}" var="p">
				<c:set var="totalSupPrice" value="${totalSupPrice +p.supplyValue}" />
				<c:set var="totalCount" value="${totalCount +1}" />
				<c:set var="totalPrice" value="${totalPrice + p.totalPrice}" />
				<c:if test="${p.payMethod eq 'cr'}">
					<c:set var="crCount" value="${crCount +1}"></c:set>
					<c:set var="crPrice" value="${p.totalPrice}" />
				</c:if>
				<c:if test="${p.payMethod eq 'ac'}">
					<c:set var="acCount" value="${acCount+1}"></c:set>
					<c:set var="acPrice" value="${acPrice+p.totalPrice}" />
				</c:if>
				<c:if test="${p.payMethod eq 'ph'}">
					<c:set var="phCount" value="${p.count+1}"></c:set>
					<c:set var="phPrice" value="${phPrice+p.totalPrice}" />
				</c:if>
				<c:if test="${p.payMethod eq 'ka'}">
					<c:set var="kaCount" value="${kaCount+1}"></c:set>
					<c:set var="kaPrice" value="${kaPrice+p.totalPrice}" />
				</c:if>
				<c:if test="${p.payMethod eq 'to'}">
					<c:set var="toCount" value="${toCount+1}"></c:set>
					<c:set var="toPrice" value="${p.totalPrice}" />
				</c:if>
				<c:if test="${p.payMethod eq 'na'}">
					<c:set var="naCount" value="${naCount+1}"></c:set>
					<c:set var="naPrice" value="${naPrice+p.totalPrice}" />
				</c:if>
				<c:if test="${p.payMethod eq 'ra'}">
					<c:set var="raCount" value="${p.count+1}"></c:set>
					<c:set var="raPrice" value="${raPrice+p.totalPrice}" />
				</c:if>
			</c:forEach>
			
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="text-center active vertical-middle">분류<c:out
								value=""></c:out></th>
						<th class="text-center active vertical-middle">건수</th>
						<th class="text-center active vertical-middle">금액</th>
					</tr>
					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">신용카드</td>
						<td class="text-right vertical-middle"><c:out
								value="${crCount }"></c:out>건</td>
								<td  class="text-right vertical-middle">
							<fmt:formatNumber value="${crPrice}" pattern="#,###" />
						원</td>
					</tr>
					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">무통장입금</td>
						<td class="text-right vertical-middle"><c:out
								value="${acCount}"></c:out>건</td>
								<td  class="text-right vertical-middle">
							<fmt:formatNumber value="${acPrice}" pattern="#,###" />
						원</td>
					</tr>
					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">휴대전화</td>
						<td class="text-right vertical-middle"><c:out
								value="${phCount}"></c:out>건</td>
								<td  class="text-right vertical-middle">
							<fmt:formatNumber value="${phPrice}" pattern="#,###" />
						원</td>
					</tr>

					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">카카오페이</td>
						<td class="text-right vertical-middle"><c:out
								value="${kaCount}"></c:out>건</td>
								<td  class="text-right vertical-middle">
							<fmt:formatNumber value="${kaPrice}" pattern="#,###" />
						원</td>
					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">토스</td>
						<td class="text-right vertical-middle"><c:out
								value="${toCount}"></c:out>건</td>
								<td  class="text-right vertical-middle">
							<fmt:formatNumber value="${toPrice}" pattern="#,###" />
						원</td>
					</tr>
					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">네이버페이</td>
						<td class="text-right vertical-middle"><c:out
								value="${naCount}"></c:out>건</td>
								<td  class="text-right vertical-middle">
							<fmt:formatNumber value="${naPrice}" pattern="#,###" />
						원</td>
					</tr>
					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">실시간계좌이체</td>
						<td class="text-right vertical-middle"><c:out
								value="${raCount}"></c:out>건</td>
						<td class="text-right vertical-middle">
						<fmt:formatNumber value="${raPrice}" pattern="#,###" />
						원</td>
					</tr>

					<tr style="background-color: #ffffff;">
						<td class="text-center vertical-middle">합계</td>
						<td class="text-right vertical-middle"><c:out
								value="${totalCount}"></c:out> 건</td>
						<td class="text-right vertical-middle"><fmt:formatNumber value="${totalPrice }" pattern="#,###" /> 원</td>
					</tr>

				</tbody>
			</table>

			<table class="table table-bordered">
				<tbody>
					<tr>
						<td>
							<div class="widget-content text-conter">
								<div class="row">
									<div class="col-lg-3 bordered " style="width: 23%;">
										<div class="value-block text-center">
											<div class="value-sub">
												<strong class="text-danger">총 결재 금액</strong>
											</div>
											<div class="value-self won"><fmt:formatNumber value="${totalPrice }" pattern="#,###" />원</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-3 bordered  " style="width: 23%;">
											<div class="value-block text-center">
												<div class="value-sub">
													<strong class="text-danger">총 판매 이익</strong>
												</div>
												<div class="value-self"><fmt:formatNumber value="${totalPrice-totalSupPrice}" pattern="#,###" />원</div>
											</div>
										</div>
										<div class="col-lg-3 bordered " style="width: 23%;">
											<div class="value-block text-center">
												<div class="value-sub">
													<strong class="text-danger">총 구매건수</strong>
												</div>
												<div class="value-self">${totalCount}건</div>
											</div>
										</div>
										<div class="col-lg-3 " style="width: 23%;">
											<div class="value-block text-center">
												<div class="value-sub">
													<strong class="text-danger">선택날짜</strong>
												</div>
												<div class="value-self">${sdate } ~ ${edate }</div>
											</div>
										</div>
									</div>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	
      <c:if test="${fn:length(clist) >0 }">									
 	 google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawChart);

       function drawChart() {
         var data = google.visualization.arrayToDataTable([
           ['Month', '공급가', '판매가'],
           
           <c:forEach items="${clist}" var="cs" varStatus="vs">
           ['${cs.adate}',${cs.supValue}, ${cs.price} ]
           ${!vs.last?",":""}
           </c:forEach>
           
         ]);

         var options = {
           title: '총 매출현황',
           curveType: 'function',
           legend: { position: 'bottom' },
           hAxis:{
           format:""
           }
           
         };

         var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

         chart.draw(data, options);
       }
       </c:if>
      </script>
      <div id="curve_chart" style="height: 500px; position: relative;">
     	<div><br /> <h2>매출이 없습니다..</h2></div>
      </div>

										
								
								</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
jQuery('.won').text(function() {
    jQuery(this).text(
        jQuery(this).text().format()
    );
});
</script>
<!-- /.content-wrapper -->

<!-- </div> -->
<!-- ./wrapper -->
<!-- Js Plugins -->
    <script src="${pageContext.request.contextPath }/resources/js/shop/jquery-3.3.1.min.js"></script>
    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/jQuery-2.1.3.min.js"></script>
    <!-- jQuery UI 1.11.2 -->
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.min.js" type="text/javascript"></script>    
    <!-- Morris.js charts -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/morris.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/icheck.min.js" type="text/javascript"></script>
    <!-- Slimscroll -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/resources/js/admin/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/app.min.js" type="text/javascript"></script>



    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/demo.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
  $(document).ready(function () {  
	$("#main_page").click(function(){
		location.href="/sales_manager/main/main.php";
	});
  });
  //-->
</script>

<script type="text/javascript">
function edit(val,m) {
	alert("뭐에요 ?.");
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
        
        
        
        
        //더미 값
        
        
        /* 날짜 객체 받아서 문자열로 리턴하는 함수 */
function getDateStr(myDate){
	var	mm = String(myDate.getMonth()+1).length === 1 ? '0' + String(myDate.getMonth()+1) : String(myDate.getMonth()+1);
	var dd = String(myDate.getDate()).length === 1 ? '0' + String(myDate.getDate()) : String(myDate.getDate());
	return (myDate.getFullYear() + '-'+
			mm+'-'+dd)
}

$( "#sdate" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
$( "#edate" ).datepicker( "option", "dateFormat", "yy-mm-dd" );



/* 오늘 날짜를 문자열로 반환 */
function today() {
  var d = new Date()
  return getDateStr(d)
}

/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek() {
  var d = new Date()
  var dayOfMonth = d.getDate()
  d.setDate(dayOfMonth - 7)
  return getDateStr(d)
}

/* 오늘로부터 1개월전 날짜 반환 */
function lastMonth() {
  var d = new Date()
  var monthOfYear = d.getMonth()
  d.setMonth(monthOfYear - 1)
  return getDateStr(d)
}
			//오늘 날짜 버튼 클릭시
            $(".sel_today").on("click",function(){
                $("#sdate").val(today());
                $("#edate").val(today());
            });
            
            //일주일 관련 눌리기
            $(".sel_week").click(function(){
                $("#sdate").val(lastWeek());
                $("#edate").val(today());
            });
            //한달 날짜 눌리기
            $(".sel_month").click(function(){
                $("#sdate").val(lastMonth());
                $("#edate").val(today());
            });
        
        
        
        
        //더미값 종료
        
        
        //달력 위젯 사용되는 것임.
        $(document).ready(function(){
            $('#sdate').datepicker().on('changeDate', function(e) {
                $("#sdate").datepicker('hide');
            });
            $('#edate').datepicker().on('changeDate', function(e) {
                $("#edate").datepicker('hide');
            });

        });
    
    </script>
<!-- <div class="datepicker dropdown-menu"><div class="datepicker-days" style="display: block;"><table class=" table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">3월 2020</th><th class="next">›</th></tr><tr><th class="dow">일</th><th class="dow">월</th><th class="dow">화</th><th class="dow">수</th><th class="dow">목</th><th class="dow">금</th><th class="dow">토</th></tr></thead><tbody><tr><td class="day  old">23</td><td class="day  old">24</td><td class="day  old">25</td><td class="day  old">26</td><td class="day  old">27</td><td class="day  old">28</td><td class="day  old">29</td></tr><tr><td class="day ">1</td><td class="day ">2</td><td class="day ">3</td><td class="day ">4</td><td class="day ">5</td><td class="day ">6</td><td class="day ">7</td></tr><tr><td class="day ">8</td><td class="day ">9</td><td class="day ">10</td><td class="day ">11</td><td class="day ">12</td><td class="day ">13</td><td class="day ">14</td></tr><tr><td class="day ">15</td><td class="day ">16</td><td class="day ">17</td><td class="day ">18</td><td class="day ">19</td><td class="day ">20</td><td class="day ">21</td></tr><tr><td class="day ">22</td><td class="day ">23</td><td class="day ">24</td><td class="day ">25</td><td class="day  active">26</td><td class="day ">27</td><td class="day ">28</td></tr><tr><td class="day ">29</td><td class="day ">30</td><td class="day ">31</td><td class="day  new">1</td><td class="day  new">2</td><td class="day  new">3</td><td class="day  new">4</td></tr></tbody></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="month">1</span><span class="month">2</span><span class="month active">3</span><span class="month">4</span><span class="month">5</span><span class="month">6</span><span class="month">7</span><span class="month">8</span><span class="month">9</span><span class="month">10</span><span class="month">11</span><span class="month">12</span></td></tr></tbody></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020-2029</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="year old">2019</span><span class="year active">2020</span><span class="year">2021</span><span class="year">2022</span><span class="year">2023</span><span class="year">2024</span><span class="year">2025</span><span class="year">2026</span><span class="year">2027</span><span class="year">2028</span><span class="year">2029</span><span class="year old">2030</span></td></tr></tbody></table></div></div><div class="datepicker dropdown-menu"><div class="datepicker-days" style="display: block;"><table class=" table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">3월 2020</th><th class="next">›</th></tr><tr><th class="dow">일</th><th class="dow">월</th><th class="dow">화</th><th class="dow">수</th><th class="dow">목</th><th class="dow">금</th><th class="dow">토</th></tr></thead><tbody><tr><td class="day  old">23</td><td class="day  old">24</td><td class="day  old">25</td><td class="day  old">26</td><td class="day  old">27</td><td class="day  old">28</td><td class="day  old">29</td></tr><tr><td class="day ">1</td><td class="day ">2</td><td class="day ">3</td><td class="day ">4</td><td class="day ">5</td><td class="day ">6</td><td class="day ">7</td></tr><tr><td class="day ">8</td><td class="day ">9</td><td class="day ">10</td><td class="day ">11</td><td class="day ">12</td><td class="day ">13</td><td class="day ">14</td></tr><tr><td class="day ">15</td><td class="day ">16</td><td class="day ">17</td><td class="day ">18</td><td class="day ">19</td><td class="day ">20</td><td class="day ">21</td></tr><tr><td class="day ">22</td><td class="day ">23</td><td class="day ">24</td><td class="day ">25</td><td class="day  active">26</td><td class="day ">27</td><td class="day ">28</td></tr><tr><td class="day ">29</td><td class="day ">30</td><td class="day ">31</td><td class="day  new">1</td><td class="day  new">2</td><td class="day  new">3</td><td class="day  new">4</td></tr></tbody></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="month">1</span><span class="month">2</span><span class="month active">3</span><span class="month">4</span><span class="month">5</span><span class="month">6</span><span class="month">7</span><span class="month">8</span><span class="month">9</span><span class="month">10</span><span class="month">11</span><span class="month">12</span></td></tr></tbody></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2020-2029</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="year old">2019</span><span class="year active">2020</span><span class="year">2021</span><span class="year">2022</span><span class="year">2023</span><span class="year">2024</span><span class="year">2025</span><span class="year">2026</span><span class="year">2027</span><span class="year">2028</span><span class="year">2029</span><span class="year old">2030</span></td></tr></tbody></table></div></div> -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
</body>
</html>




