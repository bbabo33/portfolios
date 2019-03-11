package kr.co.project.main;

import kr.co.project.admin.AdminMode;
import kr.co.project.join.GetLoginInfo;
import kr.co.project.login.Login;
import kr.co.project.util.ProjectUI;

public class ProjectMain{
	
	ProjectMain(){}
	
	public static void main(String[] args) {	
		
		ProjectMenu pm = new ProjectMenu();
		ProjectUI ui=null;
	
			while(true) {
				try {
					int selectNum = pm.menu();
					switch(selectNum) {
					
					case 1:
						ui=new GetLoginInfo();
						break;
						
					case 2:
						ui=new Login();
						break;
						
					case 3:
						ui=new AdminMode();
						break;
						
					case 4:
						System.out.println("프로그램을 종료합니다.");
						System.exit(0);
						break;
						
					default:
						System.out.println("다시 입력 해주세요.");
						break;
					}
					ui.execute();
				}catch(Exception e) {
					System.out.println("숫자가 아닌 문자를 입력하셨습니다.");
				}
			}
			
	}
}
