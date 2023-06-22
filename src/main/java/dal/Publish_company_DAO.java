package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Publish_company;

public class Publish_company_DAO extends DBContext {
	public ArrayList<Publish_company> getAll() {
		ArrayList<Publish_company> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from Publish_company";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Publish_company a = new Publish_company(rs.getString("id-publish_company"), rs.getString("name-publish_company"));
				list.add(a);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insert(Publish_company a) {
		String insertQuery = "insert into Publish_company values(?,?)";
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
				+ "from Publish_company\r\n"
				+ "where [id-publish_company] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, id);
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void update(Publish_company a) {
		String deleteQuery = "update Publish_company\n" +
                "set [name-publish_company] = ?\n" +
                "where [id-publish_company] = ?";
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
	
	public Publish_company getPublish_companyById(String id) {
		String selectQuery = "select *\r\n"
				+ "from Publish_company\r\n"
				+ "where [id-publish_company] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Publish_company a = new Publish_company(rs.getString("id-publish_company"), rs.getString("name-publish_company"));
				return a;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		Publish_company_DAO a = new Publish_company_DAO();
		ArrayList<Publish_company> list = a.getAll();
		for (Publish_company publish_company : list) {
			System.out.println(publish_company.toString());
		}
	}
}
