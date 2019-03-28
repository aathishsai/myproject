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
<%
    String proname=request.getParameter("proname");
    String availQuantity=request.getParameter("availQuantity");
    String salesprice=request.getParameter("salesprice");
    String category=request.getParameter("category");
    String formtype=request.getParameter("formtype");
    if(formtype == null || formtype.length() == 0){
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB", "root", "pass123");
            Statement st=conn.createStatement();

            int i=st.executeUpdate("INSERT INTO product (productName, AvailableQuantity, salesPrice, categoryID)values('"+proname+"','"+availQuantity+"','"+salesprice+"','"+category+"')");
            session.setAttribute("msg", "Product Added Successfully");
            response.sendRedirect("productdetails.jsp");
        }
        catch(Exception e)
        {
            System.out.print(e);
            e.printStackTrace();
        }
    }else if(formtype.trim().equals("delete")){
        String productID=request.getParameter("productID");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB", "root", "pass123");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("delete from product where productID = "+productID);
        session.setAttribute("msg", "Product Deleted Successfully");
        response.sendRedirect("productdetails.jsp");
    }
    else if(formtype.trim().equals("update")){
        String productID=request.getParameter("productID");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB", "root", "pass123");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("update product set productName='"+proname+"',AvailableQuantity='"+availQuantity+"',salesPrice='"+salesprice+"',categoryID='"+category+"' where productID = "+productID);
        session.setAttribute("msg", "Product Updated Successfully");
        response.sendRedirect("productdetails.jsp");
    }
%>