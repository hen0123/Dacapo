<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<link rel="stylesheet" href="resources/css/main.css">
	<script src="https://kit.fontawesome.com/e257908efc.js" crossorigin="anonymous"></script>
	
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
			dateClick: function(info) {
			    alert('훈련 기록이 없습니다.');
			    
			},

			selectable : true, 
			// droppable : true,
			editable : true, // 달력 일자 드래그해서 이동 가능
			
			// 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
			events:[ 
				
				// ajax로 데이터 불러옴(json형태)

				// test용(DB에 넣어도 됨)
				{
                    title:'레슨 8시',
                    start:'2023-06-14',
                    end:'2023-06-14',
                    color:'#AC7BD7'
                },
                
                {
                    title:'경기 10시',
                    start:'2023-06-24',
                    end:'2023-06-24',
                    color:'#FFCC99'
                },
                
                {
                    title:'레슨 8시',
                    start:'2023-06-07',
                    end:'2023-06-07',
                	color:'#AC7BD7'    
                }
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
            
            /* 이벤트 눌렀을 때 삭제 */
            eventClick: function(arg){
            	if(confirm("일정을 삭제하시겠습니까?")){
            		arg.event.remove()
            		
            	}
            },
            
            /* 마우스 오버 시 세부내용 팝업
            eventRender: function(info) {
                var tooltip = new Tooltip(info.el, {
                  title: info.event.extendedProps.description,
                  placement: 'top',
                  trigger: 'hover',
                  container: 'body'
                });
              }*/
	    });	
		
	    // 달력 불러오기
	    calendar.render();
	  });

	</script>
	

	<style>
	
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
	
</div>  
		
	<!-- 우측 여백 -->
	<div class="item"></div>
</div>
    
<!-- 푸터 -->	
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>