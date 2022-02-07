package project.spring.TW.service;

import org.springframework.stereotype.Service;

import project.spring.TW.domain.UserVO;


public interface LoginService {
	
	
	public boolean newAccount(UserVO vo);

	public boolean checkId(String userId);
}
