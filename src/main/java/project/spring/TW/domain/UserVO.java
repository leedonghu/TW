package project.spring.TW.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	
	private List<AuthVO> authList;
}
