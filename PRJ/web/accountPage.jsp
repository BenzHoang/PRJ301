
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Tài khoản của người dùng: ${InforCustomer.contactName}</h4>
                            <hr>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 justify-content-center">
                            <form class="justify-content-center" action="MainController?action=updateAccout" method="POST">
                                <input type="hidden" value="${InforCustomer.accountID}" name="accId"/>
                                <!--username-->
                                <div class="form-group justify-content-center row">
                                    <label for="username" class="col-2 col-form-label">username</label>
                                    <div class="col-6">
                                        <input id="username" name="username" class="form-control here" type="text" value="${Account.userName}" disabled>
                                    </div>
                                </div>
                                <!-- Password -->
                                <div class="form-group justify-content-center row">
                                    <label for="password" class="col-2 col-form-label">En-Password</label>
                                    <div class="col-6">
                                        <input id="password" name="password" placeholder="Enter password" class="form-control here" type="password">
                                        <div id="passwordError" style="color: red" class="error"></div>
                                        <p style="color:red" >${requestScope.ERROR}</p>

                                    </div>
                                </div>

                                <!-- New Password -->
                                <div class="form-group justify-content-center row">
                                    <label for="newpassword" class="col-2 col-form-label">New password</label>
                                    <div class="col-6">
                                        <input id="newpassword" name="newpassword" placeholder="New password" class="form-control here" type="password">
                                        <div id="newpasswordError" style="color: red" class="error"></div>
                                    </div>
                                </div>

                                <!-- Re-New Password -->
                                <div class="form-group justify-content-center row">
                                    <label for="renewpassword" class="col-2 col-form-label">Re - New password</label>
                                    <div class="col-6">
                                        <input id="renewpassword" name="renewpassword" placeholder="Re-new password" class="form-control here" type="password">
                                        <div id="renewpasswordError" style="color: red" class="error"></div>
                                    </div>
                                </div>

                                <!-- Save button -->
                                <div class="form-group justify-content-center row">
                                    <div class="offset-4 col-8">
                                        <p style="color:green" >${requestScope.SUCCESS}</p>
                                        <button name="submit" type="submit" class="btn btn-primary">Save</button>
                                        <c:if test="${Account.type == 2}">
                                            <a href="MainController?action=profilePage" class="btn btn-link">Changes information</a>
                                        </c:if>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="logOutModal.jsp"></jsp:include>
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap JS -->
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script>
            function validateCustomerForm() {
                let hasError = false;

                // Get the values from the form inputs
                let password = $('#password').val();
                let newPassword = $('#newpassword').val();
                let renewPassword = $('#renewpassword').val();

                // Clear current error messages
                $('.error').html('');

                // Validate Password - Placeholder for server-side check
                // IMPORTANT: Actual password comparison should be done server-side for security
                if (password.trim() === '') {
                    $('#passwordError').html('Password cannot be empty');
                    hasError = true;
                }

                // Validate New Password
                if (newPassword.trim() === '') {
                    $('#newpasswordError').html('New Password cannot be empty');
                    hasError = true;
                } else if (newPassword === password) {
                    $('#newpasswordError').html('New Password cannot be the same as the current password');
                    hasError = true;
                }

                // Validate Re-New Password
                if (renewPassword.trim() === '') {
                    $('#renewpasswordError').html('Re-New Password cannot be empty');
                    hasError = true;
                } else if (newPassword !== renewPassword) { // Check if newPassword and renewPassword match
                    $('#renewpasswordError').html('Re-New Password not same');
                    hasError = true;
                }

                // Prevent form submission if there are errors
                return !hasError;
            }

            // Attach the validation function to the form's submit event
            $(document).ready(function () {
                $('form').on('submit', function (event) {
                    if (!validateCustomerForm()) {
                        event.preventDefault(); // Prevent form submission if validation fails
                    }
                });
            });
        </script>

    </body>
</html>
