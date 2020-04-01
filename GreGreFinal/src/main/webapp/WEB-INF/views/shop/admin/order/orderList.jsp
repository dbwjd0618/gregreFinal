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
                전체주문조회
                <small>주문목록</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상품관리</a></li>
                <li class="active">전체주문조회</li>
              </ol>
            </section>
    
          

            <div class="row text-center">
                <div class="col-md-12">		  
                  <form method="get" role="form" class="form-horizontal" name="seach_form" id="seach_form">
                  <input type="hidden" name="page" value="">
                  <input type="hidden" name="S" value="1">
                  <input type="hidden" name="ostatus" value="">
                  
                    
                  <table class="table table-bordered">
                    <colgroup>
                      <col style="width:10%;">
                      <col style="width:30%;">
                      <col style="width:10%;">
                      <col style="width:30%;">
                      <col style="width:10%;">
                    </colgroup>
                    <tbody><tr> 
                      <th  class="text-center active" style="vertical-align:middle;">기간</th>
                      <td colspan="3" class="text-left" style="background-color:#fff;vertical-align:middle;">
                        <input type="text" name="sdate" class="form-control" style="width:100px;display:inline-block;" id="sdate" value="" data-date="2020-03-13" data-date-format="yyyy-mm-dd"> ~ 
                        <input type="text" name="edate" class="form-control" style="width:100px;display:inline-block;" id="edate" value="" data-date="2020-03-20" data-date-format="yyyy-mm-dd">
                        <button class="btn btn-default btn-xs sel_today" type="button">오늘</button> 
                        <button class="btn btn-default btn-xs sel_week" type="button">일주일</button> 
                        <button class="btn btn-default btn-xs sel_month" type="button">한달</button>
                      </td>							
                      <td class="text-center" rowspan="5" style="background-color:#fff;vertical-align:middle;"><button class="btn btn-primary btn-lg" id="searchBtn" type="button" onclick="searchPram();"> 검 색 </button></td>
                    </tr>
                    <tr>
                      <th class="text-center active" style="vertical-align:middle;">통합검색</th>
                      <td class="text-left" style="background-color:#fff;vertical-align:middle;">
                        <input type="text" name="searchK" class="form-control" style="display:inline-block;" id="searchK" value=""> 
                      </td>
                      <th class="text-center active" style="vertical-align:middle;">상품명</th>
                      <td class="text-center" style="background-color:#fff;">
                        <input type="text" name="pname" class="form-control" style="display:inline-block;" id="pname" value="">
                      </td>
                    </tr>
                    <tr>
                      <th class="text-center active" style="vertical-align:middle;">결제방식</th>
                      <td class="text-left" style="background-color:#fff;vertical-align:middle;">
                        <select name="pay" class="form-control" id="pay" style="width:200px;">
                          <option value=""> -- 선택 -- </option>
                          <option value="CARD"> 신용카드 </option>
                          <option value="CELLPHONE"> 휴대전화 </option>
                          <option value="3"> 무통장입금 </option>
                          <option value="VBANK"> 가상계좌 </option>
                          <option value="BANK"> 실시간이체 </option>
                        </select>
                      </td>
                      <th class="text-center active" style="vertical-align:middle;">주문상태</th>
                      <td class="text-left" style="background-color:#fff;" colspan="3">
              
                        <label>
                          <input type="checkbox" name="status" value="0">
                          <span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">미입금</span>
                        </label>

                        <label>
                          <input type="checkbox" name="status" value="4">
                          <span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">배송중</span>
                        </label>
              
                        <label>
                          <input type="checkbox" name="status" value="5">
                          <span style="font-size:12px; color:#5f6164; vertical-align:top; line-height:21px; margin-right:10px;">배송완료</span>
                      </td>
                    </tr>
                    
                    <tr>
                      <th class="text-center active" style="vertical-align:middle;">정렬</th>
                      <td class="text-left" style="background-color:#fff;vertical-align:middle;" colspan="3">
                        <select name="sort" class="form-control" id="sort" style="width:200px;display:inline-block;">
                          <option value=""> -- 선택 -- </option>
                          <option value="o_date"> 주문일</option>
                          <option value="o_num"> 주문번호</option>
                          <option value="r_date"> 입금일</option>
                          <option value="order_name"> 주문자</option>
                          <option value="order_phone"> 핸드폰번호</option>
                        </select>
                        <select name="orderby" class="form-control" id="orderby" style="width:200px;display:inline-block;">
                          <option value=""> -- 선택 -- </option>
                          <option value="desc"> 내림차순 </option>
                          <option value="asc"> 오름차순 </option>
                        </select>
                      </td>
              
                    </tr>
                        </tbody></table>
                  </form>
                  <form method="post" role="form" class="form-horizontal" name="regi_form" id="regi_form">
                  <input type="hidden" name="sdate" id="sdate" value="">
                  <input type="hidden" name="edate" id="edate" value="">
                  <input type="hidden" name="receipt_yn" id="receipt_yn" value="">
                  <input type="hidden" name="searchK" id="searchK" value="">
                  <input type="hidden" name="pname" id="pname" value="">
                  <input type="hidden" name="pay" id="pay" value="">
                  <input type="hidden" name="status" id="status" value="">
                  <input type="hidden" name="sort" id="sort" value="">
                  <input type="hidden" name="orderby" id="orderby" value="">
                  <input type="hidden" name="list_count" id="list_count" value="">
                  <input type="hidden" name="page" id="page" value="">
                  <input type="hidden" name="S" id="S" value="1">
                  <input type="hidden" name="gid" id="gid" value="">
                  <input type="hidden" name="mode" id="mode" value="">
                  <input type="hidden" name="statusup" id="statusup" value="">
                  <input type="hidden" name="ostatus" id="ostatus" value="">
              
                    <div class="col-md-12" style="text-align:left;margin-bottom:8px; padding-left:0px;">
                      <span class="col-md-12 text-left b" style="font-size:1.3em; padding-left:0px;">총 주문건수 : <strong class="text-danger">0</strong>개
                        <button class="btn btn-primary btn-sm" type="button" id="ChkSms" style="margin-left: 20px; cursor: pointer;">선택 SMS발송</button>
                        <button class="btn btn-primary btn-sm" type="button" onclick="CheckGroup(2);return false;">선택주문취소</button>
                        <button class="btn btn-primary btn-sm" type="button" onclick="xlsdown();return false;">엑셀저장</button>
                        <!--button class="btn btn-primary btn-sm" type="button" onclick="sendCashReceipt();return false;">선택 현금영수증 발행</button-->
                        
              
                        <select name="status_update" class="form-control" id="status_update" style="margin-left:30px;width:190px;display:inline-block;">
                          <option value=""> -- 주문상태 선택변경 -- </option>
                          <option value="0">미입금</option>
                          <!-- <option value="2">신규주문</option> -->
                          <!-- <option value="3">배송준비</option> -->
                          <option value="4">배송중</option>
                          <option value="5">배송완료</option>
                          <option value="61">취소완료</option>
                          <!-- <option value="10">배송예약</option> -->
                          <!-- <option value="60">취소접수</option>
                          <option value="70">반품중</option>
                          <option value="71">반품완료</option>
                          <option value="80">교환중</option>
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
                      <tbody><tr>
                        <th class="text-center active vertical-middle"><input type="checkbox" name="chkall" value="1" onclick="javascript:selall(this,document.regi_form.chkDel);"></th>
                        <th class="text-center active">번호</th>
                        <th class="text-center active">주문번호</th>
                        <th class="text-center active">주문일</th>
                        <th class="text-center active">주문자명/전화번호</th>
                        <th class="text-center active">수령자명/수령인핸드폰번호</th>
                        <th colspan="2" class="text-center active">우편번호<br>주소1<br>주소2</th>
                        <th style="width:250px;" class="text-center active">상품정보<br>(상세)</th>
                        <th class="text-center active">상품금액</th>
                        <th class="text-center active">배송비<br>총결제금액</th>
                        <th class="text-center active">택배사<br>배송번호</th>
                        <th class="text-center active">결제방법<br>입금자명</th>
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
					<td class="text-left vertical-middle" colspan="2">
						${l.recptZipcode }<br>
						${l.recptAddr }<br>
						${l.recptDetailAddr }			</td>
					<td class="text-left vertical-middle">
					 <img src="${pageContext.request.contextPath}/resources/upload/shop/productMainImg/${l.attachList.get(0).renamedImg}" alt=""><br>
					<strong></strong><br><br>
					opt : 90/블랙(1개)<br>					</td>
					<td class="text-right vertical-middle">${l.totalPrice }</td>
					<td class="text-right vertical-middle">${l.totalDeliveryFee } 원<br>${l.totalPrice+l.totalDeliveryFee } 원</td>
					<td class="text-right vertical-middle">우체국택배<br>${l.deliveryNo}</td>
					<td class="text-center vertical-middle"><span class="dev_stat_red">${l.payState }</span></td>
					<td class="text-center vertical-middle"><span class="dev_stat_green">${l.deliveryState }</span></td>
					<td class="text-center vertical-middle">
						<button class="btn btn-detail btn-norad" onclick="javascript:location.href='./detail.php?S=1&amp;c=TLYChVDHcld_73929';" type="button">상세보기</button>
																		<button class="btn btn-warning btn-norad" onclick="sel_check('TLYChVDHcld_73929','60');" type="button">주문취소</button>
					</td>
				</tr>
				</c:forEach>
                      <!-- <tr style="background-color:#ffffff;"><td class="text-center vertical-middle" colspan="14">주문내역이 없습니다.</td></tr> -->
						</tbody>
					</table>
                  </form>
                </div>
                </div>
          </div><!-- /.content-wrapper -->
         
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
	function searchPram(){
		var form=document.seach_form;
		var i; 
		var nChk = document.getElementsByName("status");     //체크되어있는 박스 value값
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

			document.seach_form.action = "/sales_manager/order/index.php";
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
					form.status_update.value =  "";
					form.mode.value =  "sms10";
					document.regi_form.action = "_proc.php";
				} else {
					return false;
				}
			}else if ( val == "2" ) { // 일괄취소
				var con = confirm("선택된 내역을 일괄 취소하시겠습니까?");
				if (con) {
					form.status_update.value =  "61";
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

		var today_val = "2020-03-31";
		var week_val = "2020-03-24";
		var mon_val = "2020-03-02";

		$(".sel_today").on("click",function(){
			$("#sdate").val(today_val);
			$("#edate").val(today_val);
		});
		$(".sel_week").click(function(){
			$("#sdate").val(week_val);
			$("#edate").val(today_val);
		});
		$(".sel_month").click(function(){
			$("#sdate").val(mon_val);
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
				"shopid"	:   'ekfcjd2'
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


		


