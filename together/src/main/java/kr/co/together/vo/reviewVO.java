package kr.co.together.vo;

public class reviewVO {
	// 글번호 
    private int no;
    // 글쓴이 
    private String writer;
    // 제목 
    private String title;
    // 내용 
    private String content;
    // 등록일 
    private String regDate;
    // 조회수 
    private int viewCnt;
    // 댓글수 
    private int commentCnt;
    
    private String email;
    
    private MemberVO member;
    
    public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public reviewVO(int no, String writer, String title, String content, String regDate, int viewCnt, int commentCnt,
			String email, MemberVO memberVO) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
		this.commentCnt = commentCnt;
		this.email = email;
		this.member = memberVO;
	}
	
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO memberVO) {
		this.member = memberVO;
	}
	public reviewVO(int no, String writer, String title, String content, String regDate, int viewCnt, int commentCnt,
			MemberVO memberVO) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
		this.commentCnt = commentCnt;
		this.member = memberVO;
	}
	public reviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "reviewVO [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", viewCnt=" + viewCnt + ", commentCnt=" + commentCnt + ", email=" + email + ", memberVO="
				+ member + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
}
