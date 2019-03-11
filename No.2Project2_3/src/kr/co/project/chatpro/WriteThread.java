package kr.co.project.chatpro;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.sql.ResultSet;

public class WriteThread {
	
	Socket socket;
	ClientFrame cf;
	String msg;
	String name;
	
	public WriteThread(ClientFrame cf,String name) {
		
		this.cf=cf;
		this.socket=cf.socket;
		this.name=name;
		
	}
	
	//클라이언트가 서버로 문자열 보냄
	
	public void sendMsg(String msg) {
		
		BufferedReader br= new BufferedReader(new InputStreamReader(System.in));
		PrintWriter pw=null;
		String outMsg=null;
		
		try {
			pw=new PrintWriter(socket.getOutputStream());
			
			//System.out.println("clientToServer"+msg);
			
			if(msg.equals("+++++")) {
					outMsg=name+",+++++";
					pw.println(outMsg);
					
				}else {
					this.msg="["+name+"]"+msg;
					pw.println(this.msg);
				}	
				pw.flush();
				
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
