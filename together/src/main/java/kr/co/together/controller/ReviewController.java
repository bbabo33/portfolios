package kr.co.together.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.together.dao.reviewDAO;
import kr.co.together.vo.ImageVO;
import kr.co.together.vo.reviewVO;

@Component
@RequestMapping("/matching")
public class ReviewController {
	@Autowired
	ServletContext servletContext;

	@Autowired
	reviewDAO rvdao;

	@GetMapping("/accompanyAfter")
	public ModelAndView matchingAfter() {
		List<reviewVO> list = rvdao.selectAll();
		List<ImageVO> imglist = rvdao.selectAllimg();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("matching/accompanyAfter");
		mav.addObject("imglist", imglist);
		mav.addObject("afterlist", list);
		return mav;
	}

	@GetMapping("/accompanyAfterWrite")
	public String matchingAfterWrite() {
		return "matching/accompanyAfterWrite";
	}

	@PostMapping("/accompanyAfterWriteUp") // 글쓰기 폼에서 post로 정보를 가지고 넘어옴
	public ModelAndView matchingAfterWriteUp(MultipartHttpServletRequest mRequest)
			throws IllegalStateException, IOException {
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/review/"); // 톰캣 업ㄹ드
		ModelAndView mav = new ModelAndView("redirect:accompanyAfter");
		reviewVO rvo = new reviewVO();
		rvo.setWriter(mRequest.getParameter("writer"));
		rvo.setTitle(mRequest.getParameter("title"));
		rvo.setContent(mRequest.getParameter("content"));
		rvo.setEmail(mRequest.getParameter("email"));
		int filecount = 0;
		// file
		rvdao.insert(rvo);

		int boardno = rvdao.selectlastNo();
		Iterator<String> iter = mRequest.getFileNames();
		while (iter.hasNext()) {

			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);

			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);

			if (oriFileName != null && !oriFileName.equals("")) {

				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}

				// 파일 사이즈
				long fileSize = mFile.getSize();
				System.out.println("파일 사이즈 : " + fileSize);

				// 고유한 파일명 만들기
				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);

				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
				ImageVO ivo = new ImageVO();
				ivo.setBoardno(boardno);
				ivo.setFileOrlName(oriFileName);
				ivo.setFileSaveName(saveFileName);
				ivo.setTablename("review");
				rvdao.insertImg(ivo);
				filecount++;
			}
		}
		if (filecount == 0) {
			System.out.println("타입2");
			ImageVO ivo = new ImageVO();
			ivo.setBoardno(boardno);
			ivo.setFileOrlName("korea");
			ivo.setFileSaveName("jpg/Korea.jpg");
			ivo.setTablename("review");
			rvdao.insertImg(ivo);
		}
		return mav;
	}

	// 181230 ������ ����
	@GetMapping("/accompanyAfterDetail/{no}")
	public ModelAndView matchingAfterDetail(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("matching/accompanyAfterDetail");
		reviewVO rvo = rvdao.selectbyno(no);
		List<ImageVO> imglist = rvdao.selectAllimg(rvo.getNo());
		mav.addObject("afterimg", imglist);
		mav.addObject("afterdt", rvo);
		System.out.println(rvo);
		return mav;
	}

	@GetMapping("/accompanyAfterUpdate/{no}")
	public ModelAndView matchingAfterUpdate(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("matching/accompanyAfterUpdate");
		reviewVO rvo = rvdao.selectbyno(no);
		List<ImageVO> imglist = rvdao.selectAllimg(rvo.getNo());
		mav.addObject("afterimg", imglist);
		mav.addObject("afterdt", rvo);
		System.out.println(rvo);
		return mav;
	}

	@PostMapping("/accompanyAfterUpdateUp/{no}")
	public ModelAndView matchingAfterUpdateUp(@PathVariable("no") int no, MultipartHttpServletRequest mRequest)
			throws IllegalStateException, IOException {
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/review/"); // 톰캣 업ㄹ드
		ModelAndView mav = new ModelAndView("redirect:/matching/accompanyAfter");
		reviewVO rvo = new reviewVO();
		rvo.setNo(no);
		rvo.setWriter(mRequest.getParameter("writer"));
		rvo.setTitle(mRequest.getParameter("title"));
		rvo.setContent(mRequest.getParameter("content"));
		int filecount = 0;
		// file
		rvdao.update(rvo);

		deletefile(rvo);

		int boardno = no;
		Iterator<String> iter = mRequest.getFileNames();
		while (iter.hasNext()) {

			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);

			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);

			if (oriFileName != null && !oriFileName.equals("")) {

				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}

				// 파일 사이즈
				long fileSize = mFile.getSize();
				System.out.println("파일 사이즈 : " + fileSize);

				// 고유한 파일명 만들기
				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);

				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
				ImageVO ivo = new ImageVO();
				ivo.setBoardno(boardno);
				ivo.setFileOrlName(oriFileName);
				ivo.setFileSaveName(saveFileName);
				ivo.setTablename("review");
				rvdao.updateImg(ivo);
				filecount++;
			}
		}
		return mav;
	}

	@GetMapping("/accompanyAfterDelete/{no}")
	public ModelAndView matchingAfterDelete(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/matching/accompanyAfter");
		reviewVO rvo = new reviewVO();
		rvo.setNo(no);
		deletefile(rvo);
		rvdao.delete(no);
		
		return mav;
	}

	public void deletefile(reviewVO rvo) {
		// 죽어라파일
		List<ImageVO> imglist = rvdao.selectAllimg(rvo.getNo());
		String existfile = imglist.get(0).getFileSaveName();
		if (existfile.length() > 20) { // korea.jpg 이런게아니면
			String path = servletContext.getRealPath("/upload/") + existfile; // 삭제할 파일의 경로
			File file = new File(path);
			if (file.exists() == true) {
				file.delete();
			}
		}
	}
}
