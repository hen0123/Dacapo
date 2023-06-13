<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> 
<!DOCTYPE html>
<html>
<head>
<!-- 부스스트랩 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>LineDrive</title>

<!-- 회원탈퇴 스크립트 -->
<script>
	function showPopup() {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			alert("탈퇴 되었습니다.");
			// 확인 버튼을렀을 때 실행할 코드를 여기에 작성하세요.
			window.location.href = "${contextPath}/memDelete.do/${mvo.memID}"
			} else {
				alert("취소 되었습니다.");
				// 취소 버튼을 눌렀을 때 실행할 코드를 여기에 작성하세요.
				}
		}
</script>

</head>
<body>

<!-- 스타일 -->
<style>

table {
	border-collapse: separate !important;
	border-spacing: 100px 0px !important;
	display: flex;
	justify-content: center;
	align-items: center;
	padding : 20px 0 20px 0;
}

p {
	color: #34347D;
	margin-top: 0px !important;
	margin-bottom: 5px !important;
	text-align: center;
	font-family: 'TheJamsil';
	font-weight : 300;
}
</style>

<!-- 헤더 -->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="item" style="margin-left: 20%;">
	<p1 class="title">내정보</p1>
</div><br><br>

<!-- 상단 테이블 -->
<table style="border-radius: 15px; max-width: 850px; margin: auto; background-color: #EAEAEA">
	<tr><td><br></td></tr>
	<tr>
	<td class="my-information-img1"><p class="my-information-content">${ recent }</p></td>
	<td class="my-information-img2"><p class="my-information-content">${ countSwing }</p></td>
	<td class="my-information-img3"><p class="my-information-content">${ countDate }</p></td>
	</tr>
	<tr>
	<th><p class="my-information">최근진단일</p></th>
	<th><p class="my-information">스윙횟수</p></th>
	<th><p class="my-information">훈련일수</p></th>
	</tr>
</table>
<br>
<div class="item" style="margin-left: 20%;">

	<p1 class="title">메뉴</p1>
</div><br><br>

<!-- 하단 테이블 -->
<table style="border-radius: 15px; max-width: 850px; margin: auto; background-color: #EAEAEA">
	<tr>
		<th><p class="mini-title">회원정보</p></th>
		<th><p class="mini-title">결제수단</p></th>
		<th><p class="mini-title">부가서비스</p></th>
	</tr>
	<tr>
		<td><a href="${contextPath}/updateForm.do"><p>회원정보수정</p></a></td>
		<td><p>결제수단추가</p></td>
		<td><p>서비스신청</p></td>
	</tr>
	<tr>
		<td><a onclick="showPopup();"><p>회원탈퇴</p></a></td>
		<td><p>결제수단삭제</p></td>
		<td><p>이용취소</p></td>
	</tr>
	<tr>
		<td></td>
		<td><a href="${contextPath}/payHistory.do/${mvo.memID}"><p>결제내역</p></td>
	</tr>
</table>

<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>