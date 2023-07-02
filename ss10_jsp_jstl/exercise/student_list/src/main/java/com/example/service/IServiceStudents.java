package com.example.service;

import com.example.modal.Students;

import java.util.List;

public interface IServiceStudents {
    List<Students> getAll();

    void add(Students student);
}
