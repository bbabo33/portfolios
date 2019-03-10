package kr.co.together.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.together.dao.AdminDAO;
import kr.co.together.service.AdminService;
import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public void foodWriteUp(FoodVO food) {
		System.out.println("AdminServiceImpl : "+ food);
		
		StringBuilder sb = new StringBuilder();
		String[] offs = food.getOff();
		
		for(int i=0; i<offs.length; i++) {
			if(i == (offs.length-1)) {
				sb.append(offs[i]);
			} else {
				sb.append(offs[i]+", ");
			}
		}
		food.setOffday(sb.toString());
		System.out.println(food.getOffday());
		
		food.setTel(food.getTel1()+"-"+food.getTel2()+"-"+food.getTel3());
		System.out.println(food.getTel());
		
		System.out.println("AdminServiceImpl 다 넣은거 : "+ food);

		adminDAO.foodWriteUp(food);
		
	}

	@Override
	public int foodWriteNo() {
		int boardNo = adminDAO.foodWriteNo();
		
		return boardNo;
	}

	@Override
	public void insertImg(ImageVO img) {
		adminDAO.insertImg(img);
	}

	@Override
	public int foodDelete(String no) {
		
		String[] foodNo = no.split(","); 
		int delNo = 0;
		for(String fNo : foodNo) {
			System.out.println("String : "+fNo);
			int foNo = Integer.parseInt(fNo);
			System.out.println("int : "+foNo);
			delNo = adminDAO.foodDelete(foNo);
		}
		
		System.out.println("AdminServiceImpl 삭제 후 받은 수 : "+delNo);
		
		return delNo;
		
	}

}
