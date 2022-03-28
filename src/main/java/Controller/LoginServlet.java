package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ConnectionDB;
import Model.DaoOperations;
import Model.Utilisateur;

public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String motPasse = request.getParameter("motPasse");

		DaoOperations op = new DaoOperations();
		Utilisateur utilisateur = op.getUtilisateurEmail(email);
		System.out.println(utilisateur.getMotPasse()+"  "+motPasse);
		if (utilisateur.getMotPasse().equals(motPasse)) {
			
			String role=utilisateur.getRole();
			int id = utilisateur.getId();
			
			request.getSession().setAttribute("user", new Utilisateur(id,email,motPasse,role));
			
			response.sendRedirect("Index.jsp");

		} else  {
			
			System.out.println( "Invalid password try again");
			response.sendRedirect("login.jsp");
		}
			
	}

}

