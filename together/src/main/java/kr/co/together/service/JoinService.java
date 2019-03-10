package kr.co.together.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.together.vo.MemberVO;

public interface JoinService {
	
	public void joinTogether(MemberVO member);
	// 19-01-05 khj
	public int emailCheckTogether(String email);
	
	public String getProfileImg(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException;

}
