package kr.co.together.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class MatchingVO {
   
   private int no;                 // 글번호
   private String title;		   // 작성자
   private String writer;          // 게시자
   private String matchingMsg;     // 메시지
   private String matchingTime;    // 만나는 시간
   private String matchingDate;    // 만나는 날짜
   private String[] language;      // 가능언어 배열
   private String languages;       // DB 넣을 때 가능언어 str
   private String remarks;         // 특이사항(채식유무)
   private String korLocations;    // 한글주소들
   private String engLocations;    // 영문주소들
   private String regDate;         // 등록날짜
   private String email;		   // DB에서 작성자 정보를 가져오기 위한 변수
   private MemberVO member;		   // 게시자 정보를 담기 위한 객체
   
   public String[] getLanguage() {
      return language;
   }

   public void setLanguage(String[] language) {
      this.language = language;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public int getNo() {
      return no;
   }
   
   public void setNo(int no) {
      this.no = no;
   }
   
   public String getWriter() {
      return writer;
   }
   
   public void setWriter(String writer) {
      this.writer = writer;
   }
   
   public String getMatchingMsg() {
      return matchingMsg;
   }
   
   public void setMatchingMsg(String matchingMsg) {
      this.matchingMsg = matchingMsg;
   }
   
   public String getMatchingTime() {
      return matchingTime;
   }
   
   public void setMatchingTime(String matchingTime) {
      this.matchingTime = matchingTime;
   }
   
   public String getMatchingDate() {
      return matchingDate;
   }
   
   public void setMatchingDate(String matchingDate) {
      this.matchingDate = matchingDate;
   }
   
   public String getLanguages() {
      return languages;
   }
   
   public void setLanguages(String languages) {
      this.languages = languages;
   }
   
   public String getRemarks() {
      return remarks;
   }
   
   public void setRemarks(String remarks) {
      this.remarks = remarks;
   }
   
   public String getKorLocations() {
      return korLocations;
   }
   
   public void setKorLocations(String korLocations) {
      this.korLocations = korLocations;
   }
   
   public String getEngLocations() {
      return engLocations;
   }
   
   public void setEngLocations(String engLocations) {
      this.engLocations = engLocations;
   }
   
   public String getRegDate() {
      return regDate;
   }

   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }

   public String getEmail() {
	   return email;
   }

	public void setEmail(String email) {
		this.email = email;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "MatchingVO [no=" + no + ", title=" + title + ", writer=" + writer + ", matchingMsg=" + matchingMsg
				+ ", matchingTime=" + matchingTime + ", matchingDate=" + matchingDate + ", language="
				+ Arrays.toString(language) + ", languages=" + languages + ", remarks=" + remarks + ", korLocations="
				+ korLocations + ", engLocations=" + engLocations + ", regDate=" + regDate + ", email=" + email
				+ ", member=" + member + "]";
	}

}