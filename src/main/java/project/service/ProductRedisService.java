package project.service;

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


    private String getKeyFrom(String keyword, int page, int size) {
        return String.format(keyword+ ":" + page + ":" + size);
    }

    @Override
    public void clear() {
        redisTemplate.getConnectionFactory().getConnection().flushAll();
    }

    @Override
    public void saveAllProducts(String key, List<Product> products, int page, int size, int totalPage, Long totalItem) throws JsonProcessingException {
        try {
            String keyForm = getKeyFrom(key, page, size);
            String json = redisObjectMapper.writeValueAsString(products);
            redisTemplate.opsForValue().set(keyForm, json);
            redisTemplate.opsForValue().set(keyForm + ":totalPage", totalPage);
            redisTemplate.opsForValue().set(keyForm+ ":totalItem", totalItem);
        } catch (JsonProcessingException e) {
            // Xử lý ngoại lệ tại đây (ví dụ: log và báo lỗi)
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> getAllProduct(String key, int page, int size) throws JsonProcessingException {
        String keyFrom = this.getKeyFrom(key, page, size);
        String json = (String) redisTemplate.opsForValue().get(keyFrom);
        return json != null ?
                redisObjectMapper.readValue(json, new TypeReference<List<Product>>() {
                })
                : null;
    }

    @Override
    public int getTotalPage(String key,int page, int size){
        String keyForm = this.getKeyFrom(key,page,size);
        Integer totalPage = (Integer) redisTemplate.opsForValue().get(keyForm + ":totalPage");
        return totalPage != null ? totalPage : 0;
    }

    @Override
    public long getTotalItem(String key,int page, int size){
        String keyForm = this.getKeyFrom(key,page,size);
        Integer totalItem = (Integer) redisTemplate.opsForValue().get(keyForm + ":totalItem");
        return totalItem != null ? totalItem : 0L;
    }

}
