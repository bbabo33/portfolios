package kr.co.project.userVO;

public class UserVO {

	private String id;
	private String name;
	private String pw;
	private int age;
	private String joinDate;
	
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVO(String id, String name, String pw, int age, String joinDate) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.age = age;
		this.joinDate = joinDate;
	}
	
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", pw=" + pw + ", age=" + age + ", joinDate=" + joinDate + "]";
	}
	
	
	
	
	
}
