<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    </head>
    <body>
        <h1 class="text-center">Delete a car</h1>
        <h2 class="text-center">Are you sure to delete this car?</h2>
        <c:set var="car" value="${requestScope.data}"/>
        <form class="delete" method="post">
            <table class="table">
                <tr>
                    <th>ID</th>
                    <th><input type="hidden" name="txtID" value="${car.carID}"/>${car.carID}</th>
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
                <input onclick="doDelete(${car.carID})" type="button" name="btnAct" value="Delete"/>
                <a href="list">Back to list</a>
            </div>
        </form>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete?")) {
                    var form = document.createElement("form");
                    form.setAttribute("method", "post");
                    form.setAttribute("action", "delete");

                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "txtID");
                    hiddenField.setAttribute("value", id);

                    form.appendChild(hiddenField);
                    document.body.appendChild(form);

                    form.submit();
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
