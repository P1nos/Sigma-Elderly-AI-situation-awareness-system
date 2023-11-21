package com.test;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class calendarDAO {

	DataSource dataSource;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public calendarDAO() {
		try {
			// Class.forName(dirver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> select_days(String id) {
		
		ArrayList<String> filetimeList = new ArrayList<>();
		try {
			// con = DriverManager.getConnection(url, id, pw);
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
			con = dataSource.getConnection();
			String sql_select = "select filetime from images where  id = '" + id + "'";
			// String sql_select = "select * from tblbook where rentalinformation = '0' and
			// "+value+" = '"+book_select+"'"; // 대여 가능만 표시
			pstmt = con.prepareStatement(sql_select);
			rs = pstmt.executeQuery(sql_select);
			
			
			while (rs.next()) {
				String filetime = rs.getString(1);
		        filetimeList.add(filetime); // ArrayList에 filetime 추가
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
		return filetimeList;
	}
	

}
