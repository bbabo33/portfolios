package kr.co.PetSitter.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.PetSitter.dao.LoginDAO;
import kr.co.PetSitter.service.LoginService;
import kr.co.PetSitter.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public int joinUser(UserVO user) {
		System.out.println("loginServiceImpl join:"+user);
		return loginDAO.joinUser(user);
	}

	@Override
	public UserVO loginUser(UserVO user) {
		System.out.println("loginServiceImpl login:"+user);
		return loginDAO.loginUser(user);
	}

	@Override
	public int updateUser(UserVO user) {
		System.out.println("loginServiceImpl update: "+user);
		return loginDAO.updateUser(user);
	}

	@Override
	public int idCheck(String id) {
		System.out.println("loginserviceImpl idCheck : "+id);
		return loginDAO.idCheck(id);
	}

	
}
