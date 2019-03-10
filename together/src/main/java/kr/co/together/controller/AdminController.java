package kr.co.together.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.together.service.AdminService;
import kr.co.together.vo.FoodVO;
import kr.co.together.vo.ImageVO;

@Component
@RequestMapping("/admin")
public class AdminController {
   
   @Autowired
   ServletContext servletContext;
   
   @Autowired
   AdminService adminService;
   
   @Autowired
   BoardController boardController;
   
   @RequestMapping(value="/admin")
   public String adminBoard() {
      System.out.println("AdminController : /admin");
      return "admin/admin";
   }
   
   @RequestMapping(value="/noticeBoard")
   public String noticeBoard() {
      System.out.println("AdminController : /noticeadmin");
      return "admin/noticeBoard";
   }
   
   @RequestMapping(value="/userInfo")
   public String userinfo() {
      System.out.println("AdminController : /userInfo");
      return "admin/userInfo";
   }
   
   @RequestMapping(value="/vegetarian_write")
   public String vegetarianWrite() {
      System.out.println("AdminController : /vegetarian_write");
      return "admin/vegetarian_write";
   }
   // 19-01-06 khj foodBoard
   @RequestMapping(value="/food")
   public ModelAndView foodBoard() {
      System.out.println("AdminController : /foodBoard");
      
      // board/pick/foodList 가져오기
      ModelAndView mav = boardController.foodBoard();
      mav.setViewName("admin/food");
      
      return mav;
   }
   
   // 19-01-06 khj foodWrite
   @RequestMapping(value="/foodWrite")
   public String foodWrite() {
      System.out.println("AdminController : /foodWrite");
      return "admin/foodWrite";
   }
   
   // 19-01-12 khj 푸드게시판 글 등록
   @PostMapping("/foodWriteUp")
   public ModelAndView foodWriteUp(MultipartHttpServletRequest mRequest)
      throws IllegalStateException, IOException {
      
      // 실행되는 웹어플리케이션의 실제 경로 가져오기
      String uploadDir = servletContext.getRealPath("/upload/food/"); // 톰캣 업로드
      ModelAndView mav = new ModelAndView("redirect:food");
      
      FoodVO food = new FoodVO();
      food.setName(mRequest.getParameter("name"));
      food.setAddress(mRequest.getParameter("address"));
      food.setkAddress(mRequest.getParameter("kAddress"));
      food.setTel1(mRequest.getParameter("tel1"));
      food.setTel2(mRequest.getParameter("tel2"));
      food.setTel3(mRequest.getParameter("tel3"));
      food.setCate(mRequest.getParameter("cate"));
      food.setOpenTime(mRequest.getParameter("openTime"));
      food.setCloseTime(mRequest.getParameter("closeTime"));
      food.setOff(mRequest.getParameterValues("off"));
      food.setFood(mRequest.getParameter("food"));
      food.setContent(mRequest.getParameter("content"));
      
      System.out.println(food);
      adminService.foodWriteUp(food);
      
      int boardno = adminService.foodWriteNo();
      System.out.println("AdminController 푸드게시판 마지막번호 : "+boardno);
      
      Iterator<String> iter = mRequest.getFileNames();
      while(iter.hasNext()) {
         String formFileName = iter.next();
         //폼에서 파일을 선택하지 않아도 객체 생성됨
         MultipartFile mFile = mRequest.getFile(formFileName);
         
         //원본파일명
         String oriFileName = mFile.getOriginalFilename();
         System.out.println("원본 파일명 : "+oriFileName);
         
         if(oriFileName != null && !oriFileName.equals("")) {
            
            //확장자 처리
            String ext = "";
            //뒤쪽에 있는 . 의 위치
            int index = oriFileName.lastIndexOf(".");
            if(index != -1) {
               //파일명에서 확장자명(.포함)을 추출
               ext = oriFileName.substring(index);
            }
            
            //파일 사이즈
            long fileSize = mFile.getSize();
            System.out.println("파일 사이즈 : "+fileSize);
            
            //고유한 파일명 만들기
            String saveFileName = "mlen-"+UUID.randomUUID().toString()+ext;
            System.out.println("저장할 파일명 : "+saveFileName);
                  
            //임시저장된 파일을 원하는 경로에 저장
            mFile.transferTo(new File(uploadDir + saveFileName));
            ImageVO img = new ImageVO();
            img.setBoardno(boardno);
            img.setFileOrlName(oriFileName);
            img.setFileSaveName(saveFileName);
            img.setTablename("food");
            adminService.insertImg(img);
         }
      }
      
      return mav;
   }
   
   
   // 19-01-14 khj foodDelete
   @GetMapping("/foodDel")
   @ResponseBody
   public int foodDelete(@RequestParam("no") String no) {
      System.out.println("AdminCon foodDel : "+no);
      
      int delNo = adminService.foodDelete(no);

      return delNo;
   }
   
   // 19-01-14 khj foodUpdate
   @GetMapping("/foodUpdate")
   public ModelAndView foodUpdate(@RequestParam("no") int no, @RequestParam("img") int imgNo) {
      System.out.println("foodNo : "+no);
      System.out.println("imgNo : "+imgNo);
      
      // board/pick/foodList 가져오기
      ModelAndView mav = boardController.foodDetailBoard(no, imgNo);
      mav.setViewName("admin/foodUpdate");
      
      return mav;
   }
   
   // 19-01-07 khj 
   @RequestMapping(value="/tour")
   public String tourBoard() {
      System.out.println("AdminController : /tourBoard");
      return "admin/tour";
   }
}