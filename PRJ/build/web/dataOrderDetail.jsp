<%@page import="dto.OrderDetails"%>
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
        <h2 class="text-center"> Order details of order: ${requestScope.orderId}</h2>
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
                        <th>Product Name</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%    List<OrderDetails> listOrderDetail = (List<OrderDetails>) request.getAttribute("listOrderDetail"); // Hoặc session.getAttribute("listOrder"), tùy thuộc vào cách bạn lưu trữ listOrder
                        int n = 1;
                        for (OrderDetails details : listOrderDetail) {
                            double total = details.getQuantity() * details.getUnitPrice();
                    %>
                    <tr>
                        <td> <%= n++%> </td>
                        <td> <%= details.getProduct().getProductName()%> </td>
                        <td> <%= details.getUnitPrice()%> </td>
                        <td><form action="MainController" method="post">
                                <input type="hidden" name="action" value="updateOrderDetailUser">
                                <input type="hidden" name="orderId" value="<%= details.getOrderID()%>">
                                <input type="hidden" name="productId" value="<%= details.getProduct().getProductID()%>">
                                <input type="number" name="quantity" value="<%= details.getQuantity()%>" style="width: 70px;">
                                <button type="submit">Update</button>
                            </form> </td>
                        <td> <%= total%> </td> <!-- Bạn cần tính toán giá trị của total theo yêu cầu -->
                        <td>
                            <a onclick="return window.confirm('Are you sure?')" href="MainController?action=deleteOrderDetailUser&orderId=<%= details.getOrderID()%>&productId=<%= details.getProduct().getProductID()%>">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    function updateOrderDetailUser(orderId, productId) {
        var quantityId = 'quantity_' + orderId + '_' + productId;
        var quantity = document.getElementById(quantityId).value;

        var url = 'MainController?action=updateOrderDetailUser&orderId=' + orderId + '&productId=' + productId + '&quantity=' + quantity;
        window.location.href = url; // Chuyển hướng người dùng đến URL mới với giá trị quantity được bổ sung
    }
</script>

