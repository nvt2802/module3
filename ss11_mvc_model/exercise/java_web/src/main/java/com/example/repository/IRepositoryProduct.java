package com.example.repository;

import com.example.model.Product;

import java.util.List;

public interface IRepositoryProduct {
    List<Product> getList();

    int getMinId();

    void add(Product product);

    Product getById(int id);

    void update(int id, Product product);

    void remove(int id);

    List<Product> getListByName(String name);
}
