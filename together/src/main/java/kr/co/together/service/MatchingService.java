package kr.co.together.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import kr.co.together.vo.MatchingVO;

public interface MatchingService {

	public void matchingWrite(MatchingVO matchingVO);
	public List<MatchingVO> selectAllmatching();
	public MatchingVO selectByNo(int no);
	public List<MatchingVO> selectrecent();
	public List<MatchingVO> selectthreematching(List<MatchingVO> list);
	public int getTotalCnt();
	public List<MatchingVO> getMatchingList(Map<String, Integer> indexKey);
	public List<MatchingVO> selectByEmail(String email);
}
