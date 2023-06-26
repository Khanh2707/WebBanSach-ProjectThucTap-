package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.Order;
import model.OrderLine;

import java.io.IOException;
import java.util.ArrayList;

import dal.Book_DAO;
import dal.Order_DAO;

/**
 * Servlet implementation class List_OrderLine_By_Order
 */
public class List_OrderLine_By_Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List_OrderLine_By_Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Order_DAO oDAO = new Order_DAO();
		String id_order = request.getParameter("id_order");
		ArrayList<OrderLine> orderline = oDAO.getOrderLineById(id_order);
		Order order = oDAO.getOrderById(id_order);
		request.setAttribute("orderline", orderline);
		request.setAttribute("order", order);
		request.getRequestDispatcher("OrderLine.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
