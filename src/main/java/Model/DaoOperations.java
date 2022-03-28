package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoOperations {
	
	public ArrayList<Articles> getAllArticle(){
		
	   ArrayList<Articles> listArticle = new ArrayList<Articles>();
		
	   try{
			
		   Connection con = ConnectionDB.getConnection();
		   PreparedStatement pr =  con.prepareStatement("select * from articles");
			  ResultSet rs = pr.executeQuery();
			  
			    while(rs.next()){
				      Articles article =  new Articles();
				      article.setCodeArticle(rs.getInt("codeArticle"));
				      article.setDesignation(rs.getString("designation"));
				      article.setPrix(rs.getInt("prix"));
				      article.setStock(rs.getInt("stock"));
				      article.setCategorie(rs.getInt("categorie"));
				      article.setPhoto(rs.getString("photo"));
				      
				      listArticle.add(article);
			      }
			    
			}catch(Exception e){}
	   
		return listArticle;
	}
	
	public Articles getArticle(int id){

		Articles article = new Articles();
		 Connection con = ConnectionDB.getConnection();
		 String req = "SELECT * FROM Articles WHERE codeArticle = "+id;
		   try{
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(req);

				while (rs.next()) {
					
					article.setCodeArticle(rs.getInt("codeArticle"));
				    article.setDesignation(rs.getString("designation"));
				    article.setPrix(rs.getInt("prix"));
				    article.setStock(rs.getInt("stock"));
				    article.setCategorie(rs.getInt("categorie"));
				    article.setPhoto(rs.getString("photo"));
					
				}

		}catch(SQLException e) {
			
		}
		   return article;
	}
	
	public void addArticle (Articles article) {
		Connection con = ConnectionDB.getConnection();
		String sql = "insert into articles values (default,?,?,?,null,?)";
		try {
			
		   PreparedStatement pr =  con.prepareStatement(sql);
		
		   pr.setString(1,article.getDesignation());
		   pr.setInt(2,(int) article.getPrix());
		   pr.setInt(3, article.getStock());
		   pr.setString(4,article.getPhoto());

		   pr.executeUpdate();
		   pr.close();
		}catch(SQLException e) {
			
		}
	}
	
	public void editeArticle (Articles article) {
		Connection con = ConnectionDB.getConnection();
		try {
			
		      String sql = "UPDATE produit SET designation=?, prix=?, stock=?, categorie=null, photo=? "
		      		+ "WHERE codeArticle=?";
		      PreparedStatement pr = con.prepareStatement(sql);
		      pr.setString(1,article.getDesignation());
			  pr.setInt(2,(int) article.getPrix());
			  pr.setInt(3, article.getStock());
			  pr.setString(4,article.getPhoto());
			  pr.setInt(5, article.getCodeArticle());
		     
		      pr.executeUpdate();            
		
		} catch (Exception e) {
		      e.printStackTrace();
		}
	}
	
	public void suppArticle (int id) {
		Connection con = ConnectionDB.getConnection();
		String sql = "DELETE FROM articles WHERE codeArticle=?";
        PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
	        ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	public ArrayList<LignesCommandes> getAllLignesCommandes(int userId){
		
		   ArrayList<LignesCommandes> listLignesCommandes = new ArrayList<LignesCommandes>();
			
		   try{
				
			   Connection con = ConnectionDB.getConnection();
			   PreparedStatement pr =  con.prepareStatement("select * from lignescommande where userId = "+userId);
				  ResultSet rs = pr.executeQuery();
				  
				    while(rs.next()){
				    	LignesCommandes lignesCommandes =  new LignesCommandes();
				    	lignesCommandes.setNumCommande(rs.getInt("numCommande"));
				    	lignesCommandes.setCodeArticle(rs.getInt("codeArticle"));
				    	lignesCommandes.setQteCde(rs.getInt("QteCde"));
				    	lignesCommandes.setPrix(rs.getInt("Prix"));
				    	lignesCommandes.setUserId(rs.getInt("userId"));
				    	listLignesCommandes.add(lignesCommandes);
				      }
				    
				}catch(Exception e){}
		   
			return listLignesCommandes;
		}
	
	public void addLignesCommandes(int codeArticle, int qteCde,int prix, int userId) {
		 Connection con = ConnectionDB.getConnection();
		 String req = "insert into lignescommande values (default,?,?,?,?)";
		try{
			PreparedStatement pr =  con.prepareStatement(req);
			pr.setInt(1,codeArticle);
		    pr.setInt(2,qteCde);
		    pr.setInt(3,prix);
		    pr.setInt(4,userId);
		    
		    pr.executeUpdate();
		    pr.close();
		}catch(SQLException e) {
			
		}
	}
	public void editLignesCommandes(int numCommande,int qteCde, int userId, int prix ) {
		 Connection con = ConnectionDB.getConnection();
		try {
			
		      String sql = "UPDATE lignescommande SET qteCde =?, userId=?, prix=?  where numCommande = ?";
		      
		      PreparedStatement ps = con.prepareStatement(sql);
		      ps.setInt(1, qteCde);
		      ps.setInt(2, userId);
			  ps.setInt(3, prix);
			  ps.setInt(4, numCommande);
		     
		      ps.executeUpdate();            

           } catch (Exception e) {
               e.printStackTrace();
           }
     
	}
	public void suppLignesCommandes(int numCommande) {
		try {
			  Connection con = ConnectionDB.getConnection();
	         String sql = "DELETE FROM lignescommande WHERE numCommande=?";
	         PreparedStatement pr = con.prepareStatement(sql);
	         pr.setInt(1, numCommande);
	         pr.executeUpdate();
	
	       } catch (Exception e) {
               e.printStackTrace();
             }
	}
	public void suppAllLignesCommandes(int userId) {
		Connection con = ConnectionDB.getConnection();
		String sql = "delete from lignescommande where userId=?";
		try{
			PreparedStatement pr = con.prepareStatement(sql);
	         pr.setInt(1, userId);
	         pr.executeUpdate();
		}catch(Exception e) {
			
		}
	}
	public void AddCommande(int userId, String dateCommande) {
		Connection con = ConnectionDB.getConnection();
		String sql = "insert into commande values (default,?,?)";
		try {
			PreparedStatement pr = con.prepareStatement(sql);
			pr.setInt(1, userId);
			pr.setString(2, dateCommande);
			pr.executeUpdate();
			pr.close();
		}catch(SQLException e) {
			
		}
	}
	
	
	public void suppCommande(int id) {
		Connection con = ConnectionDB.getConnection();
        String sql = "DELETE FROM commande WHERE numCommande=?";   
		try {
               PreparedStatement pr = con.prepareStatement(sql);
               pr.setInt(1, id);
               pr.executeUpdate();

             } catch (Exception e) {
                     e.printStackTrace();
           }
	}
	
	public ArrayList<Commande> getAllCommandes(){
		
		   ArrayList<Commande> listcommandes = new ArrayList<Commande>();
			
		   try{
				
			   Connection con = ConnectionDB.getConnection();
			   PreparedStatement pr =  con.prepareStatement("select * from commande");
				  ResultSet rs = pr.executeQuery();
				  
				    while(rs.next()){
				    	  Commande commande =  new Commande();
				    	  commande.setNumCommande(rs.getInt("numCommande"));
				    	  commande.setCodeClient(rs.getInt("codeClient"));
				    	  commande.setDateCommande(rs.getString("dateCommande"));
					    
					      listcommandes.add(commande);
				      }
				    
				}catch(Exception e){}
		   
			return listcommandes;
		}
	
	public ArrayList<Utilisateur> getAllUser(){
		
		ArrayList<Utilisateur> listutilisateur = new ArrayList<Utilisateur>();
		try{
		
			Connection con = ConnectionDB.getConnection();
			PreparedStatement pr =  con.prepareStatement("select * from utilisateur");
		    ResultSet rs = pr.executeQuery();
		  
		    while(rs.next()){
			      Utilisateur utilisateur =  new Utilisateur();
			      utilisateur.setId(rs.getInt("id"));
			      utilisateur.setNom(rs.getString("nom"));
			      utilisateur.setPrenom(rs.getString("prenom"));
			      utilisateur.setAdresse(rs.getString("adresse"));
			      utilisateur.setVille(rs.getString("ville"));
			      utilisateur.setEmail(rs.getString("email"));
			      utilisateur.setTel(rs.getString("tel"));
			      utilisateur.setCodePostal(rs.getString("codePostal"));
			      utilisateur.setMotPasse(rs.getString("motPasse"));
			      utilisateur.setRole(rs.getString("role"));
			     
			      listutilisateur.add(utilisateur);
			  
		      }
		    
		}catch(Exception e){}
	
		return listutilisateur;
		
	}
	
	public Utilisateur getUtilisateur(int id) {
		
		Utilisateur utilisateur = new Utilisateur();
	try{
		Connection con = ConnectionDB.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE id = "+id);
		
		while (rs.next()) {
			  utilisateur.setId(rs.getInt("id"));
		      utilisateur.setNom(rs.getString("nom"));
		      utilisateur.setPrenom(rs.getString("prenom"));
		      utilisateur.setAdresse(rs.getString("adresse"));
		      utilisateur.setVille(rs.getString("ville"));
		      utilisateur.setEmail(rs.getString("email"));
		      utilisateur.setTel(rs.getString("tel"));
		      utilisateur.setCodePostal(rs.getString("codePostal"));
		      utilisateur.setMotPasse(rs.getString("motPasse"));
		      utilisateur.setRole(rs.getString("role"));
		}
		
	}catch(Exception e){}
		
		return utilisateur;
	}
	public Utilisateur getUtilisateurEmail(String email) {
			
			Utilisateur utilisateur = new Utilisateur();
		try{
		Connection con = ConnectionDB.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE email = '"+email+"'");
		
		while (rs.next()) {
			  utilisateur.setId(rs.getInt("id"));
		      utilisateur.setNom(rs.getString("nom"));
		      utilisateur.setPrenom(rs.getString("prenom"));
		      utilisateur.setAdresse(rs.getString("adresse"));
		      utilisateur.setVille(rs.getString("ville"));
		      utilisateur.setEmail(rs.getString("email"));
		      utilisateur.setTel(rs.getString("tel"));
		      utilisateur.setCodePostal(rs.getString("codePostal"));
		      utilisateur.setMotPasse(rs.getString("motPasse"));
		      utilisateur.setRole(rs.getString("role"));
		}
		
	}catch(Exception e){}
		
		return utilisateur;
	}
	
	public void addUtilisateur (Utilisateur utilisateur){		
		Connection con = ConnectionDB.getConnection();
		String req = "insert into utilisateur values (default,?,?,?,?,?,?,?,?,?)";
		try {
		   
			PreparedStatement pr = con.prepareStatement(req);
			
		   pr.setString(1, utilisateur.getEmail());
		   pr.setString(2, utilisateur.getNom());
		   pr.setString(3, utilisateur.getPrenom());
		   pr.setString(4, utilisateur.getAdresse());
		   pr.setString(5, utilisateur.getCodePostal());
		   pr.setString(6, utilisateur.getVille());
		   pr.setString(7, utilisateur.getTel());
		   pr.setString(8, utilisateur.getMotPasse());
		   pr.setString(9, utilisateur.getRole());
		   
		   pr.executeUpdate();
		   pr.close();
			   
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void editUtilisateur (Utilisateur utilisateur) {
		Connection con = ConnectionDB.getConnection();
		String sql = "UPDATE utilisateur SET email=?, nom=?, prenom=?, adresse=?, codePostal=?, ville=?, tel=?, motPasse=?, role=?" +
			     " WHERE id=?";
		try {

		     PreparedStatement pr = con.prepareStatement(sql);
		     pr.setString(1, utilisateur.getEmail());
			 pr.setString(2, utilisateur.getNom());
			 pr.setString(3, utilisateur.getPrenom());
			 pr.setString(4, utilisateur.getAdresse());
			 pr.setString(5, utilisateur.getCodePostal());
			 pr.setString(6, utilisateur.getVille());
			 pr.setString(7, utilisateur.getTel());
			 pr.setString(8, utilisateur.getMotPasse());
			 pr.setString(9, utilisateur.getRole());
			 pr.setInt(10, utilisateur.getId());
			   
		     pr.executeUpdate();     
		     pr.close();
		
		 } catch (Exception e) {
		     e.printStackTrace();
		 }
   
	}
	public void suppUtlisateur (int id) {
		Connection con = ConnectionDB.getConnection();
		String sql = "DELETE FROM utilisateur WHERE id=?";
		try {
	        PreparedStatement pr = con.prepareStatement(sql);
	        pr.setInt(1, id);
	        pr.executeUpdate();
	
	      } catch (Exception e) {
              e.printStackTrace();
          }
	}
}
