<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Verify OTP</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f8f9fa;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .otp-card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0px 6px 20px rgba(0,0,0,0.1);
      padding: 30px;
      text-align: center;
      width: 400px;
    }
    .otp-card h4 {
      font-weight: bold;
      margin-bottom: 10px;
    }
    .otp-input {
      width: 50px;
      height: 50px;
      font-size: 24px;
      text-align: center;
      border: 2px solid #ddd;
      border-radius: 8px;
      margin: 0 5px;
    }
    .otp-input:focus {
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0,123,255,0.5);
      outline: none;
    }
    .btn-verify {
      margin-top: 20px;
      padding: 10px;
      font-weight: bold;
      border-radius: 8px;
      background: #007bff;
      color: white;
    }
    .btn-verify:hover {
      background: #0056b3;
    }
    .resend {
      margin-top: 15px;
      font-size: 14px;
    }
    .resend a {
      color: #007bff;
      text-decoration: none;
    }
    .resend a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="otp-card">
  <div class="mb-3">
    <img src="https://img.icons8.com/ios-filled/50/007bff/checked.png" alt="verify">
  </div>
  <h4>Verify your code</h4>
  <p>We have sent a code to your email <strong><%= session.getAttribute("UserEmail") != null ? session.getAttribute("UserEmail") : " not correct your email" %>
</strong></p>
  
 
  <form action="Verify" method="post">
    <div class="d-flex justify-content-center">
      <input type="text" maxlength="1" class="otp-input" name="otp1" required />
      <input type="text" maxlength="1" class="otp-input" name="otp2" required />
      <input type="text" maxlength="1" class="otp-input" name="otp3" required />
      <input type="text" maxlength="1" class="otp-input" name="otp4" required />
      <input type="text" maxlength="1" class="otp-input" name="otp5" required />
      <input type="text" maxlength="1" class="otp-input" name="otp6" required />
    </div>

     
    <button type="submit" class="btn btn-verify w-100">Verify</button>
  </form>
</div>

 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
