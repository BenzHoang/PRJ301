<%@page import="dto.Product"%>
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
        Product list
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
                        <th>Product name</th>
                        <th>Supplier ID</th>
                        <th>Category Name</th>
                        <th>Unit Price</th>
                        <th>Image</th>
                        <th>Desciption</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%    List<Product> listProduct = (List<Product>) request.getAttribute("listProduct"); // Hoặc session.getAttribute("listOrder"), tùy thuộc vào cách bạn lưu trữ listOrder
                        int n = 1;
                        for (Product pro : listProduct) {
                            System.out.println(pro.getCategory().getCategoryName());
                    %>
                    <tr>
                        <td> <%= n++%> </td>
                        <td> <%= pro.getProductName()%> </td>
                        <td> <%= pro.getSupplierID()%> </td>
                        <td> <%= pro.getCategory().getCategoryName()%> </td>
                        <td> <%= pro.getUnitPrice()%> </td>
                        <td>
                            <img  width="100px"
                                  height="100px"
                                  src="${pageContext.request.contextPath}<%= pro.getProductImage()%>" 
                                  alt="Loi" class="card-img-top">
                        </td>
                        <td> <%= pro.getDescription()%> </td>

                        <td>
                            <a href=""data-toggle="modal"
                               data-target="#editProductModal"
                               onclick="editPetModal(<%= pro.getProductID()%>,
                                               '<%= pro.getProductName()%>',
                               <%= pro.getSupplierID()%>,
                               <%= pro.getCategory().getCategoryID()%>,
                               <%= pro.getUnitPrice()%>,
                                               '<%= pro.getDescription()%>')">Edit
                            </a>|
                            <a onclick="return window.confirm('Are you sure?')" href="MainController?action=removeProduct&txtitemid=<%= pro.getProductID()%>"  >Delete</a>
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