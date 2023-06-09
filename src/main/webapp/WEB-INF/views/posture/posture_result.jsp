<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- 바디 -->
<div class="container">
	<!-- 좌측 여백 -->
	<div class="item"></div>
	<p>자세진단</p>
	<!-- 메인공간 -->
	<div class="item">
		<img> <!-- 사진 여기 -->
		<p>전체점수</p>
		<p>comment</p>
		<p>Take-back</p>
		<p>Swing</p>
		<p>Impact</p>
		<p>Follow-through</p>
	</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>

<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>