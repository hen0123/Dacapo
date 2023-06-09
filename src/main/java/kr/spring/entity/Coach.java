package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Coach {
	private int coachIdx;
	private String region;
	private String name;
	private String career;
	private String img;
	private String beginDate;
}
