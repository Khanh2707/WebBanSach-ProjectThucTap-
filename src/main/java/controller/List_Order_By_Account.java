package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Order;
import model.OrderLine;

import java.io.IOException;
import java.util.ArrayList;

import dal.Order_DAO;

/**
 * Servlet implementation class List_Order_By_Account
 */
public class List_Order_By_Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List_Order_By_Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account a = (Account) session.getAttribute("account");
		Order_DAO oDAO = new Order_DAO();
		System.err.println(a.getUsername());
		ArrayList<Order> order = oDAO.getOrderByUsername(a.getUsername());
		ArrayList<OrderLine> orderline = oDAO.getOrderLineByUsername(a.getUsername());
		request.setAttribute("order", order);
		request.setAttribute("orderline", orderline);
		request.getRequestDispatcher("Info_account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
