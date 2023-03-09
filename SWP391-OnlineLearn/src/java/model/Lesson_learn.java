/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Khangnekk
 */
public class Lesson_learn {
    private int user_id;
    private int lesson_id;
    private boolean llearn;

    public Lesson_learn() {
    }

    public Lesson_learn(int user_id, int lesson_id, boolean llearn) {
        this.user_id = user_id;
        this.lesson_id = lesson_id;
        this.llearn = llearn;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public boolean isLlearn() {
        return llearn;
    }

    public void setLlearn(boolean llearn) {
        this.llearn = llearn;
    }
    
    
}
