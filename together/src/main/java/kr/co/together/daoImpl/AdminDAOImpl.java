package kr.co.together.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.together.dao.AdminDAO;
import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void foodWriteUp(FoodVO food) {
		sqlSession.insert("kr.co.together.amdin.insertFood", food);
	}

	@Override
	public int foodWriteNo() {
		int boardNo = sqlSession.selectOne("kr.co.together.amdin.selectFoodLastNo");
		System.out.println("AdminDAOImpl : "+boardNo);
		return boardNo;
	}

	@Override
	public void insertImg(ImageVO img) {
		sqlSession.insert("kr.co.together.amdin.insertImg", img);
	}

	@Override
	public int foodDelete(int no) {
		System.out.println("AdminDAOImpl foodNo : "+no);
		
		int delNo = sqlSession.delete("kr.co.together.amdin.foodDelete", no);
		System.out.println("푸드게시판은 삭제됨");
		sqlSession.delete("kr.co.together.amdin.foodImgDelete", no);
		
		System.out.println("AdminDAOImpl delNo : "+delNo);

		return delNo;
	}

}
