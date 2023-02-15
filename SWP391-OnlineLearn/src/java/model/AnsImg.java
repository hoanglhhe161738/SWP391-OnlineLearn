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
public class AnsImg {
    private int ans_img_id;
    private String ans_img_name;
    private String ans_img_url;
    private ArrayList<MatchGame> matchgames = new ArrayList<>();

    public int getAns_img_id() {
        return ans_img_id;
    }

    public void setAns_img_id(int ans_img_id) {
        this.ans_img_id = ans_img_id;
    }

    public String getAns_img_name() {
        return ans_img_name;
    }

    public void setAns_img_name(String ans_img_name) {
        this.ans_img_name = ans_img_name;
    }

    public String getAns_img_url() {
        return ans_img_url;
    }

    public void setAns_img_url(String ans_img_url) {
        this.ans_img_url = ans_img_url;
    }

    public ArrayList<MatchGame> getMatchgames() {
        return matchgames;
    }

    public void setMatchgames(ArrayList<MatchGame> matchgames) {
        this.matchgames = matchgames;
    }

    
    
    
}
