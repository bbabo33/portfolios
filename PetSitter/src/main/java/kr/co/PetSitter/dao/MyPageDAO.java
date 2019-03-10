package kr.co.PetSitter.dao;

import java.util.List;

import kr.co.PetSitter.vo.ReviewVO;

public interface MyPageDAO {
	
	public int reviewUp(ReviewVO review);
	public List<ReviewVO> reviewAll();

}
