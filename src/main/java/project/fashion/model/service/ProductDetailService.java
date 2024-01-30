package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

    public String updatePrDetail(ProductDetail pd, RedirectAttributes attributes) throws Exception {
        System.out.println(Objects.equals(findByCode(pd.getCode()), pd.getProductDetailId()));
        //nếu code sp đã tồn tại và id không khớp với code sp trong database thì nghĩa là đã tồn tại
        if (findByCode(pd.getCode()) != null && !Objects.equals(findByCode(pd.getCode()).getProductDetailId(), pd.getProductDetailId())) {
            attributes.addFlashAttribute("alertMessage", "Sản phẩm đã tồn tại");
            return "redirect:/admin/productDetail/update-detail/" + pd.getProductDetailId();
        } else if (Objects.equals(pd.getCode(), "") || pd.getCode() == null ||
                !isNumeric(pd.getQuantity().toString()) || pd.getQuantity() == null || isEmpty(pd.getQuantity().toString()) ||
                Objects.equals(pd.getColor(), "") || pd.getColor() == null ||
                Objects.equals(pd.getSize(), "") || pd.getSize() == null ||
                Objects.equals(pd.getProductDetailActive(), "") || pd.getProductDetailActive() == null) {
            throw new Exception("Nhập sai hoặc thiếu thông tin");
        } else {
            productDetailRepo.save(pd);
            attributes.addFlashAttribute("alertMessage", "Lưu thành công");
            return "redirect:/admin/productDetail/update-detail/" + pd.getProductDetailId();
        }
    }

    public void deleteById(Integer prDetailId) {
        productDetailRepo.deleteById(prDetailId);
    }

    public ProductDetail getById(Integer prDetailId) {
        return productDetailRepo.getById(prDetailId);
    }

    public String save(String productId, ProductDetail pd,RedirectAttributes attributes) {
        if (productDetailRepo.existsByCode(pd.getCode())) {
            attributes.addFlashAttribute("alertMessage", "Sản phẩm đã tồn tại");
            attributes.addFlashAttribute("pd", pd);
            return "redirect:/admin/productDetail/add-prDetail?productId="+productId ;
        } else {
            Product product = productService.findById(productId);
            pd.setProduct(product);
            productDetailRepo.save(pd);
            attributes.addFlashAttribute("alertMessage", "Đã tạo sản phẩm thành công");
            return "redirect:/admin/product/update-product/" + productId ;
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

    public List<ProductDetail> findAllByProductAndColor(String productId, String colorId) {
        return productDetailRepo.findAllByProductProductIdAndColor_ColorId(productId, colorId);
    }

    public ProductDetail findProductDetail(String productId, String colorId, String sizeId) {
        return productDetailRepo.findProductDetails(productId, colorId, sizeId);
    }

    public ProductDetail findByCode(String productDetailCode) {
        return productDetailRepo.findByCode(productDetailCode);
    }
}
