package project.spring.TW.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Service;

import project.spring.TW.domain.DateVO;
import project.spring.TW.domain.TicketingVO;

@Service
public class MainServiceImpl implements MainService {

	@Override
	public DateVO[] calcDate() {
		int[] nonLeapYear = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31};
		int[] leapYear = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31};

		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		
		int year = Integer.parseInt(formatedNow.substring(0,4));
		int month = Integer.parseInt(formatedNow.substring(4,6));
		int day = Integer.parseInt(formatedNow.substring(6));
		


		
		
		boolean leapYearCheck;
		if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
			leapYearCheck = true;
		}else {
			leapYearCheck = false;
		}
		
		DateVO[] dateArr = new DateVO[7];
		
		for(int i=0; i<7; i++) {
			DateVO date = new DateVO();
			
			if(leapYearCheck) {
				if(day > leapYear[month-1]) {
					date.setMonth(month+1);
					date.setDay(1);
					month = month+1;
					day = 2;
				}else {
					date.setMonth(month);
					date.setDay(day);
					day++;
				}
				
				
			}else {
				if(day > nonLeapYear[month-1]) {
					date.setMonth(month+1);
					date.setDay(1);
					month = month+1;
					day = 2;
				}else {
					date.setMonth(month);
					date.setDay(day);
					day++;
				}
				
				
			}
			dateArr[i] = date;
		}
		
		
		return dateArr;
	}

	@Override
	public TicketingVO[] ticketingInfo(DateVO vo) {
		TicketingVO[] tvoArr = new TicketingVO[3];
		
		TicketingVO tvo1 = new TicketingVO();
		String[] hallNumber = {"2관", "3관"};
		String[][] movieTime = {{"11:40", "14:10", "16:40", "19:10"},{"12:55","15:25","17:55", "20:25"}};
		int[] hallSize = {138, 158};
		tvo1.setDay(vo.getDay());
		tvo1.setMonth(vo.getMonth());
		tvo1.setMovieTime(movieTime);
		tvo1.setHallNumber(hallNumber);
		tvo1.setMovieName("가나다라");
		tvo1.setHallSize(hallSize);
		
		tvoArr[0] = tvo1;
		
		TicketingVO tvo2 = new TicketingVO();
		String[] hallNumber2 = {"3관"};
		String[][] movieTime2 = {{"11:40", "14:10", "16:45", "19:15"}};
		int[] hallSize2 = {120};
		tvo2.setDay(vo.getDay());
		tvo2.setMonth(vo.getMonth());
		tvo2.setMovieTime(movieTime2);
		tvo2.setHallNumber(hallNumber2);
		tvo2.setMovieName("355");
		tvo2.setHallSize(hallSize2);
		
		tvoArr[1] = tvo2;
		
		TicketingVO tvo3 = new TicketingVO();
		String[] hallNumber3 = {"1관", "5관", "7관"};
		String[][] movieTime3 = {{"11:20", "15:10", "17:40", "19:00"},{"12:00","15:30","17:55", "20:25"}, {"12:46","15:30","17:00",}};
		int[] hallSize3 = {156, 183, 126};
		tvo3.setDay(vo.getDay());
		tvo3.setMonth(vo.getMonth());
		tvo3.setMovieTime(movieTime3);
		tvo3.setHallNumber(hallNumber3);
		tvo3.setMovieName("해적");
		tvo3.setHallSize(hallSize3);
		
		tvoArr[2] = tvo3;
		
		return tvoArr;
		
	}

}