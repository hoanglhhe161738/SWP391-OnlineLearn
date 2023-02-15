/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author Khangnekk
 */
public class Lesson {
    private int lesson_id;
    private String lesson_name;
    private Module module;
    private boolean status;

    public Lesson() {
    }

    public Lesson(int lesson_id, String lesson_name, Module module, boolean status) {
        this.lesson_id = lesson_id;
        this.lesson_name = lesson_name;
        this.module = module;
        this.status = status;
    }

    public Lesson(String lesson_name,boolean status) {
        this.lesson_name = lesson_name;
        this.status = status;
    }
    
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public String getLesson_name() {
        return lesson_name;
    }

    public void setLesson_name(String lesson_name) {
        this.lesson_name = lesson_name;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }
    
    
}
