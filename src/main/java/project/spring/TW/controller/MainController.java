package project.spring.TW.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.resource.HttpResource;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import project.spring.TW.domain.DateVO;
import project.spring.TW.domain.TicketingVO;
import project.spring.TW.domain.UserVO;
import project.spring.TW.service.MainService;

@Controller
@RequestMapping("/main")
@Log4j
public class MainController {
	
	@Setter(onMethod_ = @Autowired)
	MainService service;
	
	@RequestMapping("/home")
	public String home(Model model, HttpServletResponse response) {
		DateVO[] dateArr = service.calcDate();
		response.setHeader("a", "a");
		
		TicketingVO[] tvoArr =  service.ticketingInfo(dateArr[0]);

//		for(int i=0; i<dateArr.length; i++) {
//			System.out.println(dateArr[i].getMonth());
//			System.out.println(dateArr[i].getDay());
//		}
		model.addAttribute("dateArr", dateArr);
		model.addAttribute("tvoArr", tvoArr);
		
		return "home";
	}
	
	@RequestMapping("/movieTime/{month}/{day}")
	@Transactional
	public String movieTime(@PathVariable("month") int month, @PathVariable("day") int day, Model model) {
		DateVO[] dateArr = service.calcDate();
		model.addAttribute("dateArr", dateArr);
		
		Date year = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		String todayYear = format1.format(year);
		
		model.addAttribute("year", todayYear);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		boolean today = service.today(month, day);
		log.info(month);
		log.info(day);
		
		TicketingVO[] tvoArr = service.movieTime(month, day, today);
		model.addAttribute("tvoArr", tvoArr);
		return "movieTime";
		
		
	}
	
	@GetMapping("/ticketing")
	public String ticketing(TicketingVO vo, Model model) {
		int[] seatArr =  service.ticketing(vo);
		
		
		String movieEndTime = service.movieEndTime(vo.getMovieName(), vo.getMovieStartTime(), vo.getHallNumber());
		vo.setMovieEndTime(movieEndTime);
		String[] seatName = service.seatName(seatArr[0], seatArr[1]);
		
		model.addAttribute("lineSize", seatArr[0]);
		model.addAttribute("lastSeat", seatArr[1]);
		
		model.addAttribute("seatName", seatName);
		
		model.addAttribute("tvo", vo);
		return "ticketing";
	}
	
	@GetMapping("/reservation")
	public String reservation(TicketingVO vo, UserVO uvo, Model model) {
		vo.setUserId(uvo.getUserId());
		
		service.reservation(vo);
		model.addAttribute("tvo", vo);
		
		return "reservation";
	}
}
