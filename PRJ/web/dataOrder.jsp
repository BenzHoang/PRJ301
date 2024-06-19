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
<div class="card mb-3 container">
    <div class="card-header">
        <h2 class="text-center">Table orders list</h2>
    </div>
    <%
        Used used = new Used();
    %>
    <div class="card-body">

            <table class="table table-bordered"  width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Required Date</th>
                        <th>Shipped Date</th>
                        <th>Total Products</th>
                        <th>Ship Address</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>

                    </tr>
                </thead>
                <tbody>
                    <%    List<Orders> listOrder = (List<Orders>) request.getAttribute("listOrder"); // Hoặc session.getAttribute("listOrder"), tùy thuộc vào cách bạn lưu trữ listOrder

                        for (Orders order : listOrder) {
                            double total = used.TotalByOrderID(order.getOrderID());
                    %>
                    <tr>
                        <td> <%= order.getOrderID()%> </td>
                        <td> <%= used.NameCusByIdCus(order.getCustomerID())%> </td>
                        <td> <%= order.getOrderDate()%> </td>
                        <td> <%= order.getRequiredDate()%> </td>
                        <td> <%= order.getShippedDate()%> </td>
                        <td> <%= order.getTotalProducts()%> </td>
                        <td> <%= order.getShipAddress()%> </td>
                        <td> <%= total%> </td> 
                        <td>
                            <form action="MainController?action=changeStatus" method="post">
                                <input type="hidden" name="orderId" value="<%= order.getOrderID()%>" />
                                <button type="submit" class="<%=order.getStatus() == 1 ? "status-button status-unconfirm"
                                        : order.getStatus() == 2 ? "status-button status-confirm"
                                        : order.getStatus() == 3 ? "status-button status-complete"
                                        : "status-button status-cancel"%>" 
                                        <%= order.getStatus() == 3 || order.getStatus() == 4 ? "disabled" : ""%>>
                                    <%=order.getStatus() == 1 ? "Pending"
                                            : order.getStatus() == 2 ? "Approved"
                                            : order.getStatus() == 3 ? "Done"
                                            : "Cancel"%>
                                </button>
                            </form>
                        </td>
                        <td>
                            <% if (order.getStatus() == 1) {%>
                            <a href="MainController?action=viewHistoryDetail&orderId=<%= order.getOrderID()%>">Details</a>
                            <a href="MainController?action=CancelOrderUser&orderId=<%= order.getOrderID()%>">Cancel</a>
                            <% } %>

                        </td> 
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        
    </div>
</div>
