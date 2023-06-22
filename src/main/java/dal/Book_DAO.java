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

public class Book_DAO extends DBContext implements Serializable {
	public void insert(Book b) {
		String insertQuery = "insert into Book values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(insertQuery);
			ps.setString(1, b.getId());
			ps.setString(2, b.getName());
			ps.setInt(3, b.getOrigin_price());
			ps.setByte(4, b.getRatio_sale());
			ps.setShort(5, b.getYear_publish());
			ps.setString(6, b.getContent());
			ps.setShort(7, b.getQuantity());
			ps.setString(8, b.getImg());
			ps.setString(9, b.getAuthor().getId());
			ps.setString(10, b.getPublish_company().getId());
			ps.setString(11, b.getCategory().getId());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void delete(String id) {
		String deleteQuery = "delete\r\n"
				+ "from Book\r\n"
				+ "where [id-book] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, id);
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void update(Book b) {
		String updateQuery = "UPDATE [dbo].[Book]\r\n"
				+ "   SET [name-book] = ?"
				+ "      ,[origin_price-book] = ?"
				+ "      ,[ratio_sale-book] = ?"
				+ "      ,[year_publish-book] = ?"
				+ "      ,[content-book] = ?"
				+ "      ,[quantity-book] = ?"
				+ "      ,[img-book] = ?"
				+ "      ,[id-author] = ?"
				+ "      ,[id-publish_company] = ?"
				+ "      ,[id-category] = ?"
				+ " WHERE [id-book] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(updateQuery);
			ps.setString(1, b.getName());
			ps.setInt(2, b.getOrigin_price());
			ps.setByte(3, b.getRatio_sale());
			ps.setShort(4, b.getYear_publish());
			ps.setString(5, b.getContent());
			ps.setShort(6, b.getQuantity());
			ps.setString(7, b.getImg());
			ps.setString(8, b.getAuthor().getId());
			ps.setString(9, b.getPublish_company().getId());
			ps.setString(10, b.getCategory().getId());
			ps.setString(11, b.getId());
			
			ps.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public ArrayList<Book> getAll() {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "SELECT *\r\n"
				+ "  FROM Book\r\n";
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
	
	public Book getBookById(String id) {
		String selectQuery = "select *\r\n"
				+ "from Book\r\n"
				+ "where [id-book] = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			Author_DAO aDAO = new Author_DAO();
			Publish_company_DAO pcDAO = new Publish_company_DAO();
			Category_DAO cDAO = new Category_DAO();
			if (rs.next()) {
				Book b = new Book(rs.getString("id-book"), rs.getString("name-book"), rs.getInt("origin_price-book"), rs.getByte("ratio_sale-book"), rs.getShort("year_publish-book"), rs.getString("content-book"), rs.getShort("quantity-book"), rs.getString("img-book"), aDAO.getAuthorById(rs.getString("id-author")), pcDAO.getPublish_companyById(rs.getString("id-publish_company")), cDAO.getCategoryById(rs.getString("id-category")));
				return b;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Book> getBooksByAuthorId(String AId) {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "SELECT *\r\n"
				+ "  FROM [dbo].[Book]\r\n"
				+ "  WHERE 1=1";
		if (!AId.equals("0")) {
			selectQuery += " and [id-author]='"+AId+"'"
						+ " order by [name-book] asc";
		}
		else {
			selectQuery += " order by [name-book] asc";
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
	
	public ArrayList<Book> getBooksByCategoryId(String CId) {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "SELECT *\r\n"
				+ "  FROM [dbo].[Book]\r\n"
				+ "  WHERE 1=1";
		if (!CId.equals("0")) {
			selectQuery += " and [id-category]='"+CId+"'"
						+ " order by [name-book] asc";
		}
		else {
			selectQuery += " order by [name-book] asc";
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
	
	public ArrayList<Book> getBooksByAuthorIdNotInIdBook(String BId, String AId) {
		ArrayList<Book> list = new ArrayList<>();
		String selectQuery = "SELECT *\r\n"
				+ "FROM Book\r\n"
				+ "WHERE [id-author] = '"+AId+"' and \r\n"
				+ "[name-book] not in \r\n"
				+ "(SELECT [name-book]\r\n"
				+ "FROM Book\r\n"
				+ "WHERE [id-book] = '"+BId+"' )";
		try {
			PreparedStatement ps = conn.prepareStatement(selectQuery);
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
	
	public ArrayList<Book> getListBookByPage(ArrayList<Book> list, int start, int end) {
		ArrayList<Book> listBook = new ArrayList<>();
		for (int i = start; i < end; i++) {
			listBook.add(list.get(i));
		}
		return listBook;
	}
}
