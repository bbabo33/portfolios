package kr.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Controller;
import kr.dao.MemberDAO;
import kr.vo.MemberVO;

public class UpdateMProcessController implements Controller{

	@Override
	public String handRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO user = new MemberVO();
		user = (MemberVO)session.getAttribute("login_result");
		
		MemberVO member = new MemberVO();
		member.setAddr(request.getParameter("addr"));
		member.setTel(request.getParameter("tel"));
		member.setEmail(request.getParameter("email"));
		member.setId(user.getId());
		System.out.println("updateProcess line 26:"+request.getParameter("email"));
		
		MemberDAO dao = new MemberDAO();
		System.out.println("updateProcess line 29:"+member);
		int result = dao.updateUser(member);
		String msg="";
		if(result==1) {
			user = dao.selectById(user.getId());
			request.getSession().setAttribute("login_result", user);
			msg="회원가입 성공";
		}else {
		}
		request.setAttribute("msg", msg);
		request.setAttribute("update_i", result);
		return "/jsp/myPage/updateProcess.jsp";
	}
	

}
