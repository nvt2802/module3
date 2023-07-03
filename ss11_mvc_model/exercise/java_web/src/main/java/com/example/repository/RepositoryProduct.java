package com.example.repository;

import com.example.model.Product;

import java.util.*;

public class RepositoryProduct implements IRepositoryProduct{
    private static Map<Integer,Product> productMap = new HashMap<>();

    static {
        productMap.put(1,(new Product(1,"Banh",100000,"Ngon","Oreo")));
        productMap.put(2,(new Product(2,"Keo",20000,"Ngon","Chuppachup")));
        productMap.put(3,(new Product(3,"Sua",15000,"Ngon","TH true milk")));
        productMap.put(4,(new Product(4,"Bimbim",5000,"Ngon","Snack")));
        productMap.put(5,(new Product(5,"Nuoc Ngot",10000,"Ngon","Pepsi")));
    }
    @Override
    public List<Product> getList() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public int getMinId() {
        for (int i = 1; i <= productMap.size() ; i++) {
            if(!productMap.containsKey(i)){
                return i;
            }
        }
        return productMap.size()+1;
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public Product getById(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public List<Product> getListByName(String name) {
        List<Product> productList = new ArrayList<>();
       Set<Integer> key = productMap.keySet();
        for (Integer k: key
             ) {
            if(productMap.get(k).getName().toLowerCase().contains(name.toLowerCase())){
                productList.add(productMap.get(k));
            }
        }

        return productList;
    }
}
