<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.dip.Course" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .custom-header {
            background: linear-gradient(to right, #6a11cb, #2575fc);
        }
        .custom-header .navbar-brand {
            font-size: 1.6rem;
            font-weight: bold;
        }
    </style>
</head>
<body style="background: linear-gradient(to right, #ff758c, #ff7eb3);">

<!-- Header -->
<nav class="navbar navbar-expand-lg custom-header shadow">
  <div class="container-fluid">
    <a class="navbar-brand text-white">Teacher Dashboard</a>
    <div class="ms-auto">
      <a href="Login.jsp" class="btn btn-light btn-sm px-3 rounded-pill shadow-sm">Logout</a>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <div class="card shadow-lg p-4 rounded-4">
        <!-- Welcome message inside card -->
        <h2 class="text-center text-danger">Welcome ${sessionScope.userName}</h2>
        
        <h4 class="mt-4 text-primary border-bottom pb-2">Your Courses</h4>
        <table class="table table-bordered table-hover mt-3 align-middle">
            <thead class="table-dark">
                <tr>
                    <th class="text-center">Course Name</th>
                    <th class="text-center">Course Code</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Course> courses = (List<Course>) request.getAttribute("courses");
                if (courses != null && !courses.isEmpty()) {
                    for (Course c : courses) {
            %>
                <tr>
                    <td class="text-center"><%= c.getCourseName() %></td>
                    <td class="text-center"><%= c.getCourseCode() %></td>
                    <td class="text-center">
					    <form action="ViewStudents" method="post" style="display:inline;">
					        <input type="hidden" name="courseId" value="<%= c.getCourseCode() %>">
					        <button type="submit" class="btn btn-sm btn-danger">View Students</button>
					    </form>
				   </td>

                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="3" class="text-center text-muted">No courses found</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
