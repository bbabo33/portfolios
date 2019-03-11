package kr.co.project.chatpro;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.Socket;

public class ReadThread extends Thread {

	Socket socket;
	ClientFrame cf;
	
	public ReadThread(Socket socket, ClientFrame cf) {
		this.socket = socket;
		this.cf = cf; 
	}
	
	public void run() {
		BufferedReader br=null;
		String fromServerMsg=null;
		try {
			br= new BufferedReader(new InputStreamReader(socket.getInputStream()));
			
			while(true) {
				
				try {
					
					fromServerMsg=br.readLine();
					
					if(fromServerMsg.length()==0) {
						//System.out.println("접속 끊김");
					}else if (fromServerMsg.equals("ozkf")) {
						// System.out.println("서버로부터 홀짝 승인");
						cf.textA.append("\n===================\n");
						cf.textA.append("             홀짝게임\n");
						cf.textA.append("===================\n\n");
						cf.textA.append("홀 또는 짝을 입력해주세요 (/취소 입력시 취소)\n\n");
						cf.textA.setCaretPosition(cf.textA.getDocument().getLength()); //스크롤 맨 아래
						cf.hjgame = true;
					}else {
					cf.textA.append(fromServerMsg+"\n");
					cf.textA.setCaretPosition(cf.textA.getDocument().getLength()); //스크롤 맨 아래
					}
				}catch(Exception e) {
					//System.out.println("readthread line:44");
					break;
				}
				
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
