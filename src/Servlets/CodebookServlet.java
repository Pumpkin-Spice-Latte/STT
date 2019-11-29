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

						//Create codebook						;
						new CodebookFactory().createCodebook(objAccount.accountID, codebookName, codebookDetails);						
						break;

					case "writeCodebookDetailsTable":
						//Write details table
						out.append(writeCodebookDetailsTable(Integer.parseInt(request.getParameter("codebookID"))));
						out.close();	
						break;

					case "deleteCodebook":
						int codebookID = Integer.parseInt(request.getParameter("codebookID"));
						new CodebookFactory().deleteCodebook(codebookID, objAccount.accountID);
						break;						
				}
			}	

			//Send status back to client
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
		str.append("<select id='codebookDropdown' onchange='writeCodebookDetails(this.value)'>");
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

	private String writeCodebookDetailsTable(int codebookID) throws SQLException {
		//Get all codebooks created by user	
		List<CodebookDetail> listcodebookDetails = new CodebookFactory().getCodeboodDtlByCodebookID(codebookID);

		//Instantiate stringbuilder
		StringBuilder str = new StringBuilder();

		//Write table
		str.append("<table border='2'>");
		str.append("	<th><b>Word/Phrase</b></th>");		
		for (CodebookDetail objCodebookDetail: listcodebookDetails) {
			str.append("<tr>");
			str.append("	<td>");
			str.append(objCodebookDetail.startWord);
			if (!objCodebookDetail.endWord.equals(""))
				str.append(" ... " + objCodebookDetail.endWord);
			str.append("	</td>");
			str.append("</tr>");
		}
		str.append("</table>");
		str.append("</div><br>");
		str.append("<div align = \"center\" style = \"padding-top: 5px;\">");
		str.append("	<button style=\"color: red;\" onclick = \"deleteAlert('codebook', deleteCodebook)\">Delete Codebook</button>");
		str.append("	<input id = 'currentCodebookID' type = 'hidden' value = '" + codebookID + "'>");
		

		return str.toString();
	}

}
