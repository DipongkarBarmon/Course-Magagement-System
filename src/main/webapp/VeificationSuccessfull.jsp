<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Confirmation Successful</title>
 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to right, #f6d365, #fda085);  
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: #333;
    }
    .confirmation-card {
      background: rgba(255, 255, 255, 0.9);  
      border-radius: 15px;
      padding: 40px;
      text-align: center;
      width: 450px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.2);
    }
    .confirmation-card h1 {
      font-weight: bold;
      margin-bottom: 20px;
      color: #ff8c00;  
    }
    .confirmation-card p {
      font-size: 18px;
      margin-bottom: 30px;
      color: #555;
    }
    .btn-home {
      padding: 12px 25px;
      font-weight: bold;
      border-radius: 8px;
      background: #ff8c00; 
      color: white;
      text-decoration: none;
    }
    .btn-home:hover {
      background: #e67600;
      color: white;
    }
    .success-icon {
      font-size: 60px;
      color: #ffb74d;  
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<div class="confirmation-card">
  <div class="success-icon">&#10004;</div>  
  <h1>Success!</h1>
  <p>Your account has been successfully verified.</p>
  <a href="Login.jsp" class="btn-home">Go to Login</a>
</div>

 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
