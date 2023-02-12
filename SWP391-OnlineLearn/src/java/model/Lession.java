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
public class Lession {
    private int lession_id;
    private String lession_name;
    private boolean status;
    private ArrayList<MatchGame> matchgames = new ArrayList<>();

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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<MatchGame> getMatchgames() {
        return matchgames;
    }

    public void setMatchgames(ArrayList<MatchGame> matchgames) {
        this.matchgames = matchgames;
    }

    
    
}
