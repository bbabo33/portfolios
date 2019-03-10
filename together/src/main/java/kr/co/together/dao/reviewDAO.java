package kr.co.together.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.together.vo.ImageVO;
import kr.co.together.vo.MemberVO;
import kr.co.together.vo.reviewVO;

@Repository
public class reviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO memberDAO;

/*	public List<reviewVO> selectAll() {
		List<reviewVO> list = sqlSession.selectList("kr.co.together.review.selectAllrev");
		return list;
	}*/

	public reviewVO selectbyno(int no) {
		reviewVO rvo = sqlSession.selectOne("kr.co.together.review.selectOnerev", no);
		MemberVO user = memberDAO.userInfoByEmail(rvo.getEmail());
		rvo.setMember(user);
		return rvo;
	}

	public void insert(reviewVO rvo) {
		sqlSession.insert("kr.co.together.review.insertrev", rvo);
	}

	public void insertImg(ImageVO ivo) {
		sqlSession.insert("kr.co.together.review.insertrevimg", ivo);
	}

	public int selectlastNo() {
		return sqlSession.selectOne("kr.co.together.review.selectrevlastno");
	}

	public List<ImageVO> selectAllimg(int boardno) {// ������ �۹�ȣ�� ��� �̹���
		return sqlSession.selectList("kr.co.together.review.selectAllrevimg", boardno);
	}

	public List<ImageVO> selectAllimg() {// �ı�Խ����� ����̹���
		return sqlSession.selectList("kr.co.together.review.revimages");
	}

	public void update(reviewVO rvo) {
		sqlSession.update("kr.co.together.review.revupdate",rvo);
	}
	public void updateImg(ImageVO ivo) {
		sqlSession.update("kr.co.together.review.revimgupdate",ivo);
	}

	public void delete(int no) {
		sqlSession.update("kr.co.together.review.revdelete",no);
	}
	
	public void deleteImg(int boardno) {
		sqlSession.update("kr.co.together.review.revimgdelete",boardno);
	}
	
	public List<reviewVO> selectAll() {
		List<reviewVO> list = sqlSession.selectList("kr.co.together.review.selectAllrev");
		
		// 게시자의 이미지등, 추가 정보들을 가져오기 위해 객체를 다시 memberDAO를 통해 member객체를 가져옴
		for(reviewVO m : list) {
			MemberVO user = memberDAO.userInfoByEmail(m.getEmail());
			m.setMember(user);
		}
		return list;
	}
}
