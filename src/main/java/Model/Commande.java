package Model;

public class Commande {
	
	private int numCommande;
	private int codeClient;
	private String dateCommande;
	
	
	public Commande() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Commande(int codeClient, String dateCommande) {
		super();
		this.codeClient = codeClient;
		this.dateCommande = dateCommande;
	}
	public int getNumCommande() {
		return numCommande;
	}
	public void setNumCommande(int numCommande) {
		this.numCommande = numCommande;
	}
	public int getCodeClient() {
		return codeClient;
	}
	public void setCodeClient(int codeClient) {
		this.codeClient = codeClient;
	}
	public String getDateCommande() {
		return dateCommande;
	}
	public void setDateCommande(String dateCommande) {
		this.dateCommande = dateCommande;
	}
	
}
