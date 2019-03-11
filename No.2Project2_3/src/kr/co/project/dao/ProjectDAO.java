package kr.co.project.dao;

import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.project.chatpro.GoChat;
import kr.co.project.userVO.UserVO;
import kr.co.project.util.ProjectGetConnection;

public class ProjectDAO {

	ProjectGetConnection getConn;
	UserVO vo;
	Connection conn;
	PreparedStatement pstmt;
	
	ProjectDAO(){}
	
	public ProjectDAO(UserVO vo){
		
		this.vo=vo;
		getConn=new ProjectGetConnection();
		
	}
	
	public boolean checkAdmin() {
		
		boolean flag=false;
		String id=vo.getId();
		String pw=vo.getPw();
		
		try {
			String query="select * from admin_tbl where id= ? and pw= ?";
			conn = getConn.getConn();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println(rs.getString("NAME")+"님 반갑습니다.");
			}else {
				System.out.println("회원님의 정보가 존재하지 않습니다.");
				return false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		flag=true;
		return flag;
	}
	
	public void searchAll() {
		try {
			String query="select * from user_tbl";
			conn=getConn.getConn();
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			int i=1;
			
			System.out.println();
			System.out.println("<< 전체 회원을 조회합니다. >>");
			System.out.println();
			
			while(rs.next()) {
				System.out.println("회원번호 "+ i);
				System.out.println("[아이디]"+ rs.getString("id"));
				System.out.println("[이름]"+rs.getString("name"));
				System.out.println("[패스워드]"+rs.getString("pw"));
				System.out.println("[나이]"+rs.getString("age"));
				System.out.println("[가입날짜]"+rs.getString("joindate"));
				System.out.println("");
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void insertVO() {
		
		String id=vo.getId();
		String name=vo.getName();
		String pw=vo.getPw();
		int age=vo.getAge();
		String joinDate=vo.getJoinDate();
		
		try {
			String query="insert into user_tbl values(?,?,?,?,?)";
			pstmt=getConn.getConn().prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, pw);
			pstmt.setInt(4, age);
			pstmt.setString(5, joinDate);
			int i=pstmt.executeUpdate();
			
			if(i != 0) {
				System.out.println(i+"건의 데이터를 입력완료 하였습니다.");
			}else {
				System.out.println("데이터 입력에 실패하였습니다.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	public void checkLogin() {
		
		String id=vo.getId();
		String pw=vo.getPw();
		
		try {
			String query="select * from user_tbl where id= ? and pw= ?";
			pstmt=getConn.getConn().prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String name=rs.getString("NAME");
				System.out.println(name+"님 반갑습니다.");
				new GoChat(name).execute();
				
			}else {
				System.out.println("회원님의 정보가 존재하지 않습니다.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
