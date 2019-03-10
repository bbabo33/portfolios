package kr.co.PetSitter.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.PetSitter.daoImpl.AdminDAOImpl;
import kr.co.PetSitter.service.AdminService;
import kr.co.PetSitter.vo.BookVO;
import kr.co.PetSitter.vo.DolbomVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAOImpl adao;
	
	@Override
	public List<BookVO> DolBomWrite() {
		return adao.DolBomWrite();
	}

	@Override
	public BookVO pageInfo(int no) {
		return adao.pageInfo(no);
	}

	@Override
	public List<BookVO> searchInfo(String date) {
		return adao.searchInfo(date);
	}

	@Override
	public int adminDolbom(DolbomVO dolbom) {
		int result = adao.adminDolbom(dolbom);
		if(result == 1) {
			dolbom.setChgStatus("D");
			adao.changeStatus(dolbom);
		}
		return result;
	}

	@Override
	public DolbomVO seeDolbomWrite(int no) {
		return adao.seeDolbomWrite(no);
	}
	
}
