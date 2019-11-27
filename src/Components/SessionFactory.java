package Components;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SessionFactory {

	private void setSessionObjectProperties(Session objSession, ResultSet objRS) throws SQLException {
		objRS.next();
		objSession.sessionID = objRS.getInt("session_id");
		objSession.sessionName = objRS.getString("session_name");					
	}
	
	@SuppressWarnings("finally")
	public Session createSession(String sessionName, int accountID, int codebookID) throws SQLException {
		//Instantiate objects used in finally clause
		Connection objConnection = null;		
		Session objSession = new Session();
		
		try {					
			//Get connection
			objConnection = dbConnection.getConnection();
			
			//Instantiate DAO object
			SessionDAO objSessionDAO = new SessionDAO(objConnection);
			
			//Update database
			objSessionDAO.insertIntoSession(sessionName, accountID, codebookID);					
						
			//Commit
			objConnection.commit();
			
			//Get newly created Session
                        int sessionID = objSessionDAO.getLastCreatedSessionByAccountID(accountID);
                        
                        //At this point we know session was successfully created, so just adding name/id to obj
                        objSession.sessionName = sessionName;
                        objSession.sessionID = sessionID;
			
		} catch(Exception e) {					
			//Rollback
			objConnection.rollback();
			throw new Exception("Error creating session");
			
		} finally {			
			//Destroy connection
			objConnection = null;
			
			//Return Session
			return objSession;
		}			
	}
		
	@SuppressWarnings("finally")
	public List<Session> getSessions(int accountID, int codebookID) throws SQLException {
		//Instantiate objects used in finally clause
		Connection objConnection = null;		
		List<Session> listSession = new ArrayList<Session>();
		
		try {					
			//Get connection
			objConnection = dbConnection.getConnection();
			
			//Instantiate DAO object
			SessionDAO objSessionDAO = new SessionDAO(objConnection);
			
			//Get resultset
			ResultSet objRS = objSessionDAO.getSessions(accountID, codebookID);
			
			//Set object properties                                                
                        while (objRS.next()) {
				Session objSession = new Session();
				setSessionObjectProperties(objSession, objRS);
				listSession.add(objSession);
			}
			
		} catch(Exception e) {			
			//Do nothing					
		} finally {			
			//Destroy connection
			objConnection = null;
			
			//Return Session
			return listSession;
		}			
        }
        

}