<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LineDrive</title>
<link rel="stylesheet" href="${contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/2c815bad85.js" crossorigin="anonymous"></script>

</head>
<body>
	<nav>
		<a href="${contextPath}"><img src="${contextPath}/resources/images/Linedrive_Logo.png"></a>
		<ul class="menu">
			<c:if test="${empty mvo}">
				<li><a href="${contextPath}/loginForm.do">자세진단</a></li>
				<li><a href="${contextPath}/loginForm.do">훈련일지</a></li>
				<li><a href="${contextPath}/loginForm.do">코치매칭</a></li>
			</c:if>
			<c:if test="${not empty mvo}">
				<li><a href="${contextPath}/posture">자세진단</a></li>
				<li><a href="${contextPath}/trainLog/${mvo.memID}">훈련일지</a></li>
				<li><a href="${contextPath}/coach">코치매칭</a></li>
			</c:if>
		</ul>
		
		<c:if test="${empty mvo}">
			<ul class="log">
				<li><a href="${contextPath}/joinForm.do">회원가입</a></li>
				<li><a href="${contextPath}/loginForm.do">로그인</a></li>
			</ul>
		</c:if>
		 
		<c:if test="${not empty mvo}">
	      	<ul class="log">
	        	<li class="login"><a href="${contextPath}/memberModify.do/${mvo.memID}"><i class="fa-regular fa-user fa-2x"></i></a></li>
	      		<li class="login"><a href="${contextPath}/logout.do"><i class="fa-solid fa-right-from-bracket fa-2x"></i></a></li>
	      		
	      	</ul>
	      </c:if>
	</nav>
	
	<div class="navblank">
	</div>
	
	<!-- 로딩화면 -->
	<jsp:include page="/common/loading.jsp"></jsp:include>

</body>
</html>