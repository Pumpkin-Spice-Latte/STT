package Components;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection { 
	
	//Static methods belong to the class, not instances of the class, so you don't need to instantiate the class to access the method
	public static Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		
		//Get driver implementation
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		//Get connection
		Connection objConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/s2tdb?useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
		
		//Set auto commit to false, as we want to control this ourselves
		objConnection.setAutoCommit(false);
		
		//Return connection
		return objConnection;
		
	}
}
