package Model;

public class LignesCommandes {
	private int numCommande;
	private int codeArticle;
	private int qteCde;
	private int userId;
	private int prix;
	
	public LignesCommandes() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LignesCommandes(int numCommande, int codeArticle, int qteCde, int userId, int prix) {
		super();
		this.numCommande = numCommande;
		this.codeArticle = codeArticle;
		this.qteCde = qteCde;
		this.userId = userId;
		this.prix = prix;
	}

	public int getNumCommande() {
		return numCommande;
	}
	public void setNumCommande(int numCommande) {
		this.numCommande = numCommande;
	}
	public int getCodeArticle() {
		return codeArticle;
	}
	public void setCodeArticle(int codeArticle) {
		this.codeArticle = codeArticle;
	}
	public int getQteCde() {
		return qteCde;
	}
	public void setQteCde(int qteCde) {
		this.qteCde = qteCde;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPrix() {
		return prix;
	}

	public void setPrix(int prix) {
		this.prix = prix;
	}
	
	
}
