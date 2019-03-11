package kr.co.project.join;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.project.service.ProjectService;
import kr.co.project.userVO.UserVO;
import kr.co.project.util.ProjectBaseUI;

public class GetLoginInfo extends ProjectBaseUI {

	@Override
	public void execute() throws Exception {
	
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		String id=getStr("아이디를 입력하세요:");
		String name=getStr("이름을 입력하세요:");
		String pw=getStr("패스워드를 입력하세요:");
		int age=getInt("나이를 입력하세요:");
		String joinDate=sdf.format(new Date());
		
		UserVO user=new UserVO(id, name, pw, age, joinDate);
		ProjectService service=new ProjectService();
		service.OrganizingObj(user);
	}

}
