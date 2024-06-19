<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Create user's website</h1>
            <form action="adduser" method="post">
                <div class="form-group"><label form="username">Username</label><br/>
                    <input type="text" placeholder="Enter username" name="txtUser"/><br/> <div/>

                    <div class="form-group"><label form="pwd">Password</label><br/>
                        <input type="password" placeholder="Enter password" name="txtPass"/><br/><div/>

                        <div class="form-group"><label form="lastname">LastName</label><br/>
                            <input type="text" placeholder="Enter last name" name="txtLastName"/><br/>

                            <div class="form-group"><input type="checkbox" name="chkIsAdmin"/>isAdmin<br/></div>

                                <div class="form-group"><input type="submit" value="Add" name="btnAct"/>
                                    <input type="reset" value="Reset"/><br/>
                                    <a href="Login.jsp">Back to login</a>
                                </div>
                                </form>
                            </div>
                            </body>
                            </html>
