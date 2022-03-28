<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Model.*" %>

<!DOCTYPE html>
<html lang="en">
  
<head>
	<jsp:include page="HeaderAd.jsp"></jsp:include>
</head>


<body class="fixed-top">


	<c:if test="${sessionScope.user==null}">
    	<c:redirect url="login.jsp"/>
    </c:if>


    <c:if test="${sessionScope.user.getRole()=='user'}">
	    <c:redirect url="Index.jsp"/>
    </c:if>



   <div id="header" class="navbar navbar-inverse navbar-fixed-top">
       <div class="navbar-inner">
           <div class="container-fluid">
               <a class="brand" href="logout.jsp">
					Log out
               </a>

           </div>
       </div>
   </div>
   <div id="container" class="row-fluid">
      <div id="sidebar" class="nav-collapse collapse">
          <ul class="sidebar-menu">

              <li class="has-sub ">
                  <a href="listeCommandes.jsp" class="">
                      <span class="icon-box"> <i class="icon-book"></i></span> Commades
                  </a>
              </li>

              <li class="has-sub active">
                  <a href="listUtilisateur.jsp" class="">
                      <span class="icon-box"> <i class="icon-book"></i></span> Users
                  </a>
              </li>

        </ul>

      </div>
      
      <div id="main-content">
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
    
                  <h3 class="page-title">
                     Ajouter un utilisateur
                  </h3>
                   
               </div>
            </div>
            <div class="row-fluid">
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE widget-->
                    <div class="widget">
                        <div class="widget-body">
                        <form action="Utilisateur" method="post">
					      <table>
					           
					           <tr>
					                <td>Email: </td>
					                <td><input type="text" name="email" ></td>
					           </tr>
					           
					            <tr>
					                <td>Nom: </td>
					                <td><input type="text" name="nom" ></td>
					           </tr>
					           
					            <tr>
					                <td>Prenom:</td>
					                <td><input type="text" name="prenom" ></td>
					           </tr>
					           
					            <tr>
					                <td> Mot de passe:</td>
					                <td><input type="text" name="motPasse" ></td>
					           </tr>
					           
					            <tr>
					                <td>Ville: </td>
					                <td><input type="text" name="ville" ></td>
					           </tr>
					           <tr>
					                <td>Adresse: </td>
					                <td><input type="text" name="adresse" ></td>
					           </tr>
					           <tr>
					                <td>Telephone: </td>
					                <td><input type="text" name="tel" ></td>
					           </tr>
					           <tr>
					                <td>Code Postal: </td>
					                <td><input type="text" name="codePostal" ></td>
					           </tr>
					           
					            <tr>
					                <td>Role: </td>
					                <td>
					                      <select name="role" >
					                          <option value="admin">admin</option>
					                          <option value="user">user</option>
					                     </select>
					                </td>
					           </tr>
           
					           <tr>
					                <td><input class="btn btn-warning" type="submit" value="Add"></td>
					                <td><input  class="btn btn-inverse" type="reset" value="Clear"></td>
					           </tr>
					      
					      </table>
					      
					   	</form>
                        
                        </div>
                    </div>
                </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>