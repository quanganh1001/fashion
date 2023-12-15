package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.entity.Product;
import project.fashion.entity.ProductDetail;
import project.fashion.repository.ProductDetailRepo;

import java.util.List;

@Service
public class ProductDetailService{
    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private ProductService productService;

    public ResponseEntity<String> updatePrDetail(Integer prDetailId,ProductDetail pd){
        pd.setProductDetailId(prDetailId);
        productDetailRepo.save(pd);
        return ResponseEntity.ok("done");
    }

    public void deleteById(Integer prDetailId){
        productDetailRepo.deleteById(prDetailId);
    }

    public ProductDetail getById(Integer prDetailId){
        return productDetailRepo.getById(prDetailId);
    }

    public ResponseEntity<String> save(String productId, ProductDetail pd){
        System.out.println(productId);
        if(productDetailRepo.existsByCode(pd.getCode())){
            System.out.println("xcxcz" + pd.getCode());
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Sản phẩm đã tồn tại");
        }else {
            Product product = productService.findById(productId);
            System.out.println(product);
            pd.setProduct(product);
            productDetailRepo.save(pd);
            return ResponseEntity.ok("done");
        }

    }

    public List<ProductDetail> findAll(){
        return productDetailRepo.findAll();
    }

    public List<ProductDetail> searchProductDetailByProductProductNameContainingIgnoreCase(String key){
        return productDetailRepo.searchProductDetailByProductProductNameContainingIgnoreCase(key);
    }

    public List<ProductDetail> findAllByProductProductId(String productId){
        return productDetailRepo.findAllByProductProductId(productId);
    }
}
