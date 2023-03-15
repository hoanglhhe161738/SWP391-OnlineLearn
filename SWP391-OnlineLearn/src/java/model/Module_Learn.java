/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Khangnekk
 */
public class Module_Learn {
    private int user_id;
    private int module_id;
    private boolean mlearn;

    public Module_Learn() {
    }

    public Module_Learn(int user_id, int module_id, boolean mlearn) {
        this.user_id = user_id;
        this.module_id = module_id;
        this.mlearn = mlearn;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getModule_id() {
        return module_id;
    }

    public void setModule_id(int module_id) {
        this.module_id = module_id;
    }

    public boolean isMlearn() {
        return mlearn;
    }

    public void setMlearn(boolean mlearn) {
        this.mlearn = mlearn;
    }
    
    
}
