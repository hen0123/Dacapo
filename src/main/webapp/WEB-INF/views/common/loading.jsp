<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(window).on("load",function(){
		$('#load').hide();
		system.out.print('작동');
		console.log('로딩화면출력');
	});
</script>
<style>
	#load {
		width : 100%;
		height : 100%;
		top : 0;
		left : 0;
		position : fixed;
		display : block;
		opacity : block;
		background : #fff;
		z-index : 99;
		text-align : center;
	}
	
	#load > img {
		position : absolute;
		top : 50%;
		left : 50%;
		z-index : 100;
	}

</style>
</head>
<body>

<div id="load">
	<img src="${contextPath}/resources/images/Fading arrows.gif" alt="loading">
</div>

</body>
</html>