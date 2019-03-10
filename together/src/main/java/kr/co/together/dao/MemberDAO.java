package kr.co.together.dao;

import kr.co.together.vo.FacebookVO;
import kr.co.together.vo.MemberVO;

public interface MemberDAO {

	public void joinTogether(MemberVO member);
	public MemberVO loginTogether(MemberVO member);
	// 19-01-05 khj
	public int emailCheckTogether(String email);
	public MemberVO userInfoByEmail(String email);
	public int beforeAccountUpdate(MemberVO member);
	public MemberVO updateUser(MemberVO member);
	public int removeUser(MemberVO member);
	// 19-01-09 khj
	public FacebookVO loginFacebook(FacebookVO fb);
}
