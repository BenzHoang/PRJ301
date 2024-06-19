<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <li class="nav-item active">
        <a class="nav-link" href="MainController?action=pageAdmin">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link " href="MainController?action=listCustomer">
            <i class="fas fa-fw fa-user"></i>
            <span>Customers</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="MainController?action=listProductAdmin">
            <i class="fas fa-fw fa-table"></i>
            <span>Manager Product</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="MainController?action=reportStatistics">
            <i class="fas fa-fw fa-folder"></i>
            <span>Report Statistics</span></a>
    </li>
</ul>
