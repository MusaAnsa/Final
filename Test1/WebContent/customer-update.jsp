<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }
        .navbar-nav .nav-link {
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            padding: 0.5rem 1rem;
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 600px;
            margin-top: 50px;
        }
        h2 {
            color: #343a40;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .form-group label {
            font-weight: bold;
            color: #343a40;
        }
        .form-control {
            border-radius: 5px;
            border-color: #ced4da;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
         
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="home.jsp">YourCompany</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="inventoryshow.jsp">Inventory</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sales-show.jsp">Sales</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="customer-show.jsp">Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product-show.jsp">Products</a>
                </li>
                <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        BI Dashboard
    </a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" href="bi_inventory.jsp">Inventory</a>
        <a class="dropdown-item" href="bi_sales.jsp">Sales</a>
        <a class="dropdown-item" href="bi_customer.jsp">Customer</a>
        <a class="dropdown-item" href="#">Product</a>
    </div>
</li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Reporting</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-danger" href="#">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h2>Update Customer</h2>
        <form action="CustomerControllerServletUpdate" method="post">
            <div class="form-group">
                <label for="CustomerID">Customer ID</label>
                <input type="number" class="form-control" id="CustomerID" name="CustomerID" required>
            </div>
            <div class="form-group">
                <label for="CustomerName">Customer Name</label>
                <input type="text" class="form-control" id="CustomerName" name="CustomerName" required>
            </div>
            <div class="form-group">
                <label for="TotalLifetimeValue">Total Lifetime Value</label>
                <input type="number" step="0.01" class="form-control" id="TotalLifetimeValue" name="TotalLifetimeValue" required>
            </div>
            <div class="form-group">
                <label for="AverageOrderValue">Average Order Value</label>
                <input type="number" step="0.01" class="form-control" id="AverageOrderValue" name="AverageOrderValue" required>
            </div>
            <div class="form-group">
    <label for="CustomerSegmentCategory">Customer Segment Category</label>
    <select class="form-control" id="CustomerSegmentCategory" name="CustomerSegmentCategory" required>
        <option value="">Select a category</option>
        <option value="New">New</option>
        <option value="Loyal">Loyal</option>
        <option value="At Risk">At Risk</option>
    </select>
</div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
