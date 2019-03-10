package kr.co.PetSitter.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.PetSitter.dao.ReservationDAO;
import kr.co.PetSitter.vo.BookVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public int booking(BookVO book) {
		System.out.println("bookingDAO booking VO:"+book);
		return sql.insert("kr.co.petSitter.insertBooking", book);
	}

	@Override
	public List<BookVO> confirmList(String id) {
		System.out.println("bookingDAO booking id:"+id);
		return sql.selectList("kr.co.petSitter.confirmList", id);
	}

	@Override
	public int bookCancel(int no) {
		return sql.update("kr.co.petSitter.bookCancel", no);
	}
	

}
