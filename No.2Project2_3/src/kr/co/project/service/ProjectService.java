package kr.co.project.service;

import java.net.Socket;

import kr.co.project.dao.ProjectDAO;
import kr.co.project.userVO.UserVO;

public class ProjectService {

	public void OrganizingObj(UserVO vo) {
		
		if(vo.getName().equals(null)) {
			vo.setName("이름 없음");
		}
		
		if(vo.getId().equals(null)) {
			vo.setId("아이디 없음");
		}
		
		new ProjectDAO(vo).insertVO();
	}
	
	public void checkLogin(UserVO vo) {
		new ProjectDAO(vo).checkLogin();
	}
	
}
