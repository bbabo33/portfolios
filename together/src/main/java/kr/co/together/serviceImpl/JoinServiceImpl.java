package kr.co.together.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.together.dao.MemberDAO;
import kr.co.together.service.JoinService;
import kr.co.together.vo.MemberVO;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public void joinTogether(MemberVO member) {
		System.out.println("joinserviceimpl line18:"+member);
		
		StringBuilder sb = new StringBuilder();
		String[] interests = member.getInterest();
		
		for(int i=0; i<interests.length; i++) {
			if(i == (interests.length-1)) {
				sb.append(interests[i]);
			}else {
				sb.append(interests[i]+",");
			}
		}
		member.setInter(sb.toString());
		
		//프로필 이미지 미등록시 기본 값으로 지정
		if(member.getProfileImg().equals("")) {
			member.setProfileImg("proImg.png");
		}
		memberDao.joinTogether(member);
	}
	
	// 19-01-05 khj
	@Override
	public int emailCheckTogether(String email) {
		System.out.println("JoinServiceImpl line28 : "+email);

		int count = memberDao.emailCheckTogether(email);
		return count;
	}

	@Override
	public String getProfileImg(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException{
		
		/* 리턴할 변수명*/
		String saveFileName=null;
		/* 서버에 저장할 루트(uploadDir)를 지정 */
		String uploadDir = servletContext.getRealPath("/upload/userImg/");
		//mRequest에서 파일명을 얻어냄
		Iterator<String> iter = mRequest.getFileNames();
		
		while(iter.hasNext()) {	
			
			String formFileName = iter.next();
			System.out.println("formFileName:"+ formFileName);
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);
			
			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);
			
			if(oriFileName != null && !oriFileName.equals("")) {
			
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
				saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);
				
				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
			}
		}	
		return saveFileName;
	}

}
