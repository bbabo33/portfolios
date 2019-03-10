package kr.co.PetSitter.vo;

public class DolbomVO {

	private String no; //예약번호
	private String toilet;
	private String food;
	private String play;
	private String needs;
	private String walk;
	private String remark;
	private String dolbomDate;
	private String chgStatus;
	
	public String getChgStatus() {
		return chgStatus;
	}
	public void setChgStatus(String chgStatus) {
		this.chgStatus = chgStatus;
	}
	public String getDolbomDate() {
		return dolbomDate;
	}
	public void setDolbomDate(String dolbomDate) {
		this.dolbomDate = dolbomDate;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getToilet() {
		return toilet;
	}
	public void setToilet(String toilet) {
		this.toilet = toilet;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getPlay() {
		return play;
	}
	public void setPlay(String play) {
		this.play = play;
	}
	public String getNeeds() {
		return needs;
	}
	public void setNeeds(String needs) {
		this.needs = needs;
	}
	public String getWalk() {
		return walk;
	}
	public void setWalk(String walk) {
		this.walk = walk;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Override
	public String toString() {
		return "DolbomVO [no=" + no + ", toilet=" + toilet + ", food=" + food + ", play=" + play + ", needs=" + needs
				+ ", walk=" + walk + ", remark=" + remark + ", dolbomDate=" + dolbomDate + "]";
	}
	
}
