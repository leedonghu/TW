package project.spring.TW.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import project.spring.TW.domain.DateVO;
import project.spring.TW.domain.TicketingVO;
import project.spring.TW.service.MainService;

@Controller
@RequestMapping("/main")
@Log4j
public class MainController {
	
	@Setter(onMethod_ = @Autowired)
	MainService service;
	
	@RequestMapping("/home")
	public String home(Model model) {
		DateVO[] dateArr = service.calcDate();
		
		
		TicketingVO[] tvoArr =  service.ticketingInfo(dateArr[0]);

//		for(int i=0; i<dateArr.length; i++) {
//			System.out.println(dateArr[i].getMonth());
//			System.out.println(dateArr[i].getDay());
//		}
		model.addAttribute("dateArr", dateArr);
		model.addAttribute("tvoArr", tvoArr);
		
		return "home";
	}
	
	@PostMapping("/movieTime")
	@ResponseBody
	public String movieTime(@RequestBody DateVO vo) {
		int month = vo.getMonth();
		int day = vo.getDay();
		log.info(month);
		log.info(day);
		
		service.movieTime(month, day);
		return "SUCCESS";
	}
}
