<%@page import="kh.mclass.Igre.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
  
  <%@ include file="/WEB-INF/views/common/header.jsp"%>
  
   <!-- 마이페이지 서브메뉴 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css">
    <!--서브메뉴 js-->
    <script src="${pageContext.request.contextPath}/resources/js/subMenu/subMenu.js"></script>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pregnancy/basic.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pregnancy/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pregnancy/layout_sub.css">
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.childvaccin{
	width: 450px;
	height: 400px;
	margin-left: 24px;
}

 .imgdiv  img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.imgdiv:hover img {
    -webkit-transform:scale(2.1);
    -moz-transform:scale(2.1);
    -ms-transform:scale(2.1);   
    -o-transform:scale(2.1);
    transform:scale(2.1);
} 

</style>
  
   <script>
   var cnumber ='${m.childNumber}'
   console.log(cnumber);

   
   function addVaccin() {
 
	   window.open("${pageContext.request.contextPath}/myPage/vaccinAdd.do", "vaccin", "width=1000, height=700, left=100, top=100"); }
   </script>
 <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" >
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
              <h1 class="mb-3 font-weight-bold text-teal">마이페이지</h1>
              <p><a href="index.html" class="text-white">Home</a> <span class="mx-3">/</span> <strong>자녀정보</strong></p>
            </div> 
          </div>
        </div>
      </div>
    </div>

<!-- contents begin-->
<style>
</style>

<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<div class="sidebar__header">
						<div class="profile sidebar__profile">
							<img class="profile__avatar" src="${pageContext.request.contextPath}/resources/images/myPage/user.png" />
							<div class="profile__name">${m.memberId }</div>
						</div>
					</div>
					<div class="sidebar__body">
						<div class="menu sidebar__menu">
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/memberUpdate.do"> 
								<div class="menu__title">개인정보</div>
							</a>
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/memberChildUpdate.do"> 
								<div class="menu__title">자녀정보</div>
							</a>   
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/myPeriodCalculatorView.do">
								<div class="menu__title">월경캘린더</div>
							</a> 
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/counsellingInfo.do">
								<div class="menu__title">상담정보/리뷰</div>
							</a> 
							<a class="menu__item" href="${pageContext.request.contextPath}/myPage/deleteMember.do">
								<div class="menu__title">회원탈퇴</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 메인 -->
			<div class="col-md-9">
                <div class="row mb-4">
                    <div class="col-md-12">
                        <h4 style="text-align: center;"><strong>자녀정보</strong></h4>
                    </div>
                </div>
                
                
                <c:if test="${m.childNumber !=0 }">
                <c:forEach items="${list }" var="c">
                <div class="row mb-3">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
<!--                                     <div class="col-md-3">
                                       <img src="../images/myPage/pic2.PNG" class="imgmini">
                                    </div> -->
                                    <div class="col-md-4"> 
                                        <p>자녀이름 : ${c.childName }</p>
                                        <p>자녀생일 : ${c.birthday }</p>
                                        <p>성별 : ${c.gender eq 'M'? '남':'여'}</p>
                                    </div>
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-outline bg-gray" data-toggle="modal" data-target="#vaccinAdd">정보수정</button>
                                    	<div><br /></div>
					<p class="biztoggle2">예방접종 리스트 </p>
					<p class="biztoggle2" style="display: none;">닫기</p>
                    <label class="switch"> <input type="checkbox" name="biztoggle2"> <span
						class="slider round"></span>
					</label>
					
					
                                    	<!-- <button type="button" class="btn btn-outline bg-gray" onclick="addVaccin();">예방접종</button> -->
                                    </div>
					<div id="pid2" style="display: none;">
					<div class="com_table mar_t20"> 
<br />
<h3>자녀이름 : ${c.childName }</h3>
<h3>자녀생일 : ${c.birthday }</h3>
<br />
<c:forEach items="${list2}" var="v" varStatus="status">
<c:if test="${c.childId == v.childId}">
<h3>테스트:${v.vaccinCode }</h3>
<h3>테스트:${v.vaccinDate }</h3>
<h3>테스트:${v.nth }</h3>

<table border="1"> 
    <caption>
     <strong>국가필수예방접종</strong>의 대상 전염병, 백신종류및 방법, 0개월, 1개월, 2개월, 4개월, 6개월, 12개월, 15개월, 18개월, 24개월, 36개월, 만4세, 만6세, 만11세, 만12세을 나타내는 표입니다.
    </caption> 
    <colgroup> 
     <col style="width:2%"> 
     <col style="width:9%"> 
     <col style="*"> 
     <col style="width:5%"> 
     <col style="width:5%"> 
     <col style="width:5%"> 
     <col style="width:5%"> 
     <col style="width:5%"> 
     <col style="width:6%"> 
     <col style="width:6%"> 
     <col style="width:6%"> 
     <col style="width:6%"> 
     <col style="width:6%"> 
     <col style="width:5%"> 
     <col style="width:5%"> 
     <col style="width:6%"> 
     <col style="width:6%"> 
    </colgroup> 
    <thead> 
     <tr> 
      <th scope="col"></th> 
      <th scope="col">대상전염병</th> 
      <th scope="col">백신종류및방법</th> 
      <th scope="col">0개월</th> 
      <th scope="col">1개월</th> 
      <th scope="col">2개월</th> 
      <th scope="col">4개월</th> 
      <th scope="col">6개월</th> 
      <th scope="col">12개월</th> 
      <th scope="col">15개월</th> 
      <th scope="col">18개월</th> 
      <th scope="col">24개월</th> 
      <th scope="col">36개월</th> 
      <th scope="col">만4세</th> 
      <th scope="col">만6세</th> 
      <th scope="col">만11세</th> 
      <th scope="col">만12세</th> 
     </tr> 
    </thead> 
    <tbody> 
     <tr> 
      <th scope="row" rowspan="15" class="b_r">국<br>가<br>필<br>수<br>예<br>방<br>접<br>종</th> 
      <td>결핵①</td> 
      <td>BCG(피내용)</td> 
      <td class="bg">1차</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
     </tr> 
     <tr> 
      <td>B형간염②</td> 
      <td>HepB</td> 
      <td class="bg">1차</td> 
      <td class="bg">2차</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td class="bg">3차</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
     </tr> 
     <tr> 
      <td rowspan="2" class="b_r">디프테리아<br>파상풍<br>백일해</td> 
      <td>DTaP③</td> 
      <td></td> 
      <td></td> 
      <td class="bg">1차</td> 
      <td class="bg">2차</td> 
      <td class="bg">3차</td> 
      <td></td> 
      <td colspan="2" class="bg">추4차</td> 
      <td></td> 
      <td></td> 
      <td colspan="2" class="bg">추5차</td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td>Td/Tdap④</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="2" class="bg">추6차</td> 
     </tr> 
     <tr> 
      <td>폴리오⑤</td> 
      <td>IPV(사백신)</td> 
      <td></td> 
      <td></td> 
      <td class="bg">1차</td> 
      <td class="bg">2차</td> 
      <td class="bg">3차</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="2" class="bg">추4차</td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td class="b_r">b형헤모필루스<br>인플루엔자⑥</td> 
      <td>PRP-T/HbOC</td> 
      <td></td> 
      <td></td> 
      <td class="bg">1차</td> 
      <td class="bg">2차</td> 
      <td class="bg">3차</td> 
      <td colspan="2" class="bg">추4차</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td rowspan="2" class="b_r">폐렴구균</td> 
      <td>PCV<br>(단백결합)⑦</td> 
      <td></td> 
      <td></td> 
      <td class="bg">1차</td> 
      <td class="bg">2차</td> 
      <td class="bg">3차</td> 
      <td colspan="2" class="bg">추4차</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td>PPSV<br>(다당질)⑧</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="6" class="bg">고위험군에 한하여 접종</td> 
     </tr> 
     <tr> 
      <td>홍역<br>유행성이하선염<br>풍진⑨</td> 
      <td>MMR</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="2" class="bg ">1차</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="2" class="bg ">2차</td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td>수두</td> 
      <td>Var</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="2" class="bg">1차</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td>A형간염⑩</td> 
      <td>HepA</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="5" class="bg">1~2차</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td rowspan="2" class="b_r">일본뇌염</td> 
      <td>JEV<br>(사백신)⑪</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="5" class="bg">1~3차</td> 
      <td></td> 
      <td class="bg">추4차</td> 
      <td></td> 
      <td class="bg">추5차</td> 
     </tr> 
     <tr> 
      <td>JE<br>(생백신)⑫</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="5" class="bg">1~2차</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td rowspan="2" class="b_r">인플루엔자</td> 
      <td>Flu<br>(사백신)⑬</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="7" class="bg">매년접종</td> 
      <td></td> 
      <td></td> 
      <td></td> 
     </tr> 
     <tr> 
      <td>Flu<br>(생백신)⑭</td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td></td> 
      <td colspan="3" class="bg">매년접종</td> 
      <td></td> 
      <td></td> 
      <td></td> 
     </tr> 
    </tbody> 
   </table>

</c:if>
</c:forEach>


      

	</div>
					</div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>	
                </c:forEach>
                </c:if>
     

                 <div class="row mb-3">
                    <div class="col-md-12">
                        <button class="btn btn-primary" style="margin: 0 auto; display:block;"  data-toggle="modal" data-target="#myChildAddModal">
                            자녀 추가하기
                        </button>
                    </div>
                </div> 
                    
            </div>
            <!--contents-end-->
		</div>
	</div>
</div>
<!-- contents end-->

<!--자녀추가히가 modal 폼-->

<!-- 자녀 추가 -->

<div class="modal fade" id="myChildAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document"  style="max-width: 100%; width: auto; display: table; overflow: scroll;" >
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="myChildAddModalLabel">자녀 정보 입력</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="${pageContext.request.contextPath}/myPage/memberChildUpdate.do" method="post">
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> 부모 아이디</span>
                        </div>
                        <input name="parentsId" class="form-control" id="parentsId" value="${m.memberId }" readonly="readonly"
                            type="text">
                    </div>
                    <input name="childId" class="form-control" id="childId"
                            type="hidden">
                    
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">자녀 이름</span>
                        </div>
                        <input name="childName" class="form-control" id="childName"
                            type="text" value="${c.childName }">
                    </div>


                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">생년월일 </span>
                        </div>
                        <input name="birthday" class="form-control" id="birthday"
                            placeholder="생년월일" type="date">
                    </div>

                    <div class="form-group input-group">
                        <div class="input-group-prepend" id="gender">
                            <span class="input-group-text"> 성별 </span>
                        </div>
                            <div id="gender1">
                                    <label for="gender0">&nbsp;&nbsp; 남</label>
                                <input type="radio" name="gender" id="gender0" value="M" checked>
                            </div>
                            
                            <div id="gender2">
                                    <label for="gender1">&nbsp;&nbsp;여</label>
                                <input type="radio" name="gender" id="gender1" value="F">
                            </div>
                    </div>
                    
                    <div class="form-group input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">자녀 연락처 </span>
								</div>
								<input name="phone" class="form-control" id="phone"
									type="text">
							</div>
					<input type="hidden" name="childNumber" value="1"/>
               
               <!-- 추가입력 -->
               <label class="switch"> <input type="checkbox" name="biztoggle"> <span
						class="slider round"></span>
					</label>
					<p class="biztoggle">예방접종 </p>
					<p class="biztoggle" style="display: none;">닫기</p>
					
					
			<div id="pid" style="display: none;">
					<div class="form-group input-group row" >
                                  <div class="input-group-prepend" >
                                      <span class="input-group-text">예방접종 목록</span>
                                  </div>
                                  <select name="vaccinCode" id="vaccinCode" class="vaccinList">
                                      <option disabled selected value="">병명</option>
                                      <option disabled>----------</option>
                                      <option value="TB">결핵</option>
                                      <option value="HepaB">B형 간염</option>
                                      <option value="cerebro">뇌수막염</option>
                                      <option value="polio">소아마비</option>
                                      <option value="diplo">폐렴구군</option>
                                      <option value="DPT">DPT</option>
                                      <option value="combo">콤보</option>
                                      <option value="chick">수두</option>
                                      <option value="mmr">mmr</option>
                                      <option value="japEncep1">일본뇌염(생)</option>
                                      <option value="japEncep2">일본뇌염(사)</option>
                                      <option value="influ">인플루엔자</option>
                                      <option value="typhoid">장티푸스</option>
                                  </select>
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">차수</span>
                                  </div>
                                  <select name="nth" id="nth" >
                                      <option disabled selected value="">차수</option>
                                      <option disabled>----------</option>

                                  </select>
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">접종일</span>
                                  </div>
                                  <input name="vaccinDate" class="form-control" id="vaccinDate" placeholder="접종일 " type="date">
                                  <input type="button" id="optPlus" value="추가"/>
                                  
                        </div>
                        <div id="optdiv" >
                         </div> 
                              </div>

                              

                    
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">확인</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
                </form>
            </div>
          </div>
        </div>
      </div>
      
      

<script src="${pageContext.request.contextPath}/resources/js/mypage/mypage.js"></script>
<script>


//백신
//$(function() {
	$(document).ready(function(){
		//입력옵션 추가 하는 스크립트
		//일반옵션 추가하는 곳
		
          $(document).on("click","#optPlus",function(){
//		$("#optPlus").click( function() {
							var html =  '<div class="form-group input-group row">'
							+'<div class="input-group-prepend" >'
                            +'<span class="input-group-text">예방접종 목록</span>'
                            +'</div>'
								+'</br><select name="vaccinCode" id="vaccinCode" class="vaccinList"><option disabled selected value="">병명</option><option disabled>----------</option><option value="TB">결핵</option><option value="HepaB">B형 간염</option><option value="cerebro">뇌수막염</option><option value="polio">소아마비</option><option value="diplo">폐렴구군</option>'
                                +'<option value="DPT">DPT</option>'
                                +'<option value="combo">콤보</option>'
                                +'<option value="chick">수두</option>'
                                +'<option value="mmr">mmr</option>'
                                +'<option value="japEncep1">일본뇌염(생)</option>'
                                +'<option value="japEncep2">일본뇌염(사)</option>'
                                +'<option value="influ">인플루엔자</option>'
                                +'<option value="typhoid">장티푸스</option>'
                                +'</select>'
                                +'<div class="input-group-prepend">'
                                +'<span class="input-group-text">차수</span>'
                                +'</div>'
                                +'<select name="nth" id="nth" >'
                                +'<option disabled selected value="">차수</option>'
                                +'<option disabled>----------</option>'
                                +'</select>'
                                +'<div class="input-group-prepend">'
                                +'<span class="input-group-text">접종일</span>'
                                +'</div>'
                                +'<input name="vaccinDate" class="form-control" id="vaccinDate" placeholder="접종일 " type="date">'
                                +'<input type="button" id="optMin" value="삭제"/>'
                                +'</div>'
                                +'</div>';
                                $("#optdiv").append(html)
                                });
							});

$(document).ready(function(){
		$(document).on("click","#optMin",function(){
			
			$(this).parent().remove()
		});
});



$("input[name='biztoggle']").click(function () {
	 if(this.checked) {
		 $("#pid").show();

	 }
	 else {
		 $("#pid").hide();


		 
	 }
});

$(document).ready(function() {
    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
    $('input[type="checkbox"][name="biztoggle2"]').click(function(){
        //클릭 이벤트 발생한 요소가 체크 상태인 경우
        if ($(this).prop('checked')) {
            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
            $(this).parent().parent().next().show();
            }
            else{
            	$(this).parent().parent().next().hide();
            	}
    });
});

function categoryChange(e) {
	
	console.log(e)
	console.log($(e).next().next())
	
	var nth_TB = ["1"];
	var nth_HepaB = ["1","2","3"];
	var nth_cerebro = ["1","2","3","4","5"];
	var nth_polio = ["1","2","3","4"];
	var nth_diplo = ["1","2","3","4"];
	var nth_DPT = ["1","2","3","4","5",'6'];
	var nth_combo = ["1","2","3","4"];
	var nth_chick = ["1","2"];
	var nth_mmr = ["1","2"];
	var nth_japEncep1 = ["1","2"];
	var nth_japEncep2 = ["1","2","3","4","5"];
	var nth_influ = ["1"];
	var nth_typhoid = ["1"];
	var target = document.getElementById("nth");
	
	if(e.value == "TB") var d = nth_TB;
	else if(e.value == "HepaB") var d = nth_HepaB;
	else if(e.value == "cerebro") var d = nth_cerebro;
	else if(e.value == "polio") var d = nth_polio;
	else if(e.value == "diplo") var d = nth_diplo;
	else if(e.value == "DPT") var d = nth_DPT;
	else if(e.value == "combo") var d = nth_combo;
	else if(e.value == "chick") var d = nth_chick;
	else if(e.value == "mmr") var d = nth_mmr;
	else if(e.value == "japEncep1") var d = nth_japEncep1;
	else if(e.value== "japEncep2") var d = nth_japEncep2;
	else if(e.value == "influ") var d = nth_influ;
	else if(e.value == "typhoid") var d = nth_typhoid;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}	
}

$(function() {
	$(document).on("change",".vaccinList",function() {
		
		var nth_TB = ["1"];
		var nth_HepaB = ["1","2","3"];
		var nth_cerebro = ["1","2","3","4","5"];
		var nth_polio = ["1","2","3","4"];
		var nth_diplo = ["1","2","3","4"];
		var nth_DPT = ["1","2","3","4","5",'6'];
		var nth_combo = ["1","2","3","4"];
		var nth_chick = ["1","2"];
		var nth_mmr = ["1","2"];
		var nth_japEncep1 = ["1","2"];
		var nth_japEncep2 = ["1","2","3","4","5"];
		var nth_influ = ["1"];
		var nth_typhoid = ["1"];
		var target = $(this).next().next();
		
		if(this.value == "TB") var d = nth_TB;
		else if(this.value == "HepaB") var d = nth_HepaB;
		else if(this.value == "cerebro") var d = nth_cerebro;
		else if(this.value == "polio") var d = nth_polio;
		else if(this.value == "diplo") var d = nth_diplo;
		else if(this.value == "DPT") var d = nth_DPT;
		else if(this.value == "combo") var d = nth_combo;
		else if(this.value == "chick") var d = nth_chick;
		else if(this.value == "mmr") var d = nth_mmr;
		else if(this.value == "japEncep1") var d = nth_japEncep1;
		else if(this.value== "japEncep2") var d = nth_japEncep2;
		else if(this.value == "influ") var d = nth_influ;
		else if(this.value == "typhoid") var d = nth_typhoid;
		
		var cho = "<option disabled selected value=''>차수</option><option disabled>----------</option>";
		target.html(cho);

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.append(opt);
		}	
	});
});


</script>
<!-- contents end-->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />