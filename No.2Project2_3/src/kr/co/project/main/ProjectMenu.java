package kr.co.project.main;

import kr.co.project.util.ProjectBaseUI;

public class ProjectMenu extends ProjectBaseUI{
	
	public int menu() {
		
		System.out.println("------------------------------------------------");
		System.out.println("\t환영합니다. 반갑습니다. 안녕하세요.");
		System.out.println("------------------------------------------------");
		System.out.println("\t1. 채팅방 회원가입");
		System.out.println("\t2. 채팅방 로그인");
		System.out.println("\t3. 관리자모드");
		System.out.println("\t4. 프로그램 종료");
		
		System.out.println("------------------------------------------------");
		int keyInt=getInt("\t원하는 메뉴를 선택하세요:");
		
		return keyInt;
	}

	@Override
	public void execute() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
