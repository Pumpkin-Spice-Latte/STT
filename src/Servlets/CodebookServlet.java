package Servlets;

import Components.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/codebookServlet")
public class CodebookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			//Get account object
			HttpSession session = request.getSession();  
			Account objAccount = (Account) session.getAttribute("currentUser");

			//Make sure user has acquired valid session
			if (objAccount.accountID == 0)
				throw new Exception();

			//Get querystring to determine page event
			String pageEvent = request.getParameter("event");
			if (pageEvent != null) {
				switch(pageEvent) {
					case "addCodebook":
						//Get post variables
						String[] temp = request.getParameter("codebookWords").split(",");
						List<String> codebookDetails = Arrays.asList(temp);
						String codebookName = request.getParameter("codebookName");

						//Create codebook
						CodebookFactory objCodebookFactory = new CodebookFactory();
						objCodebookFactory.createCodebook(objAccount.accountID, codebookName, codebookDetails);
						objCodebookFactory = null;						
				}
			}	

			out.append("success");

		} catch (Exception e) {
			out.append("error");
		} finally {
			out.close();
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		//code here for http get requests
		
	}

}
