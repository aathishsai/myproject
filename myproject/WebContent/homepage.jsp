<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%
    if( session.getAttribute("IsLoggedIN") == null){
        response.sendRedirect("index.jsp?para=2");
    }
%>
<sql:setDataSource var="myapplication" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/myDB"
    user="root"  password="pass123"/>

<sql:query dataSource = "${myapplication}" var = "catresult">
    SELECT * from category;
</sql:query>
    
<sql:query dataSource = "${myapplication}" var = "proresult">
    SELECT * from product;
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Product details</title>
    </head>
    <body>
        <style>
            body {
              font-family: "Lato", sans-serif;
            }

            .sidenav {
              height: 100%;
              width: 280px;
              position: fixed;
              z-index: 1;
              top: 0;
              left: 0;
              background-color: #111;
              overflow-x: hidden;
              padding-top: 50px;              
            }

            .sidenav a {
              padding: 6px 6px 6px 32px;
              text-decoration: none;
              font-size: 25px;
              color: #818181;
              display: block;
            }
            span {
                padding: 6px 6px 6px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
            }
            .sidenav a:hover {
              color: #f1f1f1;
            }

            .main {
              margin-left: 280px; /* Same as the width of the sidenav */
            }

            @media screen and (max-height: 450px) {
              .sidenav {padding-top: 50px;}
              .sidenav a {font-size: 18px;}
            }
            input[type=button]{

    width:150px;
    height:30px;
    border-radius: 10px;
    color: black;
    background-color: #CCFF99;
}
            body  {
  background-image: url("bgcolor.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
            
        </style>
        <div class="header-area">
            <nav class="navbar navbar-default">
                <div class="container">        
                               
                    <div class="navbar-header navbar-right" style="color:#129bb2">
                        <a href="logout.jsp" class="btn btn-primary pull-left">Logout</a>  
                                    
                    </div>
                </div>
            </nav>
        </div>
        <div class="sidenav">
            <a href="homepage.jsp">Homepage</a>
            <li>
                <span>Category</span>
                <ul>
                    <a href="catadd.jsp">Add Category</a>
                    <a href="category.jsp">Category Details</a>
                </ul>
            </li>
            <li>
                <span>Product</span>
                <ul>
                    <a href="details.jsp">Add Product</a>
                    <a href="productdetails.jsp">Product Details</a>
                </ul>
            </li>            
        </div>
        <div class="main">
            <div class="container">
            <center>   <h2>Welcome to Software Online</h2> </center>
                <h2>Category Details</h2>
                <table class="table">
                  <thead>
                    <tr>
                      <th>Category Name</th>
                      <th>No Of Products</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var = "row" items = "${catresult.rows}">
                        <tr>
                           <td><c:out value = "${row.categoryName}"/></td>
                          <td><c:out value = "${row.noofproducts}"/></td>
                        </tr>
                     </c:forEach>  
                                      
                  </tbody>
                </table>
            <center><input type="button" name="" value="AddCategory" onclick="location.href='catadd.jsp';"> </center>
            </div>
        </div>
        <div class="main">
            <div class="container">
                <h2>Product Details</h2>
                <table class="table">
                    <thead>
                      <tr>
                        <th>Product Name</th>
                        <th>Available Quantity</th>
                        <th>Sales Price</th>
                        <th>Category</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                        <c:forEach var = "row" items = "${proresult.rows}">
                            <tr>
                               <td><c:out value = "${row.productName}"/></td>
                               <td><c:out value = "${row.AvailableQuantity}"/></td>
                               <td><c:out value = "${row.salesPrice}"/></td>
                               <td><c:out value = "${row.categoryID}"/></td>
                              
                            </tr>
                         </c:forEach>                      
                    </tbody>
                </table>
                <center><input type="button" name="" value="AddProduct" onclick="location.href='details.jsp';"> </center>
            </div>
        </div>
    </body>
</html>
