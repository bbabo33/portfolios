package kr.co.together.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.together.vo.MatchingVO;
import kr.co.together.vo.MemberVO;
import kr.co.together.vo.RoomVO;
import kr.co.together.vo.msgVO;
import kr.co.together.vo.reviewVO;

@Service
public class MessageDAO {
	
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Autowired
   private MemberDAO memberDAO;
   
   public List<msgVO> selectall(int roomno) {
      List<msgVO> boardList = sqlSession.selectList("kr.co.together.msg.selectAllmsg",roomno);
      return boardList;
   }
   
   public List<msgVO> selectMy(String send,String receive) {
      Map<String,Object> map = new HashMap<>();
      map.put("first", send);
      map.put("second", receive);
      List<msgVO> boardList = sqlSession.selectList("kr.co.together.msg.selectMymsg",map);
      return boardList;
   }
   
   public void insert(msgVO mvo){
      sqlSession.insert("kr.co.together.msg.insertmsg",mvo);
   }
   
   public List<MemberVO> search(Map<String,Object> map){
      return sqlSession.selectList("kr.co.together.msg.selectbyall",map);
   }
   
   public List<Object> searchboard(Map<String,Object> map){
      List<Object> list = sqlSession.selectList("kr.co.together.msg.selectrevrev",map);
      List<Object> list2 = sqlSession.selectList("kr.co.together.msg.selectmatmat",map);
      for(Object m : list) {
         MemberVO user = memberDAO.userInfoByEmail(((reviewVO)m).getEmail());
         ((reviewVO)m).setMember(user);
      }
      for(Object m : list2) {
         MemberVO user = memberDAO.userInfoByEmail(((MatchingVO)m).getEmail());
         ((MatchingVO)m).setMember(user);
      }
      list.addAll(list2);
      return list; 
   }
   
   public void createroom(String value) {
      sqlSession.insert("kr.co.together.msg.createroom",value);
   }
   
   public List<RoomVO> searchroom(String name) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("kr.co.together.msg.selectallroom",name);
   }
   
   public String selectemail(String email) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("kr.co.together.msg.selectemail",email);
   }
   
}