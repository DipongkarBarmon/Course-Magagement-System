package com.dip.dao;

import java.sql.*;
import java.util.*;
import com.dip.Course;
import com.dip.Teacher;
import com.dip.Student;

public class CourseDAO {
    private Connection conn;

    public CourseDAO(Connection conn) {
        this.conn = conn;
    }

    public void addCourse(Course course) throws SQLException {
        String sql = "INSERT INTO courses(course_name, course_description, teacher_id) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, course.getCourseName());
            ps.setString(2, course.getCourseDescription());
            ps.setInt(3, course.getTeacherId());
            ps.executeUpdate();
        }
    }

    public List<Course> getAllCourses() throws SQLException {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_name, c.course_description, c.teacher_id, u.full_name as teacher_name " +
                    "FROM courses c LEFT JOIN users u ON c.teacher_id = u.user_id";
        try (Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                c.setCourseDescription(rs.getString("course_description"));
                c.setTeacherId(rs.getInt("teacher_id"));
                c.setTeacherName(rs.getString("teacher_name"));
                courses.add(c);
            }
        }
        return courses;
    }

    public List<Course> getCoursesByTeacher(int teacherId) throws SQLException {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_name, c.course_description, c.teacher_id, u.full_name as teacher_name " +
                    "FROM courses c LEFT JOIN users u ON c.teacher_id = u.user_id WHERE c.teacher_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                c.setCourseDescription(rs.getString("course_description"));
                c.setTeacherId(rs.getInt("teacher_id"));
                c.setTeacherName(rs.getString("teacher_name"));
                courses.add(c);
            }
        }
        return courses;
    }

    public List<Teacher> getAllTeachers() throws SQLException {
        List<Teacher> teachers = new ArrayList<>();
        String sql = "SELECT user_id, username, full_name, email FROM users WHERE role='teacher'";
        try (Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Teacher t = new Teacher();
                t.setId(rs.getInt("user_id"));
                t.setUsername(rs.getString("username"));
                t.setFullName(rs.getString("full_name"));
                t.setEmail(rs.getString("email"));
                teachers.add(t);
            }
        }
        return teachers;
    }

    public List<Student> getStudentsInCourse(int courseId) throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT u.user_id, u.username, u.full_name, u.email " +
                    "FROM users u JOIN student_courses sc ON u.user_id = sc.student_id " +
                    "WHERE sc.course_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("user_id"));
               
                s.setFullName(rs.getString("full_name"));
                s.setEmail(rs.getString("email"));
                students.add(s);
            }
        }
        return students;
    }
}
