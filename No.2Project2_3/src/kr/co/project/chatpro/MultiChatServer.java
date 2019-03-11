package kr.co.project.chatpro;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

public class MultiChatServer {

	public static void main(String[] args) {
		ServerSocket server=null;
		Socket socket = null;
		
		Vector<Socket> list= new Vector<>();
		
		try {
			server = new ServerSocket(10001);
			while(true) {	
				System.out.println("서버 대기중");
				socket=server.accept();
				System.out.println(socket.getInetAddress().getHostName()+"손님 입장");
				
				list.add(socket);
				new ServerThread(socket, list).start();
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	

}
