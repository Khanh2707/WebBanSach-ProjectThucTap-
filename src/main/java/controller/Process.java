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
		
		int num = -1;
		
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
		request.getRequestDispatcher("MyCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
