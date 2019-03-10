package kr.co.together.service;

import java.util.List;

import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;
import kr.co.together.vo.reviewVO;

public interface BoardService {
	
	public List<FoodVO> selectAllFoodList();
	public List<FoodVO> selectFoodList(String foodCate);
	public List<ImageVO> selectImageList(String tableName);
	public FoodVO selectFoodDetail(int foodNo);
	public ImageVO selectImage(int imageNo);
	public List<reviewVO> selectByEmail(String email);
}
