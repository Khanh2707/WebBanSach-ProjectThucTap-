package controller.BookServ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;

import java.io.IOException;
import java.util.ArrayList;

import dal.Book_DAO;

/**
 * Servlet implementation class List_Book
 */
public class List_Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List_Book() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book_DAO bDAO = new Book_DAO();
		ArrayList<Book> list = bDAO.getAll();
		
		int page, numberPage = 6;
		int size = list.size();
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
		ArrayList<Book> listPage = bDAO.getListBookByPage(list, start, end);
		
		request.setAttribute("dataB", listPage);
		request.setAttribute("page", page);
		request.setAttribute("totalNumPage", totalNumPage);
		
		request.setAttribute("keySelected","sp");
		
		request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
