<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Model.Car"%>
<%@page import="Model.CarDAO"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        
        <style>
            .header {
                list-style-type: none;
                margin: 0;
                padding: 10px;
                background-color: yellowgreen;
                color: white;
                font-weight: 600;
                font-size: 20px;
                text-align: center;
            }

            .header li {
                display: inline;
                margin-right: 20px;
            }
            
            .t1{
                width: 95%;
            }
        </style>
    </head>

    <body>
        <div>
            <h1 class="text-center">Home Page</h1>
            <div>
                <ul class="header">
                    <li>AutoMobileWebApp</li>
                    <li><a href="list">Home</a></li>
                    <li><a href="">Privacy</a></li>
                </ul>
            </div>

            <%
                User user = null;
                if (session.getAttribute("account") != null) {
                    user = (User) session.getAttribute("account");
                }
            %>
            <h3 class="text-center" style="color: red" >Welcome to <%=user.getLastName()%></h3>
            <p class="text-center">
                <a href="AddCar.jsp">Create New|</a>
                <a href="logout">LogOut</a> 
            </p>
            <h1 class="text-center">Car List</h1>
            <table border="1px" class="t1" style="margin-left: 40px">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Manufacturer</th>
                        <th>Price</th>
                        <th>Released Year</th>
                        <th colspan="3">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${requestScope.cList}">
                    <tr>
                        <td>${car.carID}</td>
                        <td>${car.carName}</td>
                        <td>${car.manufacturer}</td>
                        <td>${car.price}</td>
                        <td>${car.releasedYear}</td>    
                        <td><a href="process?action=update&&id=${car.carID}">Edit</a></td>
                        <td><a href="process?action=view&&id=${car.carID}">Details</a></td>
                        <td><a href="process?action=delete&&id=${car.carID}">Delete</a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>       
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
