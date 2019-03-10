package kr.co.PetSitter.vo;

public class UserVO {

	private String id;
	private String name;
	private String password;
	private String addr;
	private String detailAddr;
	private String phone;
	private String pet;
	private String joinDate;
	private String type;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getDetailAddr() {
		return detailAddr;
	}
	
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	public String getPet() {
		return pet;
	}
	
	public void setPet(String pet) {
		this.pet = pet;
	}
	
	public String getJoinDate() {
		return joinDate;
	}
	
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", password=" + password + ", addr=" + addr + ", detailAddr="
				+ detailAddr + ", phone=" + phone + ", pet=" + pet
				+ ", joinDate=" + joinDate + ", type=" + type + "]";
	}
	
}
