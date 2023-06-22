package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import model.Account;

import java.io.IOException;

import dal.Account_DAO;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Sign_in.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		
		Account_DAO aDAO = new Account_DAO();
		Account a = aDAO.checkUser(username, password);
		
		HttpSession session = request.getSession();
		
		if (a == null) {
			request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác! ");
			request.getRequestDispatcher("Sign_in.jsp").forward(request, response);
		}
		else {
			session.setAttribute("account", a);
			
			if (a.getRole() == 0) {
				request.getRequestDispatcher("list_book").forward(request, response);
			}
			else {
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
		}
	}

}
