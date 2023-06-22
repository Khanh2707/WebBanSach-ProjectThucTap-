package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	protected Connection conn;
	
	public DBContext() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String Url = "jdbc:sqlserver://LAPTOP-BH0L3U68\\MYSQLSERVER:1433;databaseName=BookOnline;encrypt=false;integratedSecurity=false";
			conn = DriverManager.getConnection(Url, "sa", "27072003");
			System.out.println("Connect Successful!!!!!!!!!!!!!");
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Connect Failed!");
			e.printStackTrace();
		}
	}
}
