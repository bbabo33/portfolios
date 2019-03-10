package kr.co.PetSitter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.PetSitter.service.ReservationService;
import kr.co.PetSitter.vo.BookVO;
import kr.co.PetSitter.vo.UserVO;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	@Autowired
	private ReservationService rService;

	@GetMapping("/bookingForm")
	public String bookForm() {
		return "reservation/bookForm";
	}
	
	@PostMapping("/booking")
	@ResponseBody
	public int booking(BookVO bookVO) {
		System.out.println("bookingController booking VO:"+bookVO);
		return rService.booking(bookVO);
	}
	
	@GetMapping("/confirm")
	public ModelAndView bookConfirm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView(); 
		UserVO user = (UserVO)session.getAttribute("user");
		List<BookVO> confirmLists = rService.confirmList(user.getId());
		mav.addObject("confirmLists", confirmLists);
		mav.setViewName("reservation/bookConfirm");
		return mav;
	}
	
	@GetMapping("/cancelReservation")
	@ResponseBody
	public String bookCancel(@RequestParam("no") int bookNo) {
		String msg=null;
		System.out.println("bookingController bookCancel bookNo:"+ bookNo);
		int cancelCnt = rService.bookCancel(bookNo);
		if(cancelCnt == 1) {
			msg = "예약을 취소하였습니다";
		}else {
			msg = "예약을 취소하지 못했습니다";
		}
		System.out.println(msg);
		return msg;
	}
}
