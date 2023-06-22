package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Author;

public class Author_DAO extends DBContext implements Serializable {
	public ArrayList<Author> getAll() {
		ArrayList<Author> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from Author";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Author a = new Author(rs.getString("id-author"), rs.getString("name-author"));
				list.add(a);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insert(Author a) {
		String insertQuery = "insert into Author values(?,?)";
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
				+ "from Author\r\n"
				+ "where [id-author] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, id);
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void update(Author a) {
		String deleteQuery = "update Author\n" +
                "set [name-author] = ?\n" +
                "where [id-author] = ?";
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
	
	public Author getAuthorById(String id) {
		String selectQuery = "select *\r\n"
				+ "from Author\r\n"
				+ "where [id-author] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Author a = new Author(rs.getString("id-author"), rs.getString("name-author"));
				return a;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		Author_DAO a = new Author_DAO();
		ArrayList<Author> list = a.getAll();
		for (Author author : list) {
			System.out.println(author.toString());
		}
	}
}
