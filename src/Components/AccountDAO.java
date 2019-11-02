package Components;

import java.sql.*;

public class AccountDAO {
	
	//properties
	private Connection objConnection;	
	
	//Constructor
	public AccountDAO(Connection connection) {
		objConnection = connection;		
	}
	
	//Methods
	public void insertIntoAccounts(String username, String password) throws Exception {	
		//Build SQL
		String SQL = "INSERT INTO ACCOUNTS (USERNAME, PASSWORD) VALUES (?,?)";
		
		//Create statement
		PreparedStatement objPreparedStatement = objConnection.prepareStatement(SQL);
		objPreparedStatement.setString(1, username);
		objPreparedStatement.setString(2, password);
								
		//Execute statement
		objPreparedStatement.executeUpdate();		
	}	
}