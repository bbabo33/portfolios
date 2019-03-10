package kr.co.PetSitter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DolBomController {

	@RequestMapping(value="/faq", method=RequestMethod.GET)
	public String DolBomPage(){
		//System.out.println("inDolBom");
		return "dolbom/faq";
	}
	
	@RequestMapping(value="/introduce", method=RequestMethod.GET)
	public String DolBomIntroduce() {
		return "dolbom/DolBomIntroduce";
	}
	
}
