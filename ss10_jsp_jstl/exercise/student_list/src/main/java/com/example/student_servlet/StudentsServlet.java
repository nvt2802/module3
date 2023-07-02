package com.example.student_servlet;

import com.example.modal.Students;
import com.example.service.IServiceStudents;
import com.example.service.ServiceStudents;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "StudentsServlet", value = "/StudentsServlet")
public class StudentsServlet extends HttpServlet {
    private IServiceStudents serviceStudents = new ServiceStudents();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Students> studentsList = serviceStudents.getAll();
        request.setAttribute("studentsList", studentsList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student_list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender = Objects.equals(request.getParameter("gender"), "nam");
        int point = Integer.parseInt(request.getParameter("point"));
        Students student = new Students(id, name, gender, point);
        serviceStudents.add(student);
        doGet(request, response);
    }
}
