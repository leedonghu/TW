package project.spring.TW.controller;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import project.spring.TW.domain.UserVO;
import project.spring.TW.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Setter(onMethod_ = @Autowired)
	private LoginService service;
	
	@RequestMapping("/")
	public String firstPage() {
		return "login";
	}
	
	
	@GetMapping("/account")
	public String account() {
		return "account";
	}
	
	@PostMapping("/account")
	public String account(UserVO vo) {
		
		boolean ok = service.newAccount(vo);
		
		return ok == true ? "redirect:/login/": "redirect:/login/account";
	}
	
	@ResponseBody
	@PostMapping("checkId")
	public String checkId(String userId) {
		boolean ok = service.checkId(userId);
		
		if(ok) {
			return "ok";
		}else {
			return "not ok";
		}
	}
	
	@ResponseBody
	@PostMapping("checkPw")
	public String checkPw(String userPw) {
		String passwordForm = "^[a-zA-Z0-9]{8,14}$";
		if(userPw.matches(passwordForm)) {
			return "ok";
		}else {
			return "not ok";
		}
	}
}
