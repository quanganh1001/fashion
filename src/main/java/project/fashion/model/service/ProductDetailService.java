package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.Product;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.repository.ProductDetailRepo;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.apache.commons.lang3.StringUtils.isEmpty;
import static org.apache.commons.lang3.StringUtils.isNumeric;

@Service
public class ProductDetailService {
    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private ProductService productService;

    public ResponseEntity<String> updatePrDetail(ProductDetail pd) {
        Optional<ProductDetail> productDetail = Optional.ofNullable(productDetailRepo.findByCode(pd.getCode()));
        var productDetailIdOther = productDetail.get().getProductDetailId();

        //nếu code sp đã tồn tại và id không khớp với code sp trong database thì nghĩa là đã tồn tại
        if (productDetailRepo.existsByCode(pd.getCode()) && !Objects.equals(productDetailIdOther, pd.getProductDetailId())) {
            return new ResponseEntity<>("sản phẩm đã tồn tại", HttpStatus.CONFLICT);

        } else if (Objects.equals(pd.getCode(), "") || pd.getCode() == null ||
                !isNumeric(pd.getQuantity().toString()) || pd.getQuantity() == null || isEmpty(pd.getQuantity().toString()) ||
                Objects.equals(pd.getColor(), "") || pd.getColor() == null ||
                Objects.equals(pd.getSize(), "") || pd.getSize() == null ||
                Objects.equals(pd.getProductDetailActive(), "") || pd.getProductDetailActive() == null) {
            return new ResponseEntity<>("Lỗi nhập sai hoặc thiếu thông tin", HttpStatus.CONFLICT);
        } else {

            productDetailRepo.save(pd);
            return ResponseEntity.ok(pd.getProduct().getProductId());
        }

    }

    public void deleteById(Integer prDetailId) {
        productDetailRepo.deleteById(prDetailId);
    }

    public ProductDetail getById(Integer prDetailId) {
        return productDetailRepo.getById(prDetailId);
    }

    public ResponseEntity<String> save(String productId, ProductDetail pd) {
        if (productDetailRepo.existsByCode(pd.getCode())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Sản phẩm đã tồn tại");
        } else {
            Product product = productService.findById(productId);
            pd.setProduct(product);
            productDetailRepo.save(pd);
            return ResponseEntity.ok(productId);
        }

    }

    public List<ProductDetail> findAll() {
        return productDetailRepo.findAll();
    }

    public List<ProductDetail> searchProductDetailByProductProductNameContainingIgnoreCase(String key) {
        return productDetailRepo.searchProductDetailByProductProductNameContainingIgnoreCase(key);
    }

    public List<ProductDetail> findAllByProductProductId(String productId) {
        return productDetailRepo.findAllByProductProductId(productId);
    }

    public List<ProductDetail> findAllByProductAndColor(String productId,String colorId) {
        return productDetailRepo.findAllByProductProductIdAndColor_ColorId(productId,colorId);
    }

    public ProductDetail findProductDetail(String productId,String colorId, String sizeId) {
        return productDetailRepo.findProductDetails(productId,colorId, sizeId);
    }
}
