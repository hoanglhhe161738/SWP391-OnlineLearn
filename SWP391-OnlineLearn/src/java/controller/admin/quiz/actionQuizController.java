/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.quiz;

import controller.auth.BaseAuthorizationController;
import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Lesson;
import model.Question;

/**
 *
 * @author Khangnekk
 */
public class actionQuizController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String action = req.getParameter("action").trim();
        QuestionDBContext qDB = new QuestionDBContext();
        switch (action) {
            case "add":

                String questionAdd = req.getParameter("question").trim();
                String option1Add = req.getParameter("option1").trim();
                String option2Add = req.getParameter("option2").trim();
                String option3Add = req.getParameter("option3").trim();
                String option4Add = req.getParameter("option4").trim();
                String true_AnsAdd = req.getParameter("trueAnswer").trim();
                int pointAdd = 1;
                int indexAdd = Integer.parseInt(req.getParameter("indexAdd"));

                Question questionModelAdd = new Question();
                questionModelAdd.setQuestion(questionAdd);
                questionModelAdd.setOption1(option1Add);
                questionModelAdd.setOption2(option2Add);
                questionModelAdd.setOption3(option3Add);
                questionModelAdd.setOption4(option4Add);
                questionModelAdd.setTrue_answer(true_AnsAdd);
                questionModelAdd.setPoints(pointAdd);
                questionModelAdd.setIndex(indexAdd);

                Lesson lesson = (Lesson) req.getSession().getAttribute("lesson");
                qDB.insert(questionModelAdd, lesson.getLesson_id());
                ArrayList<Question> questions = qDB.getQuestionByLessionID(lesson.getLesson_id());
                int questionSize = questions.size();
                req.getSession().setAttribute("questions", questions);
                req.getSession().setAttribute("questionSize", questionSize);
                req.setAttribute("alert", "Đã thêm câu hỏi thành công");
                req.getRequestDispatcher("./addQuiz.jsp").forward(req, resp);
                break;
            case "edit":
                int question_id = Integer.parseInt(req.getParameter("question_id"));
                String question = req.getParameter("question").trim();
                String option1 = req.getParameter("option1").trim();
                String option2 = req.getParameter("option2").trim();
                String option3 = req.getParameter("option3").trim();
                String option4 = req.getParameter("option4").trim();
                String true_Ans = req.getParameter("trueAnswer").trim();
                int point = 1;
                int index = Integer.parseInt(req.getParameter("index"));

                Question questionModelUpdate = new Question();
                questionModelUpdate.setQuestion_id(question_id);
                questionModelUpdate.setQuestion(question);
                questionModelUpdate.setOption1(option1);
                questionModelUpdate.setOption2(option2);
                questionModelUpdate.setOption3(option3);
                questionModelUpdate.setOption4(option4);
                questionModelUpdate.setTrue_answer(true_Ans);
                questionModelUpdate.setPoints(point);
                questionModelUpdate.setIndex(index);

                qDB.update(questionModelUpdate);
                req.setAttribute("alert", "Đã sửa câu hỏi thành công");
                req.getRequestDispatcher("./addQuiz.jsp").forward(req, resp);
                break;
            case "delete":
                int question_idForDelete = Integer.parseInt(req.getParameter("question_id"));
                Lesson lessonForDelete = (Lesson) req.getSession().getAttribute("lesson");
                qDB.deleteLessonQuestion(question_idForDelete);
                qDB.delete(question_idForDelete);
                qDB.updateIndexQuestion(lessonForDelete.getLesson_id());
                ArrayList<Question> questionsAfterDelete = qDB.getQuestionByLessionID(lessonForDelete.getLesson_id());
                int questionSizeAfterDelete = questionsAfterDelete.size();
                req.getSession().setAttribute("questions", questionsAfterDelete);
                req.getSession().setAttribute("questionSize", questionSizeAfterDelete);
                req.setAttribute("alert", "Đã xóa câu hỏi thành công");
                req.getRequestDispatcher("./addQuiz.jsp").forward(req, resp);
                break;
            default:
                req.getRequestDispatcher("./addQuiz.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        QuestionDBContext qDB = new QuestionDBContext();
        String action = req.getParameter("action");
        int index = Integer.parseInt(req.getParameter("index"));
        int question_id = Integer.parseInt(req.getParameter("question_id"));
        if (question_id != -1) {
            Question question = qDB.get(question_id);
            req.setAttribute("question", question);
        }
        req.setAttribute("action", action);
        req.setAttribute("index", index);
        req.getSession().setAttribute("add", "add");
        req.getSession().setAttribute("edit", "edit");
        req.getSession().setAttribute("delete", "delete");
        req.getRequestDispatcher("./addQuiz.jsp").forward(req, resp);
    }

}
