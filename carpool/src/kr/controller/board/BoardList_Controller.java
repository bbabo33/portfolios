package kr.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Controller;
import kr.dao.BoardDAO;
import kr.vo.BoardVO;

public class BoardList_Controller implements Controller{
	@Override
	public String handRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String post_type = request.getParameter("post_type");
		
		BoardDAO dao = new BoardDAO();
		int allRows=dao.cntAllRows(post_type);	// 모든 컬럼수
		int start=1;
		int end=0;

		if(allRows%5 !=0){
			end = (allRows/5)+1;
		}else{
			end = allRows/5;
		}
				
		String pageData = request.getParameter("pageNo");
		int pageNo = (pageData != null) ? Integer.parseInt(pageData) : 1;
		
		List<BoardVO> boardList= dao.getPage(pageNo, post_type);
		
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("boardList",boardList);
		request.setAttribute("post_type",post_type);
		
		return "/page/board/board_list.jsp";
	}

}
