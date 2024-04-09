package project.service.Category;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import project.model.Category.Category;
import project.model.Product.Product;
import project.service.Product.IProductRedisService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryRedisService implements ICategoryRedisService {
    private final RedisTemplate<String, Object> redisTemplate;
    private final ObjectMapper redisObjectMapper;

    @Override
    public void clear() {
        redisTemplate.getConnectionFactory().getConnection().flushAll();
    }

    @Override
    public void saveCategories(String keyRedis, List<Category> categories) throws JsonProcessingException {
        try {
            String json = redisObjectMapper.writeValueAsString(categories);
            redisTemplate.opsForValue().set(keyRedis + "-categories", json);
        } catch (JsonProcessingException e) {
            // Xử lý ngoại lệ tại đây (ví dụ: log và báo lỗi)
            e.printStackTrace();
        }
    }

    @Override
    public List<Category> getCategories(String keyRedis) throws JsonProcessingException {
        String json = (String) redisTemplate.opsForValue().get(keyRedis + "-categories");
        return json != null ?
                redisObjectMapper.readValue(json, new TypeReference<List<Category>>() {
                })
                : null;
    }
}
