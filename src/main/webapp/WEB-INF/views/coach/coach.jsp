<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.spring.entity.Coach"%>
<%@ page import = "java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    <!-- src/main/webapp/WEB-INF/views -->
<!DOCTYPE html>
<html>
<head>
<!-- 부스스트랩 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/style.css">
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
    	
    	// pay테이블 payDate 컬럼의 날짜 데이터 생성
        let today = new Date();   

        let year = today.getFullYear().toString(); // 년도
        let month = (today.getMonth()+1).toString() ;  // 월
        let date = today.getDate().toString();  // 날짜
        let hours = today.getHours().toString(); // 시
        let minutes = today.getMinutes().toString();  // 분
        
        let payDate = year+"/"+month+"/"+date+" "+hours+":"+minutes;
    	
         IMP.request_pay(
        {
          pg: "T5102001",
          pay_method: "card",
          merchant_uid: "merchant47"+payDate,
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
            
            let Fdata = {"amount" : rsp.paid_amount, "memID" : "${mvo.memID}", 
                    "merchantName" : $("#modalNmae").text(), "payDate" : payDate}
              $.ajax({
                 url : "pay.do",
                 type : "post",
                 data : Fdata,
                 erro : function(){ alert("error...") }
              });
            
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
                $("#modalImg").append("<img class='coach-modal-img' src='${contextPath}/resources/images/coPicture/"+ data.img +"'>");
                
             },
             erro : function(){ alert("error") }
          });
       };
       
 <!-- 리스트스크립 -->
 
 function shiftLeft() {
	 const boxes = document.querySelectorAll(".box");
	 const tmpNode = boxes[0];
	 boxes[0].className = "box move-out-from-left";
	 setTimeout(function() {
	     if (boxes.length > 5) {
	         tmpNode.classList.add("box--hide");
	         boxes[5].className = "box move-to-position5-from-left";
	     }
	     boxes[1].className = "box move-to-position1-from-left";
	     boxes[2].className = "box move-to-position2-from-left";
	     boxes[3].className = "box move-to-position3-from-left";
	     boxes[4].className = "box move-to-position4-from-left";
	     boxes[0].remove();
	     document.querySelector(".cards__container").appendChild(tmpNode);
	 }, 500);
	 }
	 function shiftRight() {
	 const boxes = document.querySelectorAll(".box");
	 boxes[4].className = "box move-out-from-right";
	 setTimeout(function() {
	     const noOfCards = boxes.length;
	     if (noOfCards > 4) {
	         boxes[4].className = "box box--hide";
	     }
	     const tmpNode = boxes[noOfCards - 1];
	     tmpNode.classList.remove("box--hide");
	     boxes[noOfCards - 1].remove();
	     let parentObj = document.querySelector(".cards__container");
	     parentObj.insertBefore(tmpNode, parentObj.firstChild);
	     tmpNode.className = "box move-to-position1-from-right";
	     boxes[0].className = "box move-to-position2-from-right";
	     boxes[1].className = "box move-to-position3-from-right";
	     boxes[2].className = "box move-to-position4-from-right";
	     boxes[3].className = "box move-to-position5-from-right";
	 }, 500);
	 }
	 
	 
</script>

<script type="text/javascript">
   $(function(){
      $("#place").val("${param.region}").attr("selected","selected");
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
	<p class="title">코치매칭</p>
		
	<!-- 위치 필터링 -->
	<div class="coach-place">
		<p>어디에서 수업할까요?</p>
		<i class="fa-solid fa-location-dot fa-xl"></i>
		<form action="${contextPath}/regionSerch.do" method="post">
			<select name="region" id="place" onchange="this.form.submit()" placeholder="선택">
				<option value="" disabled selected>선택</option>
				<option value="전체">전체</option>
				<option value="노원">노원</option>
				<option value="강남">강남</option>
				<option value="송파">송파</option>
				<option value="용산">용산</option>
		   </select>
		</form>
	</div>
	
	<!-- 카드 리스트 -->
	<div id="container">
	<div id="banner_container" style="widht:300px; height:500px; margin-top:-300px;">
	<div class="button" onclick="shiftRight()" id="left-button"></div>
		<div class="card-carousel" id="banner_wrapper" style="width:900px;/*position:absolute;*/">
			<% ArrayList<Coach> list = (ArrayList<Coach>)request.getAttribute("list");%>
			<!-- 반복문을 통해서 코치 출력하기 -->
			<ul class="cards__container">
				<c:forEach var="vo" items="${ list }" varStatus="i">
					<li class="box">
					<div class="card" onclick="goModal(${vo.coachIdx})">
						<div class="coach-container">
						<span class="coach-name">${ vo.name }</span>
						<!-- ${ vo.region } -->
						
						</div>
						<!-- ${ vo.beginDate }<br> -->
						<div class="coach-img"><img id="coachPicture" alt="" src="${contextPath}/resources/images/coPicture/${ vo.img }"></div>
						<div class="coach-container" id="content">
						<span class="coach-title">경력</span><br><span class="coach-career">${ vo.career }</span>
						</div>
					</div>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="button" onclick="shiftLeft()" id="right-button"></div>
	</div>
	
	</div>
	
	<!-- 우측 여백 -->
	<div class="item"></div>
	
</div>
	
<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-center">
    
      <!-- Modal content-->
      <div class="coach-modal-content">
        <div style="height:30px; padding:15px;">
          <button type="button" class="close" data-dismiss="modal" style="color:#34347D;">&times;</button>
        </div>
        
        <div class="coach0">
	        <div class="#">
		        <div class="modalImg-size"><p id="modalImg"></p>
	        	</div>
	        </div>
	        <div class="coach-modal-body">
	        	<div id="modalNmae"></div>
	        </div>
	        <div class="coach-modal-body">
	        	 <div id="modalCareer"></div>
	        	 <div>
          			 <button onclick="requestPay()" type="button" style="width : 200px; height : 60px;">코칭신청하기</button>
       			 </div>
	        </div>
        </div>
    
      </div>
      
    </div>
</div> 
   
</body>
</html>