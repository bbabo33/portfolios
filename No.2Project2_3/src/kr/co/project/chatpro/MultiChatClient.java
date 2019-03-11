package kr.co.project.chatpro;

import java.net.Socket;
import java.sql.ResultSet;

public class MultiChatClient {

	Socket socket=null;
	ClientFrame cf= null;
	String name;
	
	public MultiChatClient(String name) {
		this.name=name;
	}
	
	public void chatClient() {
		
		try {
			socket=new Socket("192.168.0.5",10001);
			
			System.out.println("채팅방에 입장합니다.");
			cf=new ClientFrame(socket, name);
			new ReadThread(socket, cf).start();
			
		}catch(Exception e) {
			System.out.println("채팅방 입장에 실패했습니다");
		}
	}
	
	
}
