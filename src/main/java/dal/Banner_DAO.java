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
				+ "from SlideBook";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Banner bn = new Banner(rs.getString("id-slide"), rs.getString("name-slide"));
				list.add(bn);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
