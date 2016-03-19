package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
//import model.Dao;
/**
 * Servlet implementation class SignupCon
 */
@WebServlet("/SignupCon")
public class SignupCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupCon() {
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
		String user= request.getParameter("username");
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");
		
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		
		System.out.println("Details:"+user+"\n"+password1+"\n"+firstname+"\n"+lastname+email+phone+address);
		RequestDispatcher reqDis= null;
		
		if(!password1.equals(password2))	{
			String errorPass = "Password Does Not Match";
			request.setAttribute("errorPass", errorPass);				
			reqDis = getServletContext().getRequestDispatcher("/Registration.jsp");
			reqDis.forward(request,response);
		
		}
		/*Dao da=new Dao();
		String dob ="1989-04-29";
		
		int i=Dao.insert(user,password1,email,firstname,lastname,address,phone,dob);
		if (i==1)
		{
			request.setAttribute("errormsg", "You have successfully registered...!!");
			reqDis = getServletContext().getRequestDispatcher("/Login.jsp");
			reqDis.forward(request,response);
		}*/
		
		
		
		
	}

}
