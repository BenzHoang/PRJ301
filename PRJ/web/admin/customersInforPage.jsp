<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar-style.css" />        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
        <style>
            .error {
                color: red;
            }
        </style>
    </head>

    <body id="page-top">
        <jsp:include page="navigationBar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">
                        <!-- Breadcrumbs-->
                    <jsp:include page="breadCumb.jsp"></jsp:include>

                        <!--Profile-->
                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <h4>Thông tin cá nhân của account: ${cusInfor.accountID} </h4>
                                        <hr>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 justify-content-center">
                                        <form class="justify-content-center" action="MainController?action=updateCustomer" method="POST">
                                            <input type="hidden" value="${cusInfor.accountID}" name="accId"/>
                                            <!-- Contact Name -->
                                            <div class="form-group justify-content-center row">
                                                <label for="contactName" class="col-2 col-form-label">Contact Name</label>
                                                <div class="col-6">
                                                    <input id="contactName" name="contactName" placeholder="Contact Name" class="form-control here" type="text" value="${cusInfor.contactName}">
                                                    <div id="contactNameError" class="error"></div>
                                                </div>
                                            </div>
                                            <!-- Adress -->
                                            <div class="form-group justify-content-center row">
                                                <label for="name" class="col-2 col-form-label">Adress</label>
                                                <div class="col-6">
                                                    <input id="address" name="adress" placeholder="Adress" class="form-control here" 
                                                           type="text" value="${cusInfor.address}">
                                                    <div id="addressError" class="error"></div>
                                                </div>
                                            </div>
                                            <div class="form-group justify-content-center row">
                                                <label for="phoneNumber" class="col-2 col-form-label">Phone Number</label>
                                                <div class="col-6">
                                                    <input id="phoneNumber" name="phonenumber" placeholder="Phone Number" class="form-control here" type="text" value="${cusInfor.phone}">
                                                    <div id="phoneNumberError" class="error"></div>
                                                </div>
                                            </div>

                                            <!-- Save button -->
                                            <div class="form-group justify-content-center row">
                                                <div class="offset-4 col-8">
                                                    <p style="color:green" >${requestScope.SUCCESS}</p>
                                                    <button name="submit" type="submit" class="btn btn-primary">Lưu thông tin</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>


                    <!-- Sticky Footer -->
                    <jsp:include page="stickFooter.jsp"></jsp:include>

                    </div>
                    <!-- /.content-wrapper -->

                </div>
                <!-- /#wrapper -->

                <!-- Scroll to Top Button-->
            <jsp:include page="scrollUpToButton.jsp"></jsp:include>
                <!-- Logout Modal-->
            <jsp:include page="logOutModal.jsp"></jsp:include>
            </div>
            <!-- /#wrapper -->

            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/my_chart.js"></script>
        <script src="${pageContext.request.contextPath}/js/chart-updater.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
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