<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 아이콘 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 육아시기별 정보 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/child/childWeekInfo.css">


<script src="${pageContext.request.contextPath}/resources/js/pregnancy/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/child/childWeekInfo.js"></script>
<!--   <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css"> -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>




<!-- 육아 맞춤정보 -->
<script>
//이미지
let images = {};
images['0_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents1.PNG", "${pageContext.request.contextPath}/resources/images/child/contents2.PNG");
images['0_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents3.PNG", "${pageContext.request.contextPath}/resources/images/child/contents4.PNG");
images['0_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['0_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");

images['1_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['1_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG"); 
images['1_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['1_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");

images['2_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['2_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['2_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['2_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");

images['3_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['3_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");
images['3_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");  
images['3_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   

images['4_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['4_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['4_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['4_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");    

images['5_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['5_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['5_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['5_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   

images['6_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['6_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['6_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['6_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   

images['7_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['7_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['7_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['7_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");    

images['8_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['8_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['8_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['8_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   

images['9_1'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['9_2'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['9_3'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   
images['9_4'] = new Image("${pageContext.request.contextPath}/resources/images/child/contents5.PNG", "${pageContext.request.contextPath}/resources/images/child/contents6.PNG");   



</script>


<!-- 헤더 소개 부분 -->
<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/child/child.jpg')">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-md-5 mt-5 pt-5">
					<h1 class="mb-3 font-weight-bold text-teal">육아</h1>
					<p>
						<a href="${pageContext.request.contextPath}/" class="text-white">Home</a> <span
							class="mx-3">/</span> <strong>육아정보</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 서브 메뉴 -->
<!-- contents begin-->
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<!--시설찾기 서브메뉴-->
				<h2>육아</h2>
				<ul class="menu">
					<li class="list active"><a href="${pageContext.request.contextPath }/child/childInfo.do">육아정보</a>
						 <ul class="items">
				         <li><a href="${pageContext.request.contextPath }/child/childInfo.do">예방접종</a></li>
				         <li><a href="${pageContext.request.contextPath }/child/childWeekInfo.do">시기별 정보</a></li>
				     	 </ul>
					</li>
					<li class="list"><a href="${pageContext.request.contextPath }/child/childCare.do">아이지킴이</a></li>
					<li class="list"><a href="#">육아상담</a></li>
				</ul>
			</div>

			<!-- 중앙 영역 -->
			<div class="col-lg-9">
				<!-- contents start-->
				<div class="row">
					<div class="col-lg-8">
						<h5>
							<strong>육아정보(시기별 정보) </strong>
						</h5>
					</div>
				</div>
				
				
					<div class="footer-daily-info sticky-menu-wrap sticky-area" id="stickyMenu">
<!--         <div class="sticky-menu-box tab-area"> -->
            <br><br>
             <div class="sticky-menu-cont tab-item-cont view-type"> 
                <div class="sticky-menu-item">
                    <div class="sticky-menu-swiper swiper-container">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>

                                <div class="tab-circle-wrap tab-area">
                                    <ul class="tab-circle-box sticky-tab">
                                            <li>
                                                <div class="circle-item ">
                                                    
                                                    <button class="btn-month " data-ctx="" data-type="B" id="0_1">
                                                        <span>
                                                                신생아 1주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                            
                                            <li>
                                                <div class="circle-item ">
                                                    <button class="btn-month " data-ctx="" data-type="B" id="0_2">
                                                        <span>
                                                                신생아 2주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                            
                                            <li>
                                                <div class="circle-item ">
                                                    <button class="btn-month " data-ctx="" data-type="B" id="0_3">
                                                        <span>
                                                                신생아 3주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                            
                                            <li>
                                                <div class="circle-item ">
                                                    <button class="btn-month " data-ctx="" data-type="B" id="0_4">
                                                        <span>
                                                                신생아 4주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                
                                <div class="swiper-slide">
                                          <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>
        
                                        <div class="tab-circle-wrap tab-area">
                                            <ul class="tab-circle-box sticky-tab">
                                            <li>
                                                <div class="circle-item ">
                                                    <button class="btn-month " data-ctx="" data-type="B" id="1_1">
                                                        <span>
                                                                1개월 1주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                            
                                            <li>
                                                <div class="circle-item ">
                                                    <button class="btn-month " data-ctx="" data-type="B" id="1_2">
                                                        <span>
                                                                1개월 2주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                            
                                            <li>
                                                <div class="circle-item ">
                                                    <button class="btn-month " data-ctx="" data-type="B" id="1_3">
                                                        <span>
                                                                1개월 3주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                            
                                            <li>
                                                <div class="circle-item ">
                                                    <button class="btn-month " data-ctx="" data-type="B" id="1_4">
                                                        <span>
                                                                1개월 4주
                                                        </span>
                                                    </button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                
                        <div class="swiper-slide">
                              <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>

                            <div class="tab-circle-wrap tab-area">
                                <ul class="tab-circle-box sticky-tab">
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="2_1">
                                                <span>
                                                        2개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="2_2">
                                                <span>
                                                        2개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="2_3">
                                                <span>
                                                        2개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="2_4">
                                                <span>
                                                        2개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                                    <div class="swiper-slide">
                                                <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>
                                            <div class="tab-circle-wrap tab-area">
                                                <ul class="tab-circle-box sticky-tab">
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="3_1">
                                                <span>
                                                        3개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            
                                            <button class="btn-month " data-ctx="" data-type="B" id="3_2">
                                                <span>
                                                        3개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="3_3">
                                                <span>
                                                        3개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="3_4">
                                                <span>
                                                        3개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                                
                            
                        <div class="swiper-slide">
                            <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>

                            <div class="tab-circle-wrap tab-area">
                                <ul class="tab-circle-box sticky-tab">
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="4_1">
                                                <span>
                                                        4개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="4_2">
                                                <span>
                                                        4개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="4_3">
                                                <span>
                                                        4개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="4_4">
                                                <span>
                                                        4개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                                    <div class="swiper-slide">
                                             <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>
            
                                            <div class="tab-circle-wrap tab-area">
                                                <ul class="tab-circle-box sticky-tab">
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="5_1">
                                                <span>
                                                        5개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="5_2">
                                                <span>
                                                        5개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="5_3">
                                                <span>
                                                        5개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="5_4">
                                                <span>
                                                        5개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    
                        <div class="swiper-slide">
                                <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>

                            <div class="tab-circle-wrap tab-area">
                                <ul class="tab-circle-box sticky-tab">
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="6_1">
                                                <span>
                                                        6개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="6_2">
                                                <span>
                                                        6개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="6_3">
                                                <span>
                                                        6개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="6_4">
                                                <span>
                                                        6개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                                    <div class="swiper-slide">
                                           <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>
            
                                            <div class="tab-circle-wrap tab-area">
                                                <ul class="tab-circle-box sticky-tab">
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="7_1">
                                                <span>
                                                        7개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="7_2">
                                                <span>
                                                        7개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="7_3">
                                                <span>
                                                        7개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="7_4">
                                                <span>
                                                        7개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="swiper-slide">
                                  <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>

                                <div class="tab-circle-wrap tab-area">
                                    <ul class="tab-circle-box sticky-tab">
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="8_1">
                                                <span>
                                                        8개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="8_2">
                                                <span>
                                                        8개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="8_3">
                                                <span>
                                                        8개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="8_4">
                                                <span>
                                                        8개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                                    
                                    
                        <div class="swiper-slide">
                                   <div class="swiper-button-prev"><i class="fas fa-arrow-circle-left"></i></div>
                                <div class="swiper-button-next"><i class="fas fa-arrow-circle-right"></i></div>
                                <div class="tab-circle-wrap tab-area">
                                    <ul class="tab-circle-box sticky-tab">
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="9_1">
                                                <span>
                                                        9개월 1주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="9_2">
                                                <span>
                                                        9개월 2주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="9_3">
                                                <span>
                                                        9개월 3주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                    
                                    <li>
                                        <div class="circle-item ">
                                            <button class="btn-month " data-ctx="" data-type="B" id="9_4">
                                                <span>
                                                        9개월 4주
                                                </span>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

 	           <div class="info3">
                <div class="container">
                  <div class="row is-hide">
                      <div class="col-md-6" id="children">
                        <h4>시기별 맞춤정보</h4>
                        <span style="color: yellowgreen; font-size: 20px;">신생아</span>
                        <span class="week" style="color: yellowgreen; font-size: 20px;"></span>
                        <span style="color: yellowgreen; font-size: 20px;">주차</span>
                        <hr>

                        <img src="${pageContext.request.contextPath}/resources/images/child/남자아이.PNG" width="50px" height="50px">
                        <span>남자아이</span><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div style="font-size:18px;">
                        <span>(평균) 키 : </span>
                        <span id=boy_cm></span> <span>cm,</span>
                        <span>몸무게 : </span>
                        <span id=boy_kg></span> <span>kg</span>
                        </div>
                        <br>
                        
                        <img src="${pageContext.request.contextPath}/resources/images/child/여자아이.PNG" width="50px" height="50px">
                        <span>여자아이</span><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div style="font-size:18px;">
                        <span>(평균) 키 : </span>
                        <span id=girl_cm></span> <span>cm,</span>
                        <span>몸무게 : </span>
                        <span id=girl_kg></span> <span>kg</span>
                        <br><br>
                        </div>
                    </div>
                    
                    <div class="col-lg-6" id="info2"> 
                        <br>
                        <span style="font-size: 20px;">예비엄마 구독해주세요!</span>
                        <br />
                        <span>(신생아</span>
                        <span class="week" style="font-size: 15px;"></span>
                        <span> 주차)</span>
                        <br><br>

                        <img src="" id="image1">
                        <h5>출산, 그 이후</h5>
                        <a href="https://baby.namyangi.com/contents/view/4044/4846?cateCode=4044" id="way1"></a>
                    </div>
                </div>
            </div>
           </div>

                <div class="info" >
                     <br>
                     <h3>좋은 부모, 행복한 아이, IGRE에서 시작합니다.♡</h3>
                     <br><br>
                     <iframe id="iframe" width="500" height="280" src="https://www.youtube.com/embed/2c1is-1Z4SQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>

            <!-- <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div> -->

        </div> <!-- end of .sticky-menu-box.tab-area -->
    </div> <!-- end of .footer-daily-info sticky-menu-wrap.sticky-area -->
				</div>
				<!--contents end-->
			</div>
		</div>
	</div>
</div>
	</div>


<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>