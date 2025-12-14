<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.dip.Course" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard - Course Management</title>
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
        }
        
        /* Navbar */
        .navbar-custom {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 1rem 0;
        }
        
        .navbar-brand {
            font-weight: 700;
            color: #667eea !important;
            font-size: 1.4rem;
        }
        
        .navbar-brand i {
            margin-right: 0.5rem;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .user-name {
            color: #333;
            font-weight: 600;
        }
        
        /* Main Content */
        .main-content {
            padding: 2rem 0;
        }
        
        .page-header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .page-header h1 {
            color: #333;
            font-weight: 700;
            margin: 0;
        }
        
        .btn-logout {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 12px;
            border: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
        }
        
        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(245, 87, 108, 0.4);
            color: white;
        }
        
        /* Section Container */
        .section-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        
        .section-header {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            margin-bottom: 1.5rem;
            color: #333;
        }
        
        .section-header i {
            font-size: 1.5rem;
            color: #667eea;
        }
        
        .section-header h3 {
            margin: 0;
            font-weight: 700;
        }
        
        /* Course Cards Grid */
        .courses-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 1.5rem;
        }
        
        .course-card {
            background: white;
            border-radius: 15px;
            padding: 1.8rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            border: 2px solid transparent;
            position: relative;
            overflow: hidden;
        }
        
        .course-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        
        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
            border-color: #667eea;
        }
        
        .course-header {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            margin-bottom: 1.2rem;
        }
        
        .course-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.8rem;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }
        
        .course-code-badge {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 0.4rem 0.9rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            font-family: monospace;
            box-shadow: 0 2px 8px rgba(245, 87, 108, 0.3);
        }
        
        .course-name {
            font-size: 1.2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 1.2rem;
            line-height: 1.4;
        }
        
        .course-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 1rem;
            border-top: 1px solid #f0f0f0;
        }
        
        .student-count {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #666;
            font-size: 0.9rem;
        }
        
        .student-count i {
            color: #667eea;
            font-size: 1.1rem;
        }
        
        .btn-view-students {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 10px;
            font-weight: 600;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-view-students:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(102, 126, 234, 0.4);
        }
        
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #999;
        }
        
        .empty-state i {
            font-size: 5rem;
            margin-bottom: 1.5rem;
            opacity: 0.3;
        }
        
        .empty-state h4 {
            color: #666;
            margin-bottom: 0.5rem;
        }
        
        .empty-state p {
            color: #999;
            margin: 0;
        }
        
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
            
            .courses-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-graduation-cap"></i>
                Course Management
            </a>
            <div class="user-info">
                <div class="user-avatar">
                    ${sessionScope.userName.substring(0, 1).toUpperCase()}
                </div>
                <span class="user-name">${sessionScope.userName}</span>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content container">
        <!-- Page Header -->
        <div class="page-header">
            <div>
                <h1><i class="fas fa-chalkboard-teacher"></i> Teacher Dashboard</h1>
            </div>
            <a href="Login.jsp" class="btn-logout">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </a>
        </div>

        <!-- Courses Section -->
        <div class="section-container">
            <div class="section-header">
                <i class="fas fa-book-reader"></i>
                <h3>My Courses</h3>
            </div>
            
            <%
                List<Course> courses = (List<Course>) request.getAttribute("courses");
                if (courses != null && !courses.isEmpty()) {
            %>
            <div class="courses-grid">
                <%
                    for (Course c : courses) {
                %>
                <div class="course-card">
                    <div class="course-header">
                        <div class="course-icon">
                            <i class="fas fa-book-open"></i>
                        </div>
                        <span class="course-code-badge"><%= c.getCourseCode() %></span>
                    </div>
                    <h4 class="course-name"><%= c.getCourseName() %></h4>
                    <div class="course-footer">
                        <div class="student-count">
                            <i class="fas fa-users"></i>
                            <span>View Enrolled</span>
                        </div>
                        <form action="ViewStudents" method="post" style="display:inline;">
                            <input type="hidden" name="courseId" value="<%= c.getCourseCode() %>">
                            <button type="submit" class="btn-view-students">
                                <i class="fas fa-eye"></i>
                                View Students
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
                } else {
            %>
            <div class="empty-state">
                <i class="fas fa-chalkboard"></i>
                <h4>No Courses Assigned</h4>
                <p>You don't have any courses assigned yet. Please contact the administrator.</p>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
