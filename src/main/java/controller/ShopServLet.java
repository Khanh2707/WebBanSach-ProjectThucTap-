package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.Cart;
import model.Items;

import java.io.IOException;
import java.util.ArrayList;

import dal.Book_DAO;

/**
 * Servlet implementation class ShopServLet
 */
public class ShopServLet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopServLet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		ArrayList<Items> listItems = cart.getItems();
		int n;
		if (listItems != null) {
			n = listItems.size();
		}
		else {
			n = 0;
		}
		request.setAttribute("size", n);
		request.setAttribute("data", list);
		request.getRequestDispatcher("MyShop.jsp").forward(request, response);
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
		ArrayList<Items> listItems = cart.getItems();
		int n;
		if (listItems != null) {
			n = listItems.size();
		}
		else {
			n = 0;
		}
		request.setAttribute("size", n);
		request.setAttribute("data", list);
		request.getRequestDispatcher("MyShop.jsp").forward(request, response);
	}

}
