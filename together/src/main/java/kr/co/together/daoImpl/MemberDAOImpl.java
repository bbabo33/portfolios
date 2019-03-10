package kr.co.together.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.together.dao.MemberDAO;
import kr.co.together.vo.FacebookVO;
import kr.co.together.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Autowired
	private MemberVO member;
	
	@Override
	public void joinTogether(MemberVO member) {
		System.out.println("memberdaoimpl line16:"+member+"\n sqlSession"+sqlSession.toString());
		int i = sqlSession.insert("kr.co.together.joinMember",member);
		System.out.println("memberdaoimpl line18:"+i);
	}

	@Override
	public MemberVO loginTogether(MemberVO member) {
		System.out.println("MemberDAOImpl : loginTogether line24");
		MemberVO userVO = sqlSession.selectOne("kr.co.together.loginMember", member);
		return userVO;
	}
	
	// 19-01-05
	@Override
	public int emailCheckTogether(String email) {
		System.out.println("MemberDAOImpl : emailCheckTogether line32 : "+email);
		int count = sqlSession.selectOne("kr.co.together.emailCheck", email);
		System.out.println("emailCheckTogether : "+ email);
		System.out.println("emailCheckTogether : "+ count);
		return count;
	}

	@Override
	public MemberVO userInfoByEmail(String email) {
		//System.out.println("userInfoByEmail email:"+ email);
		MemberVO memberVO = sqlSession.selectOne("kr.co.together.selectByEmail", email);
		return memberVO;
	}

	@Override
	public int beforeAccountUpdate(MemberVO member) {
		return sqlSession.selectOne("kr.co.together.beforeAccountUpdate",member);
	}

	@Override
	public MemberVO updateUser(MemberVO member) {
		
		int updatedUser =sqlSession.update("kr.co.together.updateUser", member);
		if(updatedUser ==1 ) {
			member = sqlSession.selectOne("kr.co.together.loginMember",member);
		}else {
			member = null;
		}
		return member;
	}

	@Override
	public int removeUser(MemberVO member) {
		int removeUser = sqlSession.delete("kr.co.together.removeUser", member);
		return removeUser;
	}
	
	// 19-01-09 khj
	@Override
	public FacebookVO loginFacebook(FacebookVO fb) {
		System.out.println("FacebookDAOImpl / loginFacebook : "+fb);
		
		System.out.println("facebook ID : " + fb.getId());
		
		// DB에 페이스북 아이디 유무 체크 (cnt : 아이디 있으면 0, 있으면1)
		int cnt = sqlSession.selectOne("kr.co.together.fbIdCheck", fb.getId());
		System.out.println("DB에 페북 아이디 없으면 0, 있으면1 : "+cnt);
		
		// cnt가 1일때! 아이디 없음 insert 해줘야함
		int i = 0;
		if(cnt == 0) {
			System.out.println("DB에 아디이없을시 insert 해주기 : " + cnt);
			i = sqlSession.insert("kr.co.together.fbInsert",fb);
			System.out.println("페이스북 정보 저장 성공시 1 : " + i);
		} 
		
		// DB에 회원정보 저장 or 아이디 있음 select 해줘야함
		if(i == 1 || cnt == 1) {
			fb = sqlSession.selectOne("kr.co.together.loginFacebook", fb.getId());
			System.out.println("MemberDAOImpl : select 후 정보 : "+fb);
		}
		
		
		return fb;
	}
	
}
