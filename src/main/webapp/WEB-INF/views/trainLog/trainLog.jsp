<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    <!-- src/main/webapp/WEB-INF/views -->    
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="kr.spring.entity.Diary" %>
<!DOCTYPE html>
<html>
<head>

	<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- bootstrap -->
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<!-- cdn -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/locales-all.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
	<!-- 언어 설정 관련 -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/locales-all.min.js'></script>
	
	<!-- 툴팁 옵션 -->
	<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
	<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
	
	<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet' />
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>

	<!-- CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/nav.css">
	<script src="https://kit.fontawesome.com/e257908efc.js" crossorigin="anonymous"></script>
	
	<!-- fullcalendar 불러오기 -->
<!-- fullcalendar 불러오기 -->
   <script type="text/javascript">
      
        document.addEventListener('DOMContentLoaded', function() {
       var calendarEl = document.getElementById('calendar');
       var calendar = new FullCalendar.Calendar(calendarEl, {
          plugsin: ['dayGrid', 'interaction','bootstrap'],
          themeSystem: 'bootstrap',
          displayEventTime:false,
          eventDisplay:'block',
          
          // 한국 시간으로 설정(default)
          timezone: 'local',
            initialView: 'dayGridMonth',
            headerToolbar: {
               left: 'prev,next today',
               center: 'title',
               right: 'addEventButton'
           },
           
           titleFormat : function(date) {
            return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
         },
         
         // 날짜 클릭 시 이벤트 발생(테스트용으로 날짜 나오게 함) -> 훈련 로그 있으면 그 페이지로 이동하도록! 
         // 페이지 이동 바로 어려우면 modal 창 만들어서 if문으로 없으면 없다 있으면 페이지 이동 
         

         selectable : true, 
         // droppable : true,
         editable : true, // 달력 일자 드래그해서 이동 가능
         
         // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
         events:[ 
            
            <% ArrayList<Diary> list = (ArrayList<Diary>) request.getAttribute("list");%>
               <% if (!list.isEmpty()) { %>
                  <% for (Diary vo : list) { %>
                  
                  {      
                          title:'<%= vo.getDiaryTitle() %>',                  
                          description: '<%= vo.getDiaryContent() %>',
                          start:'<%= vo.getDiaryStart() %>',
                          
                          <% 
                             LocalDate localDate = LocalDate.parse(vo.getDiaryEnd()); 
                             LocalDate oneDayPlusLocalDate = localDate.plusDays(1);
                             String realEndDate = oneDayPlusLocalDate.toString();
                          %>
                          
                          end:'<%= realEndDate %>',
                          color:'<%= vo.getDiaryColor() %>'
                      },
                  <% } %>
               <% } %>
            ],

            // 일정 추가
         customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "일정추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                       
                       // modal 빈 값으로 초기화... 
                       var title = $("#calendar_title").val('');
                       var content = $("#calendar_content").val('');
                        var start_date = $("#calendar_start_date").val('');
                        var end_date = $("#calendar_end_date").val('');
                        var color = $("input:radio[name=calendar_color]:checked").val('');

                       $("#calendarModal").modal("show"); // modal 나타내기                       
                   
                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시   
                           var title = $("#calendar_title").val();
                            var content = $("#calendar_content").val();
                            var start = $("#calendar_start_date").val();
                            var end = $("#calendar_end_date").val(); // 시간 개념 때문에 +1 해줘야 내가 선택한 날이랑 맞게 표시됨!
                            var color = $("input:radio[name=calendar_color]:checked").val();
                            
                            var start_date = new Date(start);
                            var end_date = new Date(end);
                            
                            //내용 입력 여부 확인
                            
                            if(title == null || title == ""){
                                alert("내용을 입력하세요.");
                            }else if(content == null || content == ""){
                                alert("세부 내용을 입력하세요.");
                            }else if(start_date == "" || end_date ==""){
                                alert("날짜를 입력하세요.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
                            }else{ // 정상적인 입력 시
                                var obj = {
                                    "title" : title,
                                    "description" : content,
                                    "start" : start_date,
                                    "end" : end_date,   
                                    "color" : color,
                                }//전송할 객체 생성
                               

                               console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                            
                            
                               // 일정 등록
                               calendar.addEvent(obj);
                               
                               // 일정 등록 후 모달 창 닫기
                               $('#calendarModal').modal('hide');
                               
    
                               // 다음 일정 등록 전 데이터 비우기
                               // 없으면 연속 등록한 횟수만큼 일정이 등록됨
                               calendar.init();
 
                            }
                        });
                    }
                }
            },
            
            // 이벤트 눌렀을 때 삭제
            // ajax로 컨트롤러 매핑 -> memID값, 일정의 고유값을 넘겨주고
            // controller 로직에서 데이터베이스에서 해당 일정을 지워준다.
            eventClick: function(arg){
               // 자바스크립트 달력의 arg파라미터에 접근하여 날짜 뽑아오기  
               var startYear = arg.event._instance.range.start.getFullYear();
               var startMonth = arg.event._instance.range.start.getMonth()+1;
               var startDate = arg.event._instance.range.start.getDate();
               
               var strStartYear = startYear.toString();
               var strstartMonth = startMonth.toString();
               var strstartDate = startDate.toString();
               
               if(strstartMonth .length<2) {
                  var startMonth = '0'+strstartMonth;
               }
               
               if(strstartDate.length<2) {
                  var startDate = '0'+strstartDate;
               }
               
               
               var endYear = arg.event._instance.range.end.getFullYear();
               var endMonth = arg.event._instance.range.end.getMonth()+1;
               var endDate =arg.event._instance.range.end.getDate()-1;
               
               var strEndYear = endYear.toString();
               var strEndMonth = endMonth.toString();
               var strEndDate = endDate.toString();
               
               if (strEndMonth.length<2) {
                  var endMonth = '0'+strEndMonth;
                  
               }
               console.log(endMonth);
               if (strEndDate.length<2) {
                  var endDate = '0'+strEndDate;   
               }
               
               let DiaryStart = strStartYear+"-"+startMonth+"-"+startDate;
               let DiaryEnd = strEndYear+"-"+endMonth+"-"+endDate;
               let DiaryTitle = arg.event._def.title; 
               let DiaryContent = arg.event._def.extendedProps.description;
               
               console.log(DiaryStart);
               console.log(DiaryEnd);
               console.log(DiaryTitle);
               console.log(DiaryContent);
               
               // ajax로 데이터베이스 접근 후 해당 일지 삭제
               if(confirm("일정을 삭제하시겠습니까?")){
                  
                  
               arg.event.remove();
                  
               let mdata = {"DiaryStart" : DiaryStart, "DiaryEnd" : DiaryEnd, 
                     "DiaryTitle" : DiaryTitle, "DiaryContent" : DiaryContent, "memID" : "${mvo.memID}"};
               
               
               $.ajax({
                    url : "${contextPath}/deleteDiary",
                    data : mdata,
                    method : "post",
                    success : function(data){
                  alert("success");
               },
                    error : function(){ alert("error") }
              });
               
               
               
               
                  
                  
               
                  
                  
                  
                  
               }
            },
            
            
            
            eventAdd: function () {
            console.log("이벤트에드 작동");
            let title = $('#calendar_title').val();
                let description = $('#calendar_content').val();
                let start = $('#calendar_start_date').val();
                let end = $('#calendar_end_date').val();
                let color = $('input[name="calendar_color"]:checked').val();
                
                console.log(title);
                console.log(description);
                console.log(start);
                console.log(end);
                console.log(color);
                console.log("${mvo.memID}");
                
                let fData = {"DiaryTitle":title, "DiaryContent":description, "DiaryStart":start,
                      "DiaryEnd":end, "DiaryColor":color, "memID":"${mvo.memID}"};
                
                   
                      
                $.ajax({
                      url : "${contextPath}/trainDiary",
                      data : fData,
                      method : "post",
                      erro : function(){ alert("error") }
                });
         },
         
         
         dateClick: function(info) {
               
            console.log("아이고");
               console.log(info.dateStr);
               
               dData = {"logDate" : info.dateStr, "memID" : "${mvo.memID}"};
               
               $.ajax({
                       url : "${contextPath}/oneTrainLog",
                       data : dData,
                       dataType : "json",
                       method : "get",
                       success : getLog,
                       error : function(){ alert("error") }
               });
                       
               function getLog(data) {
                  
                  $("#calendar").hide();
                  
                  $.each(data, function(index, obj){
                         console.log(obj.logMemo);
                         $("#logData").append(obj.logMemo);
                      });
                  
                      let listHtml = "<span style='border:1px solid black;'>전체 스윙통계 넣어줘야함</span><br>";
                      listHtml += "<span style='border:1px solid black;'>오늘의 스윙횟수 넣어줘야함</span><br>";
                      listHtml += "<span style='border:1px solid black;'>오늘의 평균점수 넣어줘야함</span><br>";
                      listHtml += "<span style='border:1px solid black;'>오늘의 최고점수 넣어줘야함</span><br>";
                      listHtml += "<span style='border:1px solid black;'>오늘의 사진 넣어줘야함</span><br>";
                      
                      listHtml += "<button onclick='MemoWrite()'>작성하기</button>"
                      listHtml += "<span style='border:1px solid black;'>";
                      listHtml += "<input id='write' type='text' value='아아아' readonly>";
                      listHtml += "</span>";
                      
                      
                       
                     $("#logData").html(listHtml);
                     $("#logData").css("display","block");
                     
                      
                      
                      
                      
                      
               }
         },
            
            /* 마우스 오버 시 세부내용 팝업 */
            eventDidMount: function (info) {
               
            $(info.el).popover({
                //title: info.event.title,
                content: info.event.extendedProps.description, 
                html:true,
                placement: 'bottom',
                trigger: 'hover',
                container: 'body',
             });   
           },
           
       });
      
       // 달력 불러오기
       calendar.render();
     });
        
        
   </script>
	

	<style>
	
		@font-face {
		    font-family: 'LOTTERIADDAG';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIADDAG.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
			
		* {
			font-family: 'TheJamsil';
			font-weight: 300;
		}

		.add-button {
		position:absolute;
		top:35px;
		right:260px;
		background: #2C3E50;
		border:0;
		color: white;
		height: 35px;
		border-radius: 3px;
		width: 120px;
		}
		
		.title {
			 font-family: 'LOTTERIADDAG';
			 font-size : 45px;
			 color : #34347D;
		}
		
		
		/* body레이아웃 */
		.container {
			display : flex;
			align-items : stretch;
		}
		
		.item:nth-child(1){
			flex : 1 1 0;
		}
		
		.item:nth-child(2){
			flex : 8 1 0;
		}
		
		.item:nth-child(3){
			flex : 1 1 0;
		}
		
		.modal-content input {
			border : 0;
			box-shadow : none;
			font-size : 20px;
		}

		.modal-content input:focus { outline: none; }
		
		#calendar_title {
			font-size : 20px;
			font-weight : 400;
		}
		
		#calendar_title::placeholder {
			font-weight : 200;
		}
		
		#calendar_content {
			font-size : 20px;
			font-weight : 200;
		}
	
		/* 훈련일지-Modal(일정캘린더) */
	
		.calendar-date {
			margin : 0 auto;
		}
		
		.calendar-date input {
			text-align : center;
			width : 160px;
		}
		
		input[type='date'] {
			position :relative;
			padding : 0 0 0 16px;
			background : url("../images/icon-calendar.png") no-repeat right 10px;
			background-size : 25px 25px;
			background-position : 165px center;
			width : 200px;
			height : 48px;
			border : 1px solid #E1E1E1;
			border-radius : 12px;
			text-align : left;
			font-size : 16px;
			}
		input[type='date']::-webkit-clear-button,
		input[type='date']::-webkit-inner-spin-button { display : none; }
		
		input[type='date']::-webkit-calendar-picker-indicator {
			position : absolute;
			left : 0;
			top : 0;
			width : 100%;
			height : 100%;
			background : transparent;
			color : transparent;
			cursor :pointer;
		}
		
		input[type='date']::before {
		  content: attr(data-placeholder);
		  width: 100%;
		}
		
		input[type='date']:valid::before{
			display : none;
		}
		
		input[data-placeholder]::before {
			color : #999999;
			font-size : 14px;
		}
		
		.calendar-date i { padding-left : 20px; padding-right : 20px; }
		
		/* 훈련일지-Modal(일정메모Color) */
		
		.color-palette {
			margin : 0 auto;
			text-align : center;
		}
		
		#calendarform label {
			padding-left : 10px;
			padding-right: 10px;
		}
		
		[type="radio"] {
			vertical-align: middle;
			appearance: none;
			border: max(2px, 0.1em) solid red;
			border-radius: 50%;
			width: 1.25em;
			height: 1.25em;
		}
		
		[type="radio"]:hover {
		  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
		  cursor: pointer;
		}
		
		[type="radio"]:checked {
		  border: 0.2em solid #999999;
		}
		
		/* 훈련일지-Modal(일정추가버튼) */
		.calendar-btn {
			width : 120px;
			height : 30px;
			border : 0;
			border-radius : 5px;
			font-size : 16px;
			font-weight : 400;
			color : #fff;
		}
		
		#addCalendar {
			background:#34347D;
			margin-right:10px;
		}
		
		#addCalendar:hover {
			 background-color : #AA1D20;
			 transition: 0.7s;
		}
		
		#sprintSettingModalClose {
			background:#999999;
		}
		
		#sprintSettingModalClose:hover {
			 background-color : #AA1D20;
			 transition: 0.7s;
		}
		
		/* 훈련일기 */
		.logData-container {
			width : 100%;
			height : 700px; 
			border : 2px solid #757575;
			border-radius : 10px;
			background : #EDEDED;
			padding : 30px;
			margin-top : 30px;
		}
		
		.logData-Date {
			height : 50px;
			padding : 15px;
		}
		
		.logData-trainLog {
			height : 100px;
			padding : 15px;
		}
		
		.logData-trainLog .main-container {
			float : left;
			width : 50%;
			height : 70px;
			background : #34347D;
			border-radius : 5px;
			color : #fff;
			text-align : center;
			padding : 10px;
		}
		.logData-trainLog .mini-container {
			float : left;
			width : 14.7%;
			height : 70px;
			background : #fff;
			border-radius : 5px;
			text-align : center;
			margin-left : 15px;
			padding : 10px;
		}
		
		.logData-memo {
			margin-top : 40px;
			widht : 100%;
			height : 450px;
		}
		
		.logData-memo-sub {
			float : left;
			width : 50%;
			height : 430px;
			padding-left : 15px;
		}
		
		.logData-memo-title {
			font-size : 20px;
			font-weight : 400;
			color : #34347D;
		}
		
		.logData-memo-sub button {
			position : relative;
			left : 270px;
			background : transparent;
			border : none;
			color : #757575;
		}
		
		.logData-memo-sub textarea {
			width : 100%;
			height : 370px;
			border : none;
			border-radius : 10px;
			resize : none;
			margin-top : 10px;
		}
		
		.textarea {
			marign-top : 20px;
		}
		
		.logData-picture {
			widht : 100%;
			height: 200px;
			background : gray;
			margin-top : 10px;
		}
		
		.logData-coment {
			width : 100%;
			height : 160px;
			margin-top : 10px;
			background : #FFD2D4;
			border-radius : 10px;
			padding : 10px;
		}
		
		.back-button {
			clear : both;
			margin : 0 auto;
			width : 100%;
			height : 30px;
			margin-top : -30px;
			text-align : center;
		}
		
		.back-button a {
			color: #757575;
			text-decoration: none;
		}
		
		.back-button a:hover {
			color: #AA1D20;
			text-decoration: none;
		}
			
	</style>


<meta charset="UTF-8">

<title>라인드라이브</title>
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

	<!-- fullcalendar -->
	<div id='calendarBox'>	
		<div id='calendar'>
		</div>
	</div>
	
	<!-- modal 추가 -->
    <div class="modal" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true" style="padding-top:100px;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="text-align:right;">
						<span aria-hidden="true">&times;</span>
                    </button>
                    <div class="form-group">
                    	<form role="form" id="calendarform">
	                        <h2><input type="text" class="form-control" id="calendar_title" name="calendar_title" placeholder="일정"></h2>
	                        <hr />
	                        
	                        <div>
							<input type="text" class="form-control" id="calendar_content" name="calendar_content" placeholder="메모">
	                        <hr />
	                        </div>
	                        
	                       	<div class="calendar-date">
								<input type="date" id="calendar_start_date" data-placeholder="기간(시작)" required>
								<i class="fa-solid fa-arrow-right"></i>
								<input type="date" id="calendar_end_date" data-placeholder="기간(시작)" required>
							<hr />
							</div>
							
							<div class="color-palette">
		                        <label><input type="radio" id="calendar_color" name="calendar_color" value="#3788D8" style="background:#3788D8;" checked></label>
		                        <label><input type="radio" id="calendar_color" name="calendar_color" value="#99CCFF" style="background:#99CCFF;"></label>
		                        <label><input type="radio" id="calendar_color" name="calendar_color" value="#AC7BD7" style="background:#AC7BD7;"></label>
		                        <label><input type="radio" id="calendar_color" name="calendar_color" value="#FFCCFF" style="background:#FFCCFF;"></label>
		                        <label><input type="radio" id="calendar_color" name="calendar_color" value="#FFCC99" style="background:#FFCC99;"></label>
	                        </div>
	                        
                    	</form>    
                    </div>
                </div>
                <div style="margin:0 auto; padding-bottom:30px;">
                    <button  type="button" class="calendar-btn" id="addCalendar">추가</button>
                    <button type="button" class="calendar-btn" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    	
            </div>
        </div>
    </div>
	
	 <!-- 훈련로그 창 -->
	<div id="logData" style="display: none;"></div>
	
</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>
    
<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>