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
 * Servlet implementation class Add_Account
 */
public class Add_Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role_raw = request.getParameter("role");
		int role = -1;
		try {
			role = Integer.parseInt(role_raw);
		}
		catch (NumberFormatException ex) {
			System.out.println(ex);
		}
		Account_DAO aDAO = new Account_DAO();
		Account a = aDAO.getAccountByUsername(username);
		if (a == null) {
			Account aNew = new Account(fullname, username, password, role, 0);
			aDAO.insert(aNew);
			response.sendRedirect("list_account");
		}
		else {
			request.setAttribute("error", username + " existed!");
			request.getRequestDispatcher("Add_Account.jsp").forward(request, response);
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
