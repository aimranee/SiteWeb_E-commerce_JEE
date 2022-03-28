<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="Model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        
    <!DOCTYPE html>

<html lang="en">


    <jsp:include page="HeaderAd.jsp"></jsp:include>

<body class="fixed-top">


	<c:if test="${sessionScope.user==null}">
    	<c:redirect url="login.jsp"/>
    </c:if>
    
    <c:if test="${sessionScope.user.getRole()=='user'}">
    	<c:redirect url="Index.jsp"/>
    </c:if>

	<sql:setDataSource var="myDB" driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost:3306/ecomjee"
       user="root"  password=""/>

	<sql:query dataSource = "${myDB}" sql = "select * from utilisateur where id = ${requestScope.utilisateur.getId() }" var = "result" />

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
      <!-- BEGIN SIDEBAR -->
      <div id="sidebar" class="nav-collapse collapse">

          <ul class="sidebar-menu">
            <li class="has-sub active">
                  <a href="listeCommandes.jsp" class="">
                      <span class="icon-box"> <i class="icon-book"></i></span> Commades
                  </a>
              </li>

               <li class="has-sub ">
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
                     Modifier l'utilisateur
                  </h3>
                   
               </div>
            </div>
            <!-- BEGIN ADVANCED TABLE widget-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE widget-->
                    <div class="widget">
                        
                        <div class="widget-body">
						 <form action="ConfirmEdit" method="post">
						   	<table>
						           
						           <c:forEach var="u" items="${result.rows}">
						           <tr>
						                <td>ID: </td>
						                <td><input type="text" name="id" value="${u.id }"/></td>
						           </tr>
						           
						           
						           <tr>
						                <td>Email: </td>
						                <td><input type="text" name="email" value="${u.email }"/></td>
						           </tr>
						           
						            <tr>
						                <td>Nom: </td>
						                <td><input type="text" name="nom" value="${u.nom }" /></td>
						           </tr>
						           
						            <tr>
						                <td>Prenom:</td>
						                <td><input type="text" name="prenom" value="${u.prenom }" /></td>
						           </tr>
						           
						            <tr>
						                <td> Mot de passe:</td>
						                <td><input type="text" name="motPasse" value="${u.motPasse }"></td>
						           </tr>
						           
						            <tr>
						                <td>Ville: </td>
						                <td><input type="text" name="ville" value="${u.ville }"></td>
						           </tr>
						           <tr>
						                <td>Adresse: </td>
						                <td><input type="text" name="adresse" value="${u.adresse }"></td>
						           </tr>
						           <tr>
						                <td>Telephone: </td>
						                <td><input type="text" name="tel" value="${u.tel }"></td>
						           </tr>
						           <tr>
						                <td>Code Postal: </td>
						                <td><input type="text" name="codePostal" value="${u.codePostal }"></td>
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
						                <td></td>
						                <td><input class="btn btn-warning" type="submit" value="Edit"> <a href="listUtilisateur.jsp"> 
						                <input class="btn btn-inverse"  type="button" value="Cancel"> </a></td>
						           </tr>
						           </c:forEach>
						      
						      </table>
						      
						   </form>
                        
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE widget-->
                </div>
            </div>
         </div>
         <!-- END PAGE CONTAINER-->
      </div>
      <!-- END PAGE -->
   </div>
</body>
<!-- END BODY -->
</html>