package kr.co.PetSitter.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.PetSitter.dao.MyPageDAO;
import kr.co.PetSitter.vo.ReviewVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public int reviewUp(ReviewVO review) {
		return sql.insert("kr.co.petSitter.reviewUp", review);
	}

	@Override
	public List<ReviewVO> reviewAll() {
		return sql.selectList("kr.co.petSitter.reviewAll");
	}

}
