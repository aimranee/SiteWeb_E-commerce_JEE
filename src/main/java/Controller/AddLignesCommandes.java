package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Articles;
import Model.DaoOperations;

public class AddLignesCommandes extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int codeArticle = Integer.parseInt(request.getParameter("codeArticle"));
        int qteCde = Integer.parseInt(request.getParameter("qteCde"));
        int userId = Integer.parseInt(request.getParameter("userId"));
		
		DaoOperations op = new DaoOperations();
		Articles article  = op.getArticle(codeArticle);
		int prix = (int) (article.getPrix()*qteCde);
		System.out.println("test : "+codeArticle + qteCde+ prix+userId);
		op.addLignesCommandes(codeArticle, qteCde, prix,userId);
		response.sendRedirect("Card.jsp");
		
	}

}
