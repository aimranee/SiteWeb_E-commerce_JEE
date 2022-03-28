package Model;

public class Categories {
	private int refCat;
	private String cat;
	
	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Categories(int refCat, String cat) {
		super();
		this.refCat = refCat;
		this.cat = cat;
	}
	
	public int getRefCat() {
		return refCat;
	}
	public void setRefCat(int refCat) {
		this.refCat = refCat;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	
}
