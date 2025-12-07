package com.dip.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
 

public class Signupdao {
    String url="jdbc:mysql://localhost:3306/Course_Management_System";
    String username="root";
    String password="dip";
    String sql="insert into SignupDetails (IdNumber,Fullname,Mail,PhoneNumber,Gender,RegisterAs,Password) values (?,?,?,?,?,?,?)";
    public boolean saveInfo(String userId, String name, String email, String phone,String gender, String userType,String pass)
    {
    	boolean rs=true;
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,userId);
			st.setString(2, name);
			st.setString(3, email);
			st.setString(4, phone);
			st.setString(5, gender);
			st.setString(6, userType);
			st.setString(7, pass);
			rs=st.executeUpdate() > 0;
			
		} catch (Exception e) {
			 
			e.printStackTrace();
		}
    	return rs;
    }
    
}
