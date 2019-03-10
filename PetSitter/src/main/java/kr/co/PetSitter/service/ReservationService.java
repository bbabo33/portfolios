package kr.co.PetSitter.service;

import java.util.List;

import kr.co.PetSitter.vo.BookVO;

public interface ReservationService {
	
	public int booking(BookVO book);
	public List<BookVO> confirmList(String id);
	public int bookCancel(int no);
	
}
