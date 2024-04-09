package project.model.Category;

import jakarta.persistence.PostPersist;
import jakarta.persistence.PostRemove;
import jakarta.persistence.PostUpdate;
import jakarta.persistence.PrePersist;
import lombok.RequiredArgsConstructor;
import project.model.Product.Product;
import project.service.Category.CategoryRedisService;

@RequiredArgsConstructor
public class CategoryListener {
    final private CategoryRedisService categoryRedisService;

    @PrePersist
    public void Pre(Category category){
        if(category.getIsCatActive() == null){
            category.setIsCatActive(true);
        }
    }

    @PostPersist
    public void postPersist(Product product){
        categoryRedisService.clear();
    }


    @PostUpdate
    public void postUpdate(Product product){
        categoryRedisService.clear();
    }

    @PostRemove
    public void postRemove(Product product){
        categoryRedisService.clear();
    }

}
