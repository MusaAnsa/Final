<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales Data</title>
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
            table-layout: fixed;
            word-wrap: break-word;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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

    <h1>Sales Data</h1>

    <%
        String url = "jdbc:mysql://localhost:3306/project";
        String user = "root";
        String password = "";

        // Data for Double Bar Graph
        StringBuilder salespersonNames = new StringBuilder();
        StringBuilder unitsAvailable = new StringBuilder();
        StringBuilder unitsSold = new StringBuilder();

        // Data for Area Chart
        StringBuilder salesDates = new StringBuilder();
        StringBuilder salesValues = new StringBuilder();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            // Fetch data for double bar graph
            ResultSet doubleBarResult = stmt.executeQuery("SELECT SalespersonName, NumberOfUnits, NumberOfUnitsSold FROM sales");
            while (doubleBarResult.next()) {
                if (salespersonNames.length() > 0) {
                    salespersonNames.append(", ");
                    unitsAvailable.append(", ");
                    unitsSold.append(", ");
                }
                salespersonNames.append("'").append(doubleBarResult.getString("SalespersonName")).append("'");
                unitsAvailable.append(doubleBarResult.getInt("NumberOfUnits"));
                unitsSold.append(doubleBarResult.getInt("NumberOfUnitsSold"));
            }
            doubleBarResult.close();

            // Fetch data for area chart
            // ResultSet areaChartResult = stmt.executeQuery("SELECT SalesDate, SalesValue FROM sales ORDER BY SalesDate");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>

    <div class="table_container">
        <table>
            <thead>
                <tr>
                    <th>Sales ID</th>
                    <th>Sales Person Name</th>
                    <th>Target</th>
                    <th>Number Of Units</th>
                    <th>Number Of Units Sold</th>
                    <th>Completion Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection connection = null;
                    PreparedStatement preparedStatement = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                        preparedStatement = connection.prepareStatement("SELECT * FROM sales");
                        rs = preparedStatement.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("salesID") %></td>
                    <td><%= rs.getString("salespersonName") %></td>
                    <td><%= rs.getInt("target") %></td>
                    <td><%= rs.getInt("numberOfUnits") %></td>
                    <td><%= rs.getInt("numberOfUnitsSold") %></td>
                    <td><%= rs.getString("completionStatus") %></td>
                </tr>
                <%
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (preparedStatement != null) preparedStatement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <h2>Graphs</h2>
    <div class="graph_container">
        <div class="graph">
            <canvas id="doubleBarChart" width="400" height="200"></canvas>
        </div>
        <div class="graph">
            <canvas id="areaChart" width="400" height="200"></canvas>
        </div>
    </div>

    <script>
        // Convert Java arrays to JavaScript arrays
        const salespersonNames = [<%= salespersonNames.toString() %>];
        const unitsAvailable = [<%= unitsAvailable.toString() %>];
        const unitsSold = [<%= unitsSold.toString() %>];
        const salesDates = [<%= salesDates.toString() %>];
        const salesValues = [<%= salesValues.toString() %>];

        // Render the double bar chart for salespersons
        const doubleBarCtx = document.getElementById('doubleBarChart').getContext('2d');
        new Chart(doubleBarCtx, {
            type: 'bar',
            data: {
                labels: salespersonNames,
                datasets: [
                    {
                        label: 'Units Available',
                        data: unitsAvailable,
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        barThickness: 20
                    },
                    {
                        label: 'Units Sold',
                        data: unitsSold,
                        backgroundColor: 'rgba(255, 99, 132, 0.6)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1,
                        barThickness: 20
                    }
                ]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(200, 200, 200, 0.2)',
                        },
                        ticks: {
                            color: '#343a40',
                            font: {
                                size: 14
                            }
                        }
                    },
                    x: {
                        grid: {
                            color: 'rgba(200, 200, 200, 0.2)',
                        },
                        ticks: {
                            color: '#343a40',
                            font: {
                                size: 14
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
                        backgroundColor: 'rgba(0, 0, 0, 0.7)',
                        titleFont: {
                            size: 16,
                            weight: 'bold'
                        },
                        bodyFont: {
                            size: 14
                        },
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': ' + context.raw;
                            }
                        }
                    }
                },
                layout: {
                    padding: {
                        top: 20,
                        bottom: 20,
                        left: 10,
                        right: 10
                    }
                }
            }
        });
    </script>
</body>
</html>
