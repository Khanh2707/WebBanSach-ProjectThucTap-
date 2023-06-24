package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Account;

public class Account_DAO extends DBContext {
	public Account checkUser(String username, String password) {
		String query = "select *\r\n"
				+ "from Account\r\n"
				+ "where username = '"+username+"' and password = '"+password+"'";
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
//			ps.setString(1, username);
//			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				Account a = new Account(rs.getString("fullname"), rs.getString("username"), rs.getString("password"), rs.getInt("role"));
				return a;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Account checkRegister(String username) {
		String query = "select *\r\n"
				+ "from Account\r\n"
				+ "where username = '"+username+"'";
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
//			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				Account a = new Account(rs.getString("fullname"), rs.getString("username"), rs.getString("password"), rs.getInt("role"));
				return a;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void insert(Account a) {
		String insertQuery = "insert into Account values(?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(insertQuery);
			ps.setString(1, a.getFullname());
			ps.setString(2, a.getUsername());
			ps.setString(3, a.getPassword());
			ps.setInt(4, a.getRole());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void delete(String username) {
		String deleteQuery = "delete\r\n"
				+ "from Account\r\n"
				+ "where [username] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, username);
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void update(Account a) {
		String deleteQuery = "update Account\n"
				+ "   SET [fullname] = ?"
				+ "      ,[password] = ?"
				+ " WHERE [username] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, a.getFullname());
			ps.setString(2, a.getPassword());
			ps.setString(3, a.getUsername());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public Account getAccountByUsername(String username) {
		String selectQuery = "select *\r\n"
				+ "from Account\r\n"
				+ "where [username] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Account a = new Account(rs.getString("fullname"), rs.getString("username"), rs.getString("password"), rs.getInt("role"));
				return a;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Account> getAll() {
		ArrayList<Account> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from Account";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account a = new Account(rs.getString("fullname"), rs.getString("username"), rs.getString("password"), rs.getInt("role"));
				list.add(a);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
