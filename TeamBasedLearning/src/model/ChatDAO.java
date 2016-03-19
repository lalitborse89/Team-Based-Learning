package model;

import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.beans.MessageBean;
import static misc.JDBCConnection.*;
public class ChatDAO {

	public static JSONObject saveMessage(MessageBean mb){
		JSONObject jo = new JSONObject();
		try{
			getConnection();
			String sql = "INSERT INTO MESSAGES (MEM_ID, TEAM_ID, MESSAGE, TIMESTAMP) VALUES (?, ?, ?, ?)";
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, mb.getMem_ID());
			pstmt.setInt(2, mb.getTeam_ID());
			pstmt.setString(3, mb.getMessage());
			pstmt.setString(4, mb.getTimestamp());
			
			pstmt.executeUpdate();
			
			try {
				jo.put("memId", mb.getMem_ID());
				jo.put("teamId", mb.getTeam_ID());
				jo.put("message", mb.getMessage());
				jo.put("time", mb.getTimestamp());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
		return jo;
	}
	
	public static JSONArray retrieveMessages(int team_ID){
		JSONArray ja = new JSONArray();
		
		try{
			getConnection();
			String sql = "SELECT mem.MEM_ID, FIRSTNAME, MESSAGE, TIMESTAMP FROM MESSAGES as msg LEFT JOIN members as mem on msg.MEM_ID = mem.MEM_ID WHERE msg.TEAM_ID = ? ORDER BY TIMESTAMP";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, team_ID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				JSONObject jo = new JSONObject();
				try {
					jo.put("memId", rs.getInt(1));
					jo.put("name", rs.getString(2));
					jo.put("teamId", team_ID);
					jo.put("message", rs.getString(3));
					jo.put("time", rs.getString(4));
				} catch (JSONException e) {
					e.printStackTrace();
				}
				ja.put(jo);				
			}
			System.out.println("message ARRAY - "+ja);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
		return ja;
	}
	
}
