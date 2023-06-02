<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인드라이브</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      $('.slider').bxSlider({
         auto : true,
         speed : 1000,
         pause : 2500,
         mode : 'fade',
         pager : false,
         autoHover : true,
      });
   });
</script>


<body style=" margin : 0; padding : 0;">

	<!-- 헤더 -->
	<div>
		<jsp:include page="common/header.jsp"></jsp:include>
	</div>
	
	<div class="container">
		<!-- 좌측 여백 -->
		<div class="item"></div>
		
		<!-- 메인공간 -->
		<div class="item">
			<div class="slider">
				<div><img src="resources/images/main/image1.png" /></div>
				<div><img src="resources/images/main/image2.png" /></div>
				<div><img src="resources/images/main/image3.png" /></div>
		   	</div>
			
			<div class="button-container">
				<a href="${contextPath}/posture" class="main-button item">
				<img src="resources/images/main/button1.png">
				<span>자세진단</span>
				<span class="button-sub">영상을 촬영하고 업로드하여<br>자세를 진단받아보세요</span>
				</a>
				
				<a href="${contextPath}/trainLog" class="main-button item">
				<img src="resources/images/main/button2.png">
				<span>훈련일지</span>
				<span class="button-sub">나만의 훈련일지를<br>작성해보세요</span>
				</a>
				
				<a href="${contextPath}/coach" class="main-button item">
				<img src="resources/images/main/button3.png">
				<span>코치매칭</span>
				<span class="button-sub">나에게 딱 맞는<br>코치를 찾아보세요</span>
				</a>
			</div>
		</div>  
		
		<!-- 우측 여백 -->
		<div class="item"></div>
	</div>
	
	<!-- 푸터 -->	
	<jsp:include page="common/footer.jsp"></jsp:include>
	
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="checkType" class="modal-content">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${msgType}</h4>
        </div>
        <div class="modal-body">
          <p id="checkMessage">${msg}</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    
    </div>
  </div>	
</body>
</html>