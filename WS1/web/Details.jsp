<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    </head>
    <body>
        <h1 class="text-center">Car Details</h1>
        <h3 class="text-center">Car</h3>
        <c:set var="car" value="${requestScope.data}"/>
        <form action="process" method="post">
            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>${car.carID}</th>
                </tr>
                <tr>
                    <td>Name</td>
                   <td>${car.carName}</td>
                </tr>
                <tr>
                    <td>Manufacturer</td>
                    <td>${car.manufacturer}</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>${car.price}</td>
                </tr>
                <tr>
                    <td>Released Year</td>
                    <td>${car.releasedYear}</td>
                </tr>
            </table>
                <div class="text-center">
                <a href="process?action=update&&id=${car.carID}">Edit</a>|
                <a href="list">Back to List</a>
            </div>
        </form>
    </body>
</html>
