package kr.co.together.dao;

import java.util.List;
import java.util.Map;

import kr.co.together.vo.MatchingVO;

public interface MatchingDAO {
	
	public void matchingWrite(MatchingVO matchingVO);
	public List<MatchingVO> selectAllmatching();
	public List<MatchingVO> selectthreematching(List<MatchingVO> list);
	public MatchingVO selectByNo(int no);
	public List<MatchingVO> selectrec();
	public int getTotalCnt();
	public List<MatchingVO> getmatchingList(Map<String, Integer> indexKey);
	public List<MatchingVO> selectByEmail(String email);
}
