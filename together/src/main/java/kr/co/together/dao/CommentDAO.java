package kr.co.together.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.together.vo.CommentVO;
import kr.co.together.vo.reviewVO;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<CommentVO> selectAll(String tablename,int boardno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tablename",tablename);
		map.put("boardno",boardno);
		List<CommentVO> list = sqlSession.selectList("kr.co.together.comment.selectAllcom",map);
		return list;
	}
	public void insert(CommentVO cvo) {
		sqlSession.insert("kr.co.together.comment.insertcom",cvo);
	}
	public void delete(int no) {
		sqlSession.insert("kr.co.together.comment.deletecom",no);
	}
}
