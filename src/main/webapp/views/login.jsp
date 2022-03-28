<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Model.*"%>
 <%

    Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
 
   %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- styles -->
<link href='http://fonts.googleapis.com/css?family=Droid+Serif' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,800,700,300' rel='stylesheet' type='text/css'>
<link href="assets/template1/assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/template1/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/template1/assets/css/docs.css" rel="stylesheet">
<link href="assets/template1/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
<link href="assets/template1/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/template1/assets/css/flexslider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="./assets/template1/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<link rel="shortcut icon" href="assets/ico/favicon.html">
</head>
<body>
<!-- Header Start -->

        <!-- Account Login-->
        <div class="span9">
          
          <section class="returncustomer">
            <h2 class="heading2">Login page</h2>
            <div class="loginbox">
              <h4 class="heading4">I am a returning customer</h4>
              <form class="form-vertical" action="login" method="post" >
                <fieldset>
                  <div class="control-group">
                    <label  class="control-label">Login:</label>
                    <div class="controls">
                      <input type="text" name="email"  class="span3">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Password:</label>
                    <div class="controls">
                      <input type="password" name="motPasse" class="span3">
                    </div>
                  </div>
                  <br>
                  <input class="btn btn-success" type="submit" value="Login" >
                  <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="inscription.jsp"
                	class="link-danger">Register</a></p>
                </fieldset>
              </form>
            </div>
          </section>
        </div>

</body>
</html>