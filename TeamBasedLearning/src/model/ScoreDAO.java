package model;

import static misc.JDBCConnection.connection;
import static misc.JDBCConnection.getConnection;
import static misc.JDBCConnection.pstmt;
import static misc.JDBCConnection.release;
import static misc.JDBCConnection.rs;

import java.sql.Date;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ScoreDAO {
	
	public static void saveScore(Date date, int team_ID, String exam, int mem_ID, String answer, String questionNo){
		Object ans[] = getScoreID(team_ID, exam, mem_ID, questionNo);

		int scor_ID = (Integer)ans[0];
		
		try{
			if(scor_ID == 0){ // Score doesn't exists, new entry in DB
				getConnection();
				String sql = "INSERT INTO SCORES (DATE, TEAM_ID, EXAM, MEM_ID, ANSWER_"+questionNo+") VALUES (?, ?, ?, ?, ?)";
				pstmt = connection.prepareStatement(sql);

				pstmt.setDate(1, date);
				pstmt.setInt(2, team_ID);
				pstmt.setString(3, exam);
				pstmt.setInt(4, mem_ID);
				pstmt.setString(5, answer);
				pstmt.executeUpdate();
				
			}else{ // Score exists, update entry in DB
				
				System.out.println("-- updating ...");
				
				getConnection();
				String sql = "UPDATE SCORES SET ANSWER_"+questionNo+" = ? WHERE SCOR_ID = ?";
				pstmt = connection.prepareStatement(sql);

				String temp = (String)ans[1];
				if(temp == null){
					temp = "";
				}else{
					temp = temp+",";
				}
				pstmt.setString(1, temp + answer); // ( a,b,c etc )
				pstmt.setInt(2, scor_ID);
				pstmt.executeUpdate();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
	}

	public static Object[] getScoreID(int team_ID, String exam, int mem_ID, String questionNo){
		Object answer[] = new Object[2];
		answer[0] = 0;
		answer[1] = null;
		try{
			getConnection();
			String sql = "SELECT SCOR_ID, ANSWER_"+questionNo+" FROM SCORES WHERE TEAM_ID = ? AND EXAM = ? AND MEM_ID = ?";
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, team_ID);
			pstmt.setString(2, exam);
			pstmt.setInt(3, mem_ID);

			rs = pstmt.executeQuery();

			if(rs.next()){
				answer[0] = rs.getInt(1);
				answer[1] = rs.getString(2);
			}
			System.out.println("---"+answer[0]+"--------"+answer[1]);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
		return answer;
	}

	public static String isNull(String string){
		if(string == null){
			return "";
		}else{
			return string;
		}
	}
	
	public static int getIndividualScore(String scr){
		if(scr == null){
			return 0;
		}else{
			return 5 - scr.split(",").length;
		}
	}
	
	public static JSONObject getAllAnswers(int team_ID, String exam, int mem_ID){
		JSONObject scoreDetails = new JSONObject();
		int scoreId = 0;
		try{
			getConnection();
			String sql = "SELECT SCOR_ID, ANSWER_1, ANSWER_2, ANSWER_3, ANSWER_4, ANSWER_5, ANSWER_6, ANSWER_7, ANSWER_8, ANSWER_9, ANSWER_10, IS_TEST_COMPLETED FROM SCORES WHERE TEAM_ID = ? AND EXAM = ? AND MEM_ID = ?";
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, team_ID);
			pstmt.setString(2, exam);
			pstmt.setInt(3, mem_ID);

			rs = pstmt.executeQuery();

			if(rs.next()){
				scoreId = rs.getInt(1);
				System.out.println("--------SCORE ID------"+scoreId);
				String ans1 = rs.getString(2);
				String ans2 = rs.getString(3);
				String ans3 = rs.getString(4);
				String ans4 = rs.getString(5);
				String ans5 = rs.getString(6);
				String ans6 = rs.getString(7);
				String ans7 = rs.getString(8);
				String ans8 = rs.getString(9);
				String ans9 = rs.getString(10);
				String ans10 = rs.getString(11);
				int isTestComplete = rs.getInt(12);
				
				System.out.println("score 1 === "+ans1);
				System.out.println("score 2 === "+ans2);
				System.out.println("score 3 === "+ans3);
				System.out.println("score 4 === "+ans4);
				System.out.println("score 5 === "+ans5);
				System.out.println("score 6 === "+ans6);
				System.out.println("score 7 === "+ans7);
				System.out.println("score 8 === "+ans8);
				System.out.println("score 9 === "+ans9);
				System.out.println("score 10 === "+ans10);
				System.out.println("isTestComplete === "+isTestComplete);

				scoreDetails.put("scoreId", scoreId);
				scoreDetails.put("ans1", ans1);
				scoreDetails.put("ans2", ans2);
				scoreDetails.put("ans3", ans3);
				scoreDetails.put("ans4", ans4);
				scoreDetails.put("ans5", ans5);
				scoreDetails.put("ans6", ans6);
				scoreDetails.put("ans7", ans7);
				scoreDetails.put("ans8", ans8);
				scoreDetails.put("ans9", ans9);
				scoreDetails.put("ans10", ans10);
				scoreDetails.put("isTestComplete", isTestComplete);
				
				if(isTestComplete == 1){
					scoreDetails.put("scores", getFinalScores(team_ID, exam, mem_ID));
				}
			}
			System.out.println("-Score Details--"+scoreDetails);
		}catch(SQLException e){
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			release();
		}
		return scoreDetails;

	}
	
	public static JSONObject getFinalScores(int team_ID, String exam, int mem_ID){
		JSONObject scoreDetails = new JSONObject();
		int scoreId = 0;
		try{
			getConnection();
			String sql = "SELECT SCOR_ID, ANSWER_1, ANSWER_2, ANSWER_3, ANSWER_4, ANSWER_5, ANSWER_6, ANSWER_7, ANSWER_8, ANSWER_9, ANSWER_10 FROM SCORES WHERE TEAM_ID = ? AND EXAM = ? AND MEM_ID = ?";
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, team_ID);
			pstmt.setString(2, exam);
			pstmt.setInt(3, mem_ID);

			rs = pstmt.executeQuery();

			if(rs.next()){
				scoreId = rs.getInt(1);
				System.out.println("--------SCORE ID------"+scoreId);
				int ans1 = getIndividualScore(rs.getString(2));
				int ans2 = getIndividualScore(rs.getString(3));
				int ans3 = getIndividualScore(rs.getString(4));
				int ans4 = getIndividualScore(rs.getString(5));
				int ans5 = getIndividualScore(rs.getString(6));
				int ans6 = getIndividualScore(rs.getString(7));
				int ans7 = getIndividualScore(rs.getString(8));
				int ans8 = getIndividualScore(rs.getString(9));
				int ans9 = getIndividualScore(rs.getString(10));
				int ans10 = getIndividualScore(rs.getString(11));
				System.out.println("score 1 === "+ans1);
				System.out.println("score 2 === "+ans2);
				System.out.println("score 3 === "+ans3);
				System.out.println("score 4 === "+ans4);
				System.out.println("score 5 === "+ans5);
				System.out.println("score 6 === "+ans6);
				System.out.println("score 7 === "+ans7);
				System.out.println("score 8 === "+ans8);
				System.out.println("score 9 === "+ans9);
				System.out.println("score 10 === "+ans10);
				
				int total = ans1+ans2+ans3+ans4+ans5+ans6+ans7+ans8+ans9+ans10;
				
				System.out.println("TOTAL === "+total);
				
				scoreDetails.put("score1", ans1);
				scoreDetails.put("score2", ans2);
				scoreDetails.put("score3", ans3);
				scoreDetails.put("score4", ans4);
				scoreDetails.put("score5", ans5);
				scoreDetails.put("score6", ans6);
				scoreDetails.put("score7", ans7);
				scoreDetails.put("score8", ans8);
				scoreDetails.put("score9", ans9);
				scoreDetails.put("score10", ans10);
				
				scoreDetails.put("scoreId", scoreId);
				scoreDetails.put("score", total);
				
			}
			System.out.println("-scoreId--"+scoreDetails);
		}catch(SQLException e){
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			release();
		}
		return scoreDetails;
	}
	
	public static JSONObject updateFinalScore(int team_ID, String exam, int mem_ID, Date date){
		JSONObject scoreDetails = getFinalScores(team_ID, exam, mem_ID);
		
		int scor_ID = 0;
		int scores = 0;
		if(scoreDetails.length() != 0){
			try {
				scor_ID = scoreDetails.getInt("scoreId");
				scores = scoreDetails.getInt("score");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		try{
			if(scor_ID == 0){ // Score doesn't exists, new entry in DB
				getConnection();
				String sql = "INSERT INTO SCORES (SCORE, DATE, TEAM_ID, EXAM, MEM_ID) VALUES (?, ?, ?, ?, ?)";
				pstmt = connection.prepareStatement(sql);

				pstmt.setInt(1, 0);
				pstmt.setDate(2, date);
				pstmt.setInt(3, team_ID);
				pstmt.setString(4, exam);
				pstmt.setInt(5, mem_ID);
				pstmt.executeUpdate();
				
			}else{ // Score exists, update entry in DB
				
				System.out.println("-- updating ...");
				
				getConnection();
				String sql = "UPDATE SCORES SET SCORE = ?,IS_TEST_COMPLETED = 1 WHERE SCOR_ID = ?";
				pstmt = connection.prepareStatement(sql);

				pstmt.setInt(1, scores);
				pstmt.setInt(2, scor_ID);
				pstmt.executeUpdate();
				
				System.out.println("-- updation complete ...");
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			release();
		}
		return scoreDetails;
	}	

	public static JSONArray getTeamMembers(int team_ID){
		JSONArray teamDetails = new JSONArray();
		try{
			getConnection();
			String sql = "SELECT MEM_ID, ROLE, FIRSTNAME, LASTNAME FROM MEMBERS WHERE TEAM_ID = ?";
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, team_ID);

			rs = pstmt.executeQuery();

			while(rs.next()){
				
				JSONObject member = new JSONObject();
				member.put("memId", rs.getInt(1));
				member.put("role", rs.getString(2));
				member.put("firstName", rs.getString(3));
				member.put("lastName", rs.getString(4));
				
				teamDetails.put(member);
			}
			System.out.println("member details: "+teamDetails);
		}catch(SQLException e){
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			release();
		}
		return teamDetails;
	}

}
