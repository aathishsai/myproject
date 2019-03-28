<%
	if( session.getAttribute("IsLoggedIN") == null){
		response.sendRedirect("index.jsp?para=2");
	}
%>
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
            body  {
  background-image: url("bgcolor.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
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
                <form action="catAddAction.jsp" method="post">
                    <div class="col-md-12">                        
                        <in>
                         <div class="form-group">
                            <div class="col-md-3">
                                <label for="categoryname">Category ID:</label>
                                
                            </div>
                            
                            <div class="col-md-9">                                
                                <input type="text" value="" required="true" class="form-control" id="catidman" placeholder="Enter Category ID" name="catidman">
                            </div>
                        </div>  
                        <div class="form-group">
                            <div class="col-md-3">
                                <label for="categoryname">Category Name:</label>
                                
                            </div>
                            
                            <div class="col-md-9">                                
                                <input type="text" value="" required="true" class="form-control" id="catname" placeholder="Enter Category Name" name="catname">
                            </div>
                        </div>        
                        <div class="form-group">
                            <div class="col-md-3">
                                <label for="no of products">No Of Products:</label>
                                
                            </div>
                            
                            <div class="col-md-9">                                
                                <input type="text" value="" required="true" class="form-control" id="noofproducts" placeholder="Enter NOP" name="noofproducts">
                            </div>
                        </div>                                       
                        <button type="submit" class="btn btn-default">Submit</button>    
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
