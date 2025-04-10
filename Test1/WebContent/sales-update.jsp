<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Sales Entry</title>
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
            margin: 50px auto;
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
                    <a class="nav-link btn btn-outline-danger" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
<body>
    <div class="container mt-5">
        <h2>Update Sales Entry</h2>
        <form action="SalesControllerServletUpdate" method="post">
            <div class="form-group">
                <label for="SalesID">Sales ID</label>
                <input type="number" class="form-control" id="SalesID" name="SalesID" required>
            </div>
            <div class="form-group">
                <label for="SalespersonName">Salesperson Name</label>
                <input type="text" class="form-control" id="SalespersonName" name="SalespersonName" required>
            </div>
            <div class="form-group">
                <label for="Target">Target</label>
                <input type="number" class="form-control" id="Target" name="Target" required>
            </div>
            <div class="form-group">
                <label for="NumberOfUnits">Number of Units</label>
                <input type="number" class="form-control" id="NumberOfUnits" name="NumberOfUnits" required>
            </div>
            <div class="form-group">
                <label for="NumberOfUnitsSold">Number of Units Sold</label>
                <input type="number" class="form-control" id="NumberOfUnitsSold" name="NumberOfUnitsSold" required>
            </div>
            <div class="form-group">
                <label for="CompletionStatus">Completion Status</label>
                <select class="form-control" id="CompletionStatus" name="CompletionStatus" required>
                    <option value="completed">Completed</option>
                    <option value="pending">Pending</option>
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
