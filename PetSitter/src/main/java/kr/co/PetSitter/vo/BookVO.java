package kr.co.PetSitter.vo;

public class BookVO {

	public String no; //�����ȣ
	public String bookLocation;	//�����ּ�
	public String bookingDate;	//���೯¥
	public String bookServiceTime;	//�̿�ð�
	public String bookingPhone;	//��ȭ��ȣ
	public String bookingName;	//�����ڸ�
	public String bookingInfo;	//Ư�̻���
	public String bookStatus;	//�����Ȳ
	public String bookingId;	//������̵�
	public String rollDate;		//��ϳ�¥
	
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
