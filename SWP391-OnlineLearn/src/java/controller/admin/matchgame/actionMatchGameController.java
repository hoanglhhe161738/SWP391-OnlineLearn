/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.matchgame;

import controller.auth.BaseAuthorizationController;
import dal.MatchGameDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.AnsImg;
import model.Img;
import model.Lesson;
import model.MatchGame;

/**
 *
 * @author Acer
 */
public class actionMatchGameController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String action = req.getParameter("action").trim();
        MatchGameDBContext mgDB = new MatchGameDBContext();
        switch(action){
            case "add": 
                
                String img_name_Add = req.getParameter("img_name");
                String img_url_Add = req.getParameter("img_url");
                String ans_img_name_Add = req.getParameter("ans_img_name");
                String ans_img_url_Add = req.getParameter("ans_img_url");
                int pointAdd = 50;
                int indexAdd = Integer.parseInt(req.getParameter("indexAdd"));
                
                
                Img ImgModelAdd = new Img();
                ImgModelAdd.setImg_name(img_name_Add);
                ImgModelAdd.setImg_url(img_url_Add);
                mgDB.insertImg(ImgModelAdd);
                
                AnsImg AnsImgModelAdd = new AnsImg();
                AnsImgModelAdd.setAns_img_name(ans_img_name_Add);
                AnsImgModelAdd.setAns_img_url(ans_img_url_Add);
                mgDB.insertAnsImg(AnsImgModelAdd);
                
                
                
                MatchGame matchGameModelAdd = new MatchGame();
                matchGameModelAdd.setPoints(pointAdd);
                matchGameModelAdd.setIndex(indexAdd);
                
                Lesson lesson = (Lesson) req.getSession().getAttribute("lesson");
                mgDB.insertMatchGame(matchGameModelAdd, lesson.getLesson_id(), ImgModelAdd, AnsImgModelAdd);
                ArrayList<MatchGame> matchgames = mgDB.getMatchGamePairsByLessionID(lesson.getLesson_id());
                int numberofpairs = matchgames.size();
                req.getSession().setAttribute("image_pairs", matchgames);
                req.getSession().setAttribute("numberofpairs", numberofpairs);
                req.setAttribute("alert", "Đã thêm cặp ảnh thành công");
                req.getRequestDispatcher("./addMatchGame.jsp").forward(req, resp);
                break;
            case "edit":
                
                int match_game_id = Integer.parseInt(req.getParameter("match_game_id"));
                int img_id = Integer.parseInt(req.getParameter("img_id").trim());
                int ans_img_id = Integer.parseInt(req.getParameter("ans_img_id").trim());
                
                String img_name = req.getParameter("img_name").trim();
                String img_url = req.getParameter("img_url").trim();
                String ans_img_name = req.getParameter("ans_img_name").trim();
                String ans_img_url = req.getParameter("ans_img_url").trim();
                
                
                Img imgModelUpdate = new Img();
                imgModelUpdate.setImg_name(img_name);
                imgModelUpdate.setImg_url(img_url);
                
                mgDB.updateImg(imgModelUpdate, img_id);
                
                AnsImg ansimgModelUpdate = new AnsImg();
                ansimgModelUpdate.setAns_img_name(ans_img_name);
                ansimgModelUpdate.setAns_img_url(ans_img_url);
                
                mgDB.updateAnsImg(ansimgModelUpdate, ans_img_id);
                
                req.setAttribute("alert", "Đã sửa cặp ảnh thành công");
                req.getRequestDispatcher("./addMatchGame.jsp").forward(req, resp);
                break;
                
            case "delete":
                int match_game_id_for_del = Integer.parseInt(req.getParameter("match_game_id"));
                Lesson lessonForDelete = (Lesson) req.getSession().getAttribute("lesson");
                mgDB.deleteLessonMatchGame(match_game_id_for_del);
                mgDB.deleteMatchGame(match_game_id_for_del);
                mgDB.updateIndexMatchGame(lessonForDelete.getLesson_id());
                ArrayList<MatchGame> matchGameAfterDelte = mgDB.getMatchGamePairsByLessionID(lessonForDelete.getLesson_id());
                int numberofpairsAfterDelete = matchGameAfterDelte.size();
                
                req.getSession().setAttribute("image_pairs", matchGameAfterDelte);
                req.getSession().setAttribute("numberofpairs", numberofpairsAfterDelete);
                req.setAttribute("alert", "Đã xóa thành công");
                req.getRequestDispatcher("./addMatchGame.jsp").forward(req, resp);
                break;
            default:
                req.getRequestDispatcher("./addMatchGame.jsp").forward(req, resp);
                break; 
                
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        MatchGameDBContext mgDB = new MatchGameDBContext();
        String action = req.getParameter("action");
        int index = Integer.parseInt(req.getParameter("index"));
        int match_game_id = Integer.parseInt(req.getParameter("match_game_id"));
        
        if (match_game_id!= -1) {
            MatchGame pair = mgDB.get(match_game_id);
            req.setAttribute("pair", pair);
            
            Img img = mgDB.getImgByMatchGameID(match_game_id);
            req.setAttribute("img", img);
            
            AnsImg ans_img = mgDB.getAnsImgByMatchGameID(match_game_id);
            req.setAttribute("ans_img", ans_img);
        }
        req.setAttribute("action", action);
        req.setAttribute("index", index);
        req.getSession().setAttribute("add", "add");
        req.getSession().setAttribute("edit", "edit");
        req.getSession().setAttribute("delete", "delete");
        req.getRequestDispatcher("./addMatchGame.jsp").forward(req, resp);
    }
    
}
