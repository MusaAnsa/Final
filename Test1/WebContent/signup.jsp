<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sign Up</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	padding-top: 50px;
}

.container {
	background-color: #f8f9fa;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 40px;
	max-width: 500px;
}

.form-group label {
	font-weight: bold;
	color: #495057;
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
	font-size: 16px;
	transition: background-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 1rem;
	color: #212529;
}

table th, table td {
	padding: 0.75rem;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
}

table th {
	background-color: #007bff;
	color: #fff;
	text-align: left;
}

table td {
	background-color: #f8f9fa;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<h2 class="text-center mb-4">Sign Up</h2>
				<form action="signupServlet" method="post">
					<div class="form-group">
						<label for="UserID">User ID</label> <input type="text"
							class="form-control" id="UserID" name="UserID" required>
					</div>
					<div class="form-group">
						<label for="Username">Username</label> <input type="text"
							class="form-control" id="Username" name="Username" required>
					</div>
					<div class="form-group">
						<label for="Password">Password</label> <input type="password"
							class="form-control" id="Password" name="Password" required>
					</div>
					<div class="form-group">
						<label for="Role">Role</label> <select class="form-control"
							id="Role" name="Role" required>
							<option value="" disabled selected>Select your role</option>
							<option value="Manager">Manager</option>
							<option value="Admin">Admin</option>
							<option value="Employee">Employee</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Sign
						Up</button>
				</form>
				<div class="text-center mt-3">
					<a href="login.jsp" style="color: #007bff;">Already have an
						account? Login here</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
