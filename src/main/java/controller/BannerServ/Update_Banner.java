package controller.BannerServ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Banner;

import java.io.IOException;

import dal.Banner_DAO;

/**
 * Servlet implementation class Update_Banner
 */
public class Update_Banner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Banner() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Banner_DAO bnDAO = new Banner_DAO();
		Banner bn = bnDAO.getBannerById(id);
		request.setAttribute("banner", bn);
		request.getRequestDispatcher("Update_Banner.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Banner_DAO bnDAO = new Banner_DAO();
		Banner bnNew = new Banner(id, name);
		bnDAO.update(bnNew);
		response.sendRedirect("list_banner");
	}

}
