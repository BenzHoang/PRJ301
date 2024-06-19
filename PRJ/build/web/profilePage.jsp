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

            <!--Profile-->
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Thông tin cá nhân của username: ${Account.userName} </h4>
                            <hr>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 justify-content-center">
                            <form class="justify-content-center" action="MainController?action=updateCustomer" method="POST">
                                <input type="hidden" value="${InforCustomer.accountID}" name="accId"/>
                                <input type="hidden" value="1" name="page"/>
                                <!-- Contact Name -->
                                <div class="form-group justify-content-center row">
                                    <label for="contactName" class="col-2 col-form-label">Contact Name</label>
                                    <div class="col-6">
                                        <input id="contactName" name="contactName" placeholder="Contact Name" class="form-control here" type="text" value="${InforCustomer.contactName}">
                                        <div id="contactNameError" style="color: red" class="error"></div>
                                    </div>
                                </div>
                                <!-- Adress -->
                                <div class="form-group justify-content-center row">
                                    <label for="name" class="col-2 col-form-label">Adress</label>
                                    <div class="col-6">
                                        <input id="address" name="adress" placeholder="Adress" class="form-control here" 
                                               type="text" value="${InforCustomer.address}">
                                        <div id="addressError" style="color: red" class="error"></div>
                                    </div>
                                </div>
                                <div class="form-group justify-content-center row">
                                    <label for="phoneNumber" class="col-2 col-form-label">Phone Number</label>
                                    <div class="col-6">
                                        <input id="phoneNumber" name="phonenumber" placeholder="Phone Number" class="form-control here" type="text" value="${InforCustomer.phone}">
                                        <div id="phoneNumberError" style="color: red" class="error"></div>
                                    </div>
                                </div>

                                <!-- Save button -->
                                <div class="form-group justify-content-center row">
                                    <div class="offset-4 col-8">
                                        <p style="color:green" >${requestScope.SUCCESS}</p>
                                        <button name="submit" type="submit" class="btn btn-primary">Save</button>
                                        <a href="MainController?action=accountPage" class="btn btn-link">Changes Account</a>
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
                let hasError = false; // Variable to check for errors

                // Get the values from the form inputs
                let contactName = $('#contactName').val();
                let address = $('#address').val();
                let phoneNumber = $('#phoneNumber').val();

                // Clear current error messages
                $('.error').html('');

                // Validate Contact Name
                if (contactName.trim() === '') {
                    $('#contactNameError').html('Contact Name cannot be empty');
                    hasError = true;
                }
                if (address.trim() === '') {
                    $('#addressError').html('Address cannot be empty');
                    hasError = true;
                }

                // Validate Phone Number
                if (phoneNumber.trim() === '') {
                    $('#phoneNumberError').html('Phone Number cannot be empty');
                    hasError = true;
                } else if (!/^\d+$/.test(phoneNumber)) { // Check if phoneNumber contains only digits
                    $('#phoneNumberError').html('Phone Number must be numeric');
                    hasError = true;
                }

                // Prevent form submission if there are errors
                if (hasError) {
                    event.preventDefault();
                }
            }

            // Attach the validation function to the form's submit event
            $(document).ready(function () {
                $('form').submit(function (event) {
                    validateCustomerForm();
                });
            });
        </script>
    </body>
</html>
