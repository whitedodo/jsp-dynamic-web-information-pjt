/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: SqlMapSessionFactory.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SqlMapSessionFactory {

	private static SqlMapSessionFactory factory = new SqlMapSessionFactory();
	
	private final String oracleDriver = "oracle.jdbc.driver.OracleDriver";

	private final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	private final String userid = "hr";
	private final String passwd = "1234";
	
	public SqlMapSessionFactory() {}
	
	public static SqlMapSessionFactory getInstance() {
		return factory;
	}
	
	public Connection connect() {
		
		Connection conn = null;
		
		try {
			Class.forName(oracleDriver);
			conn = DriverManager.getConnection(jdbcURL, userid, passwd);
					
		}
		catch(Exception ex) {
			System.out.println("오류 발생: " + ex);
		}
		
		return conn;
		
	}
	
	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		
		if ( rs != null ) {
			try {
				rs.close();
			}
			catch(Exception ex) {
				System.out.println("오류 발생: " + ex);
			}
		
			close(conn, ps);
			
		}
	}
	
	public void close(Connection conn, PreparedStatement ps) {
		
		if (ps != null ) {
			try {
				ps.close();
			}
			catch(Exception ex) {
				System.out.println("오류 발생: " + ex);
			}
		}
		
		if (conn != null ) {
			try {
				conn.close();
			}
			catch(Exception ex) {
				System.out.println("오류 발생: " + ex);
			}
		}
		
	}
	
	
}
