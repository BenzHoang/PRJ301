<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="MainController?action=addProduct" method="POST" enctype="multipart/form-data" ">
                    <!--Name-->
                    <div class="form-group">
                        <label for="nameInput">Name product:</label>
                        <input type="text" class="form-control" id="nameInput" name="name">
                        <div id="nameError" class="error" style="color: red"></div>
                    </div>
                    <!--Supplier-->
                    <div class="form-group">
                        <label for="supplierSelect">Supplier</label>
                        <select class="form-control" id="supplierSelect" name="supplier">
                            <option value="">--Choose supplier--</option>
                            <jsp:useBean id="supplierList" class="dao.SupplierDAO"/>
                            <c:forEach var="supplier" items="${supplierList.getAllSuppliers()}">
                                <option value="${supplier.supplierID}">${supplier.companyName}</option>
                            </c:forEach>
                        </select>
                        <div id="supplierError" class="error" style="color: red"></div>
                    </div>

                    <!--Category-->
                    <div class="form-group">
                        <label for="categorySelect">Category</label>
                        <select class="form-control" id="categorySelect" name="category"  >
                            <option value="">--Choose category--</option>
                            <jsp:useBean id="categoryList" class="dao.CategoryDAO"/>
                            <c:forEach var="category" items="${categoryList.getAllCategorys()}">
                                <option value="${category.categoryID}">${category.categoryName}</option>
                            </c:forEach>
                        </select>
                        <div id="categoryError" class="error" style="color: red"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="priceInput">Price:</label>
                        <input type="number" class="form-control" id="priceInput" name="price">
                        <div id="priceError" class="error" style="color: red"></div>
                    </div>
                    <!-- description -->
                    <div class="form-group">
                        <label for="descriptionInput">Description:</label>
                        <input type="text" class="form-control" id="descriptionInput" name="description">
                        <div id="descriptionError" class="error" style="color: red"></div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imageInput" name="image" onchange="displayImage(this)">
                                <label class="custom-file-label" for="image">Choose file</label>
                            </div>
                        </div>
                        <div id="imageError" class="error" style="color: red"></div>
                        <img id="previewImage" src="#" alt="Preview Image"
                             style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addProductForm" onclick="validateForm2()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("addProductForm").addEventListener("change",function(e){
        // Xoá thông báo lỗi hiện tại
        $('.error').html('');
    });
    function validateForm2() {
        let name = $('#nameInput').val();
        let supplier = $('#supplierSelect').val();
        let category = $('#categorySelect').val();
        let price = $('#priceInput').val();
        let description = $('#descriptionInput').val();
        let fileInput = $('#imageInput')[0]; // Get the file input element
        let file = fileInput.files[0];
        // Xoá thông báo lỗi hiện tại
        $('.error').html('');

        // Kiểm tra trường Tên
        if (name === '') {
            $('#nameError').html('Product name cannot be blank');
        }

        // Kiểm tra trường Loại
        if (supplier === '') {
            $('#supplierError').html('Supplier cannot be blank');
        }
        
        if (description === '') {
            $('#descriptionError').html('Description cannot be blank');
        }

        // Kiểm tra trường Giống
        if (category === '') {
            $('#categoryError').html('Category cannot be blank');
        }

        // Kiểm tra trường Cân nặng
        if (price === '') {
            $('#priceError').html('Price cannot be blank');
        } else if (!$.isNumeric(price) || parseFloat(price) <= 0) {
            $('#priceError').html('Price must bigger than 0');
        }

        if (!file) {
            $('#imageError').html('Please select an image');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addProductForm').submit();
        } else {
            event.preventDefault(); // Ngăn không cho form submit nếu có lỗi
        }

    }


    function displayImage(input) {
        var previewImage = document.getElementById("previewImage");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
            $(".custom-file-label").text(file.name);
        }

        reader.readAsDataURL(file);
    }


</script>


