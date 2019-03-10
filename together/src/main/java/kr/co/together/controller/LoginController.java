package kr.co.together.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.together.service.LoginService;
import kr.co.together.vo.FacebookVO;
import kr.co.together.vo.MemberVO;

@SessionAttributes(value= {"userVO"})
@Component
@RequestMapping(value="/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	// 19-01-09 페이스북 oAuth 관련
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;

	@RequestMapping(value="/loginForm")
	public String loginForm(Model model) {
		
		// 19-01-09  페이스북 링크를 생성해주는 url : login.jsp 버튼에 a태그 src
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        System.out.println("/facebook" + facebook_url);
		        
		        
		return "login/login";
	}

	// 19-01-03 김현주 수정
	@PostMapping("/login")
	public ModelAndView login(MemberVO member, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("login cont line37"+member);
		MemberVO userVO = loginService.login(member);
		ModelAndView mav = new ModelAndView();
		//System.out.println("로그인 서비스 userVO : "+userVO);
		// 로그인
		if(userVO == null) {
			mav.addObject("msg", "You have entered an incorrect ID or password.");
			mav.setViewName("redirect:/login/loginForm");
		} else {
			String dest = (String)session.getAttribute("dest");

			if(dest != null) {
				//인터셉터에 의해 로그인으로 접속한 경우
				mav.setViewName("redirect:"+dest);
			} else {
				//a태그를 이용해 로그인에 접속한 경우 
				mav.setViewName("redirect:/");
			}
			System.out.println("로그인 후 userVO:"+userVO);
			mav.addObject("userVO", userVO);
		}
		
		// 이메일 저장하기 : checked="checked"
		String remember = request.getParameter("rememberMe");
		Cookie cookie = new Cookie("email", member.getEmail());
		// 이메일 저장하기 : checked=""
		if(remember == null) {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);

		return mav;
	}
	
	// 로그인 방법2
	// 19-01-03 김현주 수정 
/*		@PostMapping("/login")
		public ModelAndView login(MemberVO member, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
			System.out.println("login Controller line28: login ok");
			
			MemberVO userVO = loginService.login(member);
			System.out.println("LoginController / login 로그인했을때 들어오는 값 : "+userVO);
			ModelAndView mav = new ModelAndView();
			
			// 로그인
			if(userVO == null) {
				mav.addObject("msg", "You have entered an incorrect ID or password.");
				mav.setViewName("redirect:/login/loginForm");
			} else {
				String dest = (String)session.getAttribute("dest");

				if(dest != null) {
					//인터셉터에 의해 로그인으로 접속한 경우
					mav.setViewName("redirect:"+dest);
				} else {
					//a태그를 이용해 로그인에 접속한 경우 
					mav.setViewName("redirect:/");
				}
				session.setAttribute("userVO", userVO);
			}
			
			// 이메일 저장하기 : checked="checked"
			String remember = request.getParameter("rememberMe");
			Cookie cookie = new Cookie("email", member.getEmail());
			// 이메일 저장하기 : checked=""
			if(remember == null) {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);

			return mav;
		}*/
	
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		System.out.println("login Controller line57: logout ok");
		
		//세션 영역에 등록한 객체를 다 사용했니? 아직 지우지 않았기 때문에 사용중이라고 나와서 false가 나온다.
		System.out.println(sessionStatus.isComplete());
		sessionStatus.setComplete();
		System.out.println(sessionStatus.isComplete());// 위에서 지웠기 때문에 true가 나온다.
		
		return "redirect:/";
	}
	
	/* 로그아웃 방법2
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("login Controller line57: logout ok");

		HttpSession session = request.getSession();
		session.removeAttribute("userVO");
		return "redirect:/";
	}*/
	
	// 내정보수정 전 로그인
	@ResponseBody
	@PostMapping("/updateCheck")
	public int beforeAccountUpdate(@RequestParam("email") String email, @RequestParam("password") String password) {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setEmail(email);
		memberVO.setPassword(password);
		int userCnt = loginService.beforeAccountUpdate(memberVO);
		System.out.println("loginController userCnt:"+userCnt);
		return userCnt;
	}
	
	// 내정보 수정
	@PostMapping("/updateUser")
	public ModelAndView updateUser(MemberVO memberVO) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userVO", loginService.updateUser(memberVO));
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	// 회원탈퇴
	@ResponseBody
	@PostMapping("/withdraw")
	public int removeUser(@RequestParam("email") String email, @RequestParam("password") String password, SessionStatus sessionStatus) {
		System.out.println("loginCon removeUser line112:email:"+email+",pw:"+password);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setPassword(password);
		
		int removeCnt = loginService.removeUser(memberVO);
		if(removeCnt == 1) {
			sessionStatus.setComplete();
		}
		return removeCnt;
	}
	
	// 19-01-09  페이스북 로그인 버튼을 표시하는 코드
	@RequestMapping(value = "/fbJoin", method = { RequestMethod.GET, RequestMethod.POST })
    public String join(@RequestParam String code, HttpServletResponse response, Model model, HttpServletRequest request) {
	
		HttpSession session = request.getSession();
    	
    	try {
           String redirectUri = oAuth2Parameters.getRedirectUri();
           System.out.println("Redirect URI : " + redirectUri);
           System.out.println("Code : " + code);

           OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
           AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
           String accessToken = accessGrant.getAccessToken();
           System.out.println("AccessToken: " + accessToken);
           Long expireTime = accessGrant.getExpireTime();
           
           if (expireTime != null && expireTime < System.currentTimeMillis()) {
               accessToken = accessGrant.getRefreshToken();
           };
       
           Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
           Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
           UserOperations userOperations = facebook.userOperations();
           
           try
           {            
               String [] fields = { "id", "email",  "name"};
               User userProfile = facebook.fetchObject("me", User.class, fields);
               System.out.println("유저이메일 : " + userProfile.getEmail());
               System.out.println("유저 id : " + userProfile.getId());
               System.out.println("유저 name : " + userProfile.getName());
               
               FacebookVO fb = new FacebookVO();
               fb.setEmail(userProfile.getEmail());
               fb.setId(userProfile.getId());
               fb.setName(userProfile.getName());

               System.out.println("facebookVO : " + fb);
               
               FacebookVO faceVO = loginService.fbLogin(fb);
               System.out.println("LoginController 페이스북 로그인 후 회원 정보 : "+faceVO);
               
               session.setAttribute("faceVO", faceVO);
               // 성공적으로 로그인되었다면 url 뒤에 #_=_가 붙은다
               // http://localhost:8888/together/#_=_
               
               
           } catch (MissingAuthorizationException e) {
               e.printStackTrace();
           }

       } catch (Exception e) {

           e.printStackTrace();
       }
       return "redirect:/";
    }
	
	// 19-01-10 khj facebook logout
	@GetMapping("/fbLogout")
	public String fbLogout(HttpServletRequest request) {
		System.out.println("login Controller line173: logout ok");

		HttpSession session = request.getSession();
		session.removeAttribute("faceVO");
		return "redirect:/";
	}
}
