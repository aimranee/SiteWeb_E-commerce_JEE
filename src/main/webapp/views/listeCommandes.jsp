<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Model.*"%>

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
	
	<sql:query dataSource = "${myDB}" sql = "select * from commande" var = "result" />
   	
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
                     Table commandes
                  </h3>
                   
               </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <div class="widget">
                        <div class="widget-body">

                         <table class="table table-striped table-bordered" id="sample_1">
                            <thead>
                               <tr>
                                  <th class="hidden-phone">NumCommande</th>
                                  <th class="hidden-phone">UserId</th>
                                  <th class="hidden-phone">Date de commande</th>
                                  <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                               
				             <c:forEach var="u" items="${result.rows}">
				             <tr>
				                <td><c:out value="${u.NumCommande}"></c:out></td>
				                <td><c:out value="${u.CodeClient}"></c:out></td>
				                <td><c:out value="${u.DateCommande}"></c:out></td>
				                <td><a href="Commande?id=${u.NumCommande}&action=delete"> 
				                <input class="btn btn-success" type="button" value="delete"> 
				                </a> </td>
				             </tr>
				            </c:forEach>
				        </tbody>
				       </table>
				       
				       </div>
				   </div>
                </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>
