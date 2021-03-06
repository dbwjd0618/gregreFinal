<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/counselorAdmin/common/header.jsp"%>

<style>
.view, .deleteCounselor{
	border: 1px solid #f6d964;
    background-color: #fdedad;
}

#example3{
	display: inline-block; 
	width:auto;
	margin-left:19px;
	position: relative;
    bottom: 43px;
    text-align: center;
}

.fa-user-times{
	color: lightgray; 
	/* margin:0px -100px 42px 200px; */
}
</style>


<!-- alert 메세지 띄우기! -->
<c:if test="${not empty msg }">
<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>

<script>
function counselorDelete(advisId){
	if(!confirm("해당 상담사를 탈퇴하시겠습니까?")){
		return;
	}
	location.href="${pageContext.request.contextPath}/counselorAdmin/counselorDelete.do?advisId="+advisId;
}

</script>


<!-- admin index 선언 -->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			상담사 권한 관리
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Main row -->
		<div class="row">
			<div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">상담사 목록</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                      <table id="example2" class="table table-bordered table-hover">
                          <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>경력</th>
                            <th>자격증</th>
                            <th>등급</th>
                            <th>성별</th>
                            <th>키워드</th>
                            <th>권한 부여</th>
                          </tr>
                          
                          <c:if test="${empty list }">
                          	<tr >
                          		<td colspan="11">조회된 상담사 목록이 없습니다.</td>
                          	</tr>
                          </c:if>
                          
                          <c:if test="${not empty list }">
                          	<c:forEach items="${list }" var="counselor">
	                          <tr>
	                            <td>${counselor.advisId }</td>
	                            <td>${counselor.advisName }</td>
	                            <td>${counselor.advisCareer }</td>
	                            <td>${counselor.advisLicense }</td>
	                            <td>${counselor.advisGrade }</td>
	                            <td>${counselor.advisGender }</td>
	                            <td>
	                            <c:forEach items="${counselor.advisKeyword }" var="i" varStatus="vs">
	                            ${i}${!vs.last?",":"" }
	                            </c:forEach>
	                            </td>
	                            <td><input type="button" class="view" value="수정"
	                            	 onclick="location.href='${pageContext.request.contextPath}/counselorAdmin/counselorView.do?advisId='+'${counselor.advisId}'"></td>
	                          </tr>
                          	</c:forEach>
                          </c:if>
                      </table>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
		</div>
		<!-- /.row (main row) -->
	</section>
	<!-- /.content -->
	
	<section class="content-header">
		<h1>
			상담사 탈퇴
		</h1>
	</section>
	
	<section class="content">
		<!-- Main row -->
		<div class="row">
			<div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">상담사 탈퇴</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
	                    <div style="font-size: 30px; display: inline-block;">
	                    <i class="fas fa-user-times fa-10x"></i>
	                    </div>
	                    
	                      <table id="example3" class="table table-bordered table-hover">
                          <tr>
                            <th style="width:100px; text-align:center;">아이디</th>
                            <th style="width:100px; text-align:center;">이름</th>
                            <th style="width:350px; text-align:center;">한줄소개</th>
                            <th style="width:100px; text-align:center;">등급</th>
                            <th style="width:100px; text-align:center;">탈퇴</th>
                          </tr>
                          
                          <c:if test="${empty list }">
                          	<tr >
                          		<td colspan="3">조회된 상담사 목록이 없습니다.</td>
                          	</tr>
                          </c:if>
                          
                          <c:if test="${not empty list }">
                          	<c:forEach items="${list }" var="counselor">
	                          <tr>
	                            <td>${counselor.advisId }</td>
	                            <td>${counselor.advisName }</td>
	                            <td>${counselor.advisLineIntro }</td>
	                            <td>${counselor.advisGrade }</td>
	                            <td><input type="button" class="deleteCounselor" value="탈퇴"
	                            	 onclick="counselorDelete('${counselor.advisId}');"></td>
	                          </tr>
                          	</c:forEach>
                          </c:if>
                      </table>
	                    
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
             </div><!-- /.col -->
		</div>
	</section>
</div>
<!-- /.content-wrapper -->



<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/counselorAdmin/common/footer.jsp"%>
