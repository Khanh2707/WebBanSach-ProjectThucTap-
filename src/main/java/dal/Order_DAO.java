package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Book;
import model.Order;
import model.OrderLine;

public class Order_DAO extends DBContext implements Serializable {
	public ArrayList<Order> getAll() {
		ArrayList<Order> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from [Order]";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order o = new Order(rs.getInt("id-order"), rs.getString("date-order"), rs.getString("username"), rs.getInt("totalMoney-order"));
				list.add(o);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Order getOrderById(String id) {
		String selectQuery = "select *\r\n"
				+ "from [Order]\r\n"
				+ "where [id-order] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Order o = new Order(rs.getInt("id-order"), rs.getString("date-order"), rs.getString("username"), rs.getInt("totalMoney-order"));
				return o;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<OrderLine> getOrderLineById(String id) {
		ArrayList<OrderLine> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from OrderLine\r\n"
				+ "where [id-order] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderLine o = new OrderLine(rs.getInt("id-order"), rs.getString("id-book"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("phone"), rs.getString("address"), rs.getString("method_pay"));
				list.add(o);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Order> getOrderByUsername(String username) {
		ArrayList<Order> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from [Order]\r\n"
				+ "where username = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order o = new Order(rs.getInt("id-order"), rs.getString("date-order"), rs.getString("username"), rs.getInt("totalMoney-order"));
				list.add(o);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<OrderLine> getOrderLineByUsername(String username) {
		ArrayList<OrderLine> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from OrderLine\r\n"
				+ "where [id-order] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderLine o = new OrderLine(rs.getInt("id-order"), rs.getString("id-book"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("phone"), rs.getString("address"), rs.getString("method_pay"));
				list.add(o);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
