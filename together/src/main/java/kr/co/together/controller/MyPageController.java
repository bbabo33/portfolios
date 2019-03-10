package kr.co.together.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.together.service.BoardService;
import kr.co.together.service.MatchingService;
import kr.co.together.vo.MatchingVO;
import kr.co.together.vo.reviewVO;

@Component
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MatchingService matchingService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("/my")
	@ResponseBody
	public ModelAndView myBoard(@RequestParam("email") String email) {
		//System.out.println("My Page Con email: "+ email);
		List<MatchingVO> myMatchingList = matchingService.selectByEmail(email);
		List<reviewVO> myReviewList = boardService.selectByEmail(email);
		System.out.println("myMatchingList size : "+myMatchingList.size());
		System.out.println("myReviewList size : "+myReviewList.size());
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("myMatchingList", myMatchingList);
		mav.addObject("myReviewList", myReviewList);
		mav.setViewName("mypage/my");
		
		return mav;
	}
	
	
	@RequestMapping("/noti")
	public String myNoti() {
		return "mypage/noti";
	}
	
	@RequestMapping("/talk")
	public String myTalk() {
		return "mypage/talk";
	}
	
	@RequestMapping("/pwCheck")
	public String myPwCheck() {
		return "mypage/pwCheck";
	}
	
	@RequestMapping(value="/pwCheckUp", method=RequestMethod.POST)
	public String myPwCheckUp() {
		/* üũ ��.jsp ���Ͽ��� ���� Ȯ���ϰ� ���� ����.jsp�� �� �� �ֵ��� ���� �ؾ� �� */
		return "mypage/pwCheckUp";
	}
	
	@RequestMapping("/useinfo")
	public ModelAndView myInfo() {
		
		ModelAndView mav = new ModelAndView();
		
		/* 국가 리스트, 흥미등 내용을 보내기 위함*/
		String[] countryList = {"Korea","Usa","China","Japan","France","England","Germany","Belgium","Spain","Italy","Thailand","Philippines","Vietnam"};
		String[] interests = {"food","culture","shopping","history","music","recreation","cafe","view"};
		
		mav.addObject("countryList", countryList);
		mav.addObject("interests", interests);
		mav.setViewName("mypage/useinfo");
		return mav;
	}
	
	@RequestMapping(value="/useinfoUp", method=RequestMethod.POST)
	public String myInfoUp() {
		System.out.println("useinfoup");
		return "redirect:/";
	}
	
}
