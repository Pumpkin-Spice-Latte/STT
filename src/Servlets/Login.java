package Servlets;

import Components.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/loginServlet")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//Get reponse object
		PrintWriter out = response.getWriter();
		
		try {
			//Get username and password
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			//Get querystring to determine page event
			String pageEvent = request.getParameter("event");
			
			//Instantiate account
			Account objAccount = new Account();			
			
			//Determine action
			if (pageEvent.equals("create")) {
				
				//Create account
				objAccount = new AccountFactory().createAccount(username, password);
							
											
			} else if (pageEvent.equals("login")) {
				
				//Retrieve account
				objAccount = new AccountFactory().getAccountByUsernameAndPassword(username, password);
			}
						
			if(objAccount.accountID != 0) {
				//Set session
				HttpSession session = request.getSession();  
		        session.setAttribute("currentUser", objAccount);
		        
		        //Write to response
				out.append("success");	
			} else {
				//Write to response
				out.append("failure");
			}
			
		} catch (Exception e) {
			//Write to response
			out.append("failure");
			
		} finally {
			//Close response
			out.close();
		}			
	}

}
