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
	public void insertIntoCodebookHdr(String codebookName, Date updateDate, int accountID) throws Exception {	
		//Build SQL
		String SQL = "INSERT INTO CODEBOOK_HDR (CODEBOOK_NAME, UPDATE_DATE, ACCOUNT_ID) VALUES (?,?,?)";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setString(1, codebookName);
		objPreparedStatement.setDate(2, (java.sql.Date) updateDate);
		objPreparedStatement.setInt(3, accountID);
								
		//Execute statement
		objPreparedStatement.executeUpdate();		
	}	
	
	public void insertIntoCodebookDtl(int codebookID, String value, Date updateDate) throws Exception {	
		//Build SQL
		String SQL = "INSERT INTO CODEBOOK_DTL (CODEBOOK_ID, VALUE, UPDATE_DATE) VALUES (?,?,?)";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, codebookID);
		objPreparedStatement.setString(2, value);
		objPreparedStatement.setDate(3, (java.sql.Date) updateDate);
								
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
			objPreparedStatement.setInt(2, codebookID);					
		} else {
			objPreparedStatement = objConnection.prepareStatement(SQL);
			objPreparedStatement.setInt(1, accountID);			
		}
											
		//Return result set
		return objPreparedStatement.executeQuery();		
	}	
	
	public ResultSet getCodebookDtlByCodebookID(int codebookID) throws Exception {	
		//Initialize preparedStatement
		PreparedStatement objPreparedStatement = null;		
		
		//Build SQL
		String SQL = "SELECT * FROM CODEBOOK_DTL WHERE CODEBOOK_ID = ? ";			
		objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, codebookID);			
											
		//Return result set
		return objPreparedStatement.executeQuery();		
	}
}