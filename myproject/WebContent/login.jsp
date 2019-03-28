<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>       
        <%
        try{
            String txtUserName=request.getParameter("txtUserName");
            String txtPassword=request.getParameter("txtPassword");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB", "root", "pass123");
            Statement st=conn.createStatement();
            ResultSet resultSet = null;
            resultSet =st.executeQuery("select * from user where username='"+txtUserName+"' and password='"+txtPassword+"'");
            if(resultSet.next()){
                session.setAttribute("IsLoggedIN", true);
                response.sendRedirect("homepage.jsp");
                
            }else{
                response.sendRedirect("index.jsp?para=1");
            }
        }catch(Exception ex)
        {
        	out.print(ex);
        }
        %>
    </body>
</html>
