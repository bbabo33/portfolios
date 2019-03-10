package kr.co.PetSitter.vo;

public class ReviewVO {

	private String no;
	private String title;
	private String good;
	private String bad;
	private String oriPic;
	private String serPic;
	private String reviewDate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getBad() {
		return bad;
	}
	public void setBad(String bad) {
		this.bad = bad;
	}
	public String getOriPic() {
		return oriPic;
	}
	public void setOriPic(String oriPic) {
		this.oriPic = oriPic;
	}
	public String getSerPic() {
		return serPic;
	}
	public void setSerPic(String serPic) {
		this.serPic = serPic;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [no=" + no + ", good=" + good + ", bad=" + bad + ", oriPic=" + oriPic + ", serPic=" + serPic
				+ ", reviewDate=" + reviewDate + "]";
	}
	
}
