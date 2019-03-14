package kr.co.PetSitter.service;

import java.util.List;

import kr.co.PetSitter.vo.BookVO;
import kr.co.PetSitter.vo.DolbomVO;

public interface AdminService {

	public List<BookVO> DolBomWrite();
	public BookVO pageInfo(int no);
	public List<BookVO> searchInfo(String searchCate, String searchDate);
	public int adminDolbom(DolbomVO dolbom);
	public DolbomVO seeDolbomWrite(int no);
}
