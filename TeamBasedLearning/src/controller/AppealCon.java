package controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import model.*;
import model.beans.Appeals;
/**
 * Servlet implementation class AppealCon
 */
@WebServlet("/AppealCon")
public class AppealCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppealCon() {
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
		// TODO Auto-generated method stub
		String Username="abc11";
		String feedback= request.getParameter("feedback");
		System.out.println("He said"+feedback);
		Appeals us = new Appeals(Username,feedback);
		//User us = new User();
		AppealDAO d= new AppealDAO();
		int p= d.insertintoAppeal(Username,feedback);
		if(p==0){
			System.out.println("Wiz Khalifa");
		}else if(p==1){
			System.out.println("Yay..");
		}
	}

}