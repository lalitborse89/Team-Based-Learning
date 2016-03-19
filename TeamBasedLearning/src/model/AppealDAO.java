package model;

import static misc.JDBCConnection.*;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class AppealDAO {

	public static int insertintoAppeal(String Username,String Comment)
	{

		int x=0;
		try{

			getConnection();     

			PreparedStatement ps;
			String insertTableSQL = "insert into appeal (username,Appeal) VALUES (?,?)";
			ps = connection.prepareStatement(insertTableSQL);

			ps.setString(1, Username);
			ps.setString(2, Comment);


			if(ps.executeUpdate()==0);
			//newUser =0;
			{ System.out.println("Record is inserted into USER table!");
			x=1;
			}

			ps.close();

		}catch(SQLException se){

			//Handle errors for JDBC

			se.printStackTrace();

		}catch(Exception e){

			//Handle errors for Class.forName

			e.printStackTrace();

		}

		return x; 

	}

}
