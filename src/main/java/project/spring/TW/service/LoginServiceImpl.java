package project.spring.TW.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import project.spring.TW.domain.AuthVO;
import project.spring.TW.domain.UserVO;
import project.spring.TW.mapper.UserMapper;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Override
	@Transactional
	public boolean newAccount(UserVO vo) {
		
		vo.setUserPw(encoder.encode(vo.getUserPw()));
		int cnt = mapper.newAccount(vo);
		
		AuthVO avo = new AuthVO();
		avo.setUserId(vo.getUserId());
		avo.setAuth("ROLE_USER");
		
		mapper.newAuth(avo);
		
		return cnt == 1;
	}

	@Override
	public boolean checkId(String userId) {
		int cnt = mapper.checkId(userId);
		return cnt == 1 ? false : true;
	}
}
