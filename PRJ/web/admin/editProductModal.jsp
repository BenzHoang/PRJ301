<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editProductForm" action="MainController?action=editProduct" method="POST" enctype="multipart/form-data" ">
                    <!--Name-->
                    <div class="form-group">
                        <label for="nameInput">Name product:</label>
                        <input type="hidden" class="form-control" id="productID1" name="productID">
                        <input type="text" class="form-control" id="nameInput1" name="name">
                        <div id="nameError1" class="error" style="color: red"></div>
                    </div>
                    <!--Supplier-->
                    <div class="form-group">
                        <label for="supplierSelect">Supplier</label>
                        <select class="form-control" id="supplierSelect1" name="supplier">
                            <option value="">--Choose supplier--</option>
                            <jsp:useBean id="supplierList" class="dao.SupplierDAO" />
                            <c:forEach var="supplier" items="${supplierList.getAllSuppliers()}">
                                <option value="${supplier.supplierID}">${supplier.companyName}</option>
                            </c:forEach>
                        </select>
                        <div id="supplierError1" class="error" style="color: red"></div>
                    </div>

                    <!--Category-->
                    <div class="form-group">
                        <label for="categorySelect">Category</label>
                        <select class="form-control" id="categorySelect1" name="category"  >
                            <option value="">--Choose category--</option>
                            <jsp:useBean id="categoryList" class="dao.CategoryDAO"/>
                            <c:forEach var="category" items="${categoryList.getAllCategorys()}">
                                <option value="${category.categoryID}">${category.categoryName}</option>
                            </c:forEach>
                        </select>
                        <div id="categoryError1" class="error" style="color: red"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="priceInput">Price:</label>
                        <input type="number" class="form-control" id="priceInput1" name="price">
                        <div id="priceError1" class="error" style="color: red"></div>
                    </div>
                    <!-- description -->
                    <div class="form-group">
                        <label for="descriptionInput">Description:</label>
                        <input type="text" class="form-control" id="descriptionInput1" name="description">
                        <div id="descriptionError1" class="error" style="color: red"></div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imageInput" name="image" onchange="displayImage2(this)">
                                <label class="custom-file-label" for="image">Choose file</label>
                            </div>
                        </div>
                        <div id="imageError1" class="error" style="color: red"></div>
                        <img id="previewImage2" src="#" alt="Preview Image"
                             style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editProductForm" onclick="validateForm1()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>



    function editPetModal(productID, name, supplier, category, price, description) {

        $('#productID1').val(productID);
        $('#nameInput1').val(name);
        $('#supplierSelect1').val(supplier);

        // Cập nhật giá trị cho dropdown menu và đặt giá trị được chọn
        $('#categorySelect1').val(category);
        $('#descriptionInput1').val(description);

        $('#priceInput1').val(price);

        // Đảm bảo rằng option tương ứng được chọn
        $('#supplierSelect1 option').each(function () {
            if ($(this).val() == supplier) {
                $(this).prop('selected', true);
            }
        });
        $('#categorySelect1 option').each(function () {
            if ($(this).val() == category) {
                $(this).prop('selected', true);
            }
        });
    }


    document.getElementById("editProductForm").addEventListener("change", function (e) {
        // Xoá thông báo lỗi hiện tại
        $('.error').html('');
    });
    function validateForm1() {
        let name = $('#nameInput1').val();
        let supplier = $('#supplierSelect1').val();
        let category = $('#categorySelect1').val();
        let price = $('#priceInput1').val();
        let description = $('#descriptionInput1').val();

        // Xoá thông báo lỗi hiện tại
        $('.error').html('');

        // Kiểm tra trường Tên
        if (name === '') {
            $('#nameError1').html('Product name cannot be blank');
        }

        // Kiểm tra trường Loại
        if (supplier === '') {
            $('#supplierError1').html('Supplier cannot be blank');
        }

        if (description === '') {
            $('#descriptionError1').html('Description cannot be blank');
        }

        // Kiểm tra trường Giống
        if (category === '') {
            $('#categoryError1').html('Category cannot be blank');
        }

        // Kiểm tra trường Cân nặng
        if (price === '') {
            $('#priceError1').html('Price cannot be blank');
        } else if (!$.isNumeric(price) || parseFloat(price) <= 0) {
            $('#priceError1').html('Price must bigger than 0');
        }


        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#editProductForm').submit();
        } else {
            event.preventDefault(); // Ngăn không cho form submit nếu có lỗi
        }

    }
    function displayImage2(input) {
        var previewImage = document.getElementById("previewImage2");
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


