package kr.co.PetSitter.dao;

import java.util.List;

import kr.co.PetSitter.vo.BookVO;

public interface ReservationDAO {

	public int booking(BookVO book);
	public List<BookVO> confirmList(String id);
	public int bookCancel(int no);
}
