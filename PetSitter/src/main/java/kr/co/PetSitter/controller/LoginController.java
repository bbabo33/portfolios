package kr.co.PetSitter.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.PetSitter.service.LoginService;
import kr.co.PetSitter.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@GetMapping("/joinForm")
	public String joinForm() {
		return "login/joinForm";
	}
	
	@GetMapping("/myProfile")
	public String myprofile() {
		return "login/myProfile";
	}
	
	@GetMapping("idcheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		System.out.println("logincontroller idCheck : "+id);
		
		return loginService.idCheck(id);
	}
	
	@PostMapping("/join")
	@ResponseBody
	public int joinUser(UserVO userVO) {
		//System.out.println("loginController join: "+userVO);
		return loginService.joinUser(userVO);
	}
	
	@PostMapping("/login")
	@ResponseBody
	public int loginUser(UserVO userVO, HttpSession session) {
		//System.out.println("loginController login: "+userVO);
		UserVO user = loginService.loginUser(userVO);
		//System.out.println("loginController after login: "+user);
		if(user != null) {
			session.setAttribute("user", user);
			return 1;
		}else {
			return 0;
		}
	}
	
	@PostMapping("/update")
	@ResponseBody
	public int updateUser(UserVO userVO, HttpSession session) {
		//System.out.println("loginController update: "+userVO);
		int updateCnt = loginService.updateUser(userVO);
		
		if(updateCnt == 1) {
			UserVO user = loginService.loginUser(userVO);
			session.setAttribute("user", user);
		}
		return updateCnt;
	}
	
	@GetMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	@RequestMapping(value="/jusoPopup", method= {RequestMethod.GET,RequestMethod.POST})
	public String juso() {
		return "/login/jusoPopup";
	}
}
