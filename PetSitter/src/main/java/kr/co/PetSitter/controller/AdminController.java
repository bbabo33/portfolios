package kr.co.PetSitter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.PetSitter.service.AdminService;
import kr.co.PetSitter.vo.BookVO;
import kr.co.PetSitter.vo.DolbomVO;

@Controller
public class AdminController {

	@Autowired
	public AdminService aService;
	
	@GetMapping("/admin/adminMain")
	public String adminPage() {
		return "admin/adminMain";
	}
	
	@GetMapping("/admin/dolbomWrite")
	public ModelAndView DolBomWrite() {
		ModelAndView mav= new ModelAndView();
		List<BookVO> bookList = aService.DolBomWrite();
		mav.addObject("bookList", bookList);
		mav.setViewName("admin/dolbomWrite");
		return mav;
	}
	
	@GetMapping("/admin/pageInfo/{no}")
	public ModelAndView pageInfo(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView();
		BookVO book = aService.pageInfo(no);
		//System.out.println("adminCon pageInfo bookVO:"+book);
		mav.addObject("book", book);
		
		switch(book.getBookStatus()) {
			case "W" :
				mav.setViewName("admin/admin_dolbomWriteForm");
				break;		
		}
		return mav;
	}
	
	@GetMapping("/admin/search")
	public ModelAndView searchInfo(String searchCate, String searchDate) {
		//검색시 name=searchDate가 예약자명, 날짜 검색으로 두가지 종류로 한번에 서버로 보내기 때문에 ,를 포함한 문자열로 온다.
		if(searchDate.indexOf(",") != -1) {
			searchDate = searchDate.replace(",","");
		}
		System.out.println("adminCon searchInfo searchCate : "+searchDate);
		List<BookVO> bookList = aService.searchInfo(searchCate, searchDate);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookList", bookList);
		mav.setViewName("admin/dolbomWrite_result");
		return mav;
	}
	
	@PostMapping("/admin/dolbom")
	public ModelAndView adminDolbom(DolbomVO dolbom) {
		//System.out.println("adminCon adminDolbom dolbomVO : "+dolbom);
		aService.adminDolbom(dolbom);
		//System.out.println("adminCon adminDolbom result : "+ result);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/admin/dolbomWrite");
		return mav;
	}
	
	@GetMapping("/admin/seeDolbomWrite/{no}")
	public ModelAndView seeDolbomWrite(@PathVariable("no") int no) {
		DolbomVO dolbom = aService.seeDolbomWrite(no);
		BookVO book = aService.pageInfo(no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dolbom", dolbom);
		mav.addObject("book", book);
		mav.setViewName("mypage/user_dolbomRead");
		return mav;
	}
}
