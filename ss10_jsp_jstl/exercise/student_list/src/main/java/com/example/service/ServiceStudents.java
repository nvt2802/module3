package com.example.service;

import com.example.modal.Students;
import com.example.repository.IRepositoryStudents;
import com.example.repository.RepositoryStudents;

import java.util.List;

public class ServiceStudents implements  IServiceStudents{
    private IRepositoryStudents repositoryStudents = new RepositoryStudents();
    @Override
    public List<Students> getAll() {
         return repositoryStudents.getAll();
    }

    @Override
    public void add(Students student) {
//        if(repositoryStudents.getAll().contains(student)){
//
//        }
        repositoryStudents.addStudent(student);
    }
}
