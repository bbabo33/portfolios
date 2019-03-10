package kr.co.together.server;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.together.vo.msgVO;

public class TogetherHandler extends TextWebSocketHandler {
   /*private static Logger logger = LoggerFactory.getLogger(TogetherHandler.class);*/
   private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
   // Ŭ���̾�Ʈ�� ���� ���Ŀ� ����Ǵ� �޼���
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      sessionList.add(session);
      
//      List<msgVO> mlist = msgdao.selectall();
      /*StringBuilder msgsb = new StringBuilder();
      for(msgVO mvo : mlist) {
         msgsb.append(mvo.getSend()+"‡"+mvo.getReceive()+"‡"+mvo.getReceiveDate()+"‡"+mvo.getContent()+"<br>");
      }
      session.sendMessage(new TextMessage(msgsb.toString()));*/
   }

   // Ŭ���̾�Ʈ�� ������ �޽����� �������� �� ����Ǵ� �޼���
   @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    
    for (WebSocketSession sess : sessionList) {
      sess.sendMessage(new TextMessage(message.getPayload()));
    }
  }

   // Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      sessionList.remove(session);
      /*logger.info("{} ���� ����", session.getId());*/
   }
}