package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.entity.Product;
import project.fashion.model.repository.ProductDetailRepo;
import project.fashion.model.repository.ProductRepo;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.apache.commons.lang3.StringUtils.isNumeric;


@Service
public class ProductService {
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private ProductDetailRepo productDetailRepo;
    @Autowired
    private ImgProductService imgProductService;

    public void setProductActive(String cat_id, Boolean boo) {
        List<Product> product = productRepo.findByCategoryCatId(cat_id);
        for (Product p : product) {
            productDetailRepo.setProductDetailActive(p.getProductId(), boo);
        }
        productRepo.setProductActive(cat_id, boo);
    }

    public Page<Product> searchProduct(String key, int page) {
        if (page < 0) {
            page = 0;
        }
        if (key != null && !key.isEmpty()) {
            return productRepo.searchProductsByProductIdContainingIgnoreCaseOrProductNameContainingIgnoreCase(
                    key, key, PageRequest.of(page, 10));
        } else {
            return productRepo.findAll(PageRequest.of(page, 10));
        }
    }

    @Transactional
    public String saveProduct(Product product, RedirectAttributes attributes) throws Exception {

        if (Objects.equals(product.getProductId(), "") || product.getProductId() == null ||
                Objects.equals(product.getProductName(), "") || product.getProductName() == null ||
                Objects.equals(product.getPrice(), "") || product.getPrice() == null || !isNumeric(product.getPrice().toString()) ||
                Objects.equals(product.getBrand(), "") || product.getBrand() == null ||
                Objects.equals(product.getCategory(), "") || product.getCategory() == null
        ) {
            throw new Exception("Lỗi validation");
        } else if (product.getDiscountPrice() != null && !isNumeric(product.getDiscountPrice().toString())) {
            throw new Exception("Lỗi validation");
        } else {
            productDetailRepo.setProductDetailActive(product.getProductId(), product.getIsProductActive());
            productRepo.save(product);
            attributes.addFlashAttribute("alertMessage", "Đã cập nhập sản phẩm");
            return "redirect:/admin/product/update-product/" + product.getProductId();
        }
    }

    @Transactional
    public String addProduct(Product product, RedirectAttributes attributes) throws Exception {
        if (Objects.equals(product.getProductId(), "") || product.getProductId() == null ||
                Objects.equals(product.getProductName(), "") || product.getProductName() == null ||
                Objects.equals(product.getPrice(), "") || product.getPrice() == null || !isNumeric(product.getPrice().toString()) ||
                Objects.equals(product.getBrand(), "") || product.getBrand() == null ||
                Objects.equals(product.getCategory(), "") || product.getCategory() == null
        ) {
            throw new Exception("Lỗi validation");
        } else if (product.getDiscountPrice() != null && !isNumeric(product.getDiscountPrice().toString())) {
            throw new Exception("Lỗi validation");

        } else if (productRepo.existsById(product.getProductId())) {
            attributes.addFlashAttribute("alertMessage", "Sản phẩm đã tồn tại");
            return "redirect:/admin/product/add-product";

        } else {
            productDetailRepo.setProductDetailActive(product.getProductId(), product.getIsProductActive());
            product.setImageBackground("no_image.jpg");
            productRepo.save(product);
            attributes.addFlashAttribute("alertMessage", "Đã tạo sản phẩm");
            return "redirect:/admin/product/update-product/" + product.getProductId();
        }
    }

    @Transactional
    public void deleteProduct(String productId) {
        try {
            // Gọi hàm xóa ảnh
            imgProductService.deleteByProductId(productId);

            // Gọi hàm xóa chi tiết sản phẩm
            productDetailRepo.deleteAllByProductProductId(productId);

            // Gọi hàm xóa sản phẩm
            productRepo.deleteById(productId);

            //xóa path ảnh
            imgProductService.deletePath(productId);

            ResponseEntity.ok("done");
        } catch (Exception e) {
            // Nếu có lỗi, hệ thống sẽ tự động rollback
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred");
        }
    }


    public List<Product> findAll() {
        return productRepo.findAll();
    }

    public Product findById(String productId) {
        Optional<Product> productOptional = Optional.of(productRepo.findById(productId).orElse(new Product()));
        return productOptional.get();
    }

    public List<Product> findProductByIsDiscountTrue() {
        return productRepo.findProductByIsDiscountTrueAndIsProductActiveTrueOrderByDiscountPercentDesc();
    }

    @Transactional
    public void setBackground(String productId, String imageName) {
        productRepo.setProductImgBackground(productId, imageName);
    }

}
