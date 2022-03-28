package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DaoOperations;
import Model.Utilisateur;

public class ConfirmEditUserServlet extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String motPass = request.getParameter("motPasse");
		String adresse = request.getParameter("adresse");
		String codePostal = request.getParameter("codePostal");
		String tel = request.getParameter("tel");
		String ville = request.getParameter("ville");
		String role = request.getParameter("role");
		   
		Utilisateur utilisateur = new Utilisateur(id,nom,prenom,email,adresse,codePostal,ville,tel, motPass, role);
		DaoOperations op = new DaoOperations();
		System.out.println("teeest : "+utilisateur.getEmail());
		op.editUtilisateur(utilisateur);

		request.getRequestDispatcher("listUtilisateur.jsp").forward(request, response);
	}
	
}
