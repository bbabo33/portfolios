package kr.co.PetSitter.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import kr.co.PetSitter.dao.ReservationDAO;
import kr.co.PetSitter.service.ReservationService;
import kr.co.PetSitter.vo.BookVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO rdao;
	
	@Override
	public int booking(BookVO book) {
		System.out.println("bookingService booking VO:"+book);
		return rdao.booking(book);
	}

	@Override
	public List<BookVO> confirmList(String id) {
		System.out.println("bookingService booking id:"+id);
		return rdao.confirmList(id);
	}

	@Override
	public int bookCancel(int no) { 
		return rdao.bookCancel(no);
	}


}
