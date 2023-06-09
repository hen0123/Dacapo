<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.spring.entity.Pay" %>
<%@ page import="java.util.*" %>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LineDrive</title>
<style type="text/css">
   table, tr, td {
      border: 1px solid black;
      border-collapse: collapse;
   }
</style>
</head>
<body>
결제내역
<table>
   <tr>
       <td>주문번호</td> 
       <td>매칭된 코치</td>
       <td>금액</td>
       <td>주문시간</td>
    </tr>
   <!-- 반복문을 통해서 결제내역 출력하기 -->
   <% 
      ArrayList<Pay> list = (ArrayList<Pay>)request.getAttribute("list");
      int totalAmount = (int)request.getAttribute("totalAmount");
   %>
   <c:forEach var="vo" items="${ list }" varStatus="i">
      <tr>
          <td>${ i.index }</td>
          <td>${ vo.merchantName }</td>
          <td>${ vo.amount }</td>
          <td>${ vo.payDate }</td>
        </tr>
        
   </c:forEach>
</table>
총금액 : <%= totalAmount %>
</body>
</html>