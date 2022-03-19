package project.spring.TW.domain;

import lombok.Data;

@Data
public class TicketingVO {
	
	private int month;
	private int day;
	private String movieName;
	private String[] hallNumbers;
	private String[][] movieStartTimes;
	private String[][] movieEndTimes;
	private int[] hallSizes;
	
	private String movieStartTime;
	private String hallNumber;
	private String movieEndTime;
	private int hallSize;
	private String seatNumber;
	private String userId;
	
}
