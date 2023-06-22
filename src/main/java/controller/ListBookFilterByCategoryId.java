package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.Category;

import java.io.IOException;
import java.util.ArrayList;

import dal.Book_DAO;
import dal.Category_DAO;

/**
 * Servlet implementation class ListBookFilterByCategoryId
 */
public class ListBookFilterByCategoryId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBookFilterByCategoryId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_category = request.getParameter("id_category");
		Book_DAO bDAO = new Book_DAO();
		ArrayList<Book> listB = bDAO.getBooksByCategoryId(id_category);
		
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
		
		Category_DAO cDAO = new Category_DAO();
		Category c = cDAO.getCategoryById(id_category);
		
		request.setAttribute("dataB", listPage);
		request.setAttribute("page", page);
		request.setAttribute("totalNumPage", totalNumPage);
		
		if (c == null) {
			Category allC = new Category();
			allC.setId("All");
			allC.setName("Tất cả sản phẩm");
			request.setAttribute("category", allC);
			request.setAttribute("keyOrderBy", "all");
			request.setAttribute("nameOrderBy", "all");
		}
		else {
			request.setAttribute("category", c);
			request.setAttribute("keyOrderBy", "category");
			request.setAttribute("nameOrderBy", c.getId());
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
