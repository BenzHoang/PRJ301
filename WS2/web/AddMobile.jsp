<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add mobile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Create information of mobile</h1>
            <form action="add" method="post">
                <div class="form-group"><label form="id">Mobile ID</label><br/>
                    <input type="text" placeholder="Enter a mobile ID" name="txtMobiID"/> <br/> </div>

                <div class="form-group"><label form="des">Description</label><br/>
                    <input type="text" placeholder="Enter description" name="txtDes"/>  <br/></div>

                <div class="form-group"><label form="price">Price</label><br/> 
                    <input type="text" placeholder="Enter a price" name="txtPrice"/>  <br/></div>

                <div class="form-group"><label form="name">Mobile Name</label><br/>
                    <input type="text" placeholder="Enter mobile's name" name="txtName"/><br/></div>

                <div class="form-group"><label form="proname">Producer Name</label><br/>
                    <input type="text" placeholder="Enter producer name" name="txtProName"/>  <br/></div>

                <div class="form-group"><label form="year">Year of Production</label><br/>
                    <input type="text" placeholder="Enter a year" name="txtYear"/>  <br/></div>

                <div class="form-group"><label form="quantity">Quantity</label><br/>
                    <input type="text" placeholder="Enter a quantity" name="txtQuan"/>  <br/></div>

                <div class="form-group">
                    <input type="checkbox" name="chkIsSaled"/>Not sale<br/></div>

                <div class="form-group">
                    <input type="submit" value="Add" name="btnAct"/>
                    <input type="reset" value = "Reset"/><br/>
                    <a href="list">Back</a>
                </div>
            </form>
        </div>
    </body>
</html>
