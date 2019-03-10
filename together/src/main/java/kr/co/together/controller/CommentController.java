package kr.co.together.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.together.dao.CommentDAO;
import kr.co.together.vo.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	CommentDAO cdao;
	
	@GetMapping("/commentlist/{boardNo}/{tablename}")
	@ResponseBody
	public List<CommentVO> selectAll(@PathVariable("boardNo") int boardNo ,@PathVariable("tablename") String tablename) {	
		List<CommentVO> list = cdao.selectAll(tablename,boardNo);
		return list;
	}
	
	@PostMapping("/commentwrite/{boardNo}/{tablename}")
	@ResponseBody
	public List insertAndSelectAll(CommentVO cvo,@PathVariable("tablename") String tablename,@PathVariable("boardNo") int boardNo) {
		cvo.setTablename(tablename);
		System.out.println("comment line34:"+cvo.toString());
		cdao.insert(cvo);
		List list = cdao.selectAll(tablename,boardNo);
		return list;
	}
	
	@GetMapping("/commentdelete/{no}/{boardNo}/{tablename}")
	@ResponseBody
	public List deleteAndSelectAll(@PathVariable("no") int no,@PathVariable("tablename") String tablename,@PathVariable("boardNo") int boardNo) {
		cdao.delete(no);
		List list = cdao.selectAll(tablename,boardNo);
		return list;
	}
}
