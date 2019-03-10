package kr.co.together.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@RequestMapping(value="/matching/{no}", method=RequestMethod.GET)
	   public ModelAndView matchingBoard(@PathVariable("no") int no) {
	      /* 페이징 하기 위한 준비 */
	      int totalPage = matchingService.getTotalCnt();
	      
	      int dataPerPage=6;
	      ModelAndView mav = new ModelAndView();
	      int endPageNum = (int)Math.ceil((double)totalPage/(double)dataPerPage);
	      
	      System.out.println("totalCnt:"+endPageNum);
	      
	      Map<String, Integer> indexKey = new HashMap<String, Integer>();
	      indexKey.put("startBoard", 6*(no-1)+1);
	      indexKey.put("endBoard", 6*no);
	      
	      List<MatchingVO> matchingBList = matchingService.getMatchingList(indexKey);
	      
	      mav.addObject("matchingBList",matchingBList);
	      mav.addObject("endPage", endPageNum);
	      mav.setViewName("matching/matching");
	      
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
		return "redirect:/matching/matching/1";
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
