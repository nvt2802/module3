package com.example.calculator;

public class Calculator {
    public static double calculate(double firstNum,double secondNum,String operator){
        double result ;
        switch (operator){
            case "add":
                result=firstNum + secondNum;
                break;
            case "sub":
                result=firstNum - secondNum;
                break;
            case "multi":
                result=firstNum * secondNum;
                break;
            case "div":
                if(secondNum!=0) {
                    result = firstNum / secondNum;
                }else {
                    throw new ArithmeticException("Can't divide by zero");
                }
                break;
            default:
                throw new ArithmeticException("Invalid operation");
        }
        return result;
    }
}
