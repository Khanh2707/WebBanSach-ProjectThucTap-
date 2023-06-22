package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Author;
import model.Book;

import java.io.IOException;
import java.util.ArrayList;

import dal.Book_DAO;

/**
 * Servlet implementation class ListBookFilterByAuthorId
 */
public class ListBookFilterByAuthorId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBookFilterByAuthorId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_author = request.getParameter("id_author");
		Book_DAO bDAO = new Book_DAO();
		ArrayList<Book> listB = bDAO.getBooksByAuthorId(id_author);
		
		int page, numberPage = 12;
		int size = listB.size();
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
		ArrayList<Book> listPage = bDAO.getListBookByPage(listB, start, end);
		
		request.setAttribute("dataB", listPage);
		request.setAttribute("page", page);
		request.setAttribute("totalNumPage", totalNumPage);
		
		Author allA = new Author();
		allA.setId(listB.get(0).getAuthor().getId());
		allA.setName(listB.get(0).getAuthor().getName());
		request.setAttribute("author", allA);
		request.setAttribute("keyOrderBy", "author");
		request.setAttribute("nameOrderBy", allA.getId());
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
