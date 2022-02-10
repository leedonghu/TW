package project.spring.TW.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import project.spring.TW.domain.DateVO;
import project.spring.TW.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Setter(onMethod_ = @Autowired)
	MainService service;
	
	@RequestMapping("/home")
	public String home(Model model) {
		DateVO[] dateArr = service.calcDate();

//		for(int i=0; i<dateArr.length; i++) {
//			System.out.println(dateArr[i].getMonth());
//			System.out.println(dateArr[i].getDay());
//		}
		model.addAttribute("dateArr", dateArr);
		
		return "home";
	}
}
