<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


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
	
	<sql:setDataSource var="myDB" driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost:3306/ecomjee"
       user="root"  password=""/>
	
	<sql:query dataSource = "${myDB}" sql = "select * from utilisateur" var = "result" />

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
                      <span class="icon-box"> <i class="icon-book"></i></span> Utilisateurs
                  </a>
              </li>
        </ul>

      </div>
      <div id="main-content">
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
    
                  <h3 class="page-title">
                     Table d'utilisateurs
                  </h3>
                   
               </div>
            </div>
            <div class="row-fluid">
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget">
                        
                        <div class="widget-body">
                             <table class="table table-striped table-bordered" id="sample_1">
                            <thead>
                               <tr>
                
                                   <th class="hidden-phone">ID</th>
                                   <th class="hidden-phone">Prenom</th>
                                   <th class="hidden-phone">Nom</th>
                                   <th class="hidden-phone">Email</th>
                                   <th class="hidden-phone">motPasse</th>
                                   <th class="hidden-phone">Ville</th>
                                   <th class="hidden-phone">Code Postal</th>
                                   <th class="hidden-phone">Telephone</th>
                                   <th class="hidden-phone">Role</th>
                                   <th>Action</th>

                                </tr>
                            </thead>
                            
                            <tbody>
                              <c:forEach var="u" items="${result.rows}">
                                  <tr class="odd gradeX">
                                     <td><c:out value="${u.id }"></c:out></td>
                                     <td><c:out value="${u.prenom }"></c:out></td>
                                     <td><c:out value="${u.nom }"></c:out> </td>
                                     <td><c:out value="${u.email }"></c:out> </td>
                                     <td><c:out value="${u.motPasse }"></c:out> </td>
                                     <td><c:out value="${u.Ville }"></c:out> </td>
                                     <td><c:out value="${u.CodePostal }"></c:out> </td>
                                     <td><c:out value="${u.Tel }"></c:out> </td>
                                     <td><c:out value="${u.role }"></c:out> </td>
                                     <td> <a href="Utilisateur?id=${u.id }&action=delete"> 
                                     	<input class="btn btn-danger" type="button" value="Delete"> </a> 
                                     	<a href="Utilisateur?id=${u.id }&action=edit"> 
                                     	<input class="btn btn-success" type="button" value="Edit"> </a>
                                     </td>
                                  </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                         <br>
                         <a href="addutilisateur.jsp"> <input class="btn btn-warning" type="button" value="Add"></a>
                        </div>
                    </div>

                </div>
            </div>

         </div>
      </div>
   </div>
</body>
</html>