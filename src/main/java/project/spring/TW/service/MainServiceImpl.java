package project.spring.TW.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import project.spring.TW.domain.DateVO;
import project.spring.TW.domain.TicketingVO;
import project.spring.TW.mapper.MovieMapper;

@Log4j
@Service
public class MainServiceImpl implements MainService {
	
	@Setter(onMethod_ = @Autowired)
	MovieMapper mapper;
	
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
		tvo1.setMovieStartTimes(movieTime);
		tvo1.setHallNumbers(hallNumber);
		tvo1.setMovieName("가나다라");
		tvo1.setHallSizes(hallSize);
		
		tvoArr[0] = tvo1;
		
		TicketingVO tvo2 = new TicketingVO();
		String[] hallNumber2 = {"3관"};
		String[][] movieTime2 = {{"11:40", "14:10", "16:45", "19:15"}};
		int[] hallSize2 = {120};
		tvo2.setDay(vo.getDay());
		tvo2.setMonth(vo.getMonth());
		tvo2.setMovieStartTimes(movieTime2);
		tvo2.setHallNumbers(hallNumber2);
		tvo2.setMovieName("355");
		tvo2.setHallSizes(hallSize2);
		
		tvoArr[1] = tvo2;
		
		TicketingVO tvo3 = new TicketingVO();
		String[] hallNumber3 = {"1관", "5관", "7관"};
		String[][] movieTime3 = {{"11:20", "15:10", "17:40", "19:00"},{"12:00","15:30","17:55", "20:25"}, {"12:46","15:30","17:00",}};
		int[] hallSize3 = {156, 183, 126};
		tvo3.setDay(vo.getDay());
		tvo3.setMonth(vo.getMonth());
		tvo3.setMovieStartTimes(movieTime3);
		tvo3.setHallNumbers(hallNumber3);
		tvo3.setMovieName("해적");
		tvo3.setHallSizes(hallSize3);
		
		tvoArr[2] = tvo3;
		
		return tvoArr;
		
	}

	@Override
	public TicketingVO[] movieTime(int month, int day, boolean today) {
		
		int movieAmount= mapper.movieAmount();
		String[] movieNames = mapper.movieNames();
		TicketingVO[] tvoArr = new TicketingVO[movieAmount];
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
		
		Date now = new Date();
		String nowTime = sdf1.format(now);
		
		for(int i=0; i<movieNames.length; i++) {
			TicketingVO tvo = new TicketingVO();
			
			tvo.setMovieName(movieNames[i]);
			
		
			String[] hallNumber = mapper.hallNumber(movieNames[i]);
			tvo.setHallNumbers(hallNumber);
			
			String[][] movieStartTime = new String[hallNumber.length][];
			String[][] movieEndTime = new String[hallNumber.length][];
			for(int j=0; j<hallNumber.length; j++) {
				String[] movieStartTimes = mapper.movieStartTimes(movieNames[i], hallNumber[j], nowTime, today);
				movieStartTime[j] = movieStartTimes;
				String[] movieEndTimes = mapper.movieEndTimes(movieNames[i], hallNumber[j], nowTime, today);
				movieEndTime[j] = movieEndTimes;
			}
			tvo.setMovieStartTimes(movieStartTime);
			tvo.setMovieEndTimes(movieEndTime);
			tvoArr[i] = tvo;
		}
		
//		for(int i=0; i<tvoArr.length; i++) {
//			for(int j=0; j<tvoArr[i].getHallNumber().length; j++) {
//				for(int k=0; k<tvoArr[i].getMovieEndTime()[j].length; k++) {
//					log.info(tvoArr[i].getMovieName() + " " + tvoArr[i].getHallNumber()[j] + " " + tvoArr[i].getMovieEndTime()[j][k]);
//				}
//			}
//		}
		
		

		
		return tvoArr;
		
		
	}

	@Override
	public boolean today(int month, int day) {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		
		
		int tMonth = Integer.parseInt(formatedNow.substring(4,6));
		int tDay = Integer.parseInt(formatedNow.substring(6));
		
		return month == tMonth && day == tDay ? true : false;
	}

	@Override
	public int[] ticketing(TicketingVO vo) {
		int hallSize = mapper.hallSize(vo.getHallNumber());
		
		String[] seatName = {"A", "B", "C", "D", "E"};
		
		int[] seatArr = new int[2];
		
		int lineSize = hallSize / 12;
		int lastSeat = hallSize % 12;
		
		seatArr[0] = lineSize;
		seatArr[1] = lastSeat;
		log.info(hallSize);
		
		return seatArr;
	}

	@Override
	public String[] seatName(int lineSize, int lastSeat) {
		String[] seatName = {"A", "B", "C", "D", "E"};
		
		int k;
		if(lastSeat == 0) {
			k = lineSize;
		}else {
			k = lineSize + 1;
		}
		
		String[] seatNameArr = new String[k];
		
		for(int i = 0; i<=k-1; i++ ) {
			seatNameArr[i] = seatName[i];
			log.info(seatNameArr[i]);
		}
		return seatNameArr;
	}

	

}
