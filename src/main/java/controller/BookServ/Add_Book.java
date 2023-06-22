package controller.BookServ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Author;
import model.Book;
import model.Category;
import model.Publish_company;

import java.io.IOException;

import dal.Author_DAO;
import dal.Book_DAO;
import dal.Category_DAO;
import dal.Publish_company_DAO;

/**
 * Servlet implementation class Add_Book
 */
public class Add_Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Book() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_book = request.getParameter("id_book");
		String name_book = request.getParameter("name_book");
		String price_book = request.getParameter("price_book");
		String discount = request.getParameter("discount");
		String year_publish = request.getParameter("year_publish");
		String content_book = request.getParameter("content_book");
		String quantity_book = request.getParameter("quantity_book");
		String img_book = request.getParameter("img_book");
		String author = request.getParameter("author");
		String NXB = request.getParameter("NXB");
		String category = request.getParameter("category");
		int price_book_num = 0;
		byte discount_num = 0;
		short year_publish_num = 0;
		short quantity_book_num = 0;
		try {
			price_book_num = Integer.parseInt(price_book);
			discount_num = Byte.parseByte(discount);
			year_publish_num = Short.parseShort(year_publish);
			quantity_book_num = Short.parseShort(quantity_book);
		}
		catch (NumberFormatException ex) {
			System.out.println(ex);
		}
		Author_DAO aDAO = new Author_DAO();
		Author a = aDAO.getAuthorById(author);
		Publish_company_DAO pcDAO = new Publish_company_DAO();
		Publish_company pc = pcDAO.getPublish_companyById(NXB);
		Category_DAO cDAO = new Category_DAO();
		Category c = cDAO.getCategoryById(category);
		Book_DAO bd = new Book_DAO();
		Book b = bd.getBookById(id_book);
		if (b == null) {
			Book bNew = new Book(id_book, name_book, price_book_num, discount_num, year_publish_num, content_book, quantity_book_num, img_book, a, pc, c);
			bd.insert(bNew);
			response.sendRedirect("list_book");
		}
		else {
			request.setAttribute("error", id_book + " existed!");
			request.getRequestDispatcher("Add_Book.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
