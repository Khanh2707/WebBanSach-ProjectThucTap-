package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;

import dal.Account_DAO;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Account_DAO aDAO = new Account_DAO();
		if (aDAO.checkRegister(email) == null) {
			Account a = new Account(fullname, email, password, 1, 0);
			aDAO.insert(a);
			request.setAttribute("success", "Đăng ký tài khoản thành công");
			request.setAttribute("email", email);
			request.getRequestDispatcher("Sign_in.jsp").forward(request, response);
		}
		else {
			request.setAttribute("error", "Tài khoản đã tồn tại");
			request.getRequestDispatcher("Sign_up.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
