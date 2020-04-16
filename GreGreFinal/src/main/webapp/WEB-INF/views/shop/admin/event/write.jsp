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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
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
<%@ include file="/WEB-INF/views/shop/admin/common/header.jsp"%>
<style>
.modal-backdrop.show {
	display: none !important;
}

.down-wrap {
	border: 1px;
	width: 100%;
	text-align: left;
	cursor: pointer;
	padding: 6px 8px;
	color: #b8b8b8;
}

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

.modal-backdrop.in {
	display: none !important;
}

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

<div class="content-wrapper">
	<!-- Right side column. Contains the navbar and content of the page -->
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">이벤트관리</a></li>
			<li class="active">이벤트 등록</li>
		</ol>
	</section>

	<!-- MAIN -->
	<div class="main-content">
		<div class="col-lg-12">
			<h2>이벤트 등록</h2>
		</div>
		<form enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/shop/admin/event/insert.do"
			method="POST" enctype="multipart/form-data">
			<input type="hidden" name="eventNo" value="0" />
			<input type="hidden" name="sellerId" value="igre_mall_test" />
			<div class="form-group row">
				<label for="eventTitle" class="col-sm-2 col-form-label">이벤트 제목</label>
				<div class="col-sm-10">
					<input type="text" name="eventTitle" class="form-control" id="">
				</div>
			</div>
			<div class="form-group row">
				<label for="Thumbnail" class="col-sm-2 col-form-label">대표사진</label>
				<div class="col-sm-10">
					<input type="file" name="Thumbnail">
				</div>
			</div>
			<div class="form-group row">
				<label for="event_start" class="col-sm-2 col-form-label">이벤트시작날짜</label>
				<div class="col-sm-5">
					<input type="date" name="eventStart"  class="form-control" value="${b.couponDuration eq null?'':b.couponDuration }"/>
				</div>
				<div class="col-form-label">
					<span>일</span>
				</div>
			</div>
			<div class="form-group row">
				<label for="event_end" class="col-sm-2 col-form-label">이벤트종료날짜</label>
				<div class="col-sm-5">
					<input type="date" name="eventEnd"  class="form-control" value="${b.couponDuration eq null?'':b.couponDuration }"/>
				</div>
				<div class="col-form-label">
					<span>일</span>
				</div>
				
			</div>
			<div class="form-group row">
				<label for="eventContent" class="col-sm-2 col-form-label">이벤트 내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="summernote" name="eventContent"
						maxlength="140" rows="7"></textarea>
				</div>
			</div>
		
			<div class=" text-center" style="padding-bottom: 50px">
				<input type="submit" class="btn btn-primary btn-lg" id=""
					value="이벤트 등록" />
			</div>


		</form>
	</div>
</div>
<!-- 폼 끝  -->
<script type="text/javascript">
	$('#summernote').summernote({
		placeholder : '제품설명을 입력해주세요.',
		tabsize : 2,
		height : 300,
		focus : true,
		lang : 'ko-KR',
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
	});
</script>
<script>
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
					data : form_data,
					type : "POST",
					url : '${pageContext.request.contextPath}/shop/admin/product/insertImg.do',
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {

						console.log("img up load success");

						var url = '${pageContext.request.contextPath}/resources/upload/shop/productDetail/'
								+ data[1];

						console.log("url=" + url);
						$(el).summernote('editor.insertImage', url);
						$('summernote')
								.append(
										'<img src="'+url+'" width = "400", height = "auto" />');
					}
				});
	}
</script>



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