<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
    </head>
    <body>
        <h1 class="text-center">Delete a mobile</h1>
        <h2 class="text-center">Are you sure to delete this mobile?</h2>
        <c:set var="mobile" value="${requestScope.data}"/>
        <form action="delete" method="post">
            <table class="table">
                <tr>
                    <th>ID</th>
                    <th><input type="hidden" name="txtID" value="${mobile.mobileID}"/>${mobile.mobileID}</th>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>${mobile.description}</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>${mobile.price}</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>${mobile.mobileName}</td>
                </tr>
                <tr>
                    <td>Producer</td>
                    <td>${mobile.producerName}</td>
                </tr>
                <tr>
                    <td>Year</td>
                    <td>${mobile.yearOfProduction}</td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td>${mobile.quantity}</td>
                </tr>
                <tr>
                    <td>Not Sale</td>
                    <td>${mobile.notSale}</td>
                </tr>
            </table>
            <div class="text-center">
                <input type="submit" name="btnAct" value="Delete"/>
                <a href="list">Back to List</a>
            </div>
        </form>
    </body>
</html>
