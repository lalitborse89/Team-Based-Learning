package model;

import static misc.JDBCConnection.connection;
import static misc.JDBCConnection.getConnection;
import static misc.JDBCConnection.pstmt;
import static misc.JDBCConnection.release;
import static misc.JDBCConnection.rs;

import java.sql.SQLException;

public class LoginDAO {
	public static int checkUserDetails(String username, String password){
		
		int ID = 0;
		String role = getUserRole(username, password);
		try{
			
			getConnection();

			String sql = "SELECT MEM_ID FROM members WHERE NETID = ? AND PASSWORD = ? AND ROLE = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, role);

			rs = pstmt.executeQuery();

			if(rs.next()){
				ID = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
		return ID;
	}
	
	public static int getTeamCount(){

		int count = 0;
		try{
			getConnection();
			String sql = "SELECT count(distinct TEAM_ID) from MEMBERS where role in ('student','lead')";

			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()){
				count = rs.getInt(1);
				  // System.out.println("numberOfRows= " + count);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			release();
		}
		return count;
	}

	public static String getUserRole(String username, String password){

		String role = null;
		try{
			getConnection();
			String sql = "SELECT ROLE FROM members WHERE NETID = ? AND PASSWORD = ?";

			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if(rs.next()){
				role = rs.getString(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
		return role;
	}
	public static User getDetails(int ID){
		User u = null;
		try{
			getConnection();
			String sql = "SELECT NETID, TEAM_ID, ROLE FROM members WHERE MEM_ID = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();

			if(rs.next()){
				u = new User();
				u.setMem_ID(ID);
				u.setNETID(rs.getString(1));
				u.setTeam_ID(rs.getInt(2));
				u.setRole(rs.getString(3));
			}
			sql = "SELECT EXAM FROM scores WHERE MEM_ID = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();

			if(rs.next()){
				u.setExam(rs.getString(1));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
		return u;
	}
}
