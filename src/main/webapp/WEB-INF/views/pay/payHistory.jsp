<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.spring.entity.Pay" %>
<%@ page import="java.util.*" %>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인드라이브</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/e257908efc.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</style>
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
		<p class="title">결제내역</p>
			<div class="table-div">
				<table class="style-table">
				<thead>
				   <tr>
				       <td>주문번호</td> 
				       <td>매칭된 코치</td>
				       <td>금액</td>
				       <td>주문시간</td>
				    </tr>
				</thead>
				   <!-- 반복문을 통해서 결제내역 출력하기 -->
				   <% 
				      ArrayList<Pay> list = (ArrayList<Pay>)request.getAttribute("list");
				      int totalAmount = (int)request.getAttribute("totalAmount");
				   %>
				<tbody>
				   <c:forEach var="vo" items="${ list }" varStatus="i">
				      <tr>
				          <td>${ i.index }</td>
				          <td>${ vo.merchantName }</td>
				          <td>${ vo.amount }</td>
				          <td>${ vo.payDate }</td>
				        </tr>
				        
				   </c:forEach>
				</tbody>
				</table>
				
				<span class="total">총 결제액 : <%= totalAmount %></span>
			</div>

</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>


<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>