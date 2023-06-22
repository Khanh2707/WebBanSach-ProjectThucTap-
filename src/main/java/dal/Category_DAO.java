package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Category;

public class Category_DAO extends DBContext implements Serializable {
	public ArrayList<Category> getAll() {
		ArrayList<Category> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from Category";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category a = new Category(rs.getString("id-category"), rs.getString("name-category"));
				list.add(a);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insert(Category a) {
		String insertQuery = "insert into Category values(?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(insertQuery);
			ps.setString(1, a.getId());
			ps.setString(2, a.getName());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void delete(String id) {
		String deleteQuery = "delete\r\n"
				+ "from Category\r\n"
				+ "where [id-category] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, id);
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void update(Category a) {
		String deleteQuery = "update Category\n" +
                "set [name-category] = ?\n" +
                "where [id-category] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, a.getName());
			ps.setString(2, a.getId());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public Category getCategoryById(String id) {
		String selectQuery = "select *\r\n"
				+ "from Category\r\n"
				+ "where [id-category] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Category a = new Category(rs.getString("id-category"), rs.getString("name-category"));
				return a;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		Category_DAO a = new Category_DAO();
		ArrayList<Category> list = a.getAll();
		for (Category category : list) {
			System.out.println(category.toString());
		}
	}
}
