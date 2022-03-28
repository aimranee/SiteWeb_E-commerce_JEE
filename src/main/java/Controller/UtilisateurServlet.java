package Controller;

import Model.DaoOperations;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Utilisateur;

public class UtilisateurServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String action =  request.getParameter("action");

	   if(action.equals("edit")){
		   		   
		   Utilisateur utilisateur = new Utilisateur();
		   DaoOperations op = new DaoOperations();
		   utilisateur = op.getUtilisateur(id);
		   request.setAttribute("utilisateur", utilisateur);
		   request.getRequestDispatcher("EditUtilisateur.jsp").forward(request, response);
		   
	     }
	
       else if(action.equals("delete")){
		   			   
		   DaoOperations op = new DaoOperations();
		   op.suppUtlisateur(id);

		   request.getRequestDispatcher("listUtilisateur.jsp").forward(request, response);
	   }
	
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		   String email = request.getParameter("email");
		   String nom = request.getParameter("nom");
		   String prenom = request.getParameter("prenom");
		   String motPasse = request.getParameter("motPasse");
		   String adresse = request.getParameter("adresse");
		   String codePostal = request.getParameter("codePostal");
		   String tel = request.getParameter("tel");
		   String ville = request.getParameter("ville");
		   String role = request.getParameter("role");
		   System.out.println(email);
		   
		   Utilisateur utilisateur = new Utilisateur(nom,prenom,email,adresse,codePostal,ville,tel, motPasse, role);
		   DaoOperations op = new DaoOperations();
		   op.addUtilisateur(utilisateur);

			request.getRequestDispatcher("listUtilisateur.jsp").forward(request, response);				
	}

}
