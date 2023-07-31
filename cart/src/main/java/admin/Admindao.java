package admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import db.DbManager;
import users.User;

public class Admindao {
	DbManager dbm;

	public Admindao() {
		// TODO Auto-generated constructor stub
		dbm = new DbManager();
	}
	private DbManager dbManager;

	public User adminlogin(String id, String password) {
		DbManager dbManager = new DbManager();
		User user=null;

		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con
						.prepareStatement("SELECT * FROM admins WHERE id =? AND password =?")) {

			stmt.setString(1, id);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				
				// Retrieve user information from the result set and create a User object
				user = new User();
				user.setUserId(rs.getString("id"));
				user.setPassword(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			// System.out.println("Login successful");
				// Set other user properties as needed
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	  public static void main(String args[]) {
		  
		  Admindao adao=new Admindao();
		  System.out.println(adao.adminlogin("000002","satya03") );
	  
	  }
	 
}
