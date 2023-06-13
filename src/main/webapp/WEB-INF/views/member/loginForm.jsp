<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LineDrive</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/2c815bad85.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
@font-face {
    font-family: 'TheJamsil';
    font-weight: 300;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.eot?#iefix') format('embedded-opentype'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.woff2') format('woff2'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.woff') format('woff'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.ttf') format("truetype");
    font-display: swap;
}

body {
    margin : 0 auto;
    text-align : center;
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		if(${not empty msgType}) {
			if(${msgType eq "실패 메세지"}) {
				$("#checkType").attr("class", "modal-content panel-warning");
			}
			$("#myModal").modal("show");
		}
	})
</script>
<body>

<!-- 바디 -->
<div class="container">
	<!-- 좌측 여백 -->
	<div class="item"></div>
		
	<!-- 메인공간 -->
	<div class="item">
	
	<div class="login-form">
		<a href="${contextPath}"><img src="resources/images/Linedrive_Logo.png" style="width:200px; height:200px;"></a>
	  		<div class="login-title">로그인</div>
	  		
	  			<form action="${contextPath}/login.do" method="post">
	  				<div class="formEmpty">
	  					<input required="required" type="text" id="memID" name="memID" class="login-text" placeholder="아이디를 입력하세요." maxlength="20">
	  					<br><i class="fa-solid fa-user" id="memIDicon"></i>
	  				</div>
	  				<div class="formEmpty" id="password-input">
	  					<input required="required" id="memPassword1" type="password" name="memPassword" class="login-text" placeholder="비밀번호를 입력하세요." maxlength="20">
	  					<br><i class="fa-solid fa-lock" id="memPassword1icon"></i>
	  				</div>

					<input type="submit" value="로그인" id="userLogin" class="formEmpty">
	  			</form>
	</div>
	</div> 
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>

	
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
  
</div>

</body>
</html>	
	
</body>
</html>