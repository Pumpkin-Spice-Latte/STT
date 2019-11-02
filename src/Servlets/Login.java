package Servlets;

import Components.*;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/loginServlet")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		           			
		try {
			//Attempt to create new account
			Account objAccount = new AccountFactory().createAccount("test", "test");
			
			//TODO
			/*
			 * Need to get post variables (username, password)
			 * send user to next page
			 * validate if account was successfully created
			 * Set session variables if needed 
			 * 
			 */
			
		} catch (SQLException e) {}
		
	}

}
