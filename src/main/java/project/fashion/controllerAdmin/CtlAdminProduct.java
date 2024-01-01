package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.ImgSize;
import project.fashion.model.entity.Product;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.repository.CategoryRepo;
import project.fashion.model.repository.ImgSizeRepo;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.ProductDetailService;
import project.fashion.model.service.ProductService;

import java.io.IOException;
import java.util.List;

@Controller
@PreAuthorize("hasAnyRole('MANAGER')")
@RequestMapping("/admin/product")
public class CtlAdminProduct {
    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ImgSizeRepo imgSizeRepo;

    @Autowired
    private AccountService accountService;
    @GetMapping()
    public String searchProduct(Model model,@RequestParam(defaultValue = "0") int page,@RequestParam(name = "key",
            required = false) String key){
        Page<Product> searchResults =
                productService.searchProduct(key,PageRequest.of(page, 10));

        accountService.getAccountResponse(model);

        model.addAttribute("key",key);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchResults.getTotalPages());
        model.addAttribute("totalItems", searchResults.getTotalElements());
        model.addAttribute("products", searchResults.getContent());
        model.addAttribute("title","Product");
        return "/admin/ProductAdmin";
    }

    @GetMapping("/add-product")
    public String addProduct(Model model) {
        List<Category> cat = categoryRepo.findAll();
        List<ImgSize> img = imgSizeRepo.findAll();
        Product product = new Product();
        accountService.getAccountResponse(model);

        model.addAttribute("product", product);
        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        model.addAttribute("title","Product");
        return "/admin/AddProduct";
    }

    @PostMapping("/add-product")
    public ResponseEntity<String> addProduct(@ModelAttribute Product product) {
        return productService.addProduct(product);
    }

    @DeleteMapping("/delete-product/{productId}")
    public ResponseEntity<String> deleteProduct(@PathVariable("productId") String productId) throws IOException {
        try{
            return productService.deleteProduct(productId);
        }catch (Exception e){
            return new ResponseEntity<>("Không thể xóa", HttpStatus.BAD_REQUEST);
        }

    }

    @GetMapping("/update-product/{productId}")
    public String updateProduct(Model model, @PathVariable("productId") String productId) {
        List<Category> cat = categoryRepo.findAll();
        List<ImgSize> img = imgSizeRepo.findAll();
        List<ProductDetail> prDetail =  productDetailService.findAllByProductProductId(productId);
        Product p = productService.findById(productId);
        accountService.getAccountResponse(model);

        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        model.addAttribute("p", p);
        model.addAttribute("prDetail",prDetail);
        model.addAttribute("title","Product");
        return "/admin/UpdateProduct";
    }

    @PutMapping("/update-product")
    public ResponseEntity<String> updateProduct(@ModelAttribute Product p) {
        return productService.saveProduct(p);
    }

}
