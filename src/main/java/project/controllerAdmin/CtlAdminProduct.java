package project.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.Enum.ImgSizeEnumDTO;
import project.model.Category;
import project.model.Product;
import project.model.ProductDetail;
import project.repository.CategoryRepo;
import project.service.AccountService;
import project.service.FeedbackCustomerService;
import project.service.ProductDetailService;
import project.service.ProductService;

import java.io.IOException;
import java.util.Arrays;
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
    private AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;

//    @GetMapping()
//    public String searchProduct(Model model,
//                                @RequestParam(value = "page",defaultValue = "1") int page,
//                                @RequestParam(name = "key", required = false) String key,
//                                @RequestParam(name = "pageSize",defaultValue = "10") int size) throws JsonProcessingException {
//        List<Product> searchResults =
//                productService.searchProduct(model,key, page - 1,size);
//
//        accountService.getAccountResponse(model);
//        feedbackCustomerService.countUnread(model);
//
//        model.addAttribute("key", key);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("products", searchResults);
//        model.addAttribute("title", "Product");
//        return "admin/ProductAdmin";
//    }

    @GetMapping()
    public String searchProduct(Model model,
                                @RequestParam(value = "page",defaultValue = "1") int page,
                                @RequestParam(name = "key", required = false)String key,
                                @RequestParam(value = "pageSize",defaultValue = "10") int size) {
        Page<Product> searchResults =
                productService.searchProduct(key, page - 1,size);

        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("key", key);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchResults.getTotalPages());
        model.addAttribute("totalItems", searchResults.getTotalElements());
        model.addAttribute("products", searchResults.getContent());
        model.addAttribute("title", "Product");
        return "admin/ProductAdmin";
    }

    @GetMapping("/add-product")
    public String addProduct(Model model, @RequestParam(value = "catId", defaultValue = "") String catId) {
        List<Category> cat = categoryRepo.findAll();
        List<ImgSizeEnumDTO> imgSize = Arrays.asList(ImgSizeEnumDTO.values());
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("catId", catId);
        model.addAttribute("product", new Product());
        model.addAttribute("cat", cat);
        model.addAttribute("imgSize", imgSize);
        model.addAttribute("title", "Product");
        return "admin/AddProduct";
    }

    @PostMapping("/add-product")
    public String addProduct(@ModelAttribute Product product, RedirectAttributes attributes) {
        try {
            return productService.addProduct(product, attributes);
        } catch (Exception e) {
            attributes.addFlashAttribute("alertMessage", " Không thêm được sản phẩm");
            return "redirect:/admin/product";
        }
    }

    @DeleteMapping("/delete-product/{productId}")
    public String deleteProduct(@PathVariable("productId") String productId,
                                RedirectAttributes attributes) throws IOException {
        try {
            productService.deleteProduct(productId);
            attributes.addFlashAttribute("alertMessage", "Đã xóa sản phẩm");
            return "redirect:/admin/product";
        } catch (Exception e) {
            attributes.addFlashAttribute("alertMessage", "Không thể xóa sản phẩm");
            return "redirect:/admin/product";
        }

    }

    @GetMapping("/update-product/{productId}")
    public String updateProduct(Model model, @PathVariable("productId") String productId) {
        if (!productService.existsById(productId)) {
            return "redirect:/admin/product";
        }
        List<Category> cat = categoryRepo.findAll();
        List<ImgSizeEnumDTO> imgSize = Arrays.asList(ImgSizeEnumDTO.values());
        List<ProductDetail> prDetail = productDetailService.findAllByProductProductId(productId);
        Product p = productService.findById(productId);
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("cat", cat);
        model.addAttribute("imgSize", imgSize);
        model.addAttribute("p", p);
        model.addAttribute("prDetail", prDetail);
        model.addAttribute("title", "Product");
        return "admin/UpdateProduct";
    }

    @PutMapping("/update-product")
    public String updateProduct(@ModelAttribute Product p, RedirectAttributes attributes) throws Exception {
        return productService.saveProduct(p, attributes);
    }

}
