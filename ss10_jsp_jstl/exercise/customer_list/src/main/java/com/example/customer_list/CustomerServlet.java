package com.example.customer_list;

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
        list.add(new Customer(1,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://i.pinimg.com/originals/5a/bf/21/5abf219774a8c5a376ae081b70c7ccf6.jpg"));
        list.add(new Customer(2,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://i.pinimg.com/736x/6c/e0/1b/6ce01bb7bc2c4b63079934d26c8a9b89.jpg"));
        list.add(new Customer(3,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://khoinguonsangtao.vn/wp-content/uploads/2022/08/anh-nobita-ngau-cute-mac-do-linh.jpg"));
        list.add(new Customer(4,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://ecdn.game4v.com/g4v-content/uploads/2021/04/Gia-the-Nobita-1-game4v.png"));
        list.add(new Customer(5,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://image.lag.vn/upload/news/18/10/15/Qt5jpHmJ_400x400_KPSP.jpg"));

        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
