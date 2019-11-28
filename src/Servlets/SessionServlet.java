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


@WebServlet("/sessionServlet")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
					case "writeSessionDropdown":
						//Write session dropdown
                                                out.append(writeSessionDropdown(objAccount.accountID));	                                                							
						break;		

                                        case "writeSessionDetailsTable":
						//Write details table
						out.append(writeSessionDetailsTable(Integer.parseInt(request.getParameter("sessionID"))));
						out.close();	
						break;
					// case "getCodebook":
					// 	//Get codebookID
					// 	int codebookID = Integer.parseInt(request.getParameter("codebookID"));
					// 	List<Sess> listCodebookDetails = new CodebookFactory().getCodeboodDtlByCodebookID(codebookID);

					// 	//Serialize object to JSON
					// 	String json = new Gson().toJson(listCodebookDetails);						
					// 	out.append(json);
					// 	break;

				}
			}	                        

		} catch (Exception e) {
			out.append("error");
		} finally {
			out.close();
		}
		
		
		
	}



	private String writeSessionDropdown(int accountID) throws SQLException {
		//Get all codebooks created by user	
		List<Session> listSessions = new SessionFactory().getSessions(accountID, 0);

		//Instantiate stringbuilder
		StringBuilder str = new StringBuilder();

		//Write dropdown
		str.append("<select id='sessionDropdown' onchange='writeSessionDetailsTable(this.value)'>");
		str.append("	    <option value='-1'>-- Select a Session --</option>");
		for (Session objSession: listSessions) {
			str.append("<option value='" + objSession.sessionID + "'>");			
			str.append(objSession.sessionName);
			str.append("</option>");
		}		
		str.append("</select>");

		//Return 
		return str.toString();
        }
        
        private String writeSessionDetailsTable(int sessionID) throws SQLException {
		//Get all codebooks created by user	
		List<SessionCount> listSessionCounts = new SessionFactory().getSessionCounts(sessionID);

		//Instantiate stringbuilder
		StringBuilder str = new StringBuilder();

		//Write table
		str.append("<table border='2'>");
                str.append("	<th><b>Word/Phrase</b></th>");
                str.append("	<th><b>Count</b></th>");		
		for (SessionCount objSessionCount: listSessionCounts) {
			str.append("<tr>");
			str.append("	<td>");
			str.append(objSessionCount.phrase);			
                        str.append("	</td>");
                        str.append("	<td>");
			str.append(objSessionCount.count);			
			str.append("	</td>");
			str.append("</tr>");
		}
		str.append("</table>");
		str.append("</div><br>");
		str.append("<div align = \"center\" style = \"padding-top: 5px;\">");
		str.append("	<button style=\"color: red;\" onclick = \"deleteCodebookAlert()\">Delete Codebook</button>");
		

		return str.toString();
	}

}
