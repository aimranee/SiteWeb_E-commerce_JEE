<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Model.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>  
   <%
     ArrayList<Articles> listArticle = new ArrayList<Articles>();
     	DaoOperations op = new DaoOperations();
     	listArticle = op.getAllArticle();
     %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Articles</title>
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
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="Index.jsp">Home</a></li>
                        <li class="active"><a href="Shop.jsp">Articles</a></li>
                        <li><a href="#">Details</a></li>
                        <li><a href="Card.jsp">Panier</a></li>
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
                        <h2>Articles</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
            <% for(Articles art : listArticle) { %>
                <div class="col-md-3 col-sm-6">
                
                    <div class="single-shop-product">
                        <div class="product-upper">
                            <img src="../img/<%=art.getPhoto() %>.jpg" alt="">
                        </div>
                        <h2><a href=""><%=art.getDesignation() %></a></h2>
                        <div class="product-carousel-price">
                            <ins><%=art.getPrix() %></ins> <del><%=art.getPrix()*2 %></del>
                        </div>  
                        
                        <div class="product-option-shop">
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="Articles?id=<%= art.getCodeArticle()%>&action=show"">Add to cart</a>
                        </div>                       
                    </div>
                </div>
               
               <%} %>
              
            </div>
           
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
    
</body>
</html>