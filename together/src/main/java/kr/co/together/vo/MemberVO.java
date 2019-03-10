package kr.co.together.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class MemberVO {

	private String email;
	private String password;
	private String name;
	private String country;
	private String gender;
	private String[] interest;	//웹에서 checkBox 배열받기
	private String inter;		//interest -> inter로 바꿔서 DB넣는 용도
	private String type;
	private String joinDate;
	private String profileImg; // 19-01-03 김현주 수정 : 프로필 이미지 추가 	
	
	public String[] getInterest() {
		return interest;
	}

	public void setInterest(String[] interest) {
		this.interest = interest;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCountry() {
		return country;
	}
	
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getInter() {
		return inter;
	}
	
	public void setInter(String inter) {
		this.inter = inter;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getJoinDate() {
		return joinDate;
	}
	
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", password=" + password + ", name=" + name + ", country=" + country
				+ ", gender=" + gender + ", interest=" + Arrays.toString(interest) + ", inter=" + inter + ", type="
				+ type + ", joinDate=" + joinDate + ", profileImg=" + profileImg + "]";
	}

}
