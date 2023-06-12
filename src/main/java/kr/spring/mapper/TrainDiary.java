package kr.spring.mapper;

import java.util.List;

import kr.spring.entity.Diary;
import kr.spring.entity.Log;
import kr.spring.entity.Posture;

public interface TrainDiary {

	void InsertDiary(Diary diary);

	List<Log> getLog(Log log);

	List<Diary> getDiary(String memID);

	void deleteDiary(Diary diary);
	
	List<Posture> getTrain(String memID);

}
