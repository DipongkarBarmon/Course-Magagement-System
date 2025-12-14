package com.dip;

public class Student {
    private int id;
    private String fullName;
    private String email;

    // Correct constructor
//    public Student(int id, String fullName, String email) {
//        this.id = id;
//        this.fullName = fullName;
//        this.email = email;
//    }

    // Getters
    public int getId() { return id; }
    public String getFullName() { return fullName; }
    public String getEmail() { return email; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public void setEmail(String email) { this.email = email; }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                '}';	
    }
}
