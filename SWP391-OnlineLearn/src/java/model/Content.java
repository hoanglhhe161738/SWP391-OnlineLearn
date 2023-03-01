/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Khangnekk
 */
public class Content {
    private int content_id;
    private String reading_content;

    public Content() {
        
    }

    public Content(int content_id, String reading_content) {
        this.content_id = content_id;
        this.reading_content = reading_content;
    }

    public int getContent_id() {
        return content_id;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }

    public String getReading_content() {
        return reading_content;
    }

    public void setReading_content(String reading_content) {
        this.reading_content = reading_content;
    }
    
    
}
