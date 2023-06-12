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
<%@ page import="kr.spring.entity.*" %>
<%
	Posture vo = (Posture)request.getAttribute("vo");
	String data = vo.getScore();
	int len = data.length()-2;
	String score = data.substring(2,len);
	String comment_low = vo.getComment_1();
	int len_1 = comment_low.length()-2;
	String comment = comment_low.substring(2,len_1);
	
%>
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
            <div class="result-img"><img src = "${contextPath}/resources/upload/20230605_163155_182692Follow Through.jpg" style="width:550px;height:300px;"></div>
            <div class="result-content">
               <div class="content1">
                  <div class="score">
                     <span class="score1">전체점수: </span><span class="score2"><%=score%></span>
                  </div>
               </div>
               <div class="content2">
                  Comment.
                  <div class="content3"><%=comment%></div>
               </div>
            </div>
         </div>
         
         <div class="result-button">
            <button class="result-btn" onclick="location.href='${contextPath}/posture.run'">Take-back</button>
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