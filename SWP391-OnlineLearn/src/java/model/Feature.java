/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

public class Feature {
    private int fe_id;
    private String fe_name;
    private String fe_url;
    private ArrayList<Role> roles = new ArrayList<>();

    public Feature() {
    }

    public Feature(int fe_id, String fe_name, String fe_url) {
        this.fe_id = fe_id;
        this.fe_name = fe_name;
        this.fe_url = fe_url;
    }

    public int getFe_id() {
        return fe_id;
    }

    public void setFe_id(int fe_id) {
        this.fe_id = fe_id;
    }

    public String getFe_name() {
        return fe_name;
    }

    public void setFe_name(String fe_name) {
        this.fe_name = fe_name;
    }

    public String getFe_url() {
        return fe_url;
    }

    public void setFe_url(String fe_url) {
        this.fe_url = fe_url;
    }

    

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }
    
}