package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SimpleCalculatorServlet", value = "/SimpleCalculatorServlet")
public class SimpleCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ArithmeticException {
        try {
            double firstNum = Double.parseDouble(request.getParameter("firstOperation"));
            double secondNum = Double.parseDouble(request.getParameter("secondOperation"));

            String operator = request.getParameter("operator");
            double result;

            result = Calculator.calculate(firstNum, secondNum, operator);
            request.setAttribute("result","Result= "+ result);
        } catch (NumberFormatException numberFormatException) {
            request.setAttribute("result", "Error: " + numberFormatException.getMessage());
        } catch (Exception ex) {
            request.setAttribute("result", "Error: " + ex.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/calculator.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
