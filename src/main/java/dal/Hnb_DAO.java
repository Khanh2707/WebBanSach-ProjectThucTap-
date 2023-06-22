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
		System.out.println(list.get(0).getBook().getId());
		return list;
	}
}
