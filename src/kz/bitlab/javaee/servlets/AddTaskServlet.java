package kz.bitlab.javaee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.javaee.db.DBManager;
import kz.bitlab.javaee.db.Task;

import java.io.IOException;

@WebServlet(value = "/addtask")
public class AddTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String button = request.getParameter("button");

        if(button.equals("save")){
            Task task = new Task();
            task.setName(name);
            task.setDescription(description);
            task.setDeadlineDate(date);
            DBManager.addTask(task);
        }else if(button.equals("close")){

        }



        response.sendRedirect("/homepage");
    }
}
