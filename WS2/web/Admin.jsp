<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
        <style>
            .header {
                list-style-type: none;
                margin: 0;
                padding: 10px;
                background-color: brown;
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
            <ul class="header" style="margin-top: 40px"> 
                <li>Mobile Shopping Web</li>
                <li><a href="list">Home</a></li>
                <li><a href="">Privacy</a></li>
            </ul>

            <h3 class="text-center" style="color: red" >Welcome to ${sessionScope.account.lastName}</h3>
            <p class="text-center">
                <a href="AddMobile.jsp">Create New|</a>
                <a href="logout">LogOut</a> 
            </p>
            <div class="text-center">
            <%
                String searchValue = null;
                if (request.getAttribute("searchValue") != null) {
                    searchValue = (String) request.getAttribute("searchValue");
                }
            %>
            <form action="searchidname" method="post">
                Enter search value <input type="text" name="txtSearch" value="<%=searchValue != null ? searchValue : ""%>"/>
                <input type="submit" value="Search" name="btnAct"/>
            </form>     
            </div>
           
            <h1 class="text-center">Mobile List</h1>
            <table border="1px" class="t1" style="margin-left: 35px">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Name</th>
                        <th>Producer</th>
                        <th>Year</th>
                        <th>Quantity</th>
                        <th>Not Sale</th>
                        <th colspan="3">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="mobile" items="${requestScope.mList}">
                        <tr>
                            <td>${mobile.mobileID}</td>
                            <td>${mobile.description}</td>
                            <td>${mobile.price}</td>
                            <td>${mobile.mobileName}</td>
                            <td>${mobile.producerName}</td> 
                            <td>${mobile.yearOfProduction}</td>
                            <td>${mobile.quantity}</td>
                            <td>${mobile.notSale}</td>
                            <td><a href="process?action=update&&id=${mobile.mobileID}">Edit</a></td>
                            <td><a href="process?action=view&&id=${mobile.mobileID}">Details</a></td>
                            <td><a href="process?action=delete&&id=${mobile.mobileID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
