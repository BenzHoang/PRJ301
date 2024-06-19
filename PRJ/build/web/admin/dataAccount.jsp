<%@page import="dto.Account"%>
<%@page import="dto.Orders"%>
<%@page import="java.util.List"%>
<%@page import="controller.Service.Used"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .fa-2x {
        font-size: 40px;
    }
    .status-unconfirm {
        background-color: #1e90ff; /* Màu xanh biển */
        color: white;
    }

    .status-confirm {
        background-color: #ffdb58; /* Màu vàng */
        color: black;
    }

    .status-progress {
        background-color: #00ff00; /* Màu xanh lá */
        color: black;
    }

    .status-cancel {
        background-color: #ff0000; /* Màu đỏ */
        color: white;
    }

    .status-complete {
        background-color: #808080; /* Màu xám */
        color: white;
    }

    .status-button {
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
    }

</style>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Table Customer list
    </div>
    <%
        Used used = new Used();

    %>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User name</th>
                        <th>Password</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%    List<Account> listCus = (List<Account>) request.getAttribute("listCus"); // Hoặc session.getAttribute("listOrder"), tùy thuộc vào cách bạn lưu trữ listOrder
                        int n = 1;
                        for (Account acc : listCus) {
                    %>
                    <tr>
                        <td> <%= n++%> </td>
                        <td> <%= acc.getUserName()%> </td>
                        <td> <%= acc.getPassword()%> </td>
                        <td> <%= acc.getType() == 2 ? "Customer" : "Staff"%> </td>
                        <td>
                            <a href="MainController?action=viewInforAccount&accId=<%= acc.getAccountID()%>">Infor Account</a> | 
                            <a onclick="return window.confirm('Are you sure?')" href="MainController?action=deleteAccount&username=<%= acc.getUserName()%>">Delete</a>
                        </td> <!-- Thay thế 'action' bằng mã HTML hoặc scriptlet thích hợp -->
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
