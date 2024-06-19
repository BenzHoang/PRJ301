<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Log In</h1>
            <form action="login" method="post">
                <div class="form-group"><label form="username">Username</label><br/>
                    <input type="text" placeholder="Username" name="txtUser"/><br/></div>
                
                 <div class="form-group"><label form="pwd">Password</label><br/>
                    <input type="password" placeholder="Password" name="txtPass"/><br/></div>
                
                 <div class="form-group"><input type="submit" value="Login" name="action"/>
                     <input type="reset" value="Reset"/><br/>
                      <a href="AddUser.jsp">Sign up</a>
                     <div/>
                     <h3 class="text-center">${requestScope.message}</h3>
            </form>
        </div>
    </body>
</html>
