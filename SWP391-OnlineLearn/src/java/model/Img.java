/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Acer
 */
public class Img {
    private int img_id;
    private String img_name;
    private String img_url;
    private ArrayList<MatchGame> matchgames = new ArrayList<>();

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public String getImg_name() {
        return img_name;
    }

    public void setImg_name(String img_name) {
        this.img_name = img_name;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public ArrayList<MatchGame> getMatchgames() {
        return matchgames;
    }

    public void setMatchgames(ArrayList<MatchGame> matchgames) {
        this.matchgames = matchgames;
    }

    
  
}
