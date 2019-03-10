package kr.co.PetSitter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.PetSitter.service.MyPageService;
import kr.co.PetSitter.vo.ReviewVO;

@Controller
public class MainpageController {
	
	@Autowired
	private MyPageService mService;

	@RequestMapping("/")
	public ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView("index");
		List<ReviewVO> reviews = mService.reviewAll();
		mav.addObject("reviews", reviews);
		return mav;
	}
	
	@GetMapping("/mypage/dolbomReviews")
	public ModelAndView reviews() {
		ModelAndView mav = new ModelAndView("mypage/dolbomReviews");
		List<ReviewVO> reviews = mService.reviewAll();
		mav.addObject("reviews", reviews);
		return mav;
	}
}
