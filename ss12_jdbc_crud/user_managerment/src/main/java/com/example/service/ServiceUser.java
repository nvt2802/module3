package com.example.service;

import com.example.model.User;
import com.example.repository.IRepositoryUser;
import com.example.repository.RepositoryUser;

import java.sql.SQLException;
import java.util.List;

public class ServiceUser implements IServiceUser{
    private IRepositoryUser repositoryUser = new RepositoryUser();
    @Override
    public void insertUser(User user) throws SQLException {
        repositoryUser.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return repositoryUser.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return repositoryUser.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return repositoryUser.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return repositoryUser.updateUser(user);
    }

    @Override
    public List<User> getListByCountry(String country) {
        return repositoryUser.getListByCountry(country);
    }

    @Override
    public List<User> sortListName() {
        return repositoryUser.sortListName();
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        repositoryUser.addUserTransaction(user,permision);
    }
}
