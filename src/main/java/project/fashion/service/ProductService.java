package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Product;
import project.fashion.repository.ProductDetailRepo;
import project.fashion.repository.ProductRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
@Service
public class ProductService{
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    public void setProductActive(String cat_id, Boolean boo) {
        List<Product> product = productRepo.findByCategoryCatId(cat_id);
        for (Product p : product){
            productDetailRepo.setProductDetailActive(p.getProductId(),boo);
        }
        productRepo.setProductActive(cat_id,boo);
    }

    public Page<Product> searchProduct(String key, Pageable pageable) {
        if (key != null && !key.isEmpty()) {
            return productRepo.searchProductsByProductIdContainingIgnoreCaseOrProductNameContainingIgnoreCase(
                    key, key, pageable);
        } else {
            return productRepo.findAll(pageable);
        }
    }

}
