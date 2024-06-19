<%-- 
    Document   : loginPage
    Created on : Mar 12, 2024, 6:51:25 PM
    Author     : Admins
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
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
                background-color: #f2f6f9;
            }
            .navbar {
                border-radius: 0; /* Bootstrap 3 navbar border radius */
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
                <div class="row ">
                    <div class="col-md-6 ">
                        <h2>Pizza menu</h2>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-1 col-md-offset-1 ">
                        <label for="search" style="font-size: 20px">Search</label>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group rounded">
                            <form action="MainController" method="post">
                                <input type="hidden" value="searchProduct" name="action"/>
                                <input id="search" name="search" type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                                <button class="btn btn-primary" style="margin-top:  10px">Search</button>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-12">
                        <h4>All pizza</h4>
                    </div>
                    <div class="col-md-12">
                        <div class="container"><c:if test="${requestScope.listProducts == null && requestScope.ERROR_LISTPRODUCT == null}">
                            <jsp:forward page="MainController?action=listProducts"/>
                        </c:if>
                        <c:choose>
                            <c:when test="${requestScope.ERROR_LISTPRODUCT != null}">
                                ${requestScope.ERROR_LISTPRODUCT}
                            </c:when>
                            <c:otherwise>
                                <div class="flex-container" page-index=''>
                                    <c:forEach  var="pizza" items="${requestScope.listProducts}">
                                        <div class=" flex-item">
                                            <div class="splide__slide">
                                                <div class="card-block">
                                                    <div class="card-img">
                                                        <img src="${pageContext.request.contextPath}${pizza.productImage}" alt="" />
                                                    </div>
                                                    <div class="card-infor col-md-12">
                                                        <p class="text-primary col-md-6 align-items-start" >${pizza.productName}</p>
                                                        <p class="col-md-6 text-right" >${pizza.unitPrice}</p>
                                                        <p class="col-md-12" style="font-size:10px "><strong>Category: ${pizza.category.categoryName}</strong></p>
                                                        <p class="col-md-12">${pizza.description}</p>
                                                    </div>
                                                    <div class="card-controller col-md-12">
                                                        <div class="card-controller-block">
                                                            <a href="MainController?action=addToCart&txtItemId=${pizza.productID}" class="a_btn-card_controller">Add Pizza</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>


                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <jsp:include page="logOutModal.jsp"></jsp:include>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.js"></script>

    </body>
</html>