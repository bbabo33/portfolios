package kr.co.PetSitter.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<BookVO> searchInfo(String searchCate, String searchDate) {
		System.out.println("adminDao SearchCate:"+searchCate);
		System.out.println("adminDao SearchDate:"+searchDate);
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchCate", searchCate);
		map.put("searchDate", searchDate);
		return sql.selectList("kr.co.petSitter.searchInfo", map);
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
