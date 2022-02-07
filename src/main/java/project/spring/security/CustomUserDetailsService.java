package project.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import project.spring.TW.domain.UserVO;
import project.spring.TW.mapper.UserMapper;
import project.spring.security.domain.CustomUser;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("user");
		
		UserVO vo = mapper.read(username);
		
		if(vo == null) {
			throw new UsernameNotFoundException("사용자를 찾을 수 없습니다. username: " + username);
		}
		return new CustomUser(vo);
	}
}
