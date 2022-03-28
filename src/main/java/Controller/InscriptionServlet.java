package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Utilisateur;
import Model.DaoOperations;


/**
 * Servlet implementation class InscriptionServlett
 */
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
           String email = request.getParameter("email");
		   String nom = request.getParameter("nom");
		   String prenom = request.getParameter("prenom");
		   String motPasse = request.getParameter("motPasse");
		   String adresse = request.getParameter("adresse");
		   String codePostal = request.getParameter("codePostal");
		   String tel = request.getParameter("tel");
		   String ville = request.getParameter("ville");
		   String role = "user";
		   
		   Utilisateur utilisateur = new Utilisateur(nom,prenom,email,adresse,codePostal,ville,tel, motPasse, role);
		   DaoOperations op = new DaoOperations();
		   op.addUtilisateur(utilisateur);

		   response.sendRedirect("login.jsp");  

	}

}
