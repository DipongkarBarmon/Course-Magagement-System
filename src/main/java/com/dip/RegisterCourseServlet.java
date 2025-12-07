package com.dip;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterCourse")
public class RegisterCourseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String courseCode = request.getParameter("courseCode");

        String url = "jdbc:mysql://localhost:3306/Course_Management_System";
        String user = "root";
        String pass = "dip";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);

            // Check if already registered
            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT * FROM StudentCourses WHERE StudentId=? AND CourseCode=?");
            checkStmt.setInt(1, studentId);
            checkStmt.setString(2, courseCode);
            ResultSet rs = checkStmt.executeQuery();

            if(rs.next()) {
                response.getWriter().println("<script>alert('Already registered for this course!'); window.location='StudentDashboard.jsp';</script>");
                return;
            }

            // Insert registration
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO StudentCourses (StudentId, CourseCode) VALUES (?, ?)");
            ps.setInt(1, studentId);
            ps.setString(2, courseCode);
            ps.executeUpdate();

            ps.close();
            conn.close();

            response.sendRedirect("StudentDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
