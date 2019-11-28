package Components;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountFactory {

	private void setAccountObjectProperties(Account objAccount, ResultSet objRS) throws SQLException {		
		objAccount.accountID = objRS.getInt("account_id");
		objAccount.username = objRS.getString("username");					
	}
	
	@SuppressWarnings("finally")
	public Account createAccount(String username, String password) throws SQLException {
		//Instantiate objects used in finally clause
		Connection objConnection = null;		
		Account objAccount = new Account();
		
		try {					
			//Get connection
			objConnection = dbConnection.getConnection();
			
			//Instantiate DAO object
			AccountDAO objAccountDAO = new AccountDAO(objConnection);
			
			//Update database
			objAccountDAO.insertIntoAccounts(username, password);					
						
			//Commit
			objConnection.commit();
			
			//Get newly created account
			objAccount = getAccountByUsernameAndPassword(username, password);
			
		} catch(Exception e) {					
			//Rollback
			objConnection.rollback();
			throw new Exception("Error creating account");
			
		} finally {			
			//Destroy connection
			objConnection = null;
			
			//Return Account
			return objAccount;
		}			
	}
		
	@SuppressWarnings("finally")
	public Account getAccountByUsernameAndPassword(String username, String password) throws SQLException {
		//Instantiate objects used in finally clause
		Connection objConnection = null;		
		Account objAccount = new Account();
		
		try {					
			//Get connection
			objConnection = dbConnection.getConnection();
			
			//Instantiate DAO object
			AccountDAO objAccountDAO = new AccountDAO(objConnection);
			
			//Get resultset
			ResultSet objRS = objAccountDAO.getAccountByUsernameAndPassword(username, password);
			
			//Set object properties
			objRS.next();
			setAccountObjectProperties(objAccount, objRS);							
			
		} catch(Exception e) {			
			//Do nothing	
			throw new Exception("Error logging in");				
		} finally {			
			//Destroy connection
			objConnection = null;
			
			//Return Account
			return objAccount;
		}			
	}
}