package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Posture {
	private int pIdx;
	private String memID; 
	private String video;
	private String TakeBack;
	private String Swing;
	private String Impact;
	private String FollowThrough;
	private String score;
	private String comment_1;
	private String comment_2;
	private String comment_3;
	private String comment_4;
	private String train_date;
}
