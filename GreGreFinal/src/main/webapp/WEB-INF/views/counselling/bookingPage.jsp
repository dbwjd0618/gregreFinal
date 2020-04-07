<%@page import="kh.mclass.Igre.counselling.model.vo.BookingInfo"%>
<%@page import="kh.mclass.Igre.counselling.model.vo.Counselor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
$(function(){
    $(".price").click(function(e){
        $(".price").attr('checked', true);
        $('#total-price').text($(this).attr('value'));
        $("[name=payPrice]").val($('#total-price').text());
        $("[name=coin]").val($(this).attr("id"));
    });
});

$('input:radio[name=options]').is(':checked');

</script>
<%
	Counselor C = (Counselor)request.getAttribute("counselor");
	BookingInfo book = (BookingInfo)request.getAttribute("bookingInfo");
	pageContext.setAttribute("price1", Integer.parseInt(C.getAdvisPrice())*2);
	pageContext.setAttribute("price2", Integer.parseInt(C.getAdvisPrice())*4);
%>

	<div class="ftco-blocks-cover-1">
		<div class="site-section-cover overlay"
			data-stellar-background-ratio="0.5"
			style="background-image: url('${pageContext.request.contextPath}/resources/images/counselling/counselling.jpg')">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-md-5 mt-5 pt-5">
						<h1 class="mb-3 font-weight-bold text-teal">상담 결제</h1>
						<p>
							<a href="${pageContext.request.contextPath}/" class="text-white">Home</a> <span
								class="mx-3">/</span> <strong>상담센터</strong>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<style>
	.site-section-cover.overlay:before {
	width: 0;
	background-image: url();
	}
	
	.align-self-center{
    	width: 200px;
        height: 200px;
    }
    h4{
        text-align: center;
        margin-top: 10%;
    }
    .c-title{
        text-align: center;
        font-size: 20px;
    }
    table{
    	cursor: pointer;
    }
</style>
	<!-- 여기부터 container -->
<form id="bookingFrm" method="POST">
	<div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-2 col-md-offset-2 col-md-3">
                    <img src="${pageContext.request.contextPath}/resources/images/counselling/${counselor.advisImg}" class="align-self-center mr-3" alt="...">
                    <h4>${counselor.advisName }&nbsp;${counselor.advisGrade }상담사</h4>
                    <input type="hidden" name="counselor_name" value="${counselor.advisName }" />
                </div>
                <div class="col-md-5">
                    <table class="table table-hover">
                        <thead>
                        	<tr>
                            	<th colspan="2" class="c-title">상담권 선택하기</th>
                        	</tr>
                        </thead>
                        <tbody>
                        	<tr class="price"  id="14" value="${price1}">
                            	<th scope="row">2주 프로그램</th>
                            	<td>${price1}원</td>   
                          	</tr>
                          	<tr class="price" id="28" value="${price2 }">
                            	<th scope="row">4주 프로그램</th>
                            	<td>${price2}원</td>
                          	</tr>
                          	<tr class="price" id="0" value="${counselor.advisPrice}">
                            	<th scope="row">1회 상담권</th>
                            	<td>${counselor.advisPrice}원</td>
                          	</tr>
                        </tbody>
                	</table>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <h5>최종 결제 금액</h5>
                    <h4><strong><span id="total-price"></span> 원</strong></h4>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <h5>결제 수단 선택</h5>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-secondary active">
                            <input type="radio" name="payInfo" id="option1" value="무통장입금" required="required"> 무통장입금
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="payInfo" id="option2" value="카카오페이"> 카카오페이
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="payInfo" id="option3" value="네이버페이"> 네이버페이
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="payInfo" id="option4" value="그레페이"> 그레페이
                        </label>
                      </div> 
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <button type="button" class="btn btn-secondary btn-lg btn-block" onclick="insert();">결제하기</button>
                </div>
                <input type="hidden" name="memberId" value="${memberLoggedIn.memberId}" />
                <input type="hidden" name="advisId" value="${counselor.advisId }" />
                <input type="hidden" name="payPrice" value="" />
                <input type="hidden" name="coin" />
            </div>
        </div>
    </div>
</form>

<script>
	function insert(){
		$("#bookingFrm").attr('action', "${pageContext.request.contextPath}/counselling/bookingEnd.do").attr("method", "post").submit();
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
