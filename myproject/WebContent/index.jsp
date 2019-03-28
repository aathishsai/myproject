<!DOCTYPE html>
<html>
    <head>
        <title>A D M I N L O G I N</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>     
    <style>
    body  {
  background-image: url("bgcolor.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
    </style>
      
        <div class="container" style="margin-top: 55px">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2><strong>A D M I N L O G I N</strong></h2>
			</div>
                        <form action="login.jsp" method="post" id="loginform">
                            <div class="panel-body">							
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span>
                                                <strong>Username</strong>
                                            </span>
                                            <input type="text" required="true" class="form-control" name="txtUserName" id="username" placeholder="Username" autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span>
                                                <strong>Password</strong>
                                            </span>
                                            <input type="password" required="true" class="form-control" name="txtPassword" id="password"  placeholder="Password" autocomplete="off">
                                        </div>
                                    </div>
                                </div>                            
                            </div>
                        </form>
                        <% if(request.getParameter("para") != null ) {%>
                            <div style="margin-left: 31px;color: red;">
                                Enter Username and Password Correctly
                            </div>
                        <% } %>
			<div class="loginpanel-footer" style="padding:10px">
                            <div class="clearfix">
                                <button type="submit" value="Submit" id="loginbutton" class="btn btn-primary pull-left">Login</button>                                
                            </div>
			</div>
                    </div>
		</div>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function(){
            $('#loginbutton').click(function(){
                $('#loginform').submit();
               
            });
        });
    </script>
</html>
