<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
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
	width: 950px;
	height: 400px;
	margin-left: 18px;
}

</style>

</head>
<body>

<div class="com_table mar_t20"> 
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
      <td class="bg">1회</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&nbsp;</td> 
      <td>&amp;p;</td> 
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
	</div>



</body>
</html>