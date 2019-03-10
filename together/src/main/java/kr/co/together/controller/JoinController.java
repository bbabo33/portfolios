package kr.co.together.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.together.service.JoinService;
import kr.co.together.vo.MemberVO;
import kr.co.together.vo.ImageVO;

@Component
@RequestMapping("/login")
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		return "login/joinForm";
	}
	
	//이미지 사진 서버에 올리는 메소드 
	@ResponseBody
	@RequestMapping(value="/joinProfileImg", method=RequestMethod.POST)
	public String getProfileImg(MultipartHttpServletRequest mRequest) {
		String imgRoot=null;
		try {
			imgRoot = joinService.getProfileImg(mRequest);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return imgRoot;
	}
	
	// 19-01-03 김현주 수정
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView joinTogether(MemberVO member) {
		
		System.out.println("joincontroller line52:"+member);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", "Membership Celebration");
		mav.setViewName("redirect:/");
		joinService.joinTogether(member);
		return mav;
		
	}	
	
	// 19-01-05 khj
	@ResponseBody
	@RequestMapping("/check")
	public int emailCheck(@RequestBody MemberVO member) {
		
		System.out.println("JoinController line44 : " + member.getEmail());
		int count = 0;
		System.out.println("조인컨트롤로 들어온거양??? email : "+member.getEmail());
		count = joinService.emailCheckTogether(member.getEmail());
		System.out.println("JoinController : cont : "+ count);
		
		return count;
	}
}
