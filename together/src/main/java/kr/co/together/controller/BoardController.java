package kr.co.together.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.together.serviceImpl.BoardServiceImpl;
import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;

@Component
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl boardService;

	@RequestMapping(value="/noticeBoard")
	public String GoNoticeBoard() {
		System.out.println("boardController : /footer");
		return "footer/noticeBoard";
	}
	
	// 181230 ������ �߰� �������� �󼼱�
	@RequestMapping(value="/noticeDetail")
	public String GoNoticeDetail() {
		System.out.println("boardController : /noticeDetail");
		return "footer/noticeDetail";
	}
	
	// 푸드게시판 전체 불러오기
	@RequestMapping(value="/pick/foodList")
	public ModelAndView foodBoard() {
		ModelAndView mav = new ModelAndView();
		
		List<FoodVO> all = new ArrayList<>();
		List<FoodVO> koreanFood = new ArrayList<>();
		List<FoodVO> snack = new ArrayList<>();
		List<FoodVO> meat = new ArrayList<>();
		List<ImageVO> images = new ArrayList<>();
		
		all = boardService.selectAllFoodList();
		koreanFood = boardService.selectFoodList("KoreanFood");
		snack = boardService.selectFoodList("Snack");
		meat = boardService.selectFoodList("Meat");
		images = boardService.selectImageList("food");
		
		mav.addObject("all",all);
		mav.addObject("koreanFood", koreanFood);
		mav.addObject("snack",snack);
		mav.addObject("meat", meat);
		mav.addObject("images", images);
		
		for (FoodVO data :  koreanFood) {
			System.out.println(data);
		}
		for (ImageVO data :  images) {
			System.out.println(data);
		}
		mav.setViewName("pick/foodList");
		
		return mav;
	}
	
	// 푸드게시판 상세글
	@RequestMapping(value="/pick/foodDetail/{foodNo}/{imageNo}")
	public ModelAndView foodDetailBoard(@PathVariable("foodNo") int foodNo, @PathVariable("imageNo") int imageNo) {
		ModelAndView mav = new ModelAndView();
		FoodVO food = boardService.selectFoodDetail(foodNo);
		ImageVO image = boardService.selectImage(imageNo);
		System.out.println("디테일이요" + food);
		System.out.println("디테일이요" + image);
		
		mav.addObject("food", food);
		mav.addObject("image", image);
		mav.setViewName("pick/foodDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/pick/tourList")
	public String tourBoard() {
		System.out.println("boardController : /tourlist");
		return "pick/tourList";
	}
	
	@RequestMapping(value="/pick/tourDetail")
	public String tourDetailBoard() {
		System.out.println("boardController : /tourDetail");
		return "pick/tourDetail";
	}
	
}
