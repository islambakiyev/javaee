package kz.bitlab.javaee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.javaee.db.DBManager;
import kz.bitlab.javaee.db.Task;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        Long id = Long.valueOf(request.getParameter("id"));
        Task task = DBManager.getTask(id);
        request.setAttribute("task", task);

        request.getRequestDispatcher("details.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String deadline = request.getParameter("date");
        String status = request.getParameter("status");
        String button = request.getParameter("button");

        if(button.equals("save")){
            DBManager.updateTask(id,name,description,deadline,status);
        }else if(button.equals("delete")){
            DBManager.deleteTask(id);
        }



        response.sendRedirect("/homepage");
    }
}
