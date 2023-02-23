/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.*;

/**
 *
 * @author T490
 */
public class User {
    private int user_id;
    private String full_name;
    private Date dob;
    private boolean gender;
    private String parent_name;
    private String parent_email;
    private String parent_phone_number;
    private String username;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getParent_name() {
        return parent_name;
    }

    public void setParent_name(String parent_name) {
        this.parent_name = parent_name;
    }

    public String getParent_email() {
        return parent_email;
    }

    public void setParent_email(String parent_email) {
        this.parent_email = parent_email;
    }

    public String getParent_phone_number() {
        return parent_phone_number;
    }

    public void setParent_phone_number(String parent_phone_number) {
        this.parent_phone_number = parent_phone_number;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public User() {
    }

    public User(int user_id, String full_name, Date dob, boolean gender, String parent_name, String parent_email, String parent_phone_number, String username) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.dob = dob;
        this.gender = gender;
        this.parent_name = parent_name;
        this.parent_email = parent_email;
        this.parent_phone_number = parent_phone_number;
        this.username = username;
    }
    
}
