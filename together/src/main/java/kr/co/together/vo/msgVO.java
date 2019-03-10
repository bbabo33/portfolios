package kr.co.together.vo;

public class msgVO {
   // 번호
   private int no;

   // 보낸사람
   private String send;

   // 받은사람
   private String receive;

   // 받은시간
   private String receiveDate;
   private String receiveTime;
   private String roomno;
   private String profile;

   public msgVO(int no, String send, String receive, String receiveDate, String receiveTime, String roomno,
         String profile, String content) {
      super();
      this.no = no;
      this.send = send;
      this.receive = receive;
      this.receiveDate = receiveDate;
      this.receiveTime = receiveTime;
      this.roomno = roomno;
      this.profile = profile;
      this.content = content;
   }

   public String getProfile() {
      return profile;
   }

   public void setProfile(String profile) {
      this.profile = profile;
   }

   public String getRoomno() {
      return roomno;
   }

   public void setRoomno(String roomno) {
      this.roomno = roomno;
   }

   public msgVO(int no, String send, String receive, String receiveDate, String receiveTime, String roomno,
         String content) {
      super();
      this.no = no;
      this.send = send;
      this.receive = receive;
      this.receiveDate = receiveDate;
      this.receiveTime = receiveTime;
      this.roomno = roomno;
      this.content = content;
   }

   public String getReceiveTime() {
      return receiveTime;
   }

   public void setReceiveTime(String receiveTime) {
      this.receiveTime = receiveTime;
   }

   public msgVO(String receiveTime) {
      super();
      this.receiveTime = receiveTime;
   }

   @Override
   public String toString() {
      return "msgVO [no=" + no + ", send=" + send + ", receive=" + receive + ", receiveDate=" + receiveDate
            + ", receiveTime=" + receiveTime + ", roomno=" + roomno + ", profile=" + profile + ", content="
            + content + "]";
   }

   // 내용
   private String content;

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public String getSend() {
      return send;
   }

   public void setSend(String send) {
      this.send = send;
   }

   public String getReceive() {
      return receive;
   }

   public void setReceive(String receive) {
      this.receive = receive;
   }

   public String getReceiveDate() {
      return receiveDate;
   }

   public void setReceiveDate(String receiveDate) {
      this.receiveDate = receiveDate;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public msgVO() {
      super();
      // TODO Auto-generated constructor stub
   }
}