package kr.co.together.vo;

import java.util.Arrays;

public class FoodVO {
   
   private int no;            // 글번호
   private String name;      // 상호명
   private String address;      // 영어주소
   private String kAddress;   // 한국주소
   private String tel1;      // 전화번호
   private String tel2;      // 전화번호
   private String tel3;      // 전화번호
   private String tel;         // 전화번호,  tel1-tel2-tel3 하나로 합쳐서 DB넣는 용도
   private String openTime;   // 영업개시
   private String closeTime;   // 영업마감
   private String[] off;      // 휴무일,  웹에서 checkBox 배열받기
   private String offday;      // 휴무일,  off -> offday로 바꿔서 DB넣는 용도
   private String cate;      // 카테고리(한식, 분식, 고기)
   private String content;      // 내용
   private String food;      // 대표메뉴
   private String regDate;      // 등록일
   private String viewCnt;      // 조회수
   
   
   public String getkAddress() {
      return kAddress;
   }

   public void setkAddress(String kAddress) {
      this.kAddress = kAddress;
   }

   public int getNo() {
      return no;
   }
   
   public void setNo(int no) {
      this.no = no;
   }
   
   public String getName() {
      return name;
   }
   
   public void setName(String name) {
      this.name = name;
   }
   
   public String getAddress() {
      return address;
   }
   
   public void setAddress(String address) {
      this.address = address;
   }
   
   public String getTel1() {
      return tel1;
   }
   
   public void setTel1(String tel1) {
      this.tel1 = tel1;
   }
   
   public String getTel2() {
      return tel2;
   }
   
   public void setTel2(String tel2) {
      this.tel2 = tel2;
   }
   
   public String getTel3() {
      return tel3;
   }
   
   public void setTel3(String tel3) {
      this.tel3 = tel3;
   }
   
   public String getTel() {
      return tel;
   }
   
   public void setTel(String tel) {
      this.tel = tel;
   }
   
   public String getOpenTime() {
      return openTime;
   }
   
   public void setOpenTime(String openTime) {
      this.openTime = openTime;
   }
   
   public String getCloseTime() {
      return closeTime;
   }
   
   public void setCloseTime(String closeTime) {
      this.closeTime = closeTime;
   }
   
   public String[] getOff() {
      return off;
   }
   
   public void setOff(String[] off) {
      this.off = off;
   }

   public String getOffday() {
      return offday;
   }

   public void setOffday(String offday) {
      this.offday = offday;
   }

   public String getCate() {
      return cate;
   }

   public void setCate(String cate) {
      this.cate = cate;
   }
   
   public String getContent() {
      return content;
   }
   
   public void setContent(String content) {
      this.content = content;
   }
   
   public String getFood() {
      return food;
   }

   public void setFood(String food) {
      this.food = food;
   }
   
   public String getRegDate() {
      return regDate;
   }

   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }

   public String getViewCnt() {
      return viewCnt;
   }

   public void setViewCnt(String viewCnt) {
      this.viewCnt = viewCnt;
   }

   @Override
   public String toString() {
      return "FoodVO [no=" + no + ", name=" + name + ", address=" + address + ", kAddress=" + kAddress + ", tel1="
            + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", tel=" + tel + ", openTime=" + openTime
            + ", closeTime=" + closeTime + ", off=" + Arrays.toString(off) + ", offday=" + offday + ", cate=" + cate
            + ", content=" + content + ", food=" + food + ", regDate=" + regDate + ", viewCnt=" + viewCnt + "]";
   }

}