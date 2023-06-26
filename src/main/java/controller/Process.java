package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Book;
import model.Cart;
import model.Items;

import java.io.IOException;
import java.util.ArrayList;

import dal.Book_DAO;

/**
 * Servlet implementation class Process
 */
public class Process extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Process() {
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
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		
		Cart cart = new Cart(txtCookies, list);
		String num_raw = request.getParameter("num");
		String id = request.getParameter("id");
		
		int num;
		
		try {
			Book b = bDAO.getBookById(id);
			int numStore = b.getQuantity();
			
			num = Integer.parseInt(num_raw);
			if (num == -1 && (cart.getQuantityById(id) <= 1)) {
				cart.removeItems(id);
			}
			else {
				if (num == 1 && cart.getQuantityById(id) >= numStore) {
					num = 0;
				}
				int price = (b.getOrigin_price() * (100 - b.getRatio_sale())) / 100;
				Items i = new Items(b, num, price);
				cart.addItems(i);
			}
		}
		catch (NumberFormatException e) {
			System.out.println(e);
		}
		
		ArrayList<Items> items = cart.getItems();
		txtCookies = "";
		if (items.size() > 0) {
			txtCookies = items.get(0).getBook().getId()+":"+items.get(0).getQuantity();
			for (int i = 1; i < items.size(); i++) {
				txtCookies += "/"+items.get(i).getBook().getId()+":"+items.get(i).getQuantity();
			}
		}
		
		Cookie c = new Cookie("cart", txtCookies);
		c.setMaxAge(60*60);
		response.addCookie(c);
		request.setAttribute("cart", cart);
		
		int n = 0;
		if (items.size() > 0) {
			for (Items items2 : items) {
				n += items2.getQuantity();				
			}
		}
		
		HttpSession session = request.getSession();
		session.removeAttribute("size");
		
		session.setAttribute("size", n);
		
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
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
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		
		String id = request.getParameter("id");
		System.err.println(id);
		
		String[] ids = txtCookies.split("/");
		String out = "";
		
		for (int i = 0; i < ids.length; i++) {
			String[] s = ids[i].split(":");
			if (!s[0].equals(id)) {
				if (out.isEmpty()) {
					out = ids[i];
				}
				else {
					out+="/"+ids[i];
				}
			}
		}
		
		if (!out.isEmpty()) {
			Cookie c = new Cookie("cart", out);
			c.setMaxAge(60*60*24);
			response.addCookie(c);
		}
		
		Cart cart = new Cart(out, list);

		ArrayList<Items> listItems = cart.getItems();

		int n = 0;
		if (listItems.size() > 0) {
			for (Items items : listItems) {
				n += items.getQuantity();
			}
		}
		
		HttpSession session = request.getSession();
		session.removeAttribute("size");
		
		session.setAttribute("size", n);

		
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}

}
