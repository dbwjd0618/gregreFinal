<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>


	<div class="ftco-blocks-cover-1">
		<div class="site-section-cover overlay"
			data-stellar-background-ratio="0.5"
			style="background-image: url('${pageContext.request.contextPath}/resources/images/counselling/counselling.jpg')">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-md-5 mt-5 pt-5">
						<h1 class="mb-3 font-weight-bold text-teal">상담 결제</h1>
						<p>
							<a href="index.html" class="text-white">Home</a> <span
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
</style>
	<!-- 여기부터 container -->
	<div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-2 col-md-offset-2 col-md-3">
                    <img src="${pageContext.request.contextPath}/resources/images/counselling/이루다.jpg" class="align-self-center mr-3" alt="...">
                    <h4>○○○ 상담사</h4>
                </div>
                <div class="col-md-5">
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th colspan="2" class="c-title">상담권 선택하기</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th scope="row">2주 프로그램</th>
                            <td>50,000원</td>   
                          </tr>
                          <tr>
                            <th scope="row">4주 프로그램</th>
                            <td>90,000원</td>
                          </tr>
                          <tr>
                            <th scope="row">1회 상담권</th>
                            <td >30,000원</td>
                          </tr>
                        </tbody>
                      </table>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <h5>최종 결제 금액</h5>
                    <h4><strong>30,000원</strong></h4>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <h5>결제 수단 선택</h5>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-secondary active">
                            <input type="radio" name="options" id="option1"> 카드 결제
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option2"> 카카오페이
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option3"> 네이버페이
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option4"> 그레페이
                        </label>
                      </div> 
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <button type="button" class="btn btn-secondary btn-lg btn-block">결제하기</button>
                </div>
            </div>
        </div>
    </div>




	<!-- container 끝  -->
	<script src="../js/jquery-migrate-3.0.0.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.sticky.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/jquery.fancybox.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/bootstrap-datepicker.min.js"></script>
	<script src="../js/aos.js"></script>

	<script src="../js/main.js"></script>




	<!-- Js Plugins -->

	<script src="js/shop/jquery-ui.min.js"></script>
	<script src="js/shop/jquery.countdown.min.js"></script>
	<script src="js/shop/jquery.nice-select.min.js"></script>
	<script src="js/shop/jquery.zoom.min.js"></script>
	<script src="js/shop/jquery.dd.min.js"></script>
	<script src="js/shop/jquery.slicknav.js"></script>
	<!-- <script src="js/shop/owl.carousel.min.js"></script> -->
	<script src="js/shop/main.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
