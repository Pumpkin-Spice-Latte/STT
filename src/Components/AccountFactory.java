package Components;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountFactory {

	private void setAccountObjectProperties(Account objAccount, ResultSet objRS) throws SQLException {
		objRS.next();
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
			objAccount = getAccountByUsername(username);
			
		} catch(Exception e) {					
			//Rollback
			objConnection.rollback();
			
		} finally {			
			//Destroy connection
			objConnection = null;
			
			//Return Account
			return objAccount;
		}			
	}
		
	@SuppressWarnings("finally")
	public Account getAccountByUsername(String username) throws SQLException {
		//Instantiate objects used in finally clause
		Connection objConnection = null;		
		Account objAccount = new Account();
		
		try {					
			//Get connection
			objConnection = dbConnection.getConnection();
			
			//Instantiate DAO object
			AccountDAO objAccountDAO = new AccountDAO(objConnection);
			
			//Get resultset
			ResultSet objRS = objAccountDAO.getAccountByUsername(username);
			
			//Set object properties
			setAccountObjectProperties(objAccount, objRS);							
			
		} catch(Exception e) {			
			//Do nothing					
		} finally {			
			//Destroy connection
			objConnection = null;
			
			//Return Account
			return objAccount;
		}			
	}
}