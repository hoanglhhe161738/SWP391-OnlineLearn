/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author T490
 */
public class Account {
    private String username;
    private String password;
    private String classify_account;
    private String membership;
    private ArrayList<Role> roles = new ArrayList<>();

    public Account() {
    }

    public Account(String username, String password, String classify_account, String membership) {
        this.username = username;
        this.password = password;
        this.classify_account = classify_account;
        this.membership = membership;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getClassify_account() {
        return classify_account;
    }

    public void setClassify_account(String classify_account) {
        this.classify_account = classify_account;
    }

    public String getMembership() {
        return membership;
    }

    public void setMembership(String membership) {
        this.membership = membership;
    }
    
}
