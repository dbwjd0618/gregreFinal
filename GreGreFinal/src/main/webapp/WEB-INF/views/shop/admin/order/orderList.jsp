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
        <div class="main-content">
  <h2 class="menu_sub_title">전체주문조회</h2>
	
	<div class="row text-center">
	<div class="col-md-12">		  
		<form method="get" role="form" class="form-horizontal" name="seach_form" id="seach_form">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="S" value="1">
		<!-- <input type="hidden" name="ostatus" value=""> -->
		
		  
		<table class="table table-bordered">
			<colgroup>
				<col style="width:10%;">
				<col style="width:30%;">
				<col style="width:10%;">
				<col style="width:30%;">
				<col style="width:10%;">
			</colgroup>
			<tr> 
				<th class="text-center active" style="vertical-align:middle;">기간</th>
				<td class="text-left" style="background-color:#fff;vertical-align:middle;">
					<input type="text" name="startDate" class="form-control" style="width:100px;display:inline-block;" id="sdate" value="" data-date="2020-03-25" data-date-format="yyyy-mm-dd" /> ~ 
					<input type="text" name="endDate" class="form-control" style="width:100px;display:inline-block;" id="edate" value="" data-date="2020-04-01" data-date-format="yyyy-mm-dd" />
					<button class="btn btn-default btn-xs sel_today" type="button" >오늘</button> 
					<button class="btn btn-default btn-xs sel_week" type="button" >일주일</button> 
					<button class="btn btn-default btn-xs sel_month" type="button" >한달</button>
				</td>							
					
				<th class="text-center active" style="vertical-align:middle;">상품명</th>
				<td class="text-center" style="background-color:#fff;">
					<input type="text" name="productName" class="form-control" style="display:inline-block;" id="pname" value="" />
				</td>
				<td class="text-center" rowspan="5" style="background-color:#fff;vertical-align:middle;"><button class="btn btn-primary btn-lg" id="searchBtn" type="button" onclick="searchPram();"> 검 색 </button></td>
			</tr>
			<tr>
				
			</tr>
			<tr>
				<th class="text-center active" style="vertical-align:middle;">결제방식</th>
				<td class="text-left" style="background-color:#fff;vertical-align:middle;">
					<select name="payMethod" class="form-control" id="pay" style="width:200px;">
						<option value="" selected> -- 선택 -- </option>
						<option value="cr" > 신용카드 </option>
						<option value="ph" > 휴대전화 </option>
						<option value="ac" > 무통장입금 </option>
						<option value="va" > 가상계좌 </option>
						<option value="ka" > 카카오 </option>
						<option value="to" > 토스</option>
						<option value="na" > 네이버페이 </option>
					</select>
				</td>
				<th class="text-center active" style="vertical-align:middle;">주문상태</th>
				<td class="text-left" style="background-color:#fff;" colspan="3">
					<label>
					
						<input type="checkbox" name="ostatus" value="A" >
						<span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">입금대기</span>
					</label>

					<label>
						<input type="checkbox" name="ostatus" value="B" >
						<span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">결제완료</span>
					</label>

					<label>
						<input type="checkbox" name="ostatus" value="C" >
						<span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">배송준비</span>
					</label>

					<label>
						<input type="checkbox" name="ostatus" value="D" >
						<span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">배송중</span>
					</label>

					<label>
						<input type="checkbox" name="ostatus" value="E" >
						<span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">배송완료</span>
					</label>

				</td>
			</tr>
			
					</table>
		</form>
		<form method="post" action="${PageContext.request.contextPath}/shop/admin/order/search.do"  role="form" class="form-horizontal" name="regi_form" id="regi_form">
		<!-- <input type="hidden" name="sdate"		id="sdate"			value="">
		<input type="hidden" name="edate"		id="edate"			value="">
		<input type="hidden" name="receipt_yn"	id="receipt_yn"	value="">
		<input type="hidden" name="searchK"		id="searchK"		value="">
		<input type="hidden" name="pname"		id="pname"			value="">
		<input type="hidden" name="pay"			id="pay"				value="">
		<input type="hidden" name="status"		id="status"			value="">
		<input type="hidden" name="sort"			id="sort"			value="">
		<input type="hidden" name="orderby"		id="orderby"		value="">
		<input type="hidden" name="list_count"	id="list_count"	value="">
		<input type="hidden" name="page"			id="page"			value="">
		<input type="hidden" name="S"				id="S"				value="">
		<input type="hidden" name="gid"			id="gid"				value="">
		<input type="hidden" name="mode"			id="mode"			value="">
		<input type="hidden" name="MID"			id="MID"				value=""> 현금영수증 발급을 위한 가맹점 번호
		<input type="hidden" name="statusup"	id="statusup"		value="">
		<input type="hidden" name="ostatus"		id="ostatus"		value=""> -->

			<div class="col-md-12" style="text-align:left;margin-bottom:8px; padding-left:0px;">
				<span class="col-md-12 text-left b" style="font-size:1.3em; padding-left:0px;">총 주문건수 : <strong class="text-danger">${totalOrders }</strong>개
					<button class="btn btn-primary btn-sm" type="button" id="ChkSms" style="margin-left:20px;">선택 SMS발송</button>
					<button class="btn btn-primary btn-sm" type="button" onclick="CheckGroup(2);return false;">선택주문취소</button>
					<button class="btn btn-primary btn-sm" type="button" onclick="xlsdown();return false;">엑셀저장</button>
					<!--button class="btn btn-primary btn-sm" type="button" onclick="sendCashReceipt();return false;">선택 현금영수증 발행</button-->
					

					<select name="status_update" class="form-control" id="status_update" style="margin-left:30px;width:190px;display:inline-block;">
						<option value=""> -- 주문상태 선택변경 -- </option>
						<option value="0">미입금</option>
						<option value="2">신규주문</option>
						<option value="3">배송준비</option>
						<option value="4">배송중</option>
						<option value="5">배송완료</option>
						<!-- <option value="10">배송예약</option> -->
						<option value="60">취소접수</option>
						<option value="61">취소완료</option>
						<!-- <option value="70">반품중</option>
						<option value="71">반품완료</option> -->
						<!-- <option value="80">교환중</option>
						<option value="81">교환완료</option> -->
					</select>
					<button class="btn btn-primary btn-sm" type="button" onclick="CheckGroup(4);return false;">선택변경하기</button>

				</span>
			</div>
			<table class="table table-bordered">
        <colgroup>
            <col style="width:15px;">
            <col style="width:60px;">
            <col style="width:150px;">
            <col style="width:100px">
            <col style="width:90px">
            <col style="width:90px">
            <col style="width: ">
            <col style="width: ">
            <col style="width:90px;">
            <col style="width:90px; ">
				<col style="width: ">
				<col style="width:90px">
            <col style="width:80px;">
            <col style="width:74px;">
        </colgroup>
				<tr>
					<th class="text-center active vertical-middle"><input type="checkbox" name="chkall" value="1" onclick="javascript:selall(this,document.regi_form.chkDel);"></th>
					<th class="text-center active">번호</th>
					<th class="text-center active">주문번호</th>
					<th class="text-center active">주문일</th>
					<th class="text-center active">주문자명<br>주문자전화</th>
					<th class="text-center active">수령인명<br>수령인핸드폰</th>
					<th class="text-center active">우편번호<br>주소1<br>주소2</th>
					<th style="width:250px;" class="text-center active">상품정보<br>(상세)</th>
					<th class="text-center active">상품금액</th>
					<th class="text-center active">배송비<br>총결제금액</th>
					<th class="text-center active">택배사<br>배송번호</th>
					<th class="text-center active">결제방법</th>
					<th class="text-center active">결제상태<br>입금자명</th>
					<th class="text-center active">주문상태</th>
					<th class="text-center active">관리</th>

				</tr>
				<!-- 리스트 출력하는 부분. -->
                      <c:forEach items="${list}" var="l">
                     <tr style="background-color:#ffffff;">
					<td class="text-center vertical-middle">
						<input type="checkbox" name="chkDel" value="TLYChVDHcld_73929">
						<input type="hidden" name="phone[]" value="${recpt.phone }">
				   	</td>
					<td class="text-center vertical-middle"></td>
					<td class="text-center vertical-middle">${l.orderNo }<br><br><a class="btn btn-default btn-sm modifyMemo" ordernum="TLYChVDHcld_73929" ordernummemo="">메모수정</a></td>
					<td class="text-center vertical-middle">${l.orderDate }</td>
					<td class="text-center vertical-middle">
						조정우<br>	
						<a class="btn btn-warning btn-sm sendSMSForm" recvphone="${l.recptPhone }">${l.recptPhone }</a>
					</td>
					<td class="text-center vertical-middle">
						${l.recptName }<br>
						<a class="btn btn_black btn-sm sendSMSForm" recvphone="1234">1234</a>
					</td>
					
					<td class="text-left vertical-middle" >
						${l.recptZipcode }<br>
						${l.recptAddr }<br>
						${l.recptDetailAddr }			</td>
					<td class="text-left vertical-middle">
					 <img src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${l.attachList.get(0).renamedImg}" style="width:200px;" alt=""><br>
					<strong><a href="location.href='http://localhost:9090/Igre/shop/product/detail.do?productId=${p.productId }">${l.attachList.get(0).productName}</a></strong><br><br>
					opt : 90/블랙(1개)<br>					</td>
					<td class="text-right vertical-middle">${l.totalPrice }</td>
					<td class="text-right vertical-middle">${l.totalDeliveryFee } 원<br>${l.totalPrice+l.totalDeliveryFee } 원</td>
					<td class="text-right vertical-middle">우체국택배<br>${l.deliveryNo}</td>
					<td class="text-right vertical-middle">${l.payMethod }</td>
					<td class="text-center vertical-middle"><span class="dev_stat_red">${l.payState }</span></td>
					<td class="text-center vertical-middle"><span class="dev_stat_green">${l.deliveryState }</span></td>
					<td class="text-center vertical-middle">
						<button class="btn btn-detail btn-norad" 
						onclick="location.href='${pageContext.request.contextPath }/shop/product/detail.do?productId=${l.productId}'"
						 type="button">상세보기</button>
						<button class="btn btn-warning btn-norad" onclick="sel_check('TLYChVDHcld_73929','60');" type="button">주문취소</button>
					</td>
				</tr>
				</c:forEach>
				<!-- <tr style='background-color:#ffffff;'><td class='text-center vertical-middle' colspan='14'>주문내역이 없습니다.</td></tr> -->		
					</table>
		</form>
	</div>
	</div>
	<div class="row text-center">
		<div class="col-sm-12">
					<ul class="pagination pagination-sm">
										</ul>
			<div class="clearfix"></div>
		</div>
	</div>

</div>



</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src='/sales_manager/js/plugins/jquery.pnotify.js'></script>
<script src='/sales_manager/js/plugins/jquery.sparkline.min.js'></script>
<script src='/sales_manager/js/plugins/mwheelIntent.js'></script>
<script src='/sales_manager/js/plugins/mousewheel.js'></script>
<script src='/sales_manager/js/bootstrap/tab.js'></script>
<script src='/sales_manager/js/bootstrap/dropdown.js'></script>
<script src='/sales_manager/js/bootstrap/tooltip.js'></script>
<script src='/sales_manager/js/bootstrap/collapse.js'></script>
<script src='/sales_manager/js/bootstrap/scrollspy.js'></script>
<script src='/sales_manager/js/plugins/bootstrap-datepicker.js'></script>
<script src='/sales_manager/js/bootstrap/transition.js'></script>
<script src='/sales_manager/js/plugins/jquery.knob.js'></script>
<script src='/sales_manager/js/plugins/jquery.flot.min.js'></script>
<script src='/sales_manager/js/plugins/fullcalendar.js'></script>
<script src='/sales_manager/js/plugins/datatables/datatables.min.js'></script>
<script src='/sales_manager/js/plugins/chosen.jquery.min.js'></script>
<script src='/sales_manager/js/plugins/jquery.timepicker.min.js'></script>
<script src='/sales_manager/js/plugins/daterangepicker.js'></script>
<script src='/sales_manager/js/plugins/colpick.js'></script>
<script src='/sales_manager/js/plugins/moment.min.js'></script>
<script src='/sales_manager/js/plugins/datatables/bootstrap.datatables.js'></script>
<script src='/sales_manager/js/bootstrap/modal.js'></script>
<script src='/sales_manager/js/plugins/raphael-min.js'></script>
<script src='/sales_manager/js/plugins/morris-0.4.3.min.js'></script>
<script src='/sales_manager/js/plugins/jquery.maskedinput.min.js'></script>
<script src='/sales_manager/js/plugins/jquery.maskmoney.js'></script>
<script src='/sales_manager/js/plugins/summernote.js'></script>
<script src='/sales_manager/js/plugins/dropzone-amd-module.js'></script>
<script src='/sales_manager/js/plugins/jquery.validate.min.js'></script>
<script src='/sales_manager/js/plugins/jquery.bootstrap.wizard.min.js'></script>
<script src='/sales_manager/js/plugins/jscrollpane.min.js'></script>
<script src='/sales_manager/js/application.js'></script>


<script type="text/javascript">
<!--
  $(document).ready(function () {  
	$("#main_page").click(function(){
		location.href="/sales_manager/main/main.php";
	});
  });
  //-->
</script>

<!--메모 모달창 -->
<div class="modal fade" id="sendMemoForm" tabindex="-1" role="dialog" aria-labelledby="sendMemoForm" aria-hidden="true" alreadyLoad="0">
    <div class="modal-dialog">
        <div class="modal-content" id="sendMemoFormContent">
            <div class="sms_wrap" style="margin-top:0px;">
                <form id="smsForm">
                    <input type="hidden" name="momoPop" id="momoPop" value="">

                    <h2 style="margin-top:0px;">관리자 메모</h2>

                    <p><textarea class="form-control" rows="5" name="memoComm" id="memoComm" style="250px;"></textarea></p>


                    <div class="text-center">
                        <a href="javascript:;" class="btn btn-info btn-sm" id="memoSendBtn">수정하기</a>
                        <a href="javascript:;" id="closebtn" class="btn btn-default btn-sm" data-dismiss="modal">닫기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--메모 모달창끝 -->
<!--sms 개별모달창 -->
<div class="modal fade" id="sendSMSForm" tabindex="-1" role="dialog" aria-labelledby="sendSMSForm" aria-hidden="true" alreadyLoad="0">
    <div class="modal-dialog">
        <div class="modal-content" id="sendSMSFormContent">
            <div class="sms_wrap" style="margin-top:0px;">
                <form id="smsForm">
                    <input type="hidden" name="searchform" value="">
                    <h2 style="margin-top:0px;">SMS 보내기</h2>
                    <p><textarea class="form-control" rows="3" name="smsMessage" id="smsMessage"></textarea></p>
                    <div class="sms_number">
                        <ul>
                            <li class="clearfix">
                                <span class="name">받는 사람</span>
                                <span class="phone"><input type="text" name="smsReceive" id="smsReceive" class="form-control input-sm" value=""></span>
                            </li>
                            <li class="clearfix">
                                <span class="name">보내는사람</span>
                                <span class="phone"><input type="text" name="smsSender" id="smsSender" class="form-control input-sm" value="01089671359" readonly></span>
                            </li>
                        </ul>
                    </div>
                    <div class="text-center">
                        <a href="javascript:;" class="btn btn-info btn-sm" id="smsSendBtn">발송하기</a>
                        <a href="javascript:;" id="closebtn" class="btn btn-default btn-sm" data-dismiss="modal">닫기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--sms 개별모달창 -->

<!--sms 선택모달창 -->
<div class="modal fade" id="sendSMSFormtoOrder" tabindex="-1" role="dialog" aria-labelledby="sendSMSFormtoOrder" aria-hidden="true" alreadyLoad="0">
    <div class="modal-dialog">
        <div class="modal-content" id="sendSMSFormContentOrder">
            <div class="sms_wrap message clearfix">
                <h2 style="margin-top:0px;">SMS 보내기</h2>

                <div class="sms-box">
                    <form id="smsFormtoOrder">
                        <h3 style="margin-top:0px;">여러건은 번호마다 콤마(,) 구분</h3>
                        <p><textarea class="form-control" rows="12" name="smschkMessage" id="smschkMessage"></textarea></p>
                        <div class="sms_number">
                            <ul>
                                <li class="clearfix" style="display:none;">
                                    <span class="cname">주문 번호</span>
                                    <span class="cphone"><input type="text" name="smsOrderNum" id="smsOrderNum" class="form-control input-sm" value="" readonly></span>
                                </li>
                                <li class="clearfix">
                                    <span class="cname">받는 사람</span>
                                    <span class="cphone"><input type="text" name="smsReceivetoOrder" id="smsReceivetoOrder" class="form-control input-sm" value="" readonly></span>
                                </li>
                                <li class="clearfix">
                                    <span class="cname">보내는사람</span>
                                    <span class="cphone"><input type="text" name="smsSendertoOrder" id="smsSendertoOrder" class="form-control input-sm" value="01089671359" readonly></span>
                                </li>
                            </ul>
                        </div>
                        <div class="text-center">
                            <a href="javascript:;" class="btn btn-info btn-sm" id="smschksand" >발송하기</a>
                            <a href="javascript:;" id="closebtnOrder" class="btn btn-default btn-sm" data-dismiss="modal">닫기</a>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<!--sms 선택모달창 끝-->
<jsp:include page="/WEB-INF/views/shop/admin/common/footer.jsp"/>

<script src="/sales_manager/js/plugins/jquery.zeroclipboard.min.js"></script>
<script type="text/javascript">
//검색버튼 실행시 해당 부분 실행됩니다.
	function searchPram(){
		var form=document.seach_form;
		var i; 
		var nChk = document.getElementsByName("ostatus");     //체크되어있는 박스 value값
		form.ostatus.value ='';
		if(nChk){
			for(i=0;i<nChk.length;i++) { 
				if(nChk[i].checked){	//체크되어 있을경우 
					if(form.ostatus.value ==''){
						form.ostatus.value = nChk[i].value; 
					}else{
						form.ostatus.value =  form.ostatus.value+ ',' +nChk[i].value;   //구분자로 +=
					}
				} 
			}

			document.seach_form.action = "search.do";
			document.seach_form.submit();
		} 
	}

	function xlsdown(){
		var form=document.regi_form;
		var i; 
		var nChk = document.getElementsByName("chkDel");     //체크되어있는 박스 value값
		form.gid.value ='';
		if(nChk){
			for(i=0;i<nChk.length;i++) { 
				if(nChk[i].checked){	//체크되어 있을경우 
					if(form.gid.value ==''){
						form.gid.value = nChk[i].value; 
					}else{
						form.gid.value =  form.gid.value+ ',' +nChk[i].value;   //구분자로 +=
					}
				} 
			}

			document.regi_form.action = "excel_down.php";
			document.regi_form.submit();
		} 
	}

	function sendCashReceipt(){
		var form=document.regi_form;
		var i; 
		var nChk = document.getElementsByName("chkDel");     //체크되어있는 박스 value값
		form.gid.value ='';
		if(nChk){
			for(i=0;i<nChk.length;i++) { 
				if(nChk[i].checked){	//체크되어 있을경우 
					if(form.gid.value ==''){
						form.gid.value = nChk[i].value; 
					}else{
						form.gid.value =  form.gid.value+ ',' +nChk[i].value;   //구분자로 +=
					}
				} 
			}
			if(form.gid.value ==''){	//선택이 하나도 안되어있을 경우
				alert("1건 이상 선택해 주세요.");       
				return false; 
			}
			document.regi_form.action = "sendCashReceipt.php";
			document.regi_form.submit();
		} 
	}
	

	function CheckGroup(val){
		var form=document.regi_form;
		var i; 
		var nChk = document.getElementsByName("chkDel");     //체크되어있는 박스 value값
		form.gid.value ='';
		if(nChk){
			for(i=0;i<nChk.length;i++) { 
				if(nChk[i].checked){	//체크되어 있을경우 
					if(form.gid.value ==''){
						form.gid.value = nChk[i].value; 
					}else{
						form.gid.value =  form.gid.value+ ',' +nChk[i].value;   //구분자로 +=
					}
				} 
			}
			if(form.gid.value ==''){	//선택이 하나도 안되어있을 경우
				alert("1건 이상 선택해 주세요.");       
				return false; 
			}
			if ( val == "1" ) { // SMS발송
				var con = confirm("선택된 주문에대해서 미입금 확인 SMS를 발송하시겠습니까?");
				if (con) {
					form.ostatus_update.value =  "";
					form.mode.value =  "sms10";
					document.regi_form.action = "_proc.php";
				} else {
					return false;
				}
			}else if ( val == "2" ) { // 일괄취소
				var con = confirm("선택된 내역을 일괄 취소하시겠습니까?");
				if (con) {
					form.ostatus_update.value =  "61";
					form.mode.value =  "save_money";
					document.regi_form.action = "_procnew.php";
				} else {
					return false;
				}
			}else if ( val == "3" ) { // 일괄엑셀
				form.mode.value =  "excel_down";
			}else if ( val == "4" ) { // 일괄 수정
				var con = confirm("선택된 내역을 일괄 변경하시겠습니까?");
				if (con) {
					if (form.status_update.value == "" ) {
						alert("변경하실 주문상태를 선택해주세요");
						return false;
					}else {
						form.mode.value =  "save_money";
					}
					document.regi_form.action = "_proc.php";
				} else {
					return false;
				}
			}
			
			document.regi_form.submit();
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

	function selUp(val , m) {
		document.regi_form.gid.value = val;
		if (m == "1" ) {
			document.regi_form.mode.value =  "update_list";		
		}else {
			var con = confirm("삭제하시겠습니까? \n 삭제하시면 복구 할 수 없습니다.");
			if (con) {
				document.regi_form.mode.value =  "delete_list";
			}
		}
		document.regi_form.action = "_proc.php";
		document.regi_form.submit();			
	}

	function sel_check(val,stat) {
		var form=document.regi_form;
		var con = confirm("주문상태를 변경 하시겠습니까?");
		if (con) {
			form.gid.value = val;
			form.statusup.value = stat;
			form.mode.value = "save_money";
			form.action = "_procnew.php";
			form.submit();
		}else {
			return false;
		}	
	}

	function sel_del(val) {
		var con = confirm("삭제하시겠습니까? \n 삭제하시면 복구 할 수 없습니다.");
		if (con) {
			document.regi_form.gid.value = val;
			document.regi_form.mode.value = "delete";
			document.regi_form.action = "_proc.php";
			document.regi_form.submit();
		}else {
			return false;
		}	
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
			
		$("body").on("copy", ".zclip", function(/* ClipboardEvent */ e) {
			e.clipboardData.clearData();
			e.clipboardData.setData("text/plain", $(this).data("zclip-text"));
			e.preventDefault();
			alert("URL이 복사되었습니다.\n Ctrl+V로 붙여넣기 하세요");
		});

		$('.modifyMemo').click(function() {
			var orderNum = $(this).attr('orderNum'),
				 orderNumMemo = $(this).attr('orderNumMemo');
			$('#memoComm').html(orderNumMemo);
			$('#momoPop').val(orderNum);
			var sendMemoForm = $('#sendMemoForm');
			sendMemoForm.modal('show');
	   });


		$('#memoSendBtn').click(function() {
			var adminNum = $('#momoPop').val(),
				 adminMemo = $('#memoComm').val();

			$.ajax({
				url			: 	"/sales_manager/order/ajax_memoup.php",
				type		: 	"POST",
				dataType	: 	"json",
				data		: 	{
					'mode': 'memoUpdate',
					'onum' : adminNum,
					'admincomment' : adminMemo
				},
				success		: 	function (result) {
					//console.log(result.msg);  
					//console.log(result.seq); 
					if (result.msg =="SUCCESS")
					{
						alert('수정되었습니다');
						$(location).get(0).reload();
					}
					else {
						alert(result.msg);
						return false;
					}
				}
			});
		});

	});

	$('.sendSMSForm').on('click', function () {
		 var sendSMSForm = $('#sendSMSForm');

		 sendSMSForm.modal('show');
		 var row = $(this), smsForm = $('form#smsForm');
		 var recvphone = row.attr('recvphone');

		 if (recvphone != '') {
			  $('#smsReceive', smsForm).val(recvphone);
			  $('#smsReceive', smsForm).parent().parent().show();
		 } else {
			  $('#smsReceive', smsForm).val('');
			  $('#smsReceive', smsForm).parent().parent().hide();
		 }
	});

	$('#sendSMSForm').on('click', '#smsSendBtn', function () {
		var smsForm = $('form#smsForm');
		var searchTarget = $('input[name=searchtarget]', smsForm).val();
		if ($('#smsMessage', smsForm).val() == '') {
			alert('내용을 입력하세요.');
			return;
		}
		if (searchTarget == '' && $('#smsReceive', smsForm).val() == '') {
			alert('받는 사람 휴대전화번호를 입력하세요.');
			return;
		}
		if ($('#smsSender', smsForm).val() == '') {
			alert('보내는 사람 휴대전화번호를 입력하세요.');
			return;
		}

		var mode = 'smssender';
		var smsMessage = $('#smsMessage', smsForm).val();
		var smsReceive = $('#smsReceive', smsForm).val();
		var smsSender = $('#smsSender', smsForm).val();

		$.ajax({
			url		: 	"smsSand.php",
			type		: 	"POST",
			dataType	: 	"json",
			data		: 	{
				"mode"	:   mode,
				"smsmsg"	:   smsMessage,
				"smsrec"	:   smsReceive,
				"smssen"	:   smsSender,
				"shopid"	:   'ekfcjd2'
			},
			success		: 	function (result) {

				if (result.msg =="SUCCESS")
				{
					alert("발송 되었습니다.");
					$('#sendSMSForm').modal('hide');
				}
				else {
					alert('잠시 후 다시 시도하세요.');
					$(location).get(0).reload();
				}
			}
		});

	});


	$('#ChkSms').css('cursor','pointer').click(function(){
		var f = $(document.forms["regi_form"]);
		if ($('input:checkbox:checked',f).length<=0) { alert('발송하실 주문건을 선택하세요.'); return; }
		var phone = [];
		var orderNum = [];

		$(':checkbox[name^=chkDel]').each(function(i) {
			if (this.checked) {
				phone.push($("input[name='phone[]']").eq(i).val());
				orderNum.push($(this).val());
			}

		});
		var sendSMSForms = $('#sendSMSFormtoOrder');
		var smsReceive = $("#smsReceivetoOrder").val(phone);
		var smsOrderNum = $("#smsOrderNum").val(orderNum);

		sendSMSForms.modal('show');
	});

	$('#smschksand').click(function() {
		var sendMessage = $('#smschkMessage').val();
		var smsReceive = $('#smsReceivetoOrder').val();
		var smsSender = $('#smsSendertoOrder').val();
		var smsOrderNum = $('#smsOrderNum').val();
		var sendSMSForms = $('#sendSMSFormtoOrder');
		var msgonum = $('#smschkMessage').attr("msgnum");
		var mode = 'smsSendToOrder';

		$.ajax({
			url		: 	"smsSand.php",
			type		: 	"POST",
			dataType	: 	"json",
			data		: 	{
				"mode"	:   mode,
				"smsmsg"	:   sendMessage,
				"smsrec"	:   smsReceive,
				"smssen"	:   smsSender,
				'smsOrderNum' : smsOrderNum,
				'msgonums' : msgonum,
				"shopid"	:   'test'
			},
			success		: 	function (result) {

				if (result.msg =="SUCCESS")
				{
					alert("발송 되었습니다.");
					$('#sendSMSFormtoOrder').modal('hide');
				}
				else {
					alert('잠시 후 다시 시도하세요.');
					$(location).get(0).reload();
				}
			}
		});
	});
</script>
</body>
</html>
