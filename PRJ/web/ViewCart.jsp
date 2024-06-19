<%@page import="dto.Product"%>
<%@page import="dao.productDAO"%>
<%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ViewCart</title>

        <!-- Bootstrap CDN -->
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

        <style>
            body {
                padding-top: 70px; /* Padding to ensure content doesn't overlap navbar */
                background-color: #f2f6f9;
            }
            .navbar {
                border-radius: 0; /* Bootstrap 3 navbar border radius */
            }

            .text-white{
                color: white !important;
            }
        </style>    `

        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/65d7426ab6.js" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

    </head>

    <body>

        <!-- Navigation Bar
        <jsp:include page="navBar.jsp"></jsp:include>
            <!--Cart Details-->
            <section class="container" id="cart-details">
            <% HashMap<Integer, Integer> cart = (HashMap<Integer, Integer>) session.getAttribute("cart");
                if (cart == null || cart.isEmpty()) { %>
            <h1 class="text-center">Shopping Cart Is Empty</h1>
            <% } else { %>
            <!-- Shopping cart has order -->
            <h1 class="text-center">Shopping Cart</h1>
            <div class="table-responsive col-md-8">
                <table class="table table-hover">
                    <thead class="table-light" >
                        <tr>
                            <th scope="col" style="text-align: center">No</th>
                            <th scope="col" style="text-align: center">Image</th>
                            <th scope="col" style="text-align: center">Name</th>
                            <th scope="col" style="text-align: center">Quantity</th>
                            <th scope="col" style="text-align: center">Price</th>
                            <th scope="col" style="text-align: center">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            productDAO PDAO = new productDAO();
                            Product product = null;
                            int NO = 0;
                            int total = 0;
                            for (Integer productID : cart.keySet()) {
                                NO++;
                                product = PDAO.getProduct(productID);
                                total += product.getUnitPrice() * cart.get(productID);
                        %> 
                        <tr>
                            <th style="text-align: center"><%= NO%></th>
                            <!-- Image -->
                            <td style="text-align: center">
                                <img src="${pageContext.request.contextPath}<%=product.getProductImage()%>" width="100" height="100" alt="alt" />
                            </td>
                            <!-- Name -->
                            <td><%= product.getProductName()%></td>
                            <!-- Quantity -->
                            <td style="display: flex; align-items: center; justify-content: center; white-space: nowrap;">
                                <form action="MainController?type=down" method="POST" style="margin-right: 5px;">
                                    <input type="hidden" name="txtquantity" value="<%= cart.get(productID)%>">
                                    <input type="hidden" name="txtitemid" value="<%= productID%>">
                                    <input type="hidden" name="action" value="updateQuantityCart">
                                    <button type="submit" class="btn btn-link">
                                        <i class="fa-solid fa-minus"></i>
                                    </button>
                                </form>
                                <p style="margin: 0 5px;"><%= cart.get(productID)%></p>
                                <form action="MainController?type=up" method="POST" style="margin-left: 5px;">
                                    <input type="hidden" name="txtquantity" value="<%= cart.get(productID)%>">
                                    <input type="hidden" name="txtitemid" value="<%= productID%>">
                                    <input type="hidden" name="action" value="updateQuantityCart">
                                    <button type="submit" class="btn btn-link">
                                        <i class="fa-solid fa-plus"></i>
                                    </button>
                                </form>
                            </td>

                            <!-- Price -->
                            <td style="text-align: center"><%= product.getUnitPrice() * cart.get(productID)%></td>

                            <!-- Delete action -->
                            <td style="text-align: center">
                                <form action="MainController?action=removeProductInCart&txtitemid=<%= cart.get(productID)%>" method="POST">
                                    <button type="submit" class="btn btn-link">
                                        <i class="fas fa-trash text-danger"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%    }
                        %>
                        <!-- Total Money -->
                        <tr>
                            <td colspan="7">
                                <div class="text-end ">
                                    <h3>Total Money: <%= total%> vnđ</h3>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>

            <div class="text-center col-md-4">
                <form id="createOrder" action="MainController" method="POST">
                    <input name="action" value="payment" type="hidden"/>
                    <!-- Date Required -->
                    <div class="form-group">
                        <label for="dateRequired">Date Required:</label>
                        <input type="date" class="form-control" id="dateRequired" name="dateRequired">
                        <div id="dateRequiredError" class="error" style="color: red"></div> 
                    </div>
                    <!-- Date ship -->
                    <div class="form-group">
                        <label for="dateShip">Date Ship:</label>
                        <input type="date" class="form-control" id="dateShip" name="dateShip">
                        <div id="dateShipError" class="error" style="color: red"></div>
                    </div>
                    <!--address khach hang-->
                    <div class="form-group">
                        <label for="description">Ship address: </label>
                        <textarea class="form-control" name="addressShip" id="addressShip"></textarea>
                        <div id="addressShipError" class="error" style="color: red"></div>
                    </div>
                    <h4 style="color: red"> ${ERROR}</h4>
                        <button class="btn btn-info btn-lg text-white" >ORDER</button>
                </form>
            </div>

            <% }%>
        </section>


        <jsp:include page="logOutModal.jsp"></jsp:include>
    </body>
    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

    <script>
        function validateOrderForm() {
            let hasError = false; // Biến để kiểm tra lỗi

            // Lấy giá trị từ các input trong form
            let dateRequired = $('#dateRequired').val();
            let dateShip = $('#dateShip').val();
            let addressShip = $('#addressShip').val();

            // Xóa các thông báo lỗi hiện tại
            $('.error').html('');

            // Validate Date Required
            let currentDate = new Date().toISOString().split('T')[0]; // Lấy ngày hôm nay dưới dạng 'yyyy-MM-dd'
            if (dateRequired === '') {
                $('#dateRequiredError').html('Date Required cannot be empty');
                hasError = true;
            } else if (dateRequired < currentDate) {
                $('#dateRequiredError').html('Date Required must be in the future');
                hasError = true;
            }

            // Validate Date Ship
            if (dateShip === '') {
                $('#dateShipError').html('Date Ship cannot be empty');
                hasError = true;
            } else if (dateShip < dateRequired) {
                $('#dateShipError').html('Date Ship must be greater than or equal to Date Required');
                hasError = true;
            }

            // Validate Ship Address
            if (addressShip.trim() === '') {
                $('#addressShipError').html('Ship Address cannot be empty');
                hasError = true;
            }

            // Ngăn việc gửi form nếu có lỗi
            if (hasError) {
                event.preventDefault();
            }
        }

        // Gắn hàm validation vào sự kiện submit của form
        $(document).ready(function () {
            $('#createOrder').submit(function (event) {
                validateOrderForm();
            });
        });
    </script>

</html>