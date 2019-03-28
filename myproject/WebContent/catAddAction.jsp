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
<%String formtype=request.getParameter("formtype"); %>
<%
    if(formtype == null || formtype.length() == 0){
        String catname=request.getParameter("catname");
        String catidman=request.getParameter("catidman");
        String noofproducts=request.getParameter("noofproducts");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB", "root", "pass123");
            Statement st=conn.createStatement();

            int i=st.executeUpdate("INSERT INTO category (categoryName,categoryIDman,noofproducts)values('"+catname+"','"+catidman+"','"+noofproducts+"')");
            session.setAttribute("msg", "Category Added Successfully");
            response.sendRedirect("category.jsp");
        }
        catch(Exception e)
        {
            System.out.print(e);
            
            e.printStackTrace();
        }   
    }
    else if(formtype.trim().equals("delete")){
        String catid=request.getParameter("categoryid");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB", "root", "pass123");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("delete from category where categoryID = "+catid);
        session.setAttribute("msg", "Category Deleted Successfully");
        response.sendRedirect("category.jsp");
    }
    else if(formtype.trim().equals("update")){        
        String catname=request.getParameter("catname");
        String catid=request.getParameter("catid");
        String catidman=request.getParameter("catidman");
        String noofproducts=request.getParameter("noofproducts");
        try
        {   
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB", "root", "pass123");
            Statement st=conn.createStatement();
            int i=st.executeUpdate("update category set categoryName='"+catname+"',categoryidman ='"+catidman+"',noofproducts ='"+noofproducts+"' where categoryID = '"+catid+"'");
            session.setAttribute("msg", "Category Updated Successfully");
            response.sendRedirect("category.jsp");
        }
        catch(Exception e)
        {
            System.out.print(e);
            e.printStackTrace();
        }
    }
%>   
