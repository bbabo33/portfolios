package kr.co.project.admin;

import kr.co.project.dao.ProjectDAO;
import kr.co.project.userVO.UserVO;
import kr.co.project.util.ProjectBaseUI;

public class AdminMode extends ProjectBaseUI {

	@Override
	public void execute() throws Exception {
		// TODO Auto-generated method stub

		String id=getStr("관리자아이디를 입력하세요:");
		String pw=getStr("관리자 비밀번호를 입력하세요:");
		
		UserVO admin=new UserVO();
		admin.setId(id);
		admin.setPw(pw);
		ProjectDAO dao=new ProjectDAO(admin);
		
		if(dao.checkAdmin()) {
		
			dao.searchAll();
		}
	}

}
