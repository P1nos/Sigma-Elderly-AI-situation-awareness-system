package com.test;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {

	DataSource dataSource;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public memberDAO() {
		try {
			// Class.forName(dirver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 가입 메소드
	public void member_insert(String id, String password, String name, String phone_number, String email, int age,
			int height, int weight, String bloodtype, String carrier_disease) {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(
					"insert into member(Id, Password, Name, Phone_Number, Email, Age, Height, Weight, Bloodtype, Carrier_disease) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, phone_number);
			pstmt.setString(5, email);
			pstmt.setInt(6, age);
			pstmt.setInt(7, height);
			pstmt.setInt(8, weight);
			pstmt.setString(9, bloodtype);
			pstmt.setString(10, carrier_disease);

			int cntrs = pstmt.executeUpdate();
			if (cntrs < 1)
				throw new Exception("sql 오류");
		} catch (SQLException ex) {
			System.out.println("sql exception: " + ex);
		} catch (Exception ex) {
			System.out.println("sql exception: " + ex);
		} finally {

			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}
	
	// 회원 확인 메소드
	public int select_user(String id, String password) {


		try {
			// con = DriverManager.getConnection(url, id, pw);
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
			con = dataSource.getConnection();
			System.out.println("DAO id : "+id + " pwd : "+password);
			String sql_select = "select * from member where  Id = '" + id + "' and Password = '" + password + "'";
			// String sql_select = "select * from tblbook where rentalinformation = '0' and
			// "+value+" = '"+book_select+"'"; // 대여 가능만 표시
			pstmt = con.prepareStatement(sql_select);
			rs = pstmt.executeQuery(sql_select);
			
			while (rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	// id 중복 확인 메소드
	public int select_id(String id) {


		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
			con = dataSource.getConnection();
			String sql_select = "select id from member where  Id = '" + id + "'";
			pstmt = con.prepareStatement(sql_select);
			rs = pstmt.executeQuery(sql_select);
			
			while (rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int update_password(String id, String pw) {


		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
			con = dataSource.getConnection();
			String sql_update = "UPDATE member SET Password = ? WHERE Id = ?";
			pstmt = con.prepareStatement(sql_update);
			pstmt.setString(1, pw);
		    pstmt.setString(2, id);
		    
			int cntrs = pstmt.executeUpdate();
			
			if(cntrs < 1) {
				throw new Exception("sql 오류");
			}
			else {
				System.out.println("pstmt.executeQuery() : " + rs);
				
				return 1;
			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

}
