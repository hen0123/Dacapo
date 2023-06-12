<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LineDrive</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script type="text/javascript">
//click on 라벨 추가 모달 열기
$(document).on('click', '#add-btn', function (e) {
  console.log("click event");
  $('#modal').addClass('show');

});

// 모달 닫기
$(document).on('click', '#close_btn', function (e) {
  console.log("click event");
  $('#modal').removeClass('show');

});
</script>

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
			<div class="upload" id="add-btn"><span class="upload-text">영상업로드</span></div>
			<div onclick="location.href='${contextPath}/posture.run'" class="posture-button">진단하기</div>
		</div>
		<div class="sign-container">
			<p id="header">!동영상 촬영 기준</p>
			첫번째, <span class="point">카메라는 측면상태</span>로.<br>두번째, <span class="point">대기자세부터 팔로우까지 촬영</span>해주세요.
			<p id="bottom">영상을 업로드하면 AI가 자세를 진단해줍니다.</p>
		</div>
			
	</div>
	
	<!-- 모달 -->
	<div class="modal" id="modal">
	  <div class="modal_body">
	    <div class="m_head">
	    	<div class="modal-logo">
				<span class="logo-circle">
					<i class="fa-regular fa-folder-open fa-xl"></i>
				</span>
				<span class="modal-title">파일 업로드</span>
			</div>
			<button class="btn-close" id="close_btn">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z" fill="var(--c-text-secondary)"/></svg>
			</button>
	    </div>
	    <div class="m_body">
			<form action="${contextPath}/posture.action" method ="post" enctype = "multipart/form-data">
					<input type ="file" name = "file"/>
					<input class = "btn-secondary" type = "reset" name = "Cancel">
					<input class = "btn-primary" type ="submit" name ="UploadFile">
			</form>
	    </div>
	  </div>
	</div>
	<!-- 모달 -->

	</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>

<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>