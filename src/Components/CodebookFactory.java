package Components;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

public class CodebookFactory {

	private void setCodebookHeaderObjectProperties(CodebookHeader objCodebookHeader, ResultSet objRS) throws SQLException {		
		objCodebookHeader.accountID = objRS.getInt("account_id");			
		objCodebookHeader.codebookName = objRS.getString("codebook_name");
		objCodebookHeader.accountID = objRS.getInt("account_id");
	}
	
	@SuppressWarnings("finally")
	public void createCodebook(int accountID, String codebookName, List<String> listCodebookDetails) throws Exception {
		//Instantiate objects used in finally clause
		Connection objConnection = null;				
		
		try {					
			//Get connection
			objConnection = dbConnection.getConnection();
			
			//Instantiate DAO object
			CodebookDAO objCodebookDAO = new CodebookDAO(objConnection);
			
			//Insert header
			objCodebookDAO.insertIntoCodebookHdr(codebookName, accountID);										
			objConnection.commit(); //Commit so we can retrieve header

			//Get header
			int codebookHeaderID = objCodebookDAO.getLastCreatedCodebookByAccountID(accountID);
												
			//Insert details
			for (String detail : listCodebookDetails) {
				String startWord = "";
				String endWord = "";
				if (detail.contains("...")) {					
					startWord = detail.substring(0, detail.indexOf(" ..."));
					endWord = detail.substring(detail.indexOf(" ...") + 4);
				} else {
					startWord = detail;
				}
				if (startWord.trim().length() > 0)
					objCodebookDAO.insertIntoCodebookDtl(codebookHeaderID, startWord, endWord);
			}	
			objConnection.commit(); //Final commit

		} catch(Exception e) {					
			//Rollback
			objConnection.rollback();
			throw new Exception("Error creating codebook");
			
		} finally {			
			//Destroy connection
			objConnection = null;			
		}			
	}
		
	@SuppressWarnings("finally")
	public List<CodebookHeader> getCodebookHdrByAccountIDAndCodebookID(int accountID, int codebookID) throws SQLException {
		//Instantiate objects used in finally clause
		Connection objConnection = null;		
		List<CodebookHeader> listCodebookHeaders = new ArrayList<CodebookHeader>();
		
		try {					
			//Get connection
			objConnection = dbConnection.getConnection();
			
			//Instantiate DAO object
			CodebookDAO objCodebookDAO = new CodebookDAO(objConnection);					
			
			//Get resultset
			ResultSet objRS = objCodebookDAO.getCodebookHdrByAccountIDAndCodebookID(accountID, codebookID);
						
			//Set c properties
			while (objRS.next()) {
				CodebookHeader objCodebookHeader = new CodebookHeader();
				setCodebookHeaderObjectProperties(objCodebookHeader, objRS);
				listCodebookHeaders.add(objCodebookHeader);
			}
													
		} catch(Exception e) {			
			//Do nothing					
		} finally {			
			//Destroy connection
			objConnection = null;
			
			//Return Account
			return listCodebookHeaders;
		}			
	}
}