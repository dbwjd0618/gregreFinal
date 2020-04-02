<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<c:if test="${not empty referer}">
<script>
$(function() {
	let ref = "${referer}";
	<% session.removeAttribute("referer"); %>
	location.href=ref;
});
</script>
</c:if>

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>



<!-- 메인 화면 -->	
<%@ include file="/WEB-INF/views/mainPage/main.jsp" %>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%> 
