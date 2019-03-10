package kr.co.together.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.together.dao.MemberDAO;
import kr.co.together.daoImpl.BoardDAOImpl;
import kr.co.together.service.BoardService;
import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;
import kr.co.together.vo.MatchingVO;
import kr.co.together.vo.MemberVO;
import kr.co.together.vo.reviewVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAOImpl boardDAO;
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<FoodVO> selectAllFoodList() {
		return boardDAO.selectAllFoodList();
	}

	@Override
	public List<FoodVO> selectFoodList(String foodCate) {
		return boardDAO.selectFoodList(foodCate);
	}

	@Override
	public List<ImageVO> selectImageList(String tableName) {
		return boardDAO.selectImageList(tableName);
	}

	@Override
	public FoodVO selectFoodDetail(int foodNo) {
		return boardDAO.selectFoodDetail(foodNo);
	}

	@Override
	public ImageVO selectImage(int imageNo) {
		return boardDAO.selectImage(imageNo);
	}

	@Override
	public List<reviewVO> selectByEmail(String email) {
		List<reviewVO> myReviewList = boardDAO.selectByEmail(email);
		
		for(reviewVO m : myReviewList) {
			MemberVO user = memberDAO.userInfoByEmail(m.getEmail());
			m.setMember(user);
			//System.out.println("matchingVO :"+m);
		}
		return myReviewList;
	}

	
}
