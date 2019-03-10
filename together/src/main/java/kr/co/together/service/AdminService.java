package kr.co.together.service;

import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;

public interface AdminService {

	public void foodWriteUp(FoodVO foodVO);	// 글등록
	public int foodWriteNo();
	public void insertImg(ImageVO img);
	public int foodDelete(String no);
}
