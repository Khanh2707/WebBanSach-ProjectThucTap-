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
 * Servlet implementation class CheckPay
 */
public class CheckPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("notification", "Bạn cần đăng nhập để thực hiện thanh toán");
			request.getRequestDispatcher("Sign_in.jsp").forward(request, response);
		}
		else {
//			Book_DAO bDAO = new Book_DAO();
//			ArrayList<Book> list = bDAO.getAll();
//			Cookie[] arrCookies = request.getCookies();
//			
//			String txtCookies = "";
//			if (arrCookies != null) {
//				for (Cookie cookie : arrCookies) {
//					if (cookie.getName().equals("cart")) {
//						txtCookies += cookie.getValue();
//					}
//				}
//			}
//			
//			Cart cart = new Cart(txtCookies, list);
//			
//			Cart_DAO cDAO = new Cart_DAO();
//			Account a = (Account) session.getAttribute("account");
//			cDAO.addOrder(a, cart);
//			Cookie c = new Cookie("cart", "");
//			c.setMaxAge(0);
//			response.addCookie(c);
//			session.setAttribute("size", 0);
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
			request.setAttribute("cart", cart);
			request.getRequestDispatcher("Pay_book.jsp").forward(request, response);
		}
	}

}
