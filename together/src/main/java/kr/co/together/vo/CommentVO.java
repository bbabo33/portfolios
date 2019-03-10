package kr.co.together.vo;

public class CommentVO {
	// 번호
	private int no;

	// 글쓴이
	private String writer;

	// 내용
	private String content;
	
	// 분류
	private String tablename;

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public CommentVO(int no, String writer, String content, String tablename, int boardno, String regdate) {
		super();
		this.no = no;
		this.writer = writer;
		this.content = content;
		this.tablename = tablename;
		this.boardno = boardno;
		this.regdate = regdate;
	}

	// 게시판 번호 게시판 번호
	private int boardno;

	// 등록일
	private String regdate;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVO(int no, String writer, String content, int boardno, String regdate) {
		super();
		this.no = no;
		this.writer = writer;
		this.content = content;
		this.boardno = boardno;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", writer=" + writer + ", content=" + content + ", tablename=" + tablename
				+ ", boardno=" + boardno + ", regdate=" + regdate + "]";
	}
}
