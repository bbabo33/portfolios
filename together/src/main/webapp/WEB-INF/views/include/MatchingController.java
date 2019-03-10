package kr.co.together.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.together.service.MatchingService;
import kr.co.together.vo.MatchingVO;

@Component
@RequestMapping("/matching")
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;

	@RequestMapping("/matching")
	public ModelAndView matchingBoard() {
		
		List<MatchingVO> matchingBList = matchingService.selectAllmatching();
		
		System.out.println(matchingBList);
		
		for(MatchingVO m : matchingBList) {
			System.out.println("matchingBoard : "+m.toString());
		}
		
		ModelAndView mav = new ModelAndView("matching/matching");
		mav.addObject("matchingBList", matchingBList);
		return mav;
	}
	
	@RequestMapping("/accompanyWrite")
	public String matchingWrite() {
		return "matching/accompanyWrite";
	}
	
	@PostMapping("/accompanyWriteUp")
	public String matchingWriteUp(MatchingVO matchingVO) {
		System.out.println("matchingWriteUp line 46:"+matchingVO);
		matchingService.matchingWrite(matchingVO);
		return "redirect:/matching/matching";
	}
	
	@GetMapping("/searchDetail/{no}")
	public ModelAndView matchingDetail(@PathVariable("no") int no) {
		MatchingVO vo= matchingService.selectByNo(no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("matching/accompanyDetail");
		mav.addObject("matchingBoard", vo);
		return mav;
	}

	//181230 khj update
	@GetMapping("/accompanyAfterDetail") 
	public String matchingAfterDetail() {
		System.out.println("matchingCon line 55 :matchingafterDetail");
		return "matching/accompanyAfterDetail";
	}
	
	/* 二쇱냼 api, �꽌踰꾩뿉�꽌 �룎�븘�삱 �븣 post濡� �뜕�졇二쇨린 �븣臾몄뿉 post*/
	@RequestMapping(value="/matchingPopUp",method= {RequestMethod.GET,RequestMethod.POST})
	public String MatchingPopUp() {
		return "matching/jusoPopup";
	}
	
	@RequestMapping(value = "topinclude", produces = "application/json")
	@ResponseBody
	public List<MatchingVO> Matchingrecent(Model model){
		return matchingService.selectthreematching(matchingService.selectrecent());
	}
}
