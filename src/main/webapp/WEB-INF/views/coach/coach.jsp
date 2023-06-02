<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.spring.entity.Coach"%>
<%@ page import = "java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<!-- 부스스트랩 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>라인드라이브</title>
</head>
<!-- 모달 스타일 -->
<style>
  .modal-header, h4, .close {
    background-color: #5cb85c;
    color: white;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
  </style>
 
<!-- 결제 로직(아래 스크립트 필요함) -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
    var IMP = window.IMP;
    IMP.init("imp17858560");
    
    var i = 0;
    function requestPay() {
    	
         IMP.request_pay(
        {
          pg: "T5102001",
          pay_method: "card",
          merchant_uid: "merchant1"+i,
          name: "이름 : 테스트",
          amount: 10,
          buyer_email: "${memEmail}",
          buyer_name: "${mvo.memName}",
        },
        function (rsp) {
           if(rsp.success) {
            console.log("성공");
            console.log(i);
            i++;
            
           } else {
            console.log("실패");
            
           }
          // callback
          //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        
              })
          }
       
      
      
      
// 모달창 띄우기 + 모달창 안에 데이터 뿌리기
function goModal(coachIdx) {
          
            // 모달창 띄우기
           $("#myModal").modal();
         
          let fData = {"coachIdx" : coachIdx};
          
          // 비동기통신 시작(모달창 안에 데이터 뿌리기)
          $.ajax({
             url : "coachModal/"+coachIdx,
             data : fData,
             method : "get",
             dataType : "json",
             success : function(data) {
                $("#modalNmae").text(data.name);
                
                //디비 값 문단 나누기
                $("#modalCareer").empty();
                var str = data.career; 
                 var words = str.split(',');
                 for (let word of words) {
                     console.log(word);
                     $("#modalCareer").append(word+"<br>");
                   }
                
                $("#modalRegion").text(data.region);
                $("#modalImg").empty();
                $("#modalImg").append("<img src='${contextPath}/resources/images/coPicture/"+ data.img +".jpg'>");
                
             },
             erro : function(){ alert("error") }
          });
       };
       
 <!-- 리스트스크립 -->
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
	<p class="title">코치매칭</p>
		
	<!-- 위치 필터링 -->
	<div class="coach-place">
		<p>어디에서 수업할까요?</p>
		<i class="fa-solid fa-location-dot fa-xl"></i>
		<form action="${contextPath}/regionSerch.do" method="post">
			<select name="region" id="place" onchange="this.form.submit()">
				<option value="">선택</option>
				<option value="노원">노원</option>
				<option value="강남">강남</option>
				<option value="송파">송파</option>
				<option value="용산">용산</option>
				<option value="전체">전체</option>
		   </select>
		</form>
	</div>
		   
	<!-- 코치 데이터 -->
	<!-- <div>
		<table> -->
		<% ArrayList<Coach> list = (ArrayList<Coach>)request.getAttribute("list");%>
		   <!-- 반복문을 통해서 코치 출력하기 -->
		   <!--<c:forEach var="vo" items="${ list }" varStatus="i">
		      <tr>
		          <td>${ vo.coachIdx }</td>
		          <td>${ vo.name }</td> 
		          <td>${ vo.region }</td>
		          <td>${ vo.career }</td>
		          <td>${ vo.beginDate }</td>
		          <td><img id="coachPicture" alt="" src="${contextPath}/resources/images/coPicture/${ vo.img }.jpg"></td>
		          <td><input onclick="goModal(${vo.coachIdx})" id="myBtn" type="button" value="선택하기"></td>
		        </tr>
		   </c:forEach>
		</table>
	</div> -->
	
	<!-- 카드 리스트 -->
	<div id="app"></div>
	<div id="banner_container" style="widht:100%; height:500px; position:relative;">
		<div id="banner_wrapper" style="width:900px; /*position:absolute;*/">
			<c:forEach var="vo" items="${ list }" varStatus="i">
				<div class="card" onclick="goModal(${vo.coachIdx})">
					<span class="coach-name">${ vo.name }</span><br>
					<!-- ${ vo.region } -->
					<span class="coach-career">${ vo.career }</span><br>
					<!-- ${ vo.beginDate }<br> -->
					<div class="coach-img"><img id="coachPicture" alt="" src="${contextPath}/resources/images/coPicture/${ vo.img }.jpg"></div><br>
				</div>
			</c:forEach>
		</div>
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
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>코치</h4>
        </div>
        
        <div id="modalNmae" class="modal-body" style="padding:40px 50px;">
        </div>
                 
        <div id="modalCareer" class="modal-body" style="padding:40px 50px;">
        </div>
        
        <div id="modalImg" class="modal-body" style="padding:40px 50px;">
        </div>
        
        
        <div>
           <button onclick="requestPay()" type="button" class="btn btn-success btn-block">결제하기</button>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
      
    </div>
</div> 


   
</body>
</html>