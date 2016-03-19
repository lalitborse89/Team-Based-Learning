package misc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCConnection {

	public static Connection connection;
	public static PreparedStatement pstmt;
	public static ResultSet rs;

	public static void getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/scratchcard", "root", "");
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(ClassNotFoundException c){
			c.printStackTrace();
		}
	}

	public static void release(){
		try{
			if(connection != null){
				connection.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			if(rs != null){
				rs.close();
			}
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
