package kr.co.together.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.together.dao.BoardDAO;
import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;
import kr.co.together.vo.reviewVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FoodVO> selectAllFoodList() {
		return sqlSession.selectList("kr.co.together.selectAllFoodList");
	}
	
	@Override
	public List<FoodVO> selectFoodList(String foodCate) {
		return sqlSession.selectList("kr.co.together.selectFoodList", foodCate);
	}

	@Override
	public List<ImageVO> selectImageList(String tableName) {
		return sqlSession.selectList("kr.co.together.selectImageList", tableName );
	}

	@Override
	public FoodVO selectFoodDetail(int foodNo) {
		return sqlSession.selectOne("kr.co.together.selectFoodDetail", foodNo);
	}

	@Override
	public ImageVO selectImage(int imageNo) {
		return sqlSession.selectOne("kr.co.together.selectImage",imageNo);
	}

	@Override
	public List<reviewVO> selectByEmail(String email) {
		List<reviewVO> myReviewList = sqlSession.selectList("kr.co.together.review.selectReviewByEmail", email);
		return myReviewList;
	}

	
}
