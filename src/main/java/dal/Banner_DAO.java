package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Banner;

public class Banner_DAO extends DBContext implements Serializable {
	public ArrayList<Banner> getAll() {
		ArrayList<Banner> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from Banner";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Banner bn = new Banner(rs.getString("id-banner"), rs.getString("name-banner"));
				list.add(bn);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insert(Banner bn) {
		String insertQuery = "insert into Banner values(?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(insertQuery);
			ps.setString(1, bn.getId());
			ps.setString(2, bn.getImg());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void delete(String id) {
		String deleteQuery = "delete\r\n"
				+ "from Banner\r\n"
				+ "where [id-banner] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, id);
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void update(Banner bn) {
		String deleteQuery = "update Banner\n" +
                "set [name-banner] = ?\n" +
                "where [id-banner] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, bn.getImg());
			ps.setString(2, bn.getId());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public Banner getBannerById(String id) {
		String selectQuery = "select *\r\n"
				+ "from Banner\r\n"
				+ "where [id-banner] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Banner a = new Banner(rs.getString("id-banner"), rs.getString("name-banner"));
				return a;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
