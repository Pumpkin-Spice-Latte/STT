package Components;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccountFactory {
		
	@SuppressWarnings("finally")
	public Account createAccount(String username, String password) throws SQLException {
		//Instantiate objects used in finally clause
		Connection objConnection = null;		
		Account objAccount = new Account();
		
		try {					
			//Get connection
			Class.forName("com.mysql.jdbc.Driver").newInstance();  
			objConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/s2tdb?useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
			objConnection.setAutoCommit(false);
			
			//Instantiate DAO object
			AccountDAO objAccountDAO = new AccountDAO(objConnection);
			
			//Update database
			objAccountDAO.insertIntoAccounts(username, password);					
						
			//Commit
			objConnection.commit();
			
			//Set Account properties
			objAccount.username = username;
			objAccount.password = password;					
			
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
}