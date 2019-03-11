package kr.co.project.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ProjectGetConnection {

	public Connection getConn() throws Exception {
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.5:1521:xe", "hr", "hr");
	
			return conn;
	}	
}
