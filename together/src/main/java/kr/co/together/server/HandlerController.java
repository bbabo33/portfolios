package kr.co.together.server;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.together.dao.MessageDAO;
import kr.co.together.vo.MemberVO;
import kr.co.together.vo.RoomVO;
import kr.co.together.vo.msgVO;

@Controller
public class HandlerController {

   @Autowired
   MessageDAO msgdao;

   @RequestMapping(value = "/chat")
   public String GoChat() {
      return "chat/socket";
   }

   @RequestMapping(value = "/chatlist", produces = "application/json")
   @ResponseBody
   public Map<String,Object> selectallmsglist(String roomno) {
      List<msgVO> list = msgdao.selectall(Integer.parseInt(roomno));
      //방번호를 통해 채팅 메세지 받아옴
      Map<String, Object> map = new HashMap<String, Object>();
         
      for(msgVO msg: list) {   //프사 설정
         msg.setProfile(msgdao.selectemail(msg.getSend()));
      }
      
      map.put("chatmsg",list);
      return map;
   }
   
   @RequestMapping(value = "/chatinput", produces = "application/json")
   @ResponseBody
   public String inputmsg(msgVO mvo) {
      System.out.println(mvo.getRoomno());
      int number = Integer.parseInt(mvo.getRoomno());
      mvo.setNo(number);
      msgdao.insert(mvo);
      return "ok";
   }
   
   @RequestMapping(value = "/search", produces = "application/json")
   @ResponseBody
   public List<MemberVO> searchlist(String type,String value) {
      Map<String,Object> map = new HashMap<>();
      System.out.println(type+value);
      if(value.length()>0) {
         if(type.equals("name")) {
            map.put("name", value);
         }else if(type.equals("email")) {
            map.put("email", value);
         }else if(type.equals("all")) {
            map.put("name", value);
            map.put("email", value);
         }
         System.out.println((List<MemberVO>) msgdao.search(map));
         return (List<MemberVO>) msgdao.search(map);
      }else {
         return null;//아무것도 안쓰면 널
      }
      
   }
   
   @RequestMapping(value = "/searchboard", produces = "application/json")
   @ResponseBody
   public List<Object> searchboardlist(String type,String value) {
      Map<String,Object> map = new HashMap<>();
      System.out.println(type+value);
      if(value.length()>0) {
         if(type.equals("writer")) {
            map.put("writer", value);
         }else if(type.equals("title")) {
            map.put("title", value);
         }else if(type.equals("content")) {
            map.put("content", value);
         }
         return (List<Object>) msgdao.searchboard(map);
      }else {
         return null;//아무것도 안쓰면 널
      }
      
   }
   
   @RequestMapping(value = "/searchroom", produces = "application/json")
   @ResponseBody
   public List<RoomVO> selectAllroom(String name) {
      if(name.length()>0) {
         List<RoomVO> list = msgdao.searchroom(name);
         for(RoomVO room: list) {
            String[] emaillist = room.getJoiner().split(",");
            boolean inyou = false;
            for(String email : emaillist) {
               if(email.equals(name)) {
                  inyou = true;
               }
            }
            if(inyou ==false) {
               list.remove(room);
            }
         }
         return list;
      }else {
         return null;//아무것도 안쓰면 널
      }   
   }
   
   @RequestMapping(value = "/createroom", produces = "application/json")
   @ResponseBody
   public String createroom(String value) {
      if(value.length()>0) {
         msgdao.createroom(value);
         return "success";
      }else {
         return null;//아무것도 안쓰면 널
      }
      
   }
}