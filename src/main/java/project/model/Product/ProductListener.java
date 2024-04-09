package project.model.Product;

import jakarta.persistence.*;
import lombok.RequiredArgsConstructor;
import project.service.Product.IProductRedisService;
import project.service.Product.ProductRedisService;

@RequiredArgsConstructor
public class ProductListener {
    private final ProductRedisService productRedisService;

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
