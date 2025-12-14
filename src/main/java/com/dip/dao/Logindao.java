package com.dip.dao;

import java.sql.*;

public class Logindao {
    String url = "jdbc:mysql://localhost:3306/Course_Management_System";
    String username = "root";
    String password = "dip";

    public int getUserId(String email, String pass, String user) {
        email = email.trim();
        pass = pass.trim();
        user = user.trim();
        String sql = "SELECT IdNumber,Mail,Password, RegisterAs FROM SignupDetails WHERE Mail=? AND Password=? AND RegisterAs=?";
//        System.out.println(user);
//        System.out.println(pass);
//        System.out.println(email);
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            st.setString(3, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
            	System.out.println(rs.getInt("IdNumber"));
                return rs.getInt("IdNumber"); 
               
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; 
    }
    
    public String getName(int userId) {
        String name = null;
        String sql1 ="SELECT Fullname FROM SignupDetails WHERE IdNumber=?";
        try   {
        	
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	 Connection con = DriverManager.getConnection(url, username, password);
             PreparedStatement st = con.prepareStatement(sql1);

            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                name = rs.getString("Fullname");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

	 
}
