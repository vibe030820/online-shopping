package db;
import java.sql.*;  
public class DbManager {
	public static Connection con;
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    
	     con=DriverManager.getConnection(  
	    "jdbc:oracle:thin:@localhost:1521:xe","system","admin"); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     return con;
	}
    
}  


