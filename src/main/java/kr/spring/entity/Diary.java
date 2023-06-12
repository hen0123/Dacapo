package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Diary {
	
	private int DiaryIdx;
	private String DiaryTitle;
	private String DiaryStart;
	private String DiaryEnd;
	private String DiaryContent;
	private String DiaryColor;
	private String memID;
}
