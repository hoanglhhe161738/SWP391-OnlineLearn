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
