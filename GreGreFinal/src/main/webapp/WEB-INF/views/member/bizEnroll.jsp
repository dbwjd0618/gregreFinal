<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
	</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <title>Kiddy &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower" rel="stylesheet">


  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  
<c:if test="${not empty memberLoggedIn }">
<script>
	$(function() {
		location.href='${pageContext.request.contextPath}';
	});
</script>
</c:if>
  <!-- MAIN CSS -->


<!--login css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css"> 
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<style>
.enroll-btn{
    padding: 12px 0 !important;
}
sapn.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px ; }
span.ok{display:none;color:green;}
span.error{display:none;color:red ;}

sapn.pguide {display:none;font-size: 12px;position:absolute; top:12px; right:10px ; }
span.ok1{display:none;color:green;}
span.error2{display:none;color:red ;}
</style>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


 <!-- contents begin-->
 <div class="site-section">
        <div class="container">
          <div class="row">
            <div class="col">
                  <div class="card-body mx-auto" style="max-width:800px;">
                      <article class="card-body">
                          <h4 class="card-title text-center mb-4 mt-1">상담사 회원 가입</h4>
                          <form action="bizEnroll.do" enctype="multipart/form-data"  method="post" onsubmit="return enrollValidate2();">
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">아이디</span>
                                  </div>
                                  <input name="cmemberId" class="form-control" id="cmemberId"
                                      placeholder="4글자 이상" type="text" required>
  
                              </div>
                              <span class="guide ok" >이 아이디는 사용 가능합니다</span>
								<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
								<input type="hidden" name="idDuplicateCheck2" id="idDuplicateCheck2" value="0"/>
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">패스워드 </span>
                                  </div>
                                  <input name="memberPwd" class="form-control" id="memberPwd"
                                      placeholder="" type="password" required>
                              </div>
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">패스확인</span>
                                  </div>
                                  <input class="form-control" name="memberPwd2"placeholder="" id="memberPwd2"
                                      type="password" required>
                              </div>
 
                              <span class="pguide ok1" id="alert-success">비밀번호가 일치합니다.</span> 
                              <span class="pguide error2" id="alert-danger">비밀번호가 일치하지 않습니다.</span> 
  
                           <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 이름</span>
                                  </div>
                                  <input name="advisName" class="form-control" id="advisName"
                                      type="text">
                              </div> 
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text">연락처 </span>
                                  </div>
                                  <input name="phone" class="form-control" id="phone"
                                      placeholder="(-없이)01012345678" type="text">
                              </div>
                              
                               <div class="form-group input-group">
                                  <div class="input-group-prepend" id="gender">
                                      <span class="input-group-text"> 성별 </span>&nbsp;&nbsp;&nbsp;
  
                                      <div id="gender1">
                                          <input type="radio" name="advisGender" id="gender0" value="M"checked> 
                                          <label for="gender0"> 남자</label> 
                                          
                                          <input type="radio" name="advisGender" id="gender1" value="F"> 
                                          <label for="gender1">여자</label>
                                      </div>
                                  </div>
                              </div>
                              
                              
                             <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 소개</span>
                                  </div>
                                  <textarea name="advisIntro" class="form-control" id="advisIntro"
                                      placeholder="" type="text"></textarea>
                              </div>
                              
                              
                               <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 한줄소개</span>
                                  </div>
                                  <textarea name="advisLineIntro" class="form-control" id="advisLineIntro"
                                      placeholder="" type="text"></textarea>
                              </div>
                              
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 경력</span>
                                  </div>
                                  <textarea name="advisCareer" class="form-control" id="advisCareer"
                                      placeholder="" type="text"></textarea>
                              </div>
                              
                              
                              
                              <div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">증명사진</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="advisImg" >
		    <label class="custom-file-label" for="advisImg">파일을 선택하세요</label>
		  </div>
		</div>
		
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 자격증</span>
                                  </div>
                                  <input name="advisLicense" class="form-control" id="advisLicense"
                                      type="text">
                              </div>		
		
				<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">자격증 사진</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="advislicenseFile" >
		    <label class="custom-file-label" for="advislicenseFile">파일을 선택하세요</label>
		  </div>
		</div>
		
		                              <div class="form-group input-group">
                                  <div class="input-group-prepend" id="gender">
                                      <span class="input-group-text"> 상담 가능 요일 </span>&nbsp;&nbsp;&nbsp;
  
                                      <div id="gender1">
                                          <input type="radio" name="advisDay" id="advisDay1" value="A" >
                                          <label for="gender0"> 무관</label> 
                                          
                                          <input type="radio" name="advisDay" id="advisDay2" value="D"checked> 
                                          <label for="gender1">주중</label>
                                          
                                          <input type="radio" name="advisDay" id="advisDay3" value="E"> 
                                          <label for="gender1">주말</label>
                                      </div>
                                  </div>
                              </div>
		
		
		
                              <div class="form-group input-group">
                                  <div class="input-group-prepend">
                                      <span class="input-group-text"> 키워드</span>
                                  </div>
                                  <input name="advisKeyword1" class="form-control" id="advisKeyword1" type="text">&nbsp;/&nbsp;
                                  <input name="advisKeyword2" class="form-control" id="advisKeyword2" type="text">&nbsp;/&nbsp;
                                  <input name="advisKeyword3" class="form-control" id="advisKeyword3" type="text">
                              </div>		
		
		
		<!-- 유형 -->
		<input type="hidden" id="compDiv"name="compDiv" value="A"/>
		<!-- 등급 -->
		<input type="hidden"  name="advisGrade" id="grade" value="1"/>
		<!-- 가격 -->
		<input type="hidden" name ="advisPay" value="35000"/> 

                             
                              <div class="form-group">
                                  <button class="btn btn-primary btn-block enroll-btn">다음</button>
                              </div>
                          </form>
                      </article>
                  </div>
              </div>
        </div>
      </div>
      </div>
     <!-- contents end-->

  <script>
  
  $(()=>{
		$("[name=upFile]").on("change",e=>{
			let $file = $(e.target); // 사용자가 작성한 file input 태그
			if($file.prop('files')[0]== undefined){
				$file.next(".custom-file-label").html("파일을 선택하세요.");
			}
			else{
				let fileName = $file.prop('files')[0].name;
				$file.next(".custom-file-label").html(fileName);
			}
			
		});
	});


  
  $(function(){
		
		$("#cmemberId").on("keyup",function(){
			let cmemberId = $("#cmemberId").val().trim();
			
			//아이디 글자수 검사
			//아이디 재작성시
			if(cmemberId.length <4){
				$(".guide").hide();
				$("#idDuplicateCheck2").val(0);
				return;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/member/"+cmemberId+"/checkcId.do",
				type:"get",
				success: data =>{
					console.log(data);
					
					if(data.isUsable2 == true){
						$(".guide.error").hide();
						$(".guide.ok").show();
						$("#idDuplicateCheck2").val(1);
					}
					else {
						$(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck2").val(0);
					}
				},
					error: (x,s,e) => {
						console.log(x,s,e);
					}
			});
		});
		
		
	});


$(function(){
	  $("#alert-success").hide(); 
	  $("#alert-danger").hide(); 
	  $("input").keyup(function(){
		  var pwd1=$("#memberPwd").val(); 
		  var pwd2=$("#memberPwd2").val(); 
		  if(pwd1 != "" || pwd2 != ""){ 
			  if(pwd1 == pwd2){ 
				  $("#alert-success").show(); 
				  $("#alert-danger").hide(); 
				  $("#submit").removeAttr("disabled"); 
				  }else{ 
					  $("#alert-success").hide(); 
					  $("#alert-danger").show(); 
					  $("#submit").attr("disabled", "disabled"); 
					  } 
			  } 
		  }); 
	  });


	function enrollValidate2(){
		var cmemberId = $("#cmemberId");
		if(cmemberId.val().trim().length<4){
			alert("아이디는 최소 4자리이상이어야 합니다.");
			cmemberId.focus();
			return false;
		}
		
		if($("#idDuplicateCheck2").val() ==0){
			
			alert("아이디 중복 검사 해주세요.");
			return false;
		}
		
		return true;
	}
  
  </script>

<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>

  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>




    <!-- Js Plugins -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/member/member.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/shop/jquery.slicknav.js"></script>
    <!-- <script src="js/shop/owl.carousel.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/shop/main.js"></script>
   
   </body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />