package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
	private static Connection con;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomjee", "root", "");
		}catch(SQLException|ClassNotFoundException e) {
		}
	}
	public static Connection getConnection() {
		return con;
	}
}
