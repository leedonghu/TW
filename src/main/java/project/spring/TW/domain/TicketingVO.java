package project.spring.TW.domain;

import lombok.Data;

@Data
public class TicketingVO {
	
	private int month;
	private int day;
	private String movieName;
	private String[] hallNumber;
	private String[][] movieTime;
	private int[] hallSize;
}
