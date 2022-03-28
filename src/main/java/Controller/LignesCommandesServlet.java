package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DaoOperations;

public class LignesCommandesServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int numCommande = Integer.parseInt(request.getParameter("numCommande"));
        String action = request.getParameter("action");
        
		if(action.equals("delete")){
			DaoOperations op = new DaoOperations();
			op.suppLignesCommandes(numCommande);
		   request.getRequestDispatcher("Card.jsp").forward(request, response);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
}
