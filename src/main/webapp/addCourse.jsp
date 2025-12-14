<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/Course_Management_System";
    String user = "root";
    String pass = "dip";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);
    Statement st = conn.createStatement();

    // ✅ Get only teachers
    ResultSet teachers = st.executeQuery("SELECT IdNumber, Fullname FROM SignupDetails WHERE RegisterAs='teacher'");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course - Course Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 2rem 0;
        }
        
        .form-container {
            max-width: 600px;
            margin: 0 auto;
        }
        
        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            padding: 2.5rem;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .form-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2.5rem;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
        }
        
        .form-header h2 {
            color: #333;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .form-header p {
            color: #666;
            margin: 0;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-label {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #333;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .form-label i {
            color: #667eea;
            font-size: 1.1rem;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        .form-control, .form-select {
            padding: 0.9rem 1rem 0.9rem 3rem;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
            outline: none;
        }
        
        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea;
            font-size: 1.1rem;
            pointer-events: none;
        }
        
        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%23667eea' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            padding-right: 3rem;
        }
        
        .btn-submit {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        
        .btn-back {
            width: 100%;
            padding: 0.9rem;
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 12px;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }
        
        .btn-back:hover {
            background: #667eea;
            color: white;
        }
        
        .helper-text {
            font-size: 0.85rem;
            color: #666;
            margin-top: 0.3rem;
        }
        
        @media (max-width: 768px) {
            .form-card {
                padding: 1.5rem;
            }
            
            .form-icon {
                width: 70px;
                height: 70px;
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-card">
            <div class="form-header">
                <div class="form-icon">
                    <i class="fas fa-book-medical"></i>
                </div>
                <h2>Add New Course</h2>
                <p>Create a new course and assign it to a teacher</p>
            </div>
            
            <form action="AddCourse" method="post">
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-book"></i>
                        Course Name
                    </label>
                    <div class="input-wrapper">
                        <i class="fas fa-book input-icon"></i>
                        <input type="text" name="course_name" class="form-control" 
                               placeholder="e.g., Data Structures and Algorithms" required>
                    </div>
                    <small class="helper-text">Enter the full name of the course</small>
                </div>
                
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-code"></i>
                        Course Code
                    </label>
                    <div class="input-wrapper">
                        <i class="fas fa-hashtag input-icon"></i>
                        <input type="text" name="course_code" class="form-control" 
                               placeholder="e.g., CS201" required>
                    </div>
                    <small class="helper-text">Unique identifier for the course</small>
                </div>
                
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-chalkboard-teacher"></i>
                        Assign Teacher
                    </label>
                    <div class="input-wrapper">
                        <i class="fas fa-user-tie input-icon"></i>
                        <select name="teacher_id" class="form-select">
                            <option value="">-- Select Teacher --</option>
                            <% while(teachers.next()) { %>
                                <option value="<%= teachers.getInt("IdNumber") %>">
                                    <%= teachers.getString("Fullname") %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <small class="helper-text">Choose a teacher to instruct this course</small>
                </div>
                
                <button type="submit" class="btn-submit">
                    <i class="fas fa-plus-circle"></i>
                    Add Course
                </button>
            </form>
            
            <a href="AdminDashboard.jsp" class="btn-back">
                <i class="fas fa-arrow-left"></i>
                Back to Dashboard
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
    teachers.close();
    st.close();
    conn.close();
%>
