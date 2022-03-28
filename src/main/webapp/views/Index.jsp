
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Model.*"%>
    
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="Model.DaoOperations" %>
<%@ page import ="Model.LignesCommandes" %>
<%@ page import ="java.util.ArrayList"%>

   <%
   ArrayList<Articles> listArticle = new ArrayList<Articles>();
   	DaoOperations op = new DaoOperations();
   	listArticle = op.getAllArticle();
    Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
    
   %>

<!DOCTYPE html>


<html lang="en">
 <head>
 <title>Home</title>
 </head>
  <body>
	<c:if test="${sessionScope.user==null}">
    <c:redirect url="login.jsp"/>
    </c:if>
    <c:if test="${sessionScope.user.getRole()=='admin'}">
    <c:redirect url="listeCommandes.jsp"/>
    </c:if>
    <jsp:include page="Header.jsp"></jsp:include>
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Index.jsp">Home</a></li>
                        <li><a href="Shop.jsp">Articles</a></li>
                        <li><a href="#">Details</a></li>
                        <li><a href="Card.jsp">Panier</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->

    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>30 Days return</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>Free shipping</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>Secure payments</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>New products</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
    
    <div class="maincontent-area">
    
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                    
                        <h2 class="section-title"></h2>
                        
                        <div class="product-carousel">
                        <% for(Articles u : listArticle) { %>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="../img/<%=u.getPhoto()%>.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="Articles?id=<%= u.getCodeArticle()%>&action=show" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                    </div>
                                </div>
                                
                                <h2><a href="Article?id=<%= u.getCodeArticle()%>&action=show"><%= u.getDesignation()%></a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins><%= u.getPrix()%></ins> <del><%= u.getPrix()*2%></del>
                                </div> 
                            </div>
                             <%} %>                 
                          </div>
                          	
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    <jsp:include page="Footer.jsp"></jsp:include>
  </body>
</html>
