package kr.co.PetSitter.dao;

import kr.co.PetSitter.vo.UserVO;

public interface LoginDAO {

	public int joinUser(UserVO user);
	public UserVO loginUser(UserVO user);
	public int updateUser(UserVO user);
	public int idCheck(String id);
}
