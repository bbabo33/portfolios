package kr.co.together.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.together.dao.MatchingDAO;
import kr.co.together.dao.MemberDAO;
import kr.co.together.vo.MatchingVO;
import kr.co.together.vo.MemberVO;

@Repository
public class MatchingDAOImpl implements MatchingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void matchingWrite(MatchingVO matchingVO) {
		
		System.out.println("matchingWrite DAO line14:"+matchingVO);
		int i = sqlSession.insert("kr.co.together.insertMatching",matchingVO);
		System.out.println("matchingDAOImpl insert line21:"+i);
	}

	@Override
	public List<MatchingVO> selectAllmatching() {
		List<MatchingVO> matchingBList = sqlSession.selectList("kr.co.together.selectAll");
		
		// 게시자의 이미지등, 추가 정보들을 가져오기 위해 객체를 다시 memberDAO를 통해 member객체를 가져옴
		for(MatchingVO m : matchingBList) {
			MemberVO user = memberDAO.userInfoByEmail(m.getEmail());
			m.setMember(user);
			System.out.println("matchingVO :"+m);
		}
		return matchingBList;
	}
	
	@Override
	public List<MatchingVO> selectthreematching(List<MatchingVO> list) {
		// 게시자의 이미지등, 추가 정보들을 가져오기 위해 객체를 다시 memberDAO를 통해 member객체를 가져옴
		for(MatchingVO m : list) {
			MemberVO user = memberDAO.userInfoByEmail(m.getEmail());
			m.setMember(user);
			//System.out.println("matchingVO :"+m);
		}
		return list;
	}

	@Override
	public MatchingVO selectByNo(int no) {
		//System.out.println("no : "+ no);
		MatchingVO vo = sqlSession.selectOne("kr.co.together.selectByNo", no); 
		MemberVO user = memberDAO.userInfoByEmail(vo.getEmail());
		vo.setMember(user);
		return vo;
	}

	@Override
	public List<MatchingVO> selectrec() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.together.selectrec");
	}
	
	@Override
	public int getTotalCnt() {
		int totalCnt = sqlSession.selectOne("kr.co.together.totalBoardCnt");
		return totalCnt;
	}
	
	@Override
	public List<MatchingVO> getmatchingList(Map<String, Integer> indexKey) {
		List<MatchingVO> matchingBList = sqlSession.selectList("kr.co.together.selectBoardByIndex",indexKey);
		
		for(MatchingVO m : matchingBList) {
			MemberVO user = memberDAO.userInfoByEmail(m.getEmail());
			m.setMember(user);
		}
		
		return matchingBList;
	}

	@Override
	public List<MatchingVO> selectByEmail(String email) {
		List<MatchingVO> myMatchingList = sqlSession.selectList("kr.co.together.selectMatchingByEmail", email);
		return myMatchingList;
	}
	
}
