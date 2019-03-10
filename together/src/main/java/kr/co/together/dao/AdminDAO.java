package kr.co.together.dao;

import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;

public interface AdminDAO {

	public void foodWriteUp(FoodVO food);
	public int foodWriteNo();
	public void insertImg(ImageVO img);
	public int foodDelete(int no);
}
