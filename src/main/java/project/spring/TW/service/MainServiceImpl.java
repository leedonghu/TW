package project.spring.TW.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Service;

import project.spring.TW.domain.DateVO;

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

}
