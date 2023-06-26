package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Book;
import model.Cart;

import java.io.IOException;
import java.util.ArrayList;

import dal.Book_DAO;
import dal.Cart_DAO;

/**
 * Servlet implementation class Purchase_Order
 */
public class Purchase_Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Purchase_Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book_DAO bDAO = new Book_DAO();
		ArrayList<Book> list = bDAO.getAll();
		Cookie[] arrCookies = request.getCookies();
		
		String txtCookies = "";
		if (arrCookies != null) {
			for (Cookie cookie : arrCookies) {
				if (cookie.getName().equals("cart")) {
					txtCookies += cookie.getValue();
				}
			}
		}
		
		Cart cart = new Cart(txtCookies, list);
		
		Cart_DAO cDAO = new Cart_DAO();
		
		HttpSession session = request.getSession();
		Account a = (Account) session.getAttribute("account");
		
		String phone_raw = request.getParameter("phone");
		String address = request.getParameter("address");
		String method_pay = request.getParameter("method_pay");
		
		int phone = 0;
		try {
			phone = Integer.parseInt(phone_raw);
		}
		catch (NumberFormatException e) {
			System.err.println(e);
		}
		
		cDAO.addOrder(a, cart, phone, address, method_pay);
		Cookie c = new Cookie("cart", "");
		c.setMaxAge(0);
		response.addCookie(c);
		session.setAttribute("size", 0);
		request.getRequestDispatcher("Home.jsp").forward(request, response);
	}

}
