<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LineDrive</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src="https://kit.fontawesome.com/e257908efc.js" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/2c815bad85.js" crossorigin="anonymous"></script>
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
	font-family: 'TheJamsil';
    font-weight: 300;
    font-size : 15px;
}
</style>
</head>
<script type="text/javascript">
	function registerCheck() {
		let memID = $("#memID").val();
		
	 $.ajax({
			url : "${contextPath}/registerCheck.do",
			type : "get",
			data : {"memID" : memID},
			dataType : "json",
			success : function(data) {
				console.log(data);
				// 중복 유무 (data = 1 : 사용가능, data = 0 : 사용불가능)
				if(data == 1) {
					$("#memID").css({
						"border-color": "#EDEDED",
						"color" : "black"
						});
					$("#memIDicon").css("color", "#EDEDED");
					$("#IDError").hide();
					$("#userError").css("display","none");
				} else {
					$("#IDError").text(memID + "은(는) 사용 불가능합니다.");
					$("#IDError").css("color", "red");
					$("#memID").css({
						"border-color" : "red",
						"color" : "red",
						});
					$("#memIDicon").css("color", "red");
					$("#IDError").show();
					$("#userError").css("display","block");
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
	
	function passwordCheck() {
		let memPassword1 = $("#memPassword1").val();
		let memPassword2 = $("#memPassword2").val();
		console.log(memPassword1+"/"+memPassword2);
		if(memPassword1 != memPassword2) {
			$("#passError").text("비밀번호가 서로 일치하지 않습니다.");
			$("#passError").css("color", "red");
			$("#memPassword2").css({
				"color" : "red",
				"border-color" : "red"
			});
			$("#memPassword2icon").css("color", "red");
			$("#passError").show()
			$("#userError").css("display","block");
		} else {
			$("#memPassword2").css({
				"border-color": "#EDEDED",
				"color" : "black"
			});
			$("#memPassword2icon").css("color", "#EDEDED");
			$("#passError").hide();
			$("#passError").text("");
			$("#memPassword").val(memPassword1);
		}
	}
	
	$(document).ready(function(){
		if(${not empty msgType}) {
			
			if(${msgType eq "실패 메세지"}){
				$("#checkType").attr("class", "modal-content panel-warning");
			}
			$("#myModal").modal("show");
		}
	});
	
	
	
</script>
<body>

<!-- 로딩화면 -->
<jsp:include page="../common/loading.jsp"></jsp:include>

<!-- 바디 -->
<div class="container">
	<!-- 좌측 여백 -->
	<div class="item"></div>
		
	<!-- 메인공간 -->
	<div class="item">
	
	  		<div class="join-form">
	  			<a href="${contextPath}"><img src="resources/images/Linedrive_Logo.png" style="width:200px; height:200px; margin-bottom:50px;"></a>
	  			
	  			<form action="${contextPath}/join.do" method="post">
	  				<input type="hidden" id="memPassword" name="memPassword" value="">
	  				
	  				<div class="formEmpty">
		  				<label for="memID" style="vertical-align: middle;">아이디</label> <br>
		  				<span class="formbox">
			  				<input required="required" type="text" id="memID" name="memID" placeholder="아이디를 입력하세요." maxlength="20" onchange="registerCheck()">
			  				<br><i class="fa-solid fa-user" id="memIDicon"></i>
						</span>
					</div>
	  				
					<div class="formEmpty" style="margin-top:-10px;">
	  				<label style="width: 110; vertical-align: middle;">비밀번호</label> <br>
					<div>
						<input required="required" id="memPassword1" type="password" name="memPassword1" placeholder="비밀번호를 입력하세요." maxlength="20">
						<br><i class="fa-solid fa-lock" id="memPassword1icon"></i>
					</div>
		  			<div style="margin-top:-10px;">
		  				<input required="required" id="memPassword2" type="password" name="memPassword2" placeholder="비밀번호를 재입력하세요." maxlength="20" onchange="passwordCheck()">
						<br><i class="fa-solid fa-lock" id="memPassword2icon"></i>
					</div>
					</div>
					
					<!-- 에러 메세지 -->
					<div id="userError" style="display:none;">
						<span id="IDError"></span> <br>
						<span id="passError"></span>
					</div>
					
					<div class="formEmpty">
	  				<label style="width: 110; vertical-align: middle;">사용자 이름</label> <br>
	  				<input required="required" type="text" name="memName" class="form-control" placeholder="이름을 입력하세요." maxlength="20">
					</div>
					
					<div class="formEmpty">
	  				<label style="width: 110; vertical-align: middle;">사용자 나이</label> <br>
	  				<input required="required" type="number" name="memAge" class="form-control" placeholder="나이를 입력하세요." maxlength="20">
	  				</div>
	  				
	  				<div class="formEmpty">	
	  				<label style="width: 110; vertical-align: middle;">성별</label>
						<div class="select">
							<input type="radio" name="memGender" autocomplete="off" value="남자" id="select1"/>
							<label for="select1">남자</label>
							<input type="radio" name="memGender" autocomplete="off" value="여자" id="select2"/>
							<label for="select2" style="margin-left:5px;">여자</label>
						</div>
					</div>
					
					<div class="formEmpty">
					<label>타격위치</label>
						<div class="select">
							<input type="radio" name="memHander" autocomplete="off" value="좌타" id="select3">
							<label for="select3">좌타</label>
							<input type="radio" name="memHander" autocomplete="off" value="우타" id="select4">
							<label for="select4">우타</label>
						</div>
					</div>

					<div class="formEmpty">
	  				<label style="width: 110; vertical-align: middle;">이메일</label> <br>
	  				<input required="required" type="email" name="memEmail" class="form-control" placeholder="이메일을 입력하세요." maxlength="50">
	  				</div>

	  				<input type="submit" value="등록" id="userSubmit" class="formEmpty">

	  			</form>
	  		</div>
	</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>
	
<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>
	
	

	
	
	
	
	
	
	
	
	
	
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="checkType" class="modal-content">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="titleMsg" class="modal-title">${msgType}</h4>
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