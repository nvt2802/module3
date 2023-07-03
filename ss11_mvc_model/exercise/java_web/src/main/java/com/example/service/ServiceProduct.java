package com.example.service;

import com.example.model.Product;
import com.example.repository.IRepositoryProduct;
import com.example.repository.RepositoryProduct;

import java.util.List;

public class ServiceProduct implements IServiceProduct{
    private IRepositoryProduct repositoryProduct = new RepositoryProduct();
    @Override
    public List<Product> getAll() {
        return repositoryProduct.getList();
    }

    @Override
    public int getMinId() {
        return repositoryProduct.getMinId();
    }

    @Override
    public void save(Product product) {
        repositoryProduct.add(product);
    }

    @Override
    public Product getById(int id) {
        return repositoryProduct.getById(id);
    }

    @Override
    public void update(int id, Product product) {
        repositoryProduct.update(id,product);
    }

    @Override
    public void remove(int id) {
        repositoryProduct.remove(id);
    }

    @Override
    public List<Product> getListByName(String name) {
        return repositoryProduct.getListByName(name);
    }
}
