package com.dip;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/DeleteCourse")
public class DeleteCourse extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Course_Management_System";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "dip";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String courseCode = request.getParameter("id");

        // Validate input: CourseCode should not be null or empty
        if (courseCode == null || courseCode.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid CourseCode");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                // Optional: delete related entries first if foreign key exists
                /*
                try (PreparedStatement psRel = conn.prepareStatement(
                        "DELETE FROM student_courses WHERE course_code = ?")) {
                    psRel.setString(1, courseCode);
                    psRel.executeUpdate();
                }
                */

                // Delete course by CourseCode
                try (PreparedStatement ps = conn.prepareStatement(
                        "DELETE FROM Courses WHERE CourseCode = ?")) {
                    ps.setString(1, courseCode);
                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        // Successfully deleted
                        response.sendRedirect("AdminDashboard.jsp");
                    } else {
                        // No course found with this code
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course not found");
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC Driver not found");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }

    // Block GET requests for safety
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Use POST to delete courses");
    }
}
