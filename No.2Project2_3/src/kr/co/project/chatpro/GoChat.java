package kr.co.project.chatpro;

import kr.co.project.util.ProjectBaseUI;

public class GoChat extends ProjectBaseUI {

	String name;
	MultiChatClient mc;
	
	GoChat(){}
	
	public GoChat(String name){
		this.name=name;
	}
	public void execute() throws Exception {
		// TODO Auto-generated method stub
		new MultiChatClient(name).chatClient();
	}

}
