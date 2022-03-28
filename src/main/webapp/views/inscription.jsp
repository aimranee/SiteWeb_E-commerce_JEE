<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Page d'inscription</title>
</head>
<body>
<!-- Header Start -->
<jsp:include page="Header.jsp"></jsp:include>
  <section id="login">
    <div class="container">
      
      <div class="row">
        
        <!-- Account Login-->
          <h2 class="headingmain">Créer nouveau account</h2>
          
          <form action="Inscription" method="Post" class="form-horizontal">
             Nom:<br><input type="text" name="nom"><br>
	         Prenom:<br><input type="text" name="prenom"><br>
	         Email:<br><input type="text" name="email"><br>
	         Password:<br><input type="password" name="motPasse"><br>
	         Adresse:<br><input type="text" name="adresse"><br>
	         Code Postale:<br><input type="text" name="codePostal"><br>
	         Ville:<br><input type="text" name="ville"><br>
	         Telephone:<br><input type="text" name="tel"><br><br>
	         <input class="btn btn-success" type="submit" value="Creat new account" />
          </form>        
       
      </div>
    </div>
  </section>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>