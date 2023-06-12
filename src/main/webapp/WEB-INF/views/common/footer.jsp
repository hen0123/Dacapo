<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LineDrive</title>
<style>
.footer {
	width : 100%;
	height : 50px;
	background : white;
	text-align : center;
	padding-top : 100px;
	font-family: 'TheJamsil';
    font-weight: 100;
    font-size : 10px;
}

.footer .content {
	padding-bottom : 20px;
}

.footer img {
	width : 150px;
	height : 20px;
}
</style>
</head>
<body>
	<div class="footer">
		<div class="content">
			<p>copyright © 2023 LINEDRIVE Co. 대표자 : 한창현
			<a style="margin-left : 10px;"><img src="${contextPath}/resources/images/Linedrive_Logoline.png"></a></p>
		</div>
	</div>
</body>
</html>