package project.spring.TW.mapper;

import org.apache.ibatis.annotations.Mapper;

import project.spring.TW.domain.AuthVO;
import project.spring.TW.domain.UserVO;


@Mapper
public interface UserMapper {
	
	public UserVO read(String userId);

	public int newAccount(UserVO vo);

	public void newAuth(AuthVO avo);

	public int checkId(String userId);
}
