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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.ImgSize;
import project.fashion.model.entity.Product;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.repository.CategoryRepo;
import project.fashion.model.repository.ImgSizeRepo;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.FeedbackCustomerService;
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
    @Autowired
    FeedbackCustomerService feedbackCustomerService;

    @GetMapping()
    public String searchProduct(Model model,
                                @RequestParam(defaultValue = "1") int page,
                                @RequestParam(name = "key", required = false) String key){
        Page<Product> searchResults =
                productService.searchProduct(key,page -1);

        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("key",key);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchResults.getTotalPages());
        model.addAttribute("totalItems", searchResults.getTotalElements());
        model.addAttribute("products", searchResults.getContent());
        model.addAttribute("title","Product");
        return "/admin/ProductAdmin";
    }

    @GetMapping("/add-product")
    public String addProduct(Model model,@RequestParam(value = "catId",defaultValue = "") String catId) {
        List<Category> cat = categoryRepo.findAll();
        List<ImgSize> img = imgSizeRepo.findAll();
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("catId",catId);
        model.addAttribute("product", new Product());
        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        model.addAttribute("title","Product");
        return "admin/AddProduct";
    }

    @PostMapping("/add-product")
    public String addProduct(@ModelAttribute Product product, RedirectAttributes attributes) throws Exception {
        return productService.addProduct(product,attributes);
    }

    @DeleteMapping("/delete-product/{productId}")
    public String deleteProduct(@PathVariable("productId") String productId,
                                                RedirectAttributes attributes) throws IOException {
        try{
            productService.deleteProduct(productId);
            attributes.addFlashAttribute("alertMessage","Đã xóa sản phẩm");
            return "redirect:/admin/product";
        }catch (Exception e){
            attributes.addFlashAttribute("alertMessage","Không thể xóa sản phẩm");
            return "redirect:/admin/product";
        }

    }

    @GetMapping("/update-product/{productId}")
    public String updateProduct(Model model, @PathVariable("productId") String productId) {
        List<Category> cat = categoryRepo.findAll();
        List<ImgSize> img = imgSizeRepo.findAll();
        List<ProductDetail> prDetail =  productDetailService.findAllByProductProductId(productId);
        Product p = productService.findById(productId);
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        model.addAttribute("p", p);
        model.addAttribute("prDetail",prDetail);
        model.addAttribute("title","Product");
        return "/admin/UpdateProduct";
    }

    @PutMapping("/update-product")
    public String updateProduct(@ModelAttribute Product p,RedirectAttributes attributes) throws Exception {
        return productService.saveProduct(p,attributes);
    }

}
