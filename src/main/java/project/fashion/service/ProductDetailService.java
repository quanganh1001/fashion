package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.ProductDetail;
import project.fashion.repository.ProductDetailRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
@Service
public class ProductDetailService{
    @Autowired
    private ProductDetailRepo productDetailRepo;

    public List<ProductDetail> findAllByProductProductId(String productId) {
        return productDetailRepo.findAllByProductProductId(productId);
    }

    public List<ProductDetail> searchProductDetailByProductProductNameContainingIgnoreCase(String key) {
        if(key != null && !key.isEmpty())
        return productDetailRepo.searchProductDetailByProductProductNameContainingIgnoreCase(key);
        else return null;
    }

}
