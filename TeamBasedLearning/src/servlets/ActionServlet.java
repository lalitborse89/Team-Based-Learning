package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.ChatDAO;
import model.ScoreDAO;
import model.beans.MessageBean;

/**
 * Servlet implementation class ActionServlet
 */
@WebServlet("/ActionServlet")
public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("action");
		
		if(action == null){
			action = "";
		}
		
		if(action.equals("answerAttempted")){
			int memId = Integer.parseInt(request.getParameter("memId"));
			int teamId = Integer.parseInt(request.getParameter("teamId"));
			String questionNo = request.getParameter("qNo");
			String option = request.getParameter("option");
			
			System.out.println("Q - "+questionNo+" opt - "+option);
			
			//Date date = new Date(0);
			
			SimpleDateFormat sdf = new SimpleDateFormat(
				    "yyyy-MM-dd");
				int year = 2014;
				int month = 10;
				int day = 31;
				Calendar cal = Calendar.getInstance();
				cal.set(Calendar.YEAR, year);
				cal.set(Calendar.MONTH, month - 1); // <-- months start
				                                    // at 0.
				cal.set(Calendar.DAY_OF_MONTH, day);

				java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
				System.out.println(sdf.format(date));
			
			ScoreDAO.saveScore(date, teamId, "CSI 107", memId, option, questionNo);
			out.println("SUCCESS");
			// call the method which inserts score into the score columns in a comma seperated fashion
			
		}else if(action.equals("completeTest")){
			// set the test complete flag and then redirect to a new page
			int memId = Integer.parseInt(request.getParameter("memId"));
			int teamId = Integer.parseInt(request.getParameter("teamId"));
			SimpleDateFormat sdf = new SimpleDateFormat(
				    "yyyy-MM-dd");
				int year = 2014;
				int month = 10;
				int day = 31;
				Calendar cal = Calendar.getInstance();
				cal.set(Calendar.YEAR, year);
				cal.set(Calendar.MONTH, month - 1); // <-- months start
				                                    // at 0.
				cal.set(Calendar.DAY_OF_MONTH, day);

				java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
				System.out.println(sdf.format(date));
				
			JSONObject scoreObj = ScoreDAO.updateFinalScore(teamId, "CSI 107", memId, date);
			response.setContentType("application/json");
	        out.write(scoreObj+"");
		}else if(action.equals("sendMessage")){
			String message = request.getParameter("message");
			int memId = Integer.parseInt(request.getParameter("memId"));
			int teamId = Integer.parseInt(request.getParameter("teamId"));
			System.out.println("MESSAGE - "+message);
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = 
			     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			System.out.println("===>"+currentTime);
		    
			MessageBean mb = new MessageBean();
			mb.setMem_ID(memId);
			mb.setTeam_ID(teamId);
			mb.setMessage(message);
			mb.setTimestamp(currentTime);
			JSONObject jo = ChatDAO.saveMessage(mb);
			response.setContentType("application/json");
	        out.write(jo+"");
		}else if(action.equals("getAnswers")){
			int memId = Integer.parseInt(request.getParameter("memId"));
			int teamId = Integer.parseInt(request.getParameter("teamId"));
			System.out.println("############-----#### "+memId);
			JSONObject answers = ScoreDAO.getAllAnswers(teamId, "CSI 107", memId);
	        response.setContentType("application/json");
	        out.write(answers+"");
		}else if(action.equals("getMessages")){
			int teamId = Integer.parseInt(request.getParameter("teamId"));
			JSONArray messages = ChatDAO.retrieveMessages(teamId);
	        response.setContentType("application/json");
	        out.write(messages+"");
		}else if(action.equals("getTeamMembers")){
			int teamId = Integer.parseInt(request.getParameter("teamId"));
			JSONArray memberDetails = ScoreDAO.getTeamMembers(teamId);
	        response.setContentType("application/json");
	        out.write(memberDetails+"");
		}else{
			response.sendRedirect(getServletContext().getContextPath()+"/jsp/home.jsp");
		}
		
	}

}
