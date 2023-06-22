package controller.Publish_companyServ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Publish_company;

import java.io.IOException;
import java.util.ArrayList;

import dal.Publish_company_DAO;

/**
 * Servlet implementation class List_Publish_company
 */
public class List_Publish_company extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List_Publish_company() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Publish_company_DAO a = new Publish_company_DAO();
		ArrayList<Publish_company> list = a.getAll();
		request.setAttribute("data", list);
		
		request.setAttribute("keySelected","nxb");
		
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
