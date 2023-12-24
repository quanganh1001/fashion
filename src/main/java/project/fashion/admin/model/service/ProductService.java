package project.fashion.admin.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.admin.model.entity.ImgProduct;
import project.fashion.admin.model.entity.Product;
import project.fashion.admin.model.repository.ImgProductRepo;
import project.fashion.admin.model.repository.ProductDetailRepo;
import project.fashion.admin.model.repository.ProductRepo;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.apache.commons.lang3.StringUtils.isNumeric;


@Service
public class ProductService{
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private ImgProductService imgProductService;

    @Autowired
    private ImgProductRepo imgProductRepo;

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
    public ResponseEntity<String> saveProduct(Product product){
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
            productDetailRepo.setProductDetailActive(product.getProductId(),product.getIsProductActive());
            productRepo.save(product);
            return ResponseEntity.ok(product.getProductId());
        }
    }

    @Transactional
    public ResponseEntity<String> addProduct(Product product){
        if(Objects.equals(product.getProductId(), "")|| product.getProductId() == null||
                Objects.equals(product.getProductName(), "")|| product.getProductName() == null||
                Objects.equals(product.getPrice(), "")|| product.getPrice() == null|| !isNumeric(product.getPrice().toString())||
                Objects.equals(product.getBrand(), "")|| product.getBrand() == null||
                Objects.equals(product.getCategory(), "")|| product.getCategory() == null
        ) {
            return new ResponseEntity<>("Lỗi validate", HttpStatus.BAD_REQUEST);
        }else if(product.getDiscountPrice() != null && !isNumeric(product.getDiscountPrice().toString())){
            return new ResponseEntity<>("Lỗi validate", HttpStatus.BAD_REQUEST);
        }else if(productRepo.existsById(product.getProductId())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Sản phẩm đã tồn tại");
        }

        else {
            productDetailRepo.setProductDetailActive(product.getProductId(),product.getIsProductActive());
            productRepo.save(product);
            return ResponseEntity.ok(product.getProductId());
        }
    }

    @Transactional
    public ResponseEntity<String> deleteProduct(String productId) {
        try {
            // Gọi hàm xóa ảnh
            imgProductService.deleteByProductId(productId);

            // Gọi hàm xóa chi tiết sản phẩm
            productDetailRepo.deleteAllByProductProductId(productId);

            // Gọi hàm xóa sản phẩm
            productRepo.deleteById(productId);

            //xóa path ảnh
            imgProductService.deletePath(productId);

            return ResponseEntity.ok("done");
        } catch (Exception e) {
            // Nếu có lỗi, hệ thống sẽ tự động rollback
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred");
        }
    }


    public List<Product> findAll(){
        return productRepo.findAll();
    }

    public Product findById(String productId){
        Optional<Product> productOptional = Optional.of(productRepo.findById(productId).orElse(new Product()));
        Product product = productOptional.get();
        return product;
    }


}
