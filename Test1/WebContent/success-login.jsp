<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Success</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            
        }
        .container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
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
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
            <ul class="navbar-nav ml-auto ">
                
                 <li class="nav-item mt-1 ">
                    <a class="nav-link btn btn-outline-danger " href="logout.jsp">Logout</a>
                   
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="text-success mb-4">You are Successfully Logged in</h2>
        <p>Click on the link below to go to the home page.</p>
        <a href="home.jsp" class="btn btn-primary">Go to Home</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
