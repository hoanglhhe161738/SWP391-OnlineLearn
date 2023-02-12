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
public class MatchGame {
    private int match_game_id;
    private Img img;
    private AnsImg ans_img;
    private int points;
    private ArrayList<Lession> lessions = new ArrayList<>();

    public int getMatch_game_id() {
        return match_game_id;
    }

    public void setMatch_game_id(int match_game_id) {
        this.match_game_id = match_game_id;
    }

    public Img getImg() {
        return img;
    }

    public void setImg(Img img) {
        this.img = img;
    }

    public AnsImg getAns_img() {
        return ans_img;
    }

    public void setAns_img(AnsImg ans_img) {
        this.ans_img = ans_img;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public ArrayList<Lession> getLessions() {
        return lessions;
    }

    public void setLessions(ArrayList<Lession> lessions) {
        this.lessions = lessions;
    }

   
    
}
