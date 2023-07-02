package com.example.repository;

import com.example.modal.Students;

import java.util.ArrayList;
import java.util.List;

public class RepositoryStudents implements  IRepositoryStudents{
    private  static List<Students> studentsList = new ArrayList<>();

    static {
        studentsList.add(new Students(1,"nguyen van a",true,10));
        studentsList.add(new Students(2,"nguyen van b",true,7));
        studentsList.add(new Students(3,"nguyen van c",true,5));
        studentsList.add(new Students(4,"nguyen van d",true,2));
    }

    @Override
    public List<Students> getAll() {
        return studentsList;
    }

    @Override
    public void addStudent(Students student) {
        studentsList.add(student);
    }
}
