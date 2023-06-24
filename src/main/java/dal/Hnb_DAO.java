package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Book;
import model.Hnb;

public class Hnb_DAO extends DBContext implements Serializable {
	public ArrayList<Hnb> getAll() {
		ArrayList<Hnb> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from HnbBook";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Book_DAO bDAO = new Book_DAO();
				Book b = bDAO.getBookById(rs.getString("id-book"));
				Hnb hnb = new Hnb(rs.getString("id-hnb"), rs.getString("img-hnb"), b);
				list.add(hnb);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insert(Hnb hnb) {
		String insertQuery = "insert into HnbBook values(?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(insertQuery);
			ps.setString(1, hnb.getId());
			ps.setString(2, hnb.getImg());
			ps.setString(3, hnb.getBook().getId());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void delete(String id) {
		String deleteQuery = "delete\r\n"
				+ "from HnbBook\r\n"
				+ "where [id-hnb] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, id);
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void update(Hnb hnb) {
		String deleteQuery = "UPDATE [dbo].[HnbBook]\r\n"
				+ "   SET [img-hnb] = ?\r\n"
				+ "      ,[id-book] = ?\r\n"
				+ " WHERE [id-hnb] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, hnb.getImg());
			ps.setString(2, hnb.getBook().getId());
			ps.setString(3, hnb.getId());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public Hnb getHnbById(String id) {
		String selectQuery = "select *\r\n"
				+ "from HnbBook\r\n"
				+ "where [id-hnb] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Book_DAO bDAO = new Book_DAO();
				Book b = bDAO.getBookById(rs.getString("id-book"));
				Hnb hnb = new Hnb(rs.getString("id-hnb"), rs.getString("img-hnb"), b);
				return hnb;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
