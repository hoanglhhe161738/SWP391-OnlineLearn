/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;

/**
 *
 * @author Khangnekk
 */
public class Lession {
    private int lession_id;
    private String lession_name;
    private Module module;

    public Lession() {
    }

    public Lession(int lession_id, String lession_name, Module module) {
        this.lession_id = lession_id;
        this.lession_name = lession_name;
        this.module = module;
    }

    public int getLession_id() {
        return lession_id;
    }

    public void setLession_id(int lession_id) {
        this.lession_id = lession_id;
    }

    public String getLession_name() {
        return lession_name;
    }

    public void setLession_name(String lession_name) {
        this.lession_name = lession_name;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }
    
    
}
