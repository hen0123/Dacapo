<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>라인드라이브</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- 바디 -->
<div class="container">
	<!-- 좌측 여백 -->
	<div class="item"></div>
	
	<!-- 메인공간 -->
	<div class="item">
		<p class="title">자세진단</p>
			<div class="result-main">
				<div class="result-img"><img>이미지공간</div>
				<div class="result-content">
					<div class="content1">
						<div class="score">
							<span class="score1">전체 점수</span> <span class="score2">70</span>
						</div>
					</div>
					<div class="content2">
						Comment.
						<div class="content3">피드백 내용삽입</div>
					</div>
				</div>
			</div>
			
			<div class="result-button">
				<button class="result-btn">Take-back</button>
				<button class="result-btn">Swing</button>
				<button class="result-btn">Impact</button>
				<button class="result-btn">Follow-through</button>
			</div>
	</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>

<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>