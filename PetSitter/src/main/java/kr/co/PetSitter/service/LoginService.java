package kr.co.PetSitter.service;

import kr.co.PetSitter.vo.UserVO;

public interface LoginService {

	public int joinUser(UserVO user);
	public UserVO loginUser(UserVO user);
	public int updateUser(UserVO user);
	public int idCheck(String id);
}
