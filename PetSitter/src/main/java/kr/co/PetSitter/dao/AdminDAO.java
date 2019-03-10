package kr.co.PetSitter.dao;

import java.util.List;

import kr.co.PetSitter.vo.BookVO;
import kr.co.PetSitter.vo.DolbomVO;

public interface AdminDAO {

	public List<BookVO> DolBomWrite();
	public BookVO pageInfo(int no);
	public List<BookVO> searchInfo(String date);
	public int adminDolbom(DolbomVO dolbom);
	public int changeStatus(DolbomVO dolbom);
	public DolbomVO seeDolbomWrite(int no);
}
