package com.example.repository;

import com.example.modal.Students;

import java.util.List;

public interface IRepositoryStudents {
    List<Students> getAll();

    void addStudent(Students student);
}
