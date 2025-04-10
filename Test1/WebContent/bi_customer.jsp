<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Data</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            padding: 60px 20px 20px 20px;
        }
        .graph_container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        .graph {
            width: calc(50% - 5px);
        }
        @media only screen and (max-width: 768px) {
            .graph {
                width: 100%;
            }
        }
        .table_container {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            color: white;
            background-color: #343a40;
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
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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
                        <a class="dropdown-item" href="bi_product.jsp">Product</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Reporting</a>
                </li>
            </ul>
            <form class="form ml-auto">
                <a class="nav-link btn btn-outline-danger" href="logout.jsp">Logout</a>
            </form>
        </div>
    </nav>

    <h1>Customer BI Data</h1>

    <%
        String url = "jdbc:mysql://localhost:3306/project";
        String user = "root";
        String password = "";

        // Data for Bar Graph
        StringBuilder customerNames = new StringBuilder();
        StringBuilder customerLTVs = new StringBuilder();
        
        // Data for Pie Chart
        StringBuilder customerSegments = new StringBuilder();
        StringBuilder segmentCounts = new StringBuilder();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            // Fetch top customers based on lifetime value
            ResultSet ltvResult = stmt.executeQuery("SELECT CustomerName, TotalLifetimeValue FROM customer ORDER BY TotalLifetimeValue DESC LIMIT 10");
            while (ltvResult.next()) {
                if (customerNames.length() > 0) {
                    customerNames.append(", ");
                    customerLTVs.append(", ");
                }
                customerNames.append("'").append(ltvResult.getString("CustomerName")).append("'");
                customerLTVs.append(ltvResult.getDouble("TotalLifetimeValue"));
            }
            ltvResult.close();

            // Fetch customer segments
            ResultSet segmentResult = stmt.executeQuery("SELECT CustomerSegmentCategory, COUNT(*) as Count FROM customer GROUP BY CustomerSegmentCategory");
            while (segmentResult.next()) {
                if (customerSegments.length() > 0) {
                    customerSegments.append(", ");
                    segmentCounts.append(", ");
                }
                customerSegments.append("'").append(segmentResult.getString("CustomerSegmentCategory")).append("'");
                segmentCounts.append(segmentResult.getInt("Count"));
            }
            segmentResult.close();

            stmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>

    <h2>Info Table</h2>
    <div class="table_container">
        <table>
            <tr>
                <th>Customer ID</th>
                <th>Customer Name</th>
                <th>Total Lifetime Value</th>
                <th>Average Order Value</th>
                <th>Customer Segment Category</th>
            </tr>
            <%
                try {
                    Connection conn = DriverManager.getConnection(url, user, password);
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM customer");

                    while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("customerID") %></td>
                            <td><%= rs.getString("customerName") %></td>
                            <td><%= rs.getString("totalLifetimeValue") %></td>
                            <td><%= rs.getString("averageOrderValue") %></td>
                            <td><%= rs.getString("customerSegmentCategory") %></td>
                        </tr>
                        <%
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>

    <h2>Graphs</h2>
    <div class="graph_container">
        <div class="graph">
            <canvas id="ltvBarChart" width="400" height="200"></canvas>
        </div>
        <div class="graph">
            <canvas id="segmentPieChart" width="400" height="200"></canvas>
        </div>
    </div>

    <script>
        // Convert Java arrays to JavaScript arrays
        const customerNames = [<%= customerNames.toString() %>];
        const customerLTVs = [<%= customerLTVs.toString() %>];
        const customerSegments = [<%= customerSegments.toString() %>];
        const segmentCounts = [<%= segmentCounts.toString() %>];

        // Render the bar chart for top customers by lifetime value
        const ltvCtx = document.getElementById('ltvBarChart').getContext('2d');
        new Chart(ltvCtx, {
            type: 'bar',
            data: {
                labels: customerNames,
                datasets: [{
                    label: 'Lifetime Value',
                    data: customerLTVs,
                    backgroundColor: 'rgba(54, 162, 235, 0.7)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 2
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return '$' + value;
                            }
                        }
                    }
                },
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#343a40',
                            font: {
                                size: 16,
                                weight: 'bold'
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.label + ': $' + context.raw.toFixed(2);
                            }
                        }
                    }
                }
            }
        });

        // Render the pie chart for customer segments
        const segmentCtx = document.getElementById('segmentPieChart').getContext('2d');
        new Chart(segmentCtx, {
            type: 'pie',
            data: {
                labels: customerSegments,
                datasets: [{
                    label: 'Customer Segment Category',
                    data: segmentCounts,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 206, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)',
                        'rgba(255, 159, 64, 0.7)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#343a40',
                            font: {
                                size: 16,
                                weight: 'bold'
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.label + ': ' + context.raw;
                            }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
