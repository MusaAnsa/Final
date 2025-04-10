<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
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

        /* Chatbot Styles */
        .chatbot-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 350px;
            z-index: 1000;
            font-family: 'Arial', sans-serif;
        }
        .chatbot-header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            font-size: 20px;
            cursor: pointer;
            border-radius: 10px 10px 0 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }
        .chatbot-header:hover {
            background-color: #0056b3;
        }
        .chatbot-body {
            display: none;
            background-color: white;
            border: 1px solid #ccc;
            border-top: none;
            height: 450px;
            overflow-y: auto;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .chatbot-messages {
            padding: 10px;
            height: 270px;
            overflow-y: auto;
            background-color: #f7f7f7;
            border-radius: 0 0 10px 10px;
        }
        .chatbot-3d {
            height: 150px;
            background-color: #f7f7f7;
            text-align: center;
            margin-bottom: 10px;
            border-radius: 10px;
        }
        .chatbot-input {
            padding: 10px;
            border-top: 1px solid #ccc;
            background-color: #f1f1f1;
            border-radius: 0 0 10px 10px;
        }
        .chatbot-input input {
            width: 75%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 5px;
        }
        .chatbot-input button {
            width: 20%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .chatbot-input button:hover {
            background-color: #0056b3;
        }

        /* Message Styles */
        .chatbot-message {
            background-color: #007bff;
            color: white;
            padding: 8px 15px;
            margin: 10px 0;
            border-radius: 20px;
            display: inline-block;
            max-width: 70%;
        }
        .chatbot-message.bot {
            background-color: #6c757d;
            margin-left: 0;
        }
        .chatbot-message.user {
            background-color: #007bff;
            margin-left: auto;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="home.jsp">ERP</a>
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
                <li class="nav-item mt-1">
                    <a class="nav-link btn btn-outline-danger" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <h2>Welcome to the Home Page</h2>
        <p>Select an option from the menu above to get started.</p>
    </div>

    <!-- Chatbot Container -->
    <div class="chatbot-container">
        <div class="chatbot-header">
            Chatbot
        </div>
        <div class="chatbot-body">
            <div class="chatbot-3d" id="chatbot3D">
                <!-- 3D model will be rendered here -->
            </div>
            <div class="chatbot-messages" id="chatbotMessages">
                <!-- Messages will be displayed here -->
            </div>
            <div class="chatbot-input">
                <input type="text" id="chatbotInput" placeholder="Type a message..." />
                <button id="chatbotSend">Send</button>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Three.js Library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

    <!-- Chatbot Script -->
    <script>
        document.querySelector('.chatbot-header').addEventListener('click', function() {
            const chatbotBody = document.querySelector('.chatbot-body');
            chatbotBody.style.display = chatbotBody.style.display === 'block' ? 'none' : 'block';
        });

        document.getElementById('chatbotSend').addEventListener('click', function() {
            const input = document.getElementById('chatbotInput');
            const message = input.value.trim();
            if (message !== '') {
                const userMessage = document.createElement('div');
                userMessage.className = 'chatbot-message user';
                userMessage.textContent = message;
                document.getElementById('chatbotMessages').appendChild(userMessage);

                // Simple echo response from the bot
                setTimeout(() => {
                    const botMessage = document.createElement('div');
                    botMessage.className = 'chatbot-message bot';
                    botMessage.textContent = 'Bot: ' + message;
                    document.getElementById('chatbotMessages').appendChild(botMessage);
                    document.getElementById('chatbotMessages').scrollTop = document.getElementById('chatbotMessages').scrollHeight;
                }, 500);

                input.value = '';
            }
        });

        // 3D Model Rendering with Three.js
        const scene = new THREE.Scene();
        const camera = new THREE.PerspectiveCamera(75, 350 / 150, 0.1, 1000);
        const renderer = new THREE.WebGLRenderer();
        renderer.setSize(350, 150);
        document.getElementById('chatbot3D').appendChild(renderer.domElement);

        const geometry = new THREE.BoxGeometry();
        const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
        const cube = new THREE.Mesh(geometry, material);
        scene.add(cube);

        camera.position.z = 5;

        const animate = function () {
            requestAnimationFrame(animate);

            cube.rotation.x += 0.01;
            cube.rotation.y += 0.01;

            renderer.render(scene, camera);
        };

        animate();
    </script>
</body>
</html>
