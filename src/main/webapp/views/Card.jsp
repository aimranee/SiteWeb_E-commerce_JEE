<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Model.*"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>


    <%
         
    Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
                 
   %>

<%

   ArrayList<LignesCommandes> listLignes = new ArrayList<LignesCommandes>();
	
   DaoOperations op = new DaoOperations();
   Articles art = new Articles();
   listLignes = op.getAllLignesCommandes(utilisateur.getId());
       int SubTotale=0,Totale = 0,Vat=0;
       int qteCde=0;
       
      for (LignesCommandes p : listLignes){
    	  art = op.getArticle(p.getCodeArticle());
    	  qteCde= qteCde + p.getQteCde();
    	  Totale = SubTotale + (p.getPrix() * p.getQteCde());  	  
      }
      

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Card</title>
    <jsp:include page="Header.jsp"></jsp:include>

</head>
<body>
<c:if test="${sessionScope.user==null}">
    <c:redirect url="login.jsp"/>
    </c:if>
    <c:if test="${sessionScope.user.getRole()=='admin'}">
    <c:redirect url="listeCommandes.jsp"/>
    </c:if>
	<div class="mainmenu-area">
        <div class="container">
            <div class="row"> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="Index.jsp">Home</a></li>
                        <li><a href="Shop.jsp">Articles</a></li>
                        <li><a href="#">Details</a></li>
                        <li class="active"><a href="Card.jsp">Panier</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Shopping Cart</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                
                <div class="col-md-12">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <form method="post" action="LignesCommandes">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-remove">&nbsp;</th>
                                            <th class="product-thumbnail">&nbsp;</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for (LignesCommandes p : listLignes){
                                    	art = op.getArticle(p.getCodeArticle());
                                    %>
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <a title="Remove this item" href="LignesCommandes?numCommande=<%= p.getNumCommande()%>&action=delete" class="remove" >×</a> 
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="single-product.html"><img width="145" height="145" alt="<%= art.getPhoto() %>" class="shop_thumbnail" src="../img/<%= art.getPhoto() %>.jpg"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="ShowProduct.jsp"><%= art.getDesignation() %></a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount"><%= art.getPrix() %></span> 
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input type="number" size="4" class="input-text qty text" title="Qty" value="<%= p.getQteCde() %>" min="0" step="1">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount"><%= p.getPrix() %></span> 
                                            </td>
                                        </tr>
                                        <%} %>	
                                    </tbody>
                                </table>
                            </form>

                            <div class="cart-collaterals">

                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>
								
                                <table cellspacing="0">
                                    <tbody>
										
                                        <tr class="order-total">
                                            <th>Order Total</th>
                                            <td><strong><span class="amount">$<%= Totale %></span></strong> </td>
                                            
                                        </tr>
                                        <tr>
                                        	<td class="actions" colspan="8">
                                        		<form action="Validation" method="get">
													<input type="hidden" name="userId" value="<%= utilisateur.getId() %>">
	                                                <input type="submit" value="Valider panier" class="checkout-button button alt wc-forward">
                                                </form>
                                         	</td>
                                         </tr>
							             
                                    </tbody>
                                </table>
                                
                            </div>


                            
                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>
        <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>