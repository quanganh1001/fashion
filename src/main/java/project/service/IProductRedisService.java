package project.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import project.model.Product.Product;

import java.util.List;

public interface IProductRedisService {
    void clear();

    void saveAllProducts(String key, List<Product> products, int page, int size, int totalPage, Long totalItem) throws JsonProcessingException;

    int getTotalPage(String key, int page, int size);

    List<Product> getAllProduct(String key, int page, int size) throws JsonProcessingException;

    long getTotalItem(String key, int page, int size);
}
