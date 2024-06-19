<%-- 
    Document   : loginPage
    Created on : Mar 12, 2024, 6:51:25 PM
    Author     : Admins
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>PizzaStore - Login</title>
        <!-- Linking the Bootstrap CSS file -->
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

        <style>
            body {
                padding-top: 70px; /* Padding to ensure content doesn't overlap navbar */
                background-color: #f2f6f9;
            }
            .navbar {
                border-radius: 0; /* Bootstrap 3 navbar border radius */
            }

            .text-white{
                color: white !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="nofication.jsp"></jsp:include>
        <jsp:include page="navBar.jsp"></jsp:include>
        
        
        <jsp:include page="dataOrderDetail.jsp"></jsp:include>

            
        <!-- Bootstrap JS -->
        <jsp:include page="logOutModal.jsp"></jsp:include>
            <script src="js/Jquery.js"></script>
            <script src="js/bootstrap.js"></script>
    </body>
</html>
