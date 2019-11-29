package Components;

import java.sql.*;

public class SessionDAO {
	
	//properties
	private Connection objConnection;	
	
	//Constructor
	public SessionDAO(Connection connection) {
		objConnection = connection;		
	}
	
	//Methods
	public void insertIntoSession(String sessionName, int accountID, int codebookID) throws Exception {	
		//Build SQL
		String SQL = "INSERT INTO SESSION (SESSION_NAME, ACCOUNT_ID, CODEBOOK_ID) VALUES (?,?,?)";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setString(1, sessionName);
                objPreparedStatement.setInt(2, accountID);
                objPreparedStatement.setInt(3, codebookID);
								
		//Execute statement
		objPreparedStatement.executeUpdate();		
	}	
	
	public void insertIntoSessionCounts(int sessionID, int detailID, int count) throws Exception {	
		//Build SQL
		String SQL = "INSERT INTO SESSION_COUNTS (SESSION_ID, DETAIL_ID, COUNT) VALUES (?,?,?)";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, sessionID);
                objPreparedStatement.setInt(2, detailID);
                objPreparedStatement.setInt(3, count);
								
		//Execute statement
		objPreparedStatement.executeUpdate();		
	}	

	public void DeleteFromSessionCounts(int sessionID) throws Exception {	
		//Build SQL
		String SQL = "DELETE FROM SESSION_COUNTS WHERE SESSION_ID = ?";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, sessionID);                
								
		//Execute statement
		objPreparedStatement.executeUpdate();		
	}	

	
	public void DeleteFromSessions(int sessionID) throws Exception {	
		//Build SQL
		String SQL = "DELETE FROM SESSION WHERE SESSION_ID = ?";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, sessionID);                
								
		//Execute statement
		objPreparedStatement.executeUpdate();		
	}


	public ResultSet getSessions(int accountID, int codebookID) throws Exception {	
                //Initialize prepared statement
                PreparedStatement objPreparedStatement = null;

		//Build SQL
		String SQL = "SELECT * FROM SESSION WHERE ACCOUNT_ID = ? ";
                
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

	public ResultSet getSessionCounts(int sessionID) throws Exception {	                
		//Build SQL
		String SQL = "SELECT S.SESSION_ID, S.DETAIL_ID, S.COUNT, D.START_WORD, D.END_WORD " +
			     "   FROM SESSION_COUNTS S " +
			     "        INNER JOIN CODEBOOK_DTL D ON D.DETAIL_ID = S.DETAIL_ID " + 
			     "  WHERE SESSION_ID = ? ";
			     
		//Prepare statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, sessionID);	
			             													                								
		//Return result set
		return objPreparedStatement.executeQuery();		
        }

        public int getLastCreatedSessionByAccountID(int accountID) throws Exception {			
		//Build SQL
		String SQL = "SELECT MAX(SESSION_ID) FROM SESSION WHERE ACCOUNT_ID = ? ";			
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setInt(1, accountID);			
											
		//Return result set
		ResultSet objRS = objPreparedStatement.executeQuery();		

		objRS.next();
		return objRS.getInt(1);
	}
        
        
}