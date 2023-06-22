package controller.Publish_companyServ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Publish_company;

import java.io.IOException;

import dal.Publish_company_DAO;

/**
 * Servlet implementation class Add_Publish_company
 */
public class Add_Publish_company extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Publish_company() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Publish_company_DAO ad = new Publish_company_DAO();
		Publish_company a = ad.getPublish_companyById(id);
		if (a == null) {
			Publish_company aNew = new Publish_company(id, name);
			ad.insert(aNew);
			response.sendRedirect("list_publish_company");
		}
		else {
			request.setAttribute("error", id + " existed!");
			request.getRequestDispatcher("Add_Publish_company.jsp").forward(request, response);
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
