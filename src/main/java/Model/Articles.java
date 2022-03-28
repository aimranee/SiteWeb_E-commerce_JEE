package Model;

public class Articles {
	private int codeArticle;
	private String designation;
	private int prix;
	private int stock;
	private int categorie;
	private String photo;
	
	public Articles() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Articles(String designation, int prix, int stock, String photo) {
		super();
		this.designation = designation;
		this.prix = prix;
		this.stock = stock;
		this.photo = photo;
	}
	public Articles(int codeArticle, String designation, int prix, int stock, String photo) {
		super();
		this.codeArticle = codeArticle;
		this.designation = designation;
		this.prix = prix;
		this.stock = stock;
		this.photo = photo;
	}
	
	public int getCodeArticle() {
		return codeArticle;
	}
	public void setCodeArticle(int codeArticle) {
		this.codeArticle = codeArticle;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCategorie() {
		return categorie;
	}
	public void setCategorie(int categorie) {
		this.categorie = categorie;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
