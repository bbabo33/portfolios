package kr.co.together.service;

import kr.co.together.vo.FacebookVO;
import kr.co.together.vo.MemberVO;

public interface LoginService {
	MemberVO login(MemberVO member);
	int beforeAccountUpdate(MemberVO memberVO);
	MemberVO updateUser(MemberVO memberVO);
	int removeUser(MemberVO memberVO);
	// 19-01-09 khj
	FacebookVO fbLogin(FacebookVO fb);
}
