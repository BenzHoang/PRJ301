<%@page import="java.util.List"%>
<%@page import="Model.Mobile"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .t1{
                width: 95%;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <form action="searchidname" method="post">
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
                        <c:forEach var="mobile" items="${requestScope.SearchResult}">
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
                <h3 class="text-center"><a href="list">Back</a></h3>
            </form>
        </div>
    </body>
</html>
