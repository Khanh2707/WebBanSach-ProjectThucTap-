package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Author;
import model.Book;
import model.Category;

import java.io.IOException;
import java.util.ArrayList;

import dal.Author_DAO;
import dal.Book_DAO;
import dal.Category_DAO;
import dal.OrderByDAO;

/**
 * Servlet implementation class ListSelect
 */
public class ListSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String list_select = request.getParameter("list_select");
		String keyOrderBy = request.getParameter("keyOrderBy");
		String nameOrderBy = request.getParameter("nameOrderBy");
		System.out.println(keyOrderBy + " " +nameOrderBy + " " +list_select);
		OrderByDAO oDAO = new OrderByDAO();
		ArrayList<Book> books = oDAO.getBooksByKeyOrderBy(keyOrderBy, nameOrderBy, list_select);
		
		int page, numberPage = 12;
		int size = books.size();
		int totalNumPage = (size % numberPage == 0 ? (size / numberPage) : ((size / numberPage) + 1));
		String xPage = request.getParameter("page");
		if (xPage == null) {
			page = 1;
		}
		else {
			page = Integer.parseInt(xPage);
		}
		int start, end;
		start = ((page - 1) * numberPage);
		end = Math.min(page * numberPage, size);
		Book_DAO bDAO = new Book_DAO();
		ArrayList<Book> listPage = bDAO.getListBookByPage(books, start, end);
		
		request.setAttribute("dataB", listPage);
		request.setAttribute("page", page);
		request.setAttribute("totalNumPage", totalNumPage);
		
		if (keyOrderBy.equals("category")) {
			Category_DAO cDAO = new Category_DAO();
			Category c = cDAO.getCategoryById(nameOrderBy);
			request.setAttribute("category", c);
			request.setAttribute("keyOrderBy", "category");
			request.setAttribute("nameOrderBy", c.getId());
			request.setAttribute("keyselected", list_select);
		}
		else if (keyOrderBy.equals("author")) {
			Author_DAO aDAO = new Author_DAO();
			Author allA = aDAO.getAuthorById(nameOrderBy);
			request.setAttribute("author", allA);
			request.setAttribute("keyOrderBy", "author");
			request.setAttribute("nameOrderBy", allA.getId());
			request.setAttribute("keyselected", list_select);
		}
		else if (keyOrderBy.equals("all")) {
			Category allC = new Category();
			allC.setId("All");
			allC.setName("Tất cả sản phẩm");
			request.setAttribute("category", allC);
			request.setAttribute("keyOrderBy", "all");
			request.setAttribute("nameOrderBy", "all");
			request.setAttribute("keyselected", list_select);
		}
		request.getRequestDispatcher("Filter_book.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
