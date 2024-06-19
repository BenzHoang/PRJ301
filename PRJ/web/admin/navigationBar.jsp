
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <div class="navbar-header">
        <a class="navbar-brand text-white" href="#">PizzaStore</a>
    </div>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <div class="container justify-content-center">
        <h1 class="navbar-brand mr-1">
            Welcome  to page Dashboard-ADMIN
        </h1>
        <!-- Các phần tử navbar khác (nếu có) -->
    </div>


    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="MainController?action=listProducts">Back Home</a>
                <a class="dropdown-item" href="MainController?action=accountPage">Change Password</a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>
