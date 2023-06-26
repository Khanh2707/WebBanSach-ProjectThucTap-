package controller.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Order;
import model.OrderLine;

import java.io.IOException;
import java.util.ArrayList;

import dal.Order_DAO;

/**
 * Servlet implementation class Update_Order
 */
public class Update_Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Order_DAO oDAO = new Order_DAO();
		Order o = oDAO.getOrderById(id);
		request.setAttribute("order", o);
		ArrayList<OrderLine> list = oDAO.getOrderLineById(id);
		request.setAttribute("orderline", list);
		request.getRequestDispatcher("Update_Order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
