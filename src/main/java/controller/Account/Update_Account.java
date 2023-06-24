package controller.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;

import dal.Account_DAO;

/**
 * Servlet implementation class Update_Account
 */
public class Update_Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		Account_DAO aDAO = new Account_DAO();
		Account a = aDAO.getAccountByUsername(username);
		request.setAttribute("account", a);
		request.getRequestDispatcher("Update_Account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role_raw = request.getParameter("role");
		String amount_raw = request.getParameter("amount");
		int role = -1;
		int amount = -1;
		try {
			role = Integer.parseInt(role_raw);
			amount = Integer.parseInt(amount_raw);
		}
		catch (NumberFormatException ex) {
			System.out.println(ex);
		}
		Account_DAO aDAO = new Account_DAO();
		Account aNew = new Account(fullname, username, password, role, amount);
		aDAO.update(aNew);
		response.sendRedirect("list_account");
	}

}
