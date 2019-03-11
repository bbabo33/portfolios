package kr.co.project.chatpro;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.SocketException;
import java.util.List;
import java.util.Random;

public class ServerThread extends Thread {

	Socket socket;
	List<Socket> list;
	
	public ServerThread(Socket socket, List<Socket> list) {
		this.socket=socket;
		this.list=list;
	}
	
	public void run() {
		BufferedReader br=null;
		
		try {
			br=new BufferedReader(new InputStreamReader(socket.getInputStream()));
			String str=null;
			String[] strNames=null;
			String strName=null;
			
			while(true) {
				//클라이언트로부터 문자열 받기
					try {
						str=br.readLine();
						if(str.indexOf("+++++") > -1) {
							strNames=str.split(",");
							strName=strNames[0];
							list.remove(socket);
							
							sendMsg("*************************************\n"+strName+"님이 채팅방을 나갔습니다\n*************************************");
						}else if(str.contains("/주사위")) {
				               // System.out.println("홀짝요구");
				               Random random = new Random();
				               int dice = random.nextInt(100)+1;
				               sendMsg(str.replace("/주사위","")+"님이 주사위를 굴려"+dice+"이 나왔습니다");   
						}else if(str.contains("/홀짝")) {
							// System.out.println("홀짝요구");
							messagetome("ozkf", this.socket);
						}
						else {
							//채팅창에 문자열 뿌리기
							sendMsg(str);
						}
					}catch(SocketException e) {
						//System.out.println("readthread line:44");
						break;
					}
					
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(br != null) br.close();
				if(socket != null) {
					socket.close();
				}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	void sendMsg(String str) {
		try {
			for(Socket s : list) {
					PrintWriter pw=new PrintWriter(new OutputStreamWriter(s.getOutputStream()));
					pw.println(str);
					pw.flush();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void sendBroad(String str) {
		try {
			for(Socket s : list) {
				if (s != this.socket) {
					PrintWriter pw=new PrintWriter(new OutputStreamWriter(s.getOutputStream()));
					pw.println(str);
					pw.flush();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void messagetome(String str, Socket socke) {
		try {
			PrintWriter pw = new PrintWriter(socke.getOutputStream());
			pw.println(str);
			pw.flush();
		} catch (IOException ie) {
			System.out.println(ie.getMessage());
		}
	}
}
