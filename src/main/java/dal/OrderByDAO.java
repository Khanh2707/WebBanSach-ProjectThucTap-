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

public class OrderByDAO extends DBContext implements Serializable {
	public ArrayList<Book> getBooksByKeyOrderBy(String keyOderBy, String nameOrderBy, String list_select) {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "SELECT *\r\n"
				+ "  FROM Book\r\n"
				+ "  WHERE 1=1";
		if (!keyOderBy.equals("all")) {
			selectQuery += " and [id-"+keyOderBy+"]='"+nameOrderBy+"'";
		}
		
		if (list_select.equals("td")) {
			selectQuery += " order by ((100 - [ratio_sale-book]) * [origin_price-book]) / 100 asc";
		}
		else if (list_select.equals("gd")) {
			selectQuery += " order by ((100 - [ratio_sale-book]) * [origin_price-book]) / 100 desc";
		}
		else if (list_select.equals("az")) {
			selectQuery += " order by [name-book] asc";
		}
		else if (list_select.equals("za")) {
			selectQuery += " order by [name-book] desc";
		}
		else if (list_select.equals("cn")) {
			selectQuery += " order by [year_publish-book] asc";
		}
		else if (list_select.equals("mn")) {
			selectQuery += " order by [year_publish-book] desc";
		}
		else if (list_select.equals("bcn")) {
			
		}
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
//			ps.setString(1, AId);
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
	
	public ArrayList<Book> getAll10() {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "select top 10 *\r\n"
				+ "from Book\r\n"
				+ "order by [year_publish-book] desc";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
//			ps.setString(1, AId);
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
		System.out.println(list.get(0).toString());
		return list;
	}
	
	public ArrayList<Book> getAll10sell() {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "select top 10 Book.[id-book], OrderLine.quantity\r\n"
				+ "from Book join OrderLine on Book.[id-book] = OrderLine.[id-book]";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
//			ps.setString(1, AId);
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
		System.out.println(list.get(0).toString());
		return list;
	}
}
