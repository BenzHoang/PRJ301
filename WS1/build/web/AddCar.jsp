<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add car</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    </head>       
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Create information of car</h1>
            <form action="addcar" method="post">
                <div class="form-group"><label form="id">Car ID</label><br/>
                    <input type="text" placeholder="Enter a car ID" name="txtID"/> <br/> </div>

                <div class="form-group"><label form="name">CarName</label><br/>
                    <input type="text" placeholder="Enter a car name" name="txtName"/>  <br/></div>

                <div class="form-group"><label form="manufacturer">Manufacturer</label><br/> 
                    <input type="text" placeholder="Enter a manufacturer" name="txtManu"/>  <br/></div>

                <div class="form-group"><label form="price">Price</label><br/>
                    <input type="text" placeholder="Enter car's price" name="txtPrice"/><br/></div>

                <div class="form-group"><label form="year">Released Year</label><br/>
                    <input type="text" placeholder="Enter a year" name="txtYear"/>  <br/></div>

                <div class="form-group">
                    <input type="submit" value="Add" name="btnAct"/>
                    <input type="reset" value = "Reset"/><br/>
                    <a href="list">Back</a>
                </div>
                <h3 class="text-center">${requestScope.message}</h3>
            </form>
        </div>       
    </body>
</html>
