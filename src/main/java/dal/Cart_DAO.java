package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import model.Account;
import model.Cart;
import model.Items;

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
	
	public void addOrder(Account a, Cart cart, int phone, String address, String method_pay) {
		LocalDate currentDate = LocalDate.now();
		String date = currentDate.toString();
		
		try {
			String query = "insert into [Order] values(?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, date);
			ps.setString(2, a.getUsername());
			ps.setInt(3, cart.getTotalMoney());
			
			ps.executeUpdate();
			
			String queryOrderLine = "select top 1 [id-order] from [Order] order by [id-order] desc";
			PreparedStatement ps1 = conn.prepareStatement(queryOrderLine);
			
			ResultSet rs = ps1.executeQuery();
			
			if (rs.next()) {
				int orderId = rs.getInt("id-order");
				for (Items items : cart.getItems()) {
					String insert = "insert into OrderLine values(?,?,?,?,?,?,?)";
					PreparedStatement ps2 = conn.prepareStatement(insert);
					ps2.setInt(1, orderId);
					ps2.setString(2, items.getBook().getId());
					ps2.setInt(3, items.getQuantity());
					ps2.setInt(4, items.getPrice());
					ps2.setInt(5, phone);
					ps2.setString(6, address);
					ps2.setString(7, method_pay);
					
					ps2.executeUpdate();
				}
			}
			String update = "update Book set [quantity-book] = [quantity-book] - ? where [id-book] = ?";
			PreparedStatement ps3 = conn.prepareStatement(update);
			for (Items items : cart.getItems()) {
				ps3.setInt(1, items.getQuantity());
				ps3.setString(2, items.getBook().getId());
				
				ps3.executeUpdate();
			}
		}
		catch (SQLException e) {
			System.err.println(e);
		}
	}
}
