package project.service.Category;

import com.fasterxml.jackson.core.JsonProcessingException;
import project.model.Category.Category;


import java.util.List;

public interface ICategoryRedisService {
    void clear();

    void saveCategories(String key, List<Category> categories) throws JsonProcessingException;

    List<Category> getCategories(String keyRedis) throws JsonProcessingException;
}
