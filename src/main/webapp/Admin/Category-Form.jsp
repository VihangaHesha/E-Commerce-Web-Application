<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 19/01/2025
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Categories</title>
    <link href="../Assets/Styles/Admin.css" rel="stylesheet">
</head>
<div class="wrapper">
<div class="modal fade" id="addCategoryModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Category</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                ></button>
            </div>
            <div class="modal-body">
                <form method="post" action="category-servlet">
                    <div class="mb-3">
                        <label class="form-label">Category Name</label>
                        <input type="text" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Category Description</label>
                        <input type="text" class="form-control" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                >
                    Close
                </button>
                <button type="button" class="btn btn-primary">Save Product</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
