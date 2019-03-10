package kr.co.PetSitter.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.PetSitter.service.MyPageService;
import kr.co.PetSitter.service.ReservationService;
import kr.co.PetSitter.vo.BookVO;
import kr.co.PetSitter.vo.ReviewVO;
import kr.co.PetSitter.vo.UserVO;

@Controller
public class MyPageController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private MyPageService mService;
	
	@Autowired
	private ReservationService rService;

	@GetMapping("/mypage/summary")
	public ModelAndView summary(HttpSession session) {
		ModelAndView mav = new ModelAndView(); 
		UserVO user = (UserVO)session.getAttribute("user");
		List<BookVO> confirmLists = rService.confirmList(user.getId());
		mav.addObject("confirmLists", confirmLists);
		mav.setViewName("mypage/mySummary");
		return mav;
	}
	
	@GetMapping("/mypage/reviewForm/{no}")
	public ModelAndView afterWrite(@PathVariable("no") int no) {
		System.out.println("maypageController no:"+no);
		ModelAndView mav= new ModelAndView("mypage/reviewForm");
		mav.addObject("bookNo", no);
		return mav;
	}
	
	@PostMapping("/mypage/reviewUp")
	public String reviewUp(MultipartHttpServletRequest mrequest) throws IllegalStateException, IOException{
		
		String uploadDir = servletContext.getRealPath("/resources/images/review/");
		Iterator<String> itr = mrequest.getFileNames();
		ReviewVO review = new ReviewVO();
		if(itr.hasNext()) {
			String formFile = itr.next();
			MultipartFile fileName = mrequest.getFile(formFile);
			String oriFileName = fileName.getOriginalFilename();
			
			if (oriFileName != null && !oriFileName.equals("")) {
				// Ȯ���� ó��
				String ext = "";
				// ���ʿ� �ִ� . �� ��ġ
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// ���ϸ��� Ȯ���ڸ�(.����)�� ����
					ext = oriFileName.substring(index);
				}
				// ������ ���ϸ� �����
				String saveFileName = "pet-" + UUID.randomUUID().toString() + ext;
				System.out.println("������ ���ϸ� : " + saveFileName);

				// �ӽ������ ������ ���ϴ� ��ο� ����
				fileName.transferTo(new File(uploadDir + saveFileName));
				
				review.setNo(mrequest.getParameter("bookNo"));
				review.setGood(mrequest.getParameter("goodSide"));
				review.setBad(mrequest.getParameter("badSide"));
				review.setTitle(mrequest.getParameter("title"));
				review.setOriPic(oriFileName);
				review.setSerPic(saveFileName);
			}
		}else {
			//������ ��ϵ��� �ʾ��� ���
			review.setNo(mrequest.getParameter("bookNo"));
			review.setGood(mrequest.getParameter("goodSide"));
			review.setBad(mrequest.getParameter("badSide"));
			review.setTitle(mrequest.getParameter("title"));
			review.setOriPic("pet-review.jpg");
			review.setSerPic("pet-review.jpg");
		}
		int result =mService.reviewUp(review);
		return "redirect:/";
	}
}
