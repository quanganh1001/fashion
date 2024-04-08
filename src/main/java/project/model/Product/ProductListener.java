package project.model.Product;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import project.service.IProductRedisService;

@AllArgsConstructor
public class ProductListener {
    private final IProductRedisService productRedisService;

    @PrePersist
    public void prePersist(Product product) {
        if (product.getIsProductActive() == null)
            product.setIsProductActive(true);
    }

    @PostPersist
    public void postPersist(Product product){
        productRedisService.clear();
    }


    @PostUpdate
    public void postUpdate(Product product){
        productRedisService.clear();
    }

    @PostRemove
    public void postRemove(Product product){
        productRedisService.clear();
    }

}
