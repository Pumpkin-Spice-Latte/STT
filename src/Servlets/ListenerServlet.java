package Servlets;

import Components.*;

import com.google.gson.Gson;

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


@WebServlet("/listenerServlet")
public class ListenerServlet extends HttpServlet {
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
					case "createNewSession":
						//Get post variables
						String sessionName = request.getParameter("sessionName");
						int codebookID = Integer.parseInt(request.getParameter("codebookID"));

						//Create new session		
						SessionFactory objSessionFactory = new SessionFactory();				
						Session objSession =  objSessionFactory.createSession(sessionName, objAccount.accountID, codebookID);
						objSessionFactory = null;
						out.append(Integer.toString(objSession.sessionID));
						out.close(); //must return only sessionID
						break;		

					case "insertSessionCounts":
						int sessionID = Integer.parseInt(request.getParameter("sessionID"));
						String[] detailIDArray = request.getParameterValues("detailID");
						String[] countArray = request.getParameterValues("count");
						for (int i = 0; i < detailIDArray.length; i++) {
							 SessionFactory objSessionFactory1 = new SessionFactory();
							 objSessionFactory1.insertIntoSessionCounts(sessionID, Integer.parseInt(detailIDArray[i]), Integer.parseInt(countArray[i]));
							 objSessionFactory1 = null;
						}
						break;	
				}
			}	

			out.append("success");

		} catch (Exception e) {
			out.append("error");
		} finally {
			out.close();
		}		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
					case "writeCodebookDropdown":
						//Write codebook dropdown
						out.append(writeCodebookDropdown(objAccount.accountID));											
						break;		

					case "getCodebook":
						//Get codebookID
						int codebookID = Integer.parseInt(request.getParameter("codebookID"));
						List<CodebookDetail> listCodebookDetails = new CodebookFactory().getCodeboodDtlByCodebookID(codebookID);

						//Serialize object to JSON
						String json = new Gson().toJson(listCodebookDetails);						
						out.append(json);
						break;

				}
			}	

		} catch (Exception e) {
			out.append("error");
		} finally {
			out.close();
		}
		
	}



	private String writeCodebookDropdown(int accountID) throws SQLException {
		//Get all codebooks created by user	
		List<CodebookHeader> listCodebookHeaders = new CodebookFactory().getCodebookHdrByAccountIDAndCodebookID(accountID, 0);

		//Instantiate stringbuilder
		StringBuilder str = new StringBuilder();

		//Write dropdown
		str.append("<select id='codebookDropdown'>");
		str.append("	    <option value='-1'>-- Select a codebook --</option>");
		for (CodebookHeader objCodebookHeader: listCodebookHeaders) {
			str.append("<option value='" + objCodebookHeader.codebookID + "'>");			
			str.append(objCodebookHeader.codebookName);
			str.append("</option>");
		}		
		str.append("</select>");

		//Return 
		return str.toString();
	}
}
