<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navbar -->
<nav class="navbar navbar-fixed-top bg-primary">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand text-white" href="#">PizzaStore</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a class="text-white" href="MainController?action=listProducts">Pizzas</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <jsp:useBean id="categoryList" class="dao.CategoryDAO"/>
                        <c:forEach var="category" items="${categoryList.getAllCategorys()}">
                            <li class="dropdown-item"><a  href="MainController?action=listProducts&by=category&id=${category.categoryID}">${category.categoryName}</a></li>
                            </c:forEach>

                    </ul>
                </li>
            </ul>
            <jsp:useBean id="cateDAO" class="dao.CategoryDAO"></jsp:useBean>
                <ul class="nav navbar-nav navbar-right">
                    <!-- Display options based on user authentication status -->
                    <li>
                        <a class="text-white" href="MainController?action=viewCart">
                            <i class="fa-solid fa-cart-shopping"></i>Cart
                            <span class="badge bg-dark text-white mr-auto rounded-pill">${sessionScope.cartSize == null ? 0 : sessionScope.cartSize}</span>
                    </a>
                </li>

                <c:if test="${sessionScope.Account == null}">
                    <li><a class="text-white" href="MainController?action=RegisPage">Register</a></li>
                    <li><a class="text-white" href="MainController?action=loginPage">Log in</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.Account}">
                        <c:if test="${sessionScope.Account.type == 2 }">
                        <li><a class="text-white" href="MainController?action=profilePage">Profile</a></li>
                        <li><a class="text-white" href="MainController?action=viewHistory">History</a></li>
                        </c:if>
                        <c:if test="${sessionScope.Account.type == 1 }">
                        <li><a class="text-white" href="MainController?action=pageAdmin" >Dashboard</a></li>
                        </c:if>
                    <li><a class="text-white" data-toggle="modal" data-target="#logoutModal">Logout</a></li>
                    </c:if>
            </ul>
        </div>
    </div>
</nav>

