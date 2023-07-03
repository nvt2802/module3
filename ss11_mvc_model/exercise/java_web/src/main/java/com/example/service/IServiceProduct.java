package com.example.service;

import com.example.model.Product;

import java.util.List;

public interface IServiceProduct {
    List<Product> getAll();

    int getMinId();

    void save(Product product);

    Product getById(int id);

    void update(int id, Product product);

    void remove(int id);

    List<Product> getListByName(String name);
}
