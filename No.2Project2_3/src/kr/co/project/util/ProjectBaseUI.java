package kr.co.project.util;

import java.util.Scanner;

public abstract class ProjectBaseUI implements ProjectUI {

	Scanner sc;
	
	public ProjectBaseUI(){
		sc=new Scanner(System.in);
	}
	
	public int getInt(String msg) throws NumberFormatException{
		System.out.print(msg);
		
		return Integer.parseInt(sc.nextLine());
	}
	
	public String getStr(String msg) {
		System.out.print(msg);
		return sc.nextLine();
	}

}
