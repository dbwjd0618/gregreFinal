<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
	<!-- 게시판 CSS -->
	<link rel="stylesheet" href="../css/board/board.css">
	
	<!--서브메뉴 js-->
	<script src="../js/subMenu/subMenu.js"></script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>