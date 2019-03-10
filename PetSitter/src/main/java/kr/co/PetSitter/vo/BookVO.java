package kr.co.PetSitter.vo;

public class BookVO {

	public String no; //예약번호
	public String bookLocation;	//예약주소
	public String bookingDate;	//예약날짜
	public String bookServiceTime;	//이용시간
	public String bookingPhone;	//전화번호
	public String bookingName;	//예약자명
	public String bookingInfo;	//특이사항
	public String bookStatus;	//예약상황
	public String bookingId;	//예약아이디
	public String rollDate;		//등록날짜
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getBookLocation() {
		return bookLocation;
	}
	public void setBookLocation(String bookLocation) {
		this.bookLocation = bookLocation;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getBookServiceTime() {
		return bookServiceTime;
	}
	public void setBookServiceTime(String bookServiceTime) {
		this.bookServiceTime = bookServiceTime;
	}
	public String getBookingPhone() {
		return bookingPhone;
	}
	public void setBookingPhone(String bookingPhone) {
		this.bookingPhone = bookingPhone;
	}
	public String getBookingName() {
		return bookingName;
	}
	public void setBookingName(String bookingName) {
		this.bookingName = bookingName;
	}
	public String getBookingInfo() {
		return bookingInfo;
	}
	public void setBookingInfo(String bookingInfo) {
		this.bookingInfo = bookingInfo;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
	public String getRollDate() {
		return rollDate;
	}
	public void setRollDate(String rollDate) {
		this.rollDate = rollDate;
	}
	@Override
	public String toString() {
		return "BookVO [no=" + no + ", bookLocation=" + bookLocation + ", bookingDate=" + bookingDate
				+ ", bookServiceTime=" + bookServiceTime + ", bookingPhone=" + bookingPhone + ", bookingName="
				+ bookingName + ", bookingInfo=" + bookingInfo + ", bookStatus=" + bookStatus + ", bookingId="
				+ bookingId + ", rollDate=" + rollDate + "]";
	}
	
}
