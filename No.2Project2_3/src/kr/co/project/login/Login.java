package kr.co.project.login;

import java.net.Socket;

import kr.co.project.service.ProjectService;
import kr.co.project.userVO.UserVO;
import kr.co.project.util.ProjectBaseUI;

public class Login extends ProjectBaseUI {
	
	private Socket socket;
	
	public Login(){}
	
	@Override
	public void execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("-----------------------------------");
		System.out.println("\t로그인 페이지입니다.");
		System.out.println("-----------------------------------");
		String id=getStr("로그인 ID:");
		String pw=getStr("패스워드 :");
		
		UserVO user=new UserVO();
		user.setId(id);
		user.setPw(pw);
		
		ProjectService service=new ProjectService();
		service.checkLogin(user);
		
	}

}
