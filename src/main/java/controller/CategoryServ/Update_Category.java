package controller.CategoryServ;

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
 * Servlet implementation class Update_Category
 */
public class Update_Category extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Category() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Category_DAO ad = new Category_DAO();
		Category a = ad.getCategoryById(id);
		request.setAttribute("category", a);
		request.getRequestDispatcher("Update_Category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Category_DAO ad = new Category_DAO();
		Category aNew = new Category(id, name);
		ad.update(aNew);
		response.sendRedirect("list_category");
	}

}
