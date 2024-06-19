<%-- 
    Document   : loginPage
    Created on : Mar 12, 2024, 6:51:25 PM
    Author     : Admins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>PizzaStore - Login</title>
        <!-- Linking the Bootstrap CSS file -->
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
        <style>
            body {
                padding-top: 70px; /* Padding to ensure content doesn't overlap navbar */
            }
            .navbar {
                border-radius: 0; /* Bootstrap 3 navbar border radius */
            }
            .form-container {
                background-color: #f7f7f7;
                padding: 20px;
                border: 1px solid #dee2e6;
                border-radius: 4px; /* Bootstrap 3 border-radius */
                margin-top: 20px;
            }
            .text-white{
                color: white !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navBar.jsp"></jsp:include>

            <!-- Login Form -->
            <div class="container">
                <div class="row login">
                    <div class="col-md-6 col-md-offset-3 form-container">
                        <h2>Please register here.</h2>
                        <p>Enter your details below</p>
                        <form action="MainController">
                            <input type="hidden" name="action" value="register"/>
                            <div class="form-group">
                                <label for="username">User name</label>
                                <input type="text" class="form-control" name="username" placeholder="Enter your username" required > 
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" name="password" placeholder="Enter your password" required >
                            </div>
                            <div class="form-group">
                                <label for="password2">Re-password</label>
                                <input type="password" class="form-control" name="Repassword" placeholder="Enter your password again" required>
                            </div>
                            <div class="form-group">
                                <div style="color:red">${requestScope.ERROR}</div>
                            <div style="color:green">${requestScope.SUCCESS}</div>
                        </div>
                        <div class="text-center mt-3 d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary btn-transparent">Register</button>
                        </div>
                        <div class="text-center mt-3 d-flex justify-content-between">
                            <a href="MainController?action=loginPage" class="btn btn-link">Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="logOutModal.jsp"></jsp:include>
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap JS -->
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
