package kr.co.together.vo;

public class ImageVO {
	// 踰덊샇 
    private int no;

    // �뙆�씪 湲곗〈紐� 
    private String fileOrlName;

    // �뙆�씪 ���옣紐� 
    private String fileSaveName;

    // 寃뚯떆�뙋 踰덊샇 
    private int boardno;

    // �뀒�씠釉붿씠由� to_review_tbl
    private String tablename;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFileOrlName() {
		return fileOrlName;
	}

	public void setFileOrlName(String fileOrlName) {
		this.fileOrlName = fileOrlName;
	}

	public String getFileSaveName() {
		return fileSaveName;
	}

	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public ImageVO(int no, String fileOrlName, String fileSaveName, int boardno, String tablename) {
		super();
		this.no = no;
		this.fileOrlName = fileOrlName;
		this.fileSaveName = fileSaveName;
		this.boardno = boardno;
		this.tablename = tablename;
	}

	@Override
	public String toString() {
		return "imageVO [no=" + no + ", fileOrlName=" + fileOrlName + ", fileSaveName=" + fileSaveName + ", boardno="
				+ boardno + ", tablename=" + tablename + "]";
	}

	public ImageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
    	
}
