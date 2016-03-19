package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import model.LoginDAO;
import model.User;
/**
 * Servlet implementation class LoginCon
 */
@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCon() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		String loggedIn = "false";
		String url = null;
		String username= request.getParameter("name");
		String password=request.getParameter("pass");
		//String role = request.getParameter("role");
		if(username == null || username.equals("")){
			request.setAttribute("errormsg", "Username can not be empty");
			if(password == null || password.equals("")){
				request.setAttribute("errormsg", "User and Password can not be Empty..!!");
			}
			url = "/jsp/login.jsp";
		}
		else if(password == null || password.equals("")){
			request.setAttribute("errormsg", "Password can not be Empty..!!");
			url = "/jsp/login.jsp";

		}
	
		else {
			int ID = model.LoginDAO.checkUserDetails(username, password);

			if (ID == 0) {
				request.setAttribute("errormsg", " Username and Password does not Match..!!");
				url = "/jsp/login.jsp";
			}
			else{
				loggedIn = "true";
				session.setAttribute("loggedIn", loggedIn);
				User u = LoginDAO.getDetails(ID);
				int count = LoginDAO.getTeamCount();
				//System.out.println("count "+count);
				session.setAttribute("User", u);
				session.setAttribute("Count", count);
				if(u.getRole().equalsIgnoreCase("student") || u.getRole().equalsIgnoreCase("lead")){
					url = "/jsp/home.jsp";
				}else if(u.getRole().equalsIgnoreCase("professor")){
					url = "/jsp/professor.jsp";
				}
			}
		}
		response.sendRedirect(getServletContext().getContextPath()+url);
	}

}
