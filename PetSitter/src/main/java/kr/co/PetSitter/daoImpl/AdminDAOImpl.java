package kr.co.PetSitter.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.PetSitter.dao.AdminDAO;
import kr.co.PetSitter.vo.BookVO;
import kr.co.PetSitter.vo.DolbomVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public List<BookVO> DolBomWrite() {
		return sql.selectList("kr.co.petSitter.selectAllBook");
	}

	@Override
	public BookVO pageInfo(int no) {
		return sql.selectOne("kr.co.petSitter.selectPageInfo", no);
	}

	@Override
	public List<BookVO> searchInfo(String date) {
		return sql.selectList("kr.co.petSitter.searchInfo", date);
	}

	@Override
	public int adminDolbom(DolbomVO dolbom) {
		return sql.insert("kr.co.petSitter.DolbomWrite", dolbom);
	}

	@Override
	public int changeStatus(DolbomVO dolbom) {
		return sql.update("kr.co.petSitter.changeStatus", dolbom);
	}

	@Override
	public DolbomVO seeDolbomWrite(int no) {
		return sql.selectOne("kr.co.petSitter.seeDolbomWrite", no);
	}
	
}
