package com.example.customer_servlet;

import com.example.customer_list.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private Customer customer = new Customer();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> list = new ArrayList<>();
        list.add(new Customer(1,"Mai Văn Hoàn","1983-08-20","Hà Nội",""));
        list.add(new Customer(2,"Mai Văn Hoàn","1983-08-20","Hà Nội",""));
        list.add(new Customer(3,"Mai Văn Hoàn","1983-08-20","Hà Nội",""));
        list.add(new Customer(4,"Mai Văn Hoàn","1983-08-20","Hà Nội",""));
        list.add(new Customer(5,"Mai Văn Hoàn","1983-08-20","Hà Nội",""));

        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
