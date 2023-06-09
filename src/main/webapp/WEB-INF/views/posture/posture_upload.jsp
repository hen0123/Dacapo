<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/e257908efc.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>LineDrive</title>
<style>
@font-face {
    font-family: 'TheJamsil';
    font-weight: 100;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Thin.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Thin.eot?#iefix') format('embedded-opentype'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Thin.woff2') format('woff2'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Thin.woff') format('woff'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Thin.ttf') format("truetype");
    font-display: swap;
}

*, *:after, *:before {
  box-sizing: border-box;
}

:root {
  --c-background-primary: #d0d1de;
}

body {
  font-family: 'TheJamsil';
  background-color: var(--c-background-primary);
  line-height: 1.5;
}

.modal {
  width: 90%;
  max-width: 500px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 10vh;
  margin-bottom: 10vh;
  background-color: #FFF;
  border-radius: 0.5rem;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.modal-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  padding: 1.5rem 1.5rem 1rem;
}

.modal-logo, .btn-close {
	margin : 0;
}

.logo-circle {
	width: 50px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	background-color: #34347D;
	color : #fff;
	float : left;
}

.logo-circle i {
	margin : 0 auto;
}

.modal-title {
	float : left;
	font-size : 20px;
  	font-weight: 700;
  	vertical-align : middle;
  	margin : 10px;
}

.btn-close {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2.25rem;
  height: 2.25rem;
  border-radius: 0.25rem;
  border: none;
  background-color: transparent;
}
.btn-close:hover, .btn-close:focus {
  background-color: var(--c-action-primary-accent);
}

.modal-body {
  padding: 1rem 1.5rem;
}

.modal-description {
  color: var(--c-text-secondary);
}

.upload-area {
  margin-top: 1.25rem;
  border: none;
  background-image: url("data:image/svg+xml,%3csvg width='100%25' height='100%25' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='100%25' height='100%25' fill='none' stroke='%23ccc' stroke-width='3' stroke-dasharray='6%2c 14' stroke-dashoffset='0' stroke-linecap='square'/%3e%3c/svg%3e");
  background-color: transparent;
  padding: 3rem;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.upload-area:hover, .upload-area:focus {
  background-image: url("data:image/svg+xml,%3csvg width='100%25' height='100%25' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='100%25' height='100%25' fill='none' stroke='%232e44ff' stroke-width='3' stroke-dasharray='6%2c 14' stroke-dashoffset='0' stroke-linecap='square'/%3e%3c/svg%3e");
}

.upload-area-icon {
  display: block;
  width: 2.25rem;
  height: 2.25rem;
}
.upload-area-icon svg {
  max-height: 100%;
  max-width: 100%;
}


.upload-area-description strong {
  color: var(--c-action-primary);
  font-weight: 700;
}

.modal-footer {
  padding: 1rem 1.5rem 1.5rem;
  display: flex;
  justify-content: flex-end;
}
.modal-footer [class*=btn-] {
  margin-left: 0.75rem;
}

.btn-secondary, .btn-primary {
  display: inline;
  padding: 0.5rem 0.5rem;
  font-weight: 500;
  border: 2px solid var(--c-action-secondary);
  border-radius: 0.25rem;
  background-color: transparent;
}

.btn-primary {
  color: #FFF;
  background-color: #34347D;
  border-color: #34347D;
}
</style>
</head>
<body>

	<!-- 짭모달창 -->
	<div class="modal">
		<div class="modal-header">
			<div class="modal-logo">
				<span class="logo-circle">
					<i class="fa-regular fa-folder-open fa-xl"></i>
				</span>
				<span class="modal-title">파일 업로드</span>
			</div>
			<button class="btn-close" onclick ="history.back();">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z" fill="var(--c-text-secondary)"/></svg>
			</button>
		</div>
		<div class="modal-body">
			<form action="${contextPath}/posture.action" method ="post" enctype = "multipart/form-data">
					<input type ="file" name = "file"/>
					<input class = "btn-secondary" type = "reset" name = "Cancel">
					<input class = "btn-primary" type ="submit" name ="UploadFile">
			</form>
		</div>
	</div>

</body>
</html>