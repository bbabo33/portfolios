package kr.co.PetSitter.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.PetSitter.dao.LoginDAO;
import kr.co.PetSitter.vo.UserVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public int joinUser(UserVO user) {
		System.out.println("loginDAOImpl join: "+user);
		return sql.insert("kr.co.petSitter.joinUser", user);
	}

	@Override
	public UserVO loginUser(UserVO user) {
		System.out.println("loginDAOImpl login: "+user);
		return sql.selectOne("kr.co.petSitter.loginUser", user);
	}

	@Override
	public int updateUser(UserVO user) {
		System.out.println("loginDAOImpl update: "+user);
		return sql.update("kr.co.petSitter.updateUser", user);
	}

	@Override
	public int idCheck(String id) {
		System.out.println("loginDAOImpl idCheck : "+id);
		return sql.selectOne("kr.co.petSitter.idCheck", id);
	}
	
}
