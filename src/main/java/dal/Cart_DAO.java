package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Account;

public class Cart_DAO extends DBContext {
	public Account getAccount(String username, String password) {
		String query = "select * from Account where username = ? and password = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				return new Account(rs.getString("fullname"), username, password, rs.getInt("role"), rs.getInt("amount"));
			}
		}
		catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}
	
	
}
