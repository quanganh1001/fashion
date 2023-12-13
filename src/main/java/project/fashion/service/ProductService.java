package project.fashion.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.entity.Category;
import project.fashion.entity.Product;
import project.fashion.repository.CategoryRepo;
import project.fashion.repository.ProductDetailRepo;
import project.fashion.repository.ProductRepo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Function;

import static org.apache.commons.lang3.StringUtils.isNumeric;


@Service
public class ProductService{
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private ImgProductService imgProductService;


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

    @Transactional
    public ResponseEntity<String> saveProduct(String productId,Product product){

        if(Objects.equals(product.getProductId(), "")|| product.getProductId() == null||
                Objects.equals(product.getProductName(), "")|| product.getProductName() == null||
                Objects.equals(product.getPrice(), "")|| product.getPrice() == null|| !isNumeric(product.getPrice().toString())||
                Objects.equals(product.getBrand(), "")|| product.getBrand() == null||
                Objects.equals(product.getCategory(), "")|| product.getCategory() == null
                ) {
            return new ResponseEntity<>("Lỗi validate", HttpStatus.BAD_REQUEST);
        }else if(product.getDiscountPrice() != null && !isNumeric(product.getDiscountPrice().toString())){
                return new ResponseEntity<>("Lỗi validate", HttpStatus.BAD_REQUEST);
        }

        else {
            productDetailRepo.setProductDetailActive(productId,product.getIsProductActive());
            productRepo.save(product);
            return ResponseEntity.ok("Done");
        }
    }

    @Transactional
    public ResponseEntity<String> deleteProduct(String productId) throws IOException {
        imgProductService.deleteByProductId(productId);
        productDetailRepo.deleteAllByProductProductId(productId);
        productRepo.deleteById(productId);
        return ResponseEntity.ok("done");
    }

}
