<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인드라이브</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/e257908efc.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	
	function passwordCheck() {
		let memPassword1 = $("#memPassword1").val();
		let memPassword2 = $("#memPassword2").val();
		console.log(memPassword1+"/"+memPassword2);
		if(memPassword1 != memPassword2) {
			$("#passMessage").text("비밀번호가 서로 일치하지 않습니다.");
			$("#passMessage").css("color", "red");
		} else {
			$("#passMessage").text("");
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

<!-- 헤더 -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- 바디 -->
<div class="container">
	<!-- 좌측 여백 -->
	<div class="item"></div>
		
	<!-- 메인공간 -->
	<div class="item">
	
	<p class="title">회원정보수정</p>
	  	<div class="memberdata-container">
	  		<form action="${contextPath}/update.do" method="post">
	  				
	  			<input type="hidden" name="memID" value="${mvo.memID}">
	  			<input type="hidden" id="memPassword" name="memPassword" value="">
						
					<div class="memberdata-info">
						<div class="info-1">
							<i class="fa-regular fa-id-card fa-5x"></i>
						</div>
						<div class="info-2">
							<input required="required" type="text" name="memName" class="memberdata-name" placeholder="이름을 입력하세요." maxlength="20" value="${mvo.memName}">
	  						<br><span style="color:#757575;">${mvo.memID}</span>
						</div>
						<div class="memberdata-email">
	  						<i class="fa-regular fa-envelope fa-xl"></i>
	  						<input required="required" type="email" name="memEmail" placeholder="이메일을 입력하세요." maxlength="50" value="${mvo.memEmail}">
	  					</div>
					</div>
	  				<div>
						비밀번호
	  					<input required="required" onkeyup="passwordCheck()" id="memPassword1" type="password" name="memPassword1" placeholder="비밀번호를 입력하세요." maxlength="20" value="${mvo.memPassword}">
	  				</div>
	  				<div>
	  					비밀번호 확인
	  					<input required="required" onkeyup="passwordCheck()" id="memPassword2" type="password" name="memPassword2" placeholder="비밀번호를 확인하세요." maxlength="20" value="${mvo.memPassword}">
	  				</div>
	  				
	  				<div>
	  					사용자 나이
	  					<input required="required" type="number" name="memAge" placeholder="나이를 입력하세요." maxlength="20" value="${mvo.memAge}"></td>
	  				</div>
	  				
	  				<div style="width : 100%; height:50px;">
	  					성별
	  					<c:if test="${mvo.memGender eq '남자' }">
		  					<div class="form-group" style="text-align: center; margin: 0 auto;"></div>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" name="memGender" class="btn-secondary" autocomplete="off" value="남자" checked="checked"/> 남자
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="memGender" class="btn-secondary" autocomplete="off" value="여자" /> 여자
								</label>
							</div>	
	  					</c:if>
	  							
	  					<c:if test="${mvo.memGender eq '여자' }">
	  						<div class="form-group" style="text-align: center; margin: 0 auto;"></div>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn gender-btn memGender">
									<input type="radio" name="memGender" class="btn btn-primary" autocomplete="off" value="남자" />남자
								</label>
								<label class="btn gender-btn memGender active">
									<input type="radio" name="memGender" class="btn btn-primary" autocomplete="off" value="여자" checked="checked" />여자
								</label>
							</div>	
	  					</c:if>
	  				</div>
	  				

	  					
	  				<span id="passMessage"></span>
					<input type="submit" class="btn btn-primary btn-sm pull-right" value="등록">

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