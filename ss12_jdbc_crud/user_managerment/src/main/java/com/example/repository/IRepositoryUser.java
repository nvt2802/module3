package com.example.repository;

import com.example.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryUser {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    List<User> getListByCountry(String country);

    List<User> sortListName();

}
