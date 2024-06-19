<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    </head>
    <body>
        <div class="container mt-5">
            <c:set var="car" value="${requestScope.data}"/>
            <h1 class="text-center">Update Car</h1>
            <form action="update" method="post">
                <div class="form-group"><label form="id">Car ID</label><br/>
                    <input type="number" readonly="true" name="txtID" value="${car.carID}"/> <br/></div>

                <div class="form-group"><label form="name">CarName</label><br/>
                    <input type="text" name="txtName" value="${car.carName}"/>  <br/></div>

                <div class="form-group"><label form="manufacturer">Manufacturer</label><br/> 
                    <input type="text"  name="txtManu" value="${car.manufacturer}"/>  <br/></div>

                <div class="form-group"> <label form="price">Price</label><br/>
                    <input type="text" name="txtPrice" value="${car.price}"/><br/></div>

                <div class="form-group"><label form="year">Released Year</label><br/>
                    <input type="text" name="txtYear" value="${car.releasedYear}"/>  <br/></div>
     
                    <div class="form-group">
                        <input type="submit" value="Save" name="btnAct"/>
                        <input type="reset" value = "Reset"/>
                        <br/>
                        <a href="list">Back</a>
                    </div>

            </form>
        </div>

        <%
        %>
    </div>
</body>
</html>
