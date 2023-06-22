package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Author;
import model.Book;
import model.Category;
import model.Publish_company;

public class Search_DAO extends DBContext implements Serializable {
	public ArrayList<Book> getBooksBySearch(String keySearch) {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "select *\r\n"
				+ "from Book\r\n"
				+ "where [name-book] like N'%"+keySearch+"%'";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
//			ps.setString(1, keySearch);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Book book = new Book();
				book.setId(rs.getString("id-book"));
				book.setName(rs.getString("name-book"));
				book.setOrigin_price(rs.getInt("origin_price-book"));
				book.setRatio_sale(rs.getByte("ratio_sale-book"));
				book.setYear_publish(rs.getShort("year_publish-book"));
				book.setContent(rs.getString("content-book"));;
				book.setQuantity(rs.getShort("quantity-book"));
				book.setImg(rs.getString("img-book"));
				Category_DAO cDAO = new Category_DAO();
				Category c = cDAO.getCategoryById(rs.getString("id-category"));
				book.setCategory(c);
				Author_DAO aDAO = new Author_DAO();
				Author a = aDAO.getAuthorById(rs.getString("id-author"));
				book.setAuthor(a);
				Publish_company_DAO pcDAO = new Publish_company_DAO();
				Publish_company pc = pcDAO.getPublish_companyById("id-publish_company");
				book.setPublish_company(pc);
				list.add(book);
			}
		}
		catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}
}
