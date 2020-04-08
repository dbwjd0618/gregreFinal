<%@page import="kh.mclass.Igre.counselling.model.vo.Counselor"%>
<%@page import="kh.mclass.Igre.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>


</script>
<%
	Counselor C = (Counselor)request.getAttribute("counselor");
	Member m = (Member)request.getAttribute("member");
%>

<style>
    body{
        background-color: #F5F5F5;
    }
    hr{
        width: 90%;
        margin-top: 3%;
        border: 0.5px solid rgba(218,218,218);
    }
    .booking{
        margin: 13% auto;
        max-width: 800px;
        min-width: 800px;
        max-height: 550px;
        min-height: 550px;
        border: 1px solid rgba(218,218,218);
        background-color: white;   
    }
    .booking>h2{
        margin-left: 5%;
        font-size: 24px;
    }
    .booking>p{
        margin-left: 5%;
        font-size: 18px;

    }
    table{
        margin-top: 5%;
        margin-left: 5%;
        border-collapse: separate;
        border-spacing: 0;
        text-align: left;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
    }
    table.booking-info th{
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #fff;
        border-left: 1px solid #fff;
        background: #eee;
    }
    table.booking-info td{
        width: 350px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .goto-main{
        background-color: #61BC86;
        margin: 6% auto;
        width: 400px;
        height: 70px;
        text-align: center;
        
    }
    .goto-main>a{
        text-decoration: none;
        font-size: 20px;
        color: white;
        line-height: 70px;
    }

</style>
<div class="booking-end-wrapper">
    <div class="booking">
        <h2>상담센터</h2>
        <p>예약이 신청되었습니다.</p>
        <hr>
        <table class="booking-info">
            <tr>
                <th>아이디</th>
                <td>${info.memberId }</td>
            </tr>
            <tr>
                <th>결제유형</th>
                <td>${info.payInfo }</td>
            </tr>
            <tr>
                <th>예약번호</th>
                <td>12312312312323</td>
            </tr>
            <tr>
                <th>상담사 이름</th>
                <td>${info.advisId }</td>
            </tr>
            <tr>
                <th>예약일</th>
                <td>${info.startDay }</td>
            </tr>
            <tr>
                <th>상담 유형</th>
                <td></td>
            </tr>
        </table>
        <div class="goto-main">
        	<a href="${pageContext.request.contextPath}/counselling/counselorFind.do">메인으로 돌아가기</a>
    	</div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
