<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="Model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
       Articles art = (Articles) request.getAttribute("article");       

    Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

   %>

<!DOCTYPE html>

<html lang="en">
  <head>
    
    <title>Detail Produit</title>
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
                        <li class="active"><a href="ShowArticle.jsp">Details</a></li>
                        <li><a href="Card.jsp">Panier</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div>
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Article : <%= art.getDesignation()%></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
            
                <div class="col-md-12">
                    <div class="product-content-right">
                    <div class="col-sm-6">
                       <div class="product-images">
                        <div class="product-main-img">
                               <img src="../img/<%= art.getPhoto() %>.jpg" alt="">
                           </div>
				        </div>
				        </div>
                        <div class="row">
                            
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name"><%= art.getDesignation()%></h2>
                                    <div class="product-inner-price">
                                        <ins><%= art.getPrix() %>$</ins> <del><%= art.getPrix()*2 %>$</del>
                                    </div>    
                                    
                                    <form action="addLignesCommandes" method="post" class="cart">
                                        <div class="quantity">
                                            <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="qteCde" min="1" step="1">
                                        </div>
                                        <input type="hidden" name="codeArticle" value="<%= art.getCodeArticle()%>">
							             <input type="hidden" name="userId" value="<%= utilisateur.getId() %>">
                                        <button class="add_to_cart_button" type="submit">Add to cart</button>
                                    </form>   
                                    
                                    <div class="product-inner-category">
                                        <p>Category: <a href=""><%= art.getCategorie() %></a>.</p>
                                    </div> 
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