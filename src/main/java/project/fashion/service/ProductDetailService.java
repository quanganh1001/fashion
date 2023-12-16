package project.fashion.service;

import com.fasterxml.jackson.core.sym.NameN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.entity.Product;
import project.fashion.entity.ProductDetail;
import project.fashion.repository.ProductDetailRepo;

import java.util.List;
import java.util.Objects;

import static org.springframework.jdbc.support.JdbcUtils.isNumeric;

@Service
public class ProductDetailService{
    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private ProductService productService;

    public ResponseEntity<String> updatePrDetail(Integer prDetailId,ProductDetail pd){
        pd.setProductDetailId(prDetailId);
        productDetailRepo.save(pd);
        return ResponseEntity.ok(pd.getProduct().getProductId());
    }

    public void deleteById(Integer prDetailId){
        productDetailRepo.deleteById(prDetailId);
    }

    public ProductDetail getById(Integer prDetailId){
        return productDetailRepo.getById(prDetailId);
    }

    public ResponseEntity<String> save(String productId, ProductDetail pd){
        if(productDetailRepo.existsByCode(pd.getCode())){
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Sản phẩm đã tồn tại");
        } else if (pd.getProduct() == null || Objects.equals(pd.getProduct(), "")||
                !isNumeric(pd.getQuantity()) || pd.getQuantity() == null||
                Objects.equals(pd.getProductDetailId(), "")|| pd.getProductDetailId() == null ||
                Objects.equals(pd.getSize(), "") || pd.getSize() == null ||
                Objects.equals(pd.getColor(), "") || pd.getColor() == null||
                Objects.equals(pd.getCode(), "") || pd.getCode() == null){
            return new ResponseEntity<>("Lỗi validate",HttpStatus.BAD_REQUEST);

        } else {
            Product product = productService.findById(productId);
            pd.setProduct(product);
            productDetailRepo.save(pd);
            return ResponseEntity.ok(productId);
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
