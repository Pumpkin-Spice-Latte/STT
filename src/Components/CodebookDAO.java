package Components;

import java.sql.*;
import java.util.Date;

public class CodebookDAO {
	
	//properties
	private Connection objConnection;	
	
	//Constructor
	public CodebookDAO(Connection connection) {
		objConnection = connection;		
	}
	
	//Methods
	public void insertIntoCodebookHdr(String codebookName, int accountID) throws Exception {					
		//Build SQL
		String SQL = "INSERT INTO CODEBOOK_HDR (CODEBOOK_NAME, ACCOUNT_ID) VALUES (?,?)";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setString(1, codebookName);
		objPreparedStatement.setInt(2, accountID);
								
		//Execute statement
		objPreparedStatement.executeUpdate();								
	}	
	
	public void insertIntoCodebookDtl(int codebookID, String startWord, String endWord) throws Exception {	
		//Build SQL
		String SQL = "INSERT INTO CODEBOOK_DTL (CODEBOOK_ID, START_WORD, END_WORD) VALUES (?,?,?)";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, codebookID);
		objPreparedStatement.setString(2, startWord);
		objPreparedStatement.setString(3, endWord);
								
		//Execute statement
		objPreparedStatement.executeUpdate();		
	}	
	
	public ResultSet getCodebookHdrByAccountIDAndCodebookID(int accountID, int codebookID) throws Exception {	
		//Initialize preparedStatement
		PreparedStatement objPreparedStatement = null;		
		
		//Build SQL
		String SQL = "SELECT * FROM CODEBOOK_HDR WHERE ACCOUNT_ID = ? ";
		
		if (codebookID != 0) {
			SQL += " AND CODEBOOK_ID = ?";
			objPreparedStatement = objConnection.prepareStatement(SQL);
			objPreparedStatement.setInt(1, accountID);	
			objPreparedStatement.setInt(2, codebookID);					
		} else {
			objPreparedStatement = objConnection.prepareStatement(SQL);
			objPreparedStatement.setInt(1, accountID);			
		}
											
		//Return result set
		return objPreparedStatement.executeQuery();		
	}	
	
	public ResultSet getCodebookDtlsByCodebookID(int codebookID) throws Exception {					
		//Build SQL
		String SQL = "SELECT * FROM CODEBOOK_DTL WHERE CODEBOOK_ID = ? ";			
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, codebookID);			
											
		//Return result set
		return objPreparedStatement.executeQuery();		
	}



	public int getLastCreatedCodebookByAccountID(int accountID) throws Exception {			
		//Build SQL
		String SQL = "SELECT MAX(CODEBOOK_ID) FROM CODEBOOK_HDR WHERE ACCOUNT_ID = ? ";			
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, accountID);			
											
		//Return result set
		ResultSet objRS = objPreparedStatement.executeQuery();		

		objRS.next();
		return objRS.getInt(1);
	}

	
}