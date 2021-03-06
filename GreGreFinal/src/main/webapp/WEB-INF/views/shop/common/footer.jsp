<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>


    </div>
<!-- Latest Blog Section Begin -->
<section class="latest-blog spad">
    <div class="container">
        
    </div>
</section>


    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="footer-logo">
                        <a href="shop.html"><img src="${pageContext.request.contextPath }/resources/images/logo/igre_mall_footer_logo.png" alt=""></a>
                    </div>

                </div>
                <div class="col-lg-8">
                    <div class="footer-left">
                        <ul>
                            <li>경기도 하남시 그레구 그래로 123</li>
                            <li>TEL : 아이그레몰 031-567-5678 &nbsp;| &nbsp;  FAX : 02-456-4567 &nbsp;|&nbsp; Email : igre_mall@gmail.com</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright(c) 2020 IGRE MALL. All rights reserved.
                        </div>
                        <div class="payment-pic">
                            <img src="img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

   <!-- Js Plugins -->
   <script src="${pageContext.request.contextPath }/resources/js/shop/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/jquery-ui.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/jquery.countdown.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/jquery.nice-select.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/jquery.zoom.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/jquery.dd.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/jquery.slicknav.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/shop/main.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/subMenu/h-subMenu.js"></script>
	
	<!-- 주소찾기 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/shop/postCode.js"></script>
	
    <script>
  //콤마찍기
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
    //콤마풀기
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
	
    
    </script>
    
  
</body>

</html>