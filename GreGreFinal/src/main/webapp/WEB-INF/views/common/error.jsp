<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
body {
	padding: 50px;
	text-align : center;
}
h1 {color : red;}
</style>
</head>
<body>
	<h1>Error</h1>
	<h2><%=exception.getMessage() %></h2>
	<a href="${pageContext.request.contextPath }">인덱스 페이지로 이동</a>
</body>
</html>