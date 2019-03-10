package kr.co.PetSitter.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.PetSitter.dao.MyPageDAO;
import kr.co.PetSitter.daoImpl.AdminDAOImpl;
import kr.co.PetSitter.service.MyPageService;
import kr.co.PetSitter.vo.DolbomVO;
import kr.co.PetSitter.vo.ReviewVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private AdminDAOImpl adao;
	
	@Autowired
	private MyPageDAO mypageDAO;

	@Override
	public int reviewUp(ReviewVO review) {
		int result = mypageDAO.reviewUp(review);
		if(result == 1 ) {
			DolbomVO dolbom = new DolbomVO();
			dolbom.setChgStatus("R");
			dolbom.setNo(review.getNo());
			adao.changeStatus(dolbom);
		}
		return result;
	}

	@Override
	public List<ReviewVO> reviewAll() {
		return mypageDAO.reviewAll();
	}

}
