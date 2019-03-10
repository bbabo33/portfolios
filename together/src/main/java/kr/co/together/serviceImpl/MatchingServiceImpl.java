package kr.co.together.serviceImpl;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.together.dao.MatchingDAO;
import kr.co.together.dao.MemberDAO;
import kr.co.together.service.MatchingService;
import kr.co.together.vo.MatchingVO;
import kr.co.together.vo.MemberVO;

@Service
public class MatchingServiceImpl implements MatchingService {

	@Autowired
	private MatchingDAO matchingDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
    public void matchingWrite(MatchingVO matchingVO) {
      System.out.println("matchingServiceImpl line16:"+matchingVO);
      
      matchingVO.setLanguages(Arrays.toString(matchingVO.getLanguage()));
      
      matchingDAO.matchingWrite(matchingVO);

    }

	@Override
	public List<MatchingVO> selectAllmatching() {
		List<MatchingVO> matchingBList = matchingDAO.selectAllmatching();
		return matchingBList;
	}

	@Override
	public MatchingVO selectByNo(int no) {
		MatchingVO vo = matchingDAO.selectByNo(no);
		return vo;
	}

	@Override
	public List<MatchingVO> selectrecent() {
		return matchingDAO.selectrec();
	}

	@Override
	public List<MatchingVO> selectthreematching(List<MatchingVO> list) {
		// TODO Auto-generated method stub
		return matchingDAO.selectAllmatching();
	}
	
	@Override
	public int getTotalCnt() {
		int totalCnt = matchingDAO.getTotalCnt();
		return totalCnt;
	}

	@Override
	public List<MatchingVO> getMatchingList(Map<String, Integer> indexKey) {
		List<MatchingVO> matchingBList = matchingDAO.getmatchingList(indexKey);
		return matchingBList;
	}

	@Override
	public List<MatchingVO> selectByEmail(String email) {
		List<MatchingVO> myMatchingList = matchingDAO.selectByEmail(email);
		
		for(MatchingVO m : myMatchingList) {
			MemberVO user = memberDAO.userInfoByEmail(m.getEmail());
			m.setMember(user);
			//System.out.println("matchingVO :"+m);
		}
		return myMatchingList;
	}
	
}
