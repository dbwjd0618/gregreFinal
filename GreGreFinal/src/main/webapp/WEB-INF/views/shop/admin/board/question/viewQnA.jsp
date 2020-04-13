<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8" />
<!-- summernotes -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
	
<!-- 헤더 선언!!-->

<%-- <%@ include file="/WEB-INF/views/shop/admin/common/header.jsp"%> --%>


<style>
/* .modal-backdrop.show {
	display: none !important;
} */

/* .down-wrap {
	border: 1px;
	width: 100%;
	text-align: left;
	cursor: pointer;
	padding: 6px 8px;
	color: #b8b8b8;
} */

.table-bordered>tbody>tr>td {
	background-color: #fff;
}

.main-content {
	padding-right: 70px;
	padding-left: 20px;
}

.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td,
	.table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
	border: 1px solid #dddddd;
}

.bg_mint {
	background-color: #f8fdff;
	color: #367798;
}

th#optionTh {
	vertical-align: middle;
}

.main-header .navbar-custom-menu, .main-header .navbar-right {
	margin-right: 5px;
	float: right;
	margin-left: auto;
}

.main-header>.navbar {
	height: 30px;
}

/* .modal-backdrop.in {
	display: none !important;
} */

span.mr5.font-size16 {
	float: left;
	margin-top: 6px;
}

span.form-inline {
	float: left;
}

a#optListUpdate {
	float: right;
	margin: 12px 0px;
}

.clearfix.mb5 {
	margin-bottom: 10px;
}

input[name="paymentMethodCode"] {
    margin-left: 10px;
}
</style>
<%@ include file="/WEB-INF/views/shop/admin/common/header.jsp"%>

<c:set value="cate" var="하하"/>

<c:if test="${qa.categoryId eq 'CA1'}">
<c:set var="cate" value="분유"/>
</c:if>
<c:if test="${qa.categoryId eq 'CA2'}">
<c:set var="cate" value="이유식"/>
</c:if>
<c:if test="${qa.categoryId eq 'CA3'}">
<c:set var="cate" value="기저귀"/>
</c:if>
<c:if test="${qa.categoryId eq 'CA4'}">
<c:set var="cate" value="물티슈"/>
</c:if>
<c:if test="${qa.categoryId eq 'CA5'}">
<c:set var="cate" value="수유용품"/>
</c:if>
<c:if test="${qa.categoryId eq 'CA6'}">
<c:set var="cate" value="이유용품"/>
</c:if>
<c:if test="${qa.categoryId eq 'CA5'}">
<c:set var="cate" value="목욕용품"/>
</c:if>


<div class="content-wrapper">
	<!-- Right side column. Contains the navbar and content of the page -->
	<!-- Content Header (Page header) -->
	
	<section class="content-header">
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">쿠폰관리</a></li>
			<li class="active">쿠폰등록</li>
		</ol>
	</section>

	<!-- MAIN -->
	<div class="main-content">
		
		<div class="col-lg-12">
			<h2>상품문의</h2>
		</div>

			<!-- <input type="hidden" name="sellerId" value="igre_mall_test" /> -->
			<div class="form-group row">
				<label for="qnaTitle" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-5">
					<input type="text" name="qnaTitle" class="form-control" placeholder="쿠폰명을 입력하세요" value="${qa.qtnTitle}"/>
				</div>
				
			</div>
			<div class="form-group row">
				<label for="productName" class="col-sm-2 col-form-label">카테고리</label>
				
				<div class="col-sm-5">
					<input type="text" name="productName" class="form-control" value="${cate }">
				</div>
			</div>
			<div class="form-group row">
				<label for="productName" class="col-sm-2 col-form-label">제품명</label>
				<div class="col-sm-5">
					<input type="text" name="productName" class="form-control" value="${qa.productName }">
				</div>
			</div>
			<div class="form-group row">
				<label for="questionDate" class="col-sm-2 col-form-label">작성일</label>
				<div class="col-sm-5">
					<input type="date" name="questionDate" class="form-control" value="${qa.qtnDate}">
				</div>
			</div>
			<div class="form-group row">
				<label for="question" class="col-sm-2 col-form-label">문의내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="" name="question"
						maxlength="140" rows="7">${qa.qtnContent }</textarea>
				</div>
			</div>
			<hr />
				<div class="col-lg-12">
			<h2>답변하기</h2>
		</div>
				<form
			action="${pageContext.request.contextPath}/shop/admin/question/answer.do"
			name="regi_form" id="regi_form" method="get" enctype="multipart/form-data">
			<input type="hidden" name="sellerId" value="igre_mall_test" /> 
			<input type="hidden" name="qaId" value="${qa.qaId }"/>		
			<div class="form-group row">
				<label for="AnswerQna" class="col-sm-2 col-form-label">답변내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="" name="answer"
						maxlength="140" rows="7"></textarea>
				</div>
			</div>
			<div class=" text-center" style="padding-bottom: 50px">
				<input type="submit" class="btn btn-primary btn-lg" id=""
					value="답변하기" />
			</div>
			</form>
	</div>
	</div>
	
	
	<!-- 정우 모달 창 연습 -->
<div class="modal fade" id="sendSMSFormtoOrder" tabindex="-1"
	role="dialog" aria-labelledby="sendSMSFormtoOrder" aria-hidden="true"
	alreadyLoad="0">
	<div class="modal-dialog">
		<div class="modal-content" id="sendSMSFormContentOrder">
			<div class="sms_wrap message clearfix">
				<h2 style="margin-top: 0px;">SMS 보내기</h2>

				<div class="sms-box">
					<form id="smsFormtoOrder">
						<h3 style="margin-top: 0px;">여러건은 번호마다 콤마(,) 구분</h3>
						<p>
							<textarea class="form-control" rows="12" name="smschkMessage"
								id="smschkMessage"></textarea>
						</p>
						<div class="sms_number">
							<ul>
								<li class="clearfix" style="display: none;"><span
									class="cname">주문 번호</span> <span class="cphone"><input
										type="text" name="smsOrderNum" id="smsOrderNum"
										class="form-control input-sm" value="" readonly></span></li>
								<li class="clearfix"><span class="cname">받는 사람</span> <span
									class="cphone"><input type="text"
										name="smsReceivetoOrder" id="smsReceivetoOrder"
										class="form-control input-sm" value="" readonly></span></li>
								<li class="clearfix"><span class="cname">보내는사람</span> <span
									class="cphone"><input type="text"
										name="smsSendertoOrder" id="smsSendertoOrder"
										class="form-control input-sm" value="01089671359" readonly></span>
								</li>
							</ul>
						</div>
						<div class="text-center">
							<a href="javascript:;" class="btn btn-info btn-sm"
								id="smschksand">발송하기</a> <a href="javascript:;"
								id="closebtnOrder" class="btn btn-default btn-sm"
								data-dismiss="modal">닫기</a>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

<button class="btn btn-primary btn-sm" type="button" id="ChkSms" style="margin-left:20px;">선택 SMS발송</button>


<!-- 정우 더미 -->
<script>
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
	/* if ($('input:checkbox:checked',f).length<=0) { alert('발송하실 주문건을 선택하세요.'); return; } */
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
<!-- 정우 더미 -->




















<script>
	/* <!--글쓰기 js -->
	 $('#summernote').summernote({
	 placeholder : '제품설명을 입력해주세요.',
	 tabsize : 2,
	 height : 300
	 }); */
</script>
<script>
	$(function() {
		$("#selectedDelivery-1").click(function() {
			console.log("test 클릭클릭");
			$("#delivery-1").show();
			$("#delivery-2").hide();
			$("input:radio[id='selectedDelivery-2']").attr("checked", false);
		});
		$("#selectedDelivery-2").click(function() {
			console.log("test 클릭클릭");
			$("#delivery-2").show();
			$("#delivery-1").hide();
			$("input:radio[id='selectedDelivery-1']").attr("checked", false);
		});
	});
</script>

<script>
	function productValidate() {
		console.log("찍히나");
		console.log("카테고리아이디" + $("#category").val());
		return true;
	}
</script>
<script>
	var optPlusIdx=1;
	var index =0;
	var tidx =0;

	console.log("t123=="+tidx);
	$(function() {
		//입력옵션 추가 하는 스크립트
		//일반옵션 추가하는 곳
		$("#optPlus").click( function() {
							var html = '<tr><td class="text-center"><input type="text" name="optionName" id="noTitle'+optPlusIdx+'" no="0" value="" maxlength="50" placeholder="50자까지 입력가능." class="form-control input_st4"></td><td class="text-center"><input type="text" name="" placeholder="예)블랙,화이트 (,로 구분)" id="optionValue'+optPlusIdx+'" value="" class="form-control input_st4"></td><th class="text-center"><a class="btn btn-danger btn-sm optMinus">삭제</a></th></tr>'
							$("#optTable").append(html)
							optPlusIdx++;
						});

		//일반 옵션 추가된것 삭제해주는 것	 
		$(document).on('click', '.optMinus', function(e) {
			$(this).parent().parent().remove();
		});
	
		
		$(document).on('click', '.optListMinus', function(e) {
			$(this).parent().parent().remove();
		});

	});
	$(function(){
		$("#optionSetting").click( function() {
			var optNameHtml='';
			for( tidx ; tidx <optPlusIdx; tidx++){
				var optionName  = 'noTitle'+tidx;
				var optionName2 = optionName;
				var nameResult = document.getElementById(optionName2);
				console.log("tidx=="+optionName2);
				var optName = nameResult.value;

				var optionValue ='optionValue'+tidx+'';
				var optionValue2 = optionValue;
				var optResult = document.getElementById(optionValue2);
				var optValStr = optResult.value.split(',');
				if(tidx==0){
					var optHtml ='';
					for( index  ; index < optValStr.length;index ++){
						optHtml += '<tr class="first-made"><td class="text-center" style="border-left:none;"><input type="checkbox" name="optCeck2[]" value="1"><input type="hidden" name="oListNum[]" value=""></td><td><input type="text" name="optionValue1" id="optVal'+index+'" value="'+optValStr[index]+'" class="form-control input_st4" readonly=""></td><td><input type="text" name="optionStock" value="0" class="form-control number-coma input_st4" idx="1"></td><td><input type="text" name="optionSupplyValue" value="0" class="form-control number-coma input_st4" idx="1"></td><td><input type="text" name="optionPrice" value="0" class="form-control number-coma input_st4" idx="1"></td><td><select name="optionState" class="form-control number-coma input_st4"><option value="Y" selected="">Y</option><option value="N">N</option></select></td><td class="text-center"><a class="btn btn-danger btn-sm optListMinus">삭제</a></td></tr>'
					
					}
					$("#optListTable").append(optHtml);				
				}else{
					var optHtml ='';
					var oIdex = 0;
					for(var opt=0; opt < index ;opt++){
						var optVal  = 'optVal'+opt;
						var optVal2 = optVal;
						var optValResult = document.getElementById(optVal2);
						var optValue = optValResult.value; 
						for(var t=0; t<optValStr.length;t++){
							optHtml = '<tr><td class="text-center" style="border-left:none;"><input type="checkbox" name="optCeck2[]" value="1"><input type="hidden" name="oListNum[]" value=""></td><td><input type="text" name="optionValue1" id="optVal'+oIdex+'" value="'+optValue+'" class="form-control input_st4" readonly=""></td><td><input type="text" name="optionValue2" id="optVal'+oIdex+'" value="'+optValStr[t]+'" class="form-control input_st4" readonly=""></td><td><input type="text" name="optionStock" value="0" class="form-control number-coma input_st4" idx="1"></td><td><input type="text" name="optionSupplyValue" value="0" class="form-control number-coma input_st4" idx="1"></td><td><input type="text" name="optionPrice" value="0" class="form-control number-coma input_st4" idx="1"></td><td><select name="optionState" class="form-control number-coma input_st4"><option value="Y" selected="">Y</option><option value="N">N</option></select></td><td class="text-center"><a class="btn btn-danger btn-sm optListMinus">삭제</a></td></tr>';
							console.log('모지=='+optVal2);
							console.log('optResult=='+optValResult);
							console.log('모지optValue=='+optValue);
							$("#optListTable").append(optHtml);		
							oIdex++;
						}
					}
					$("tr").remove(".first-made"); 
											
				}
					

				optNameHtml +='<th class="text-center">'+optName+'</th>';
				var test = '<input type="hidden" name="optionName" value="'+optName+'" >';
				$('#optNameTd2').append(test);
				console.log("뭐야=="+optNameHtml);
				$('#optNameTd2').append(optNameHtml);
				$('#optNameTd').attr('colspan',optPlusIdx);
				
			}
			

			console.log('optPlusIdx++ =='+optPlusIdx);
});
	});
</script>

<!-- /.content-wrapper -->
<!--푸터영역-->
<!-- ./wrapper -->
<!-- jQuery 2.1.3 -->

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<!-- jQuery Knob Chart -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/jquery.knob.js"
	type="text/javascript"></script>
<!-- Slimscroll -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- FastClick -->
<script
	src='${pageContext.request.contextPath}/resources/js/admin/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/app.min.js"
	type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/demo.js"
	type="text/javascript"></script>



</body>
</html>