package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.Diary;
import kr.spring.entity.Log;
import kr.spring.entity.Posture;
import kr.spring.mapper.TrainDiary;

@Controller
public class TrainLogController {
	
	@Autowired
	TrainDiary trainDiary;
	
	
	// 달력에 값 뿌려주기4
	   @RequestMapping("/trainLog/{memID}")
	   public String main(@PathVariable("memID") String memID, Model model) {
	      
	      // 달력에 값 뿌려주기4
	      System.out.println("훈련일지 페이지로 이동하는거 작동됨.");
	      List<Diary> list = trainDiary.getDiary(memID);
	      model.addAttribute("list", list);
	      
	      List<Posture> Plist = trainDiary.getTrain(memID);
	      model.addAttribute("Plist", Plist);

	      return "trainLog/trainLog";
	   }
	 
		// 달력에 데이터 저장
		@RequestMapping("/trainDiary")
		public void trainDiary(Diary diary) {
		   System.out.println("데이터가 들어갔다.");
		   trainDiary.InsertDiary(diary);
		}
		
		// 훈련로그 데이터 날짜에 맞춰 뿌려주기
		@RequestMapping("/oneTrainLog")
		@ResponseBody
		public List<Log> coachSerch(Log log, Model model) {
		   System.out.println("훈련로그 데이터 날짜에 맞춰 뿌려주기");
		   System.out.println(log);
		   List<Log> list = trainDiary.getLog(log);
		   System.out.println(list);
		      
		   return list;
		}
		

		// 달력에 데이터 삭제
		@ResponseBody
	    @RequestMapping("/deleteDiary")

	      public void deleteDiary(Diary diary) {
	         
	         System.out.println("다이어리 삭제 매핑 잘됨.");
	         trainDiary.deleteDiary(diary);
	         System.out.println(diary.getDiaryTitle());
	         System.out.println(diary.getDiaryContent());
	         System.out.println(diary.getDiaryStart());
	         System.out.println(diary.getDiaryEnd());
	         System.out.println(diary.getMemID()); 
	         
	         
	         }
}
