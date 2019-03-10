package kr.co.PetSitter.service;

import java.util.List;

import kr.co.PetSitter.vo.ReviewVO;

public interface MyPageService {

	public int reviewUp(ReviewVO review);
	public List<ReviewVO> reviewAll();
}
