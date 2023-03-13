/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.video;

import controller.auth.BaseAuthorizationController;
import dal.VideoDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Lesson;
import model.Video;

/**
 *
 * @author Khangnekk
 */
public class actionVideoController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String action = req.getParameter("action");
        VideoDBContext vDB = new VideoDBContext();
        switch (action) {
            case "add":
                String video_titleAdd = req.getParameter("title");
                String urlRawAdd = req.getParameter("url");
                String urlAdd = "";
                if (urlRawAdd.contains("https://www.youtube.com/watch?v=")) {
                    urlAdd = urlRawAdd.replace("https://www.youtube.com/watch?v=", "");
                }
                if (urlRawAdd.contains("https://youtu.be/")) {
                    urlAdd = urlRawAdd.replace("https://youtu.be/", "");
                }
                Video videoAdd = new Video();
                videoAdd.setUrl(urlAdd);
                videoAdd.setVideo_title(video_titleAdd);
                vDB.insert(videoAdd);
                Video videoJustAdd = vDB.getVideoByUrl(urlAdd);
                Lesson lesson = (Lesson) req.getSession().getAttribute("lesson");
                vDB.insertLessonVideo(lesson.getLesson_id(), videoJustAdd.getVideo_id());
                if (urlAdd != null) {
                    urlAdd = "https://www.youtube.com/watch?v=" + urlAdd;
                    req.getSession().setAttribute("originURL", urlAdd);
                }
                req.getSession().setAttribute("video", videoJustAdd);
                req.setAttribute("alert", "Thêm video thành công");
                req.setAttribute("action", -1);
                req.getRequestDispatcher("./addVideo.jsp").forward(req, resp);
                break;
            case "edit":
                int video_id = Integer.parseInt(req.getParameter("video_id"));
                String video_title = req.getParameter("title");
                String urlRaw = req.getParameter("url");
                String url = "";
                if (urlRaw.contains("https://www.youtube.com/watch?v=")) {
                    url = urlRaw.replace("https://www.youtube.com/watch?v=", "");
                }
                if (urlRaw.contains("https://youtu.be/")) {
                    url = urlRaw.replace("https://youtu.be/", "");
                }
                Video video = new Video();
                video.setUrl(url);
                video.setVideo_id(video_id);
                video.setVideo_title(video_title);
                vDB.update(video);
                if (url != null) {
                    url = "https://www.youtube.com/watch?v=" + url;
                    req.getSession().setAttribute("originURL", url);
                }
                req.getSession().setAttribute("video", video);
                req.setAttribute("alert", "Sửa thành công");
                req.setAttribute("action", -1);
                req.getRequestDispatcher("./addVideo.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        req.getSession().setAttribute("add", "add");
        req.getSession().setAttribute("edit", "edit");
        req.getSession().setAttribute("delete", "delete");
        req.getRequestDispatcher("./addVideo.jsp").forward(req, resp);
    }

}
