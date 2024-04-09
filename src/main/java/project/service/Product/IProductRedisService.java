package project.service.Product;

import com.fasterxml.jackson.core.JsonProcessingException;
import project.model.Product.Product;

import java.util.List;

public interface IProductRedisService {
    void clear();

    void saveProducts(String key, List<Product> products) throws JsonProcessingException;

    List<Product> getProducts(String keyRedis) throws JsonProcessingException;

    long getTotalItem(String key);

    int getTotalPage(String key);

    void setTotalPageAndToTalItem(String keyRedis, int totalPage, Long totalItem);
}
