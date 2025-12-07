package com.dip;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

import com.dip.dao.CourseDAO;

public class AdminServlet extends HttpServlet {
    private Connection conn;

    @Override
    public void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Course_Management_System",
                "root", "password"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        try {
            CourseDAO courseDAO = new CourseDAO(conn);
            List<Course> allCourses = courseDAO.getAllCourses();
            List<Teacher> allTeachers = courseDAO.getAllTeachers();

            req.setAttribute("allCourses", allCourses);
            req.setAttribute("allTeachers", allTeachers);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = req.getRequestDispatcher("adminDashboard.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("addCourse".equals(action)) {
            String courseName = req.getParameter("courseName");
            String courseDescription = req.getParameter("courseDescription");
            int teacherId = Integer.parseInt(req.getParameter("teacherId"));

            Course course = new Course();
            course.setCourseName(courseName);
            course.setCourseDescription(courseDescription);
            course.setTeacherId(teacherId);

            try {
                CourseDAO courseDAO = new CourseDAO(conn);
                courseDAO.addCourse(course);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect("adminServlet");
    }
}
