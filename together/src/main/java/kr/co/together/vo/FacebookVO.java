package kr.co.together.vo;

import org.springframework.stereotype.Component;

@Component
public class FacebookVO {

	private String id;
	private String email;
	private String name;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "FacebookVO [id=" + id + ", email=" + email + ", name=" + name + "]";
	}
	
}
