package project.service.Product;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import project.model.Product.Product;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductRedisService implements IProductRedisService {
    private final RedisTemplate<String, Object> redisTemplate;
    private final ObjectMapper redisObjectMapper;


    @Override
    public void clear() {
        redisTemplate.getConnectionFactory().getConnection().flushAll();
    }

    @Override
    public void saveProducts(String keyRedis, List<Product> products) throws JsonProcessingException {
        try {
            String json = redisObjectMapper.writeValueAsString(products);
            redisTemplate.opsForValue().set(keyRedis + "-products", json);
        } catch (JsonProcessingException e) {
            // Xử lý ngoại lệ tại đây (ví dụ: log và báo lỗi)
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> getProducts(String keyRedis) throws JsonProcessingException {
        String json = (String) redisTemplate.opsForValue().get(keyRedis + "-products");
        return json != null ?
                redisObjectMapper.readValue(json, new TypeReference<List<Product>>() {
                })
                : null;
    }

    @Override
    public int getTotalPage(String keyRedis){
        Integer totalPage = (Integer) redisTemplate.opsForValue().get(keyRedis + "-totalPage");
        return totalPage != null ? totalPage : 0;
    }

    @Override
    public long getTotalItem(String keyRedis){
        Integer totalItem = (Integer) redisTemplate.opsForValue().get(keyRedis + "-totalItem");
        return totalItem != null ? totalItem : 0L;
    }

    @Override
    public void setTotalPageAndToTalItem(String keyRedis,int totalPage,Long totalItem){
        redisTemplate.opsForValue().set(keyRedis + "-totalPage", totalPage);
        redisTemplate.opsForValue().set(keyRedis+ "-totalItem", totalItem);
    }

}
