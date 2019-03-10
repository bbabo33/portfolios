package kr.co.together.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.together.dao.MemberDAO;
import kr.co.together.service.LoginService;
import kr.co.together.vo.FacebookVO;
import kr.co.together.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private MemberVO member;
	
	@Override
	public MemberVO login(MemberVO member) {
		MemberVO userVO = memberDao.loginTogether(member);
		System.out.println("LoginService cont :userVO:"+userVO);
		/* userVO가 null 일때(패스워드 잘못입력시) */
		/* interest를 배열로 바꾸기 위한 것*/
		if(userVO != null && userVO.getInter() != null) {
			userVO.setInterest(userVO.getInter().split(","));
		}	
		return userVO;
	}

	@Override
	public int beforeAccountUpdate(MemberVO memberVO) {
		return memberDao.beforeAccountUpdate(memberVO);
	}

	@Override
	public MemberVO updateUser(MemberVO memberVO) {
		
		StringBuilder sb = new StringBuilder();
		/* interest[] 를 inter String 으로 만드는 과정 */
		if(memberVO.getInterest() != null) {
			for(int i=0; i<memberVO.getInterest().length;i++) {
				if(i == memberVO.getInterest().length-1) {
					sb.append(memberVO.getInterest()[i]);
				}else {
					sb.append(memberVO.getInterest()[i]+",");
				}
			}
			memberVO.setInter(sb.toString());
		}
		
		member = memberDao.updateUser(memberVO);
		
		return member;
	}

	@Override
	public int removeUser(MemberVO memberVO) {
		int removeUser = memberDao.removeUser(memberVO);
		return removeUser;
	}
	
	@Override
	public FacebookVO fbLogin(FacebookVO fb) {
		FacebookVO faceVO = memberDao.loginFacebook(fb);
		return faceVO;
	}
	
}
