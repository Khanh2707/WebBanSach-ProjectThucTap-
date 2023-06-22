package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Selected;

public class Selected_DAO extends DBContext implements Serializable {
	public ArrayList<Selected> getAll() {
		ArrayList<Selected> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from Selected";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Selected s = new Selected(rs.getString("id-selected"), rs.getString("name-selected"));
				list.add(s);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
