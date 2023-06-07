<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	<div id="posture-body">
		<div class="upload-container">
			<div class="upload"><span class="upload-text">영상업로드</span></div>
			<button>진단하기</button>
		</div>
		<div class="sign-container">
			<p id="header">!동영상 촬영 기준</p>
			첫번째, <span class="point">카메라는 측면상태</span>로.<br>두번째, <span class="point">대기자세부터 팔로우까지 촬영</span>해주세요.
			<p id="bottom">영상을 업로드하면 AI가 자세를 진단해줍니다.</p>
		</div>
			
	</div>
	
	</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>

<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>