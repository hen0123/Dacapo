package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Pay {

	private int idx;
	private int amount;
	private String memID;
	private String merchantName;
	private String payDate;
}
