package controller.HnbServ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.Hnb;

import java.io.IOException;

import dal.Book_DAO;
import dal.Hnb_DAO;

/**
 * Servlet implementation class Update_Hnb
 */
public class Update_Hnb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Hnb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Hnb_DAO hnbDAO = new Hnb_DAO();
		Hnb hnb = hnbDAO.getHnbById(id);
		request.setAttribute("hnb", hnb);
		request.getRequestDispatcher("Update_Hnb.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String img = request.getParameter("img");
		String id_book = request.getParameter("id_book");
		Hnb_DAO hnbDAO = new Hnb_DAO();
		Book_DAO bDAO = new Book_DAO();
		Book b = bDAO.getBookById(id_book);
		Hnb hnbNew = new Hnb(id, img, b);
		hnbDAO.update(hnbNew);
		response.sendRedirect("list_hnb");
	}

}
