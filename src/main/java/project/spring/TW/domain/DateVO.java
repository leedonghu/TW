package project.spring.TW.domain;

import lombok.Data;

@Data
public class DateVO {
	private boolean leapYearCheck;
	private int month;
	private int day;
}
