<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${contextPath}/updateForm.do">회원정보수정</a><br>
<a href="${contextPath}/memDelete.do/${mvo.memID}">회원탈퇴</a><br>
<a href="${contextPath}/payHistory.do/${mvo.memID}">결제내역</a>
</body>
</html>